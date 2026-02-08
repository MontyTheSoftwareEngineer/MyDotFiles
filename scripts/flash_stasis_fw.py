#!/usr/bin/env python3
"""
Standalone script to flash stasis_fw.bin to the STM device.
This script puts the board into DFU mode and flashes the firmware.

Usage:
    python3 flash_stasis_fw.py [--firmware-path <path>]
    
If no firmware path is provided, it looks for stasis_fw.bin in the same directory as this script.
"""

import subprocess
import os
import sys
import time
import serial
import argparse


def find_device_port():
    """Find the STM device serial port."""
    print("Looking for STM device...")
    result = subprocess.run(
        ["ls", "-l", "/dev/serial/by-id"],
        stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE, 
        text=True
    )
    
    if result.returncode == 0:
        args = result.stdout.strip().split('\n') if result.stdout.strip() else []
        for item in args:
            if "STM" in item:
                rPath = item.split()[-1]
                port = "/dev/" + rPath.split('/')[-1]
                print(f"Found STM device at: {port}")
                return port
        
        # No STM device found, check if already in DFU mode
        if check_dfu() == 0:
            print("Device is already in DFU mode")
            return None
        
        print("ERROR: No STM device found")
        return None
    else:
        # Could not list serial devices, check for DFU mode
        if check_dfu() == 0:
            print("Device is already in DFU mode")
            return None
        print("ERROR: Could not find serial devices")
        return None


def check_dfu():
    """Check if device is in DFU mode. Returns 0 if in DFU, 1 otherwise."""
    result = subprocess.run(
        "lsusb", 
        stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE, 
        text=True
    )
    
    if result.returncode == 0:
        if "DFU" in result.stdout:
            return 0
        return 1
    return 1


def calculate_crc(data):
    """Calculate CRC16 for the command packet."""
    wCRCTable = [
        0X0000, 0XC0C1, 0XC181, 0X0140, 0XC301, 0X03C0, 0X0280, 0XC241,
        0XC601, 0X06C0, 0X0780, 0XC741, 0X0500, 0XC5C1, 0XC481, 0X0440,
        0XCC01, 0X0CC0, 0X0D80, 0XCD41, 0X0F00, 0XCFC1, 0XCE81, 0X0E40,
        0X0A00, 0XCAC1, 0XCB81, 0X0B40, 0XC901, 0X09C0, 0X0880, 0XC841,
        0XD801, 0X18C0, 0X1980, 0XD941, 0X1B00, 0XDBC1, 0XDA81, 0X1A40,
        0X1E00, 0XDEC1, 0XDF81, 0X1F40, 0XDD01, 0X1DC0, 0X1C80, 0XDC41, 
        0X1400, 0XD4C1, 0XD581, 0X1540, 0XD701, 0X17C0, 0X1680, 0XD641,
        0XD201, 0X12C0, 0X1380, 0XD341, 0X1100, 0XD1C1, 0XD081, 0X1040,
        0XF001, 0X30C0, 0X3180, 0XF141, 0X3300, 0XF3C1, 0XF281, 0X3240,
        0X3600, 0XF6C1, 0XF781, 0X3740, 0XF501, 0X35C0, 0X3480, 0XF441,
        0X3C00, 0XFCC1, 0XFD81, 0X3D40, 0XFF01, 0X3FC0, 0X3E80, 0XFE41,
        0XFA01, 0X3AC0, 0X3B80, 0XFB41, 0X3900, 0XF9C1, 0XF881, 0X3840,
        0X2800, 0XE8C1, 0XE981, 0X2940, 0XEB01, 0X2BC0, 0X2A80, 0XEA41,
        0XEE01, 0X2EC0, 0X2F80, 0XEF41, 0X2D00, 0XEDC1, 0XEC81, 0X2C40,
        0XE401, 0X24C0, 0X2580, 0XE541, 0X2700, 0XE7C1, 0XE681, 0X2640,
        0X2200, 0XE2C1, 0XE381, 0X2340, 0XE101, 0X21C0, 0X2080, 0XE041,
        0XA001, 0X60C0, 0X6180, 0XA141, 0X6300, 0XA3C1, 0XA281, 0X6240,
        0X6600, 0XA6C1, 0XA781, 0X6740, 0XA501, 0X65C0, 0X6480, 0XA441,
        0X6C00, 0XACC1, 0XAD81, 0X6D40, 0XAF01, 0X6FC0, 0X6E80, 0XAE41,
        0XAA01, 0X6AC0, 0X6B80, 0XAB41, 0X6900, 0XA9C1, 0XA881, 0X6840,
        0X7800, 0XB8C1, 0XB981, 0X7940, 0XBB01, 0X7BC0, 0X7A80, 0XBA41,
        0XBE01, 0X7EC0, 0X7F80, 0XBF41, 0X7D00, 0XBDC1, 0XBC81, 0X7C40,
        0XB401, 0X74C0, 0X7580, 0XB541, 0X7700, 0XB7C1, 0XB681, 0X7640,
        0X7200, 0XB2C1, 0XB381, 0X7340, 0XB101, 0X71C0, 0X7080, 0XB041,
        0X5000, 0X90C1, 0X9181, 0X5140, 0X9301, 0X53C0, 0X5280, 0X9241,
        0X9601, 0X56C0, 0X5780, 0X9741, 0X5500, 0X95C1, 0X9481, 0X5440,
        0X9C01, 0X5CC0, 0X5D80, 0X9D41, 0X5F00, 0X9FC1, 0X9E81, 0X5E40,
        0X5A00, 0X9AC1, 0X9B81, 0X5B40, 0X9901, 0X59C0, 0X5880, 0X9841,
        0X8801, 0X48C0, 0X4980, 0X8941, 0X4B00, 0X8BC1, 0X8A81, 0X4A40,
        0X4E00, 0X8EC1, 0X8F81, 0X4F40, 0X8D01, 0X4DC0, 0X4C80, 0X8C41,
        0X4400, 0X84C1, 0X8581, 0X4540, 0X8701, 0X47C0, 0X4680, 0X8641,
        0X8201, 0X42C0, 0X4380, 0X8341, 0X4100, 0X81C1, 0X8081, 0X4040
    ]
    wCRCWord = 0xFFFF
    
    for byte in data:
        byte = byte & 0xFF
        nTemp = (byte ^ (wCRCWord & 0x00FF)) & 0x00FF
        wCRCWord = ((wCRCWord >> 8) ^ wCRCTable[nTemp]) & 0xFFFF
    
    return wCRCWord


def create_dfu_command():
    """Create DFU mode command packet."""
    request = []
    register = 0x00
    data = 0x00
    
    data = data & 0xFFFF
    dataLow = data & 0xFF
    dataHigh = (data >> 8) & 0xFF
    
    # start condition
    request.append(0x53)
    request.append(0x3D)
    # packet length
    request.append(0x03)
    # CRC placeholder
    request.append(0x00)
    request.append(0x00)
    # packet type command
    request.append(0x00)
    # register
    request.append(register)
    # data
    request.append(dataLow)
    request.append(dataHigh)
    # end condition
    request.append(0x3D)
    request.append(0x45)
    
    # Calculate and insert CRC
    crc = calculate_crc(request[6:])
    request[3] = crc & 0xFF
    request[4] = (crc >> 8) & 0xFF
    
    return bytearray(request)


def set_dfu_mode(port):
    """Send command to put device into DFU mode."""
    print(f"Sending DFU mode command to {port}...")
    try:
        ser = serial.Serial(
            port=port,
            baudrate=115200,
            timeout=0.5
        )
        
        command = create_dfu_command()
        print(f"DFU command: {list(command)}")
        ser.write(command)
        time.sleep(1)
        
        ser.close()
        print("DFU command sent")
        
        # Give device time to switch to DFU mode
        time.sleep(2)
        
    except serial.SerialException as e:
        print(f"ERROR: Failed to send DFU command: {e}")
        return False
    
    return True


def flash_firmware(firmware_path):
    """Flash firmware using dfu-util."""
    print(f"Flashing firmware: {firmware_path}")
    
    result = subprocess.run([
        "dfu-util",
        "-d", "0483:df11",
        "-a", "0",
        "-D", firmware_path,
        "--dfuse-address", "0x08000000:leave",
        "-R"
    ])
    
    if result.returncode == 0:
        print("Firmware flashed successfully!")
        return True
    else:
        print("ERROR: Firmware flashing failed!")
        return False


def main():
    parser = argparse.ArgumentParser(
        description="Flash stasis_fw.bin to STM device via DFU"
    )
    parser.add_argument(
        "--firmware-path",
        default=None,
        help="Path to stasis_fw.bin (default: same directory as script)"
    )
    args = parser.parse_args()
    
    # Determine firmware path
    if args.firmware_path:
        firmware_path = args.firmware_path
    else:
        script_dir = os.path.dirname(os.path.abspath(__file__))
        firmware_path = os.path.join(script_dir, "stasis_fw.bin")
    
    # Check if firmware file exists
    if not os.path.isfile(firmware_path):
        print(f"ERROR: Firmware file not found: {firmware_path}")
        sys.exit(1)
    
    print(f"Using firmware: {firmware_path}")
    
    # Check if already in DFU mode
    if check_dfu() == 0:
        print("Device is already in DFU mode, proceeding to flash...")
    else:
        # Find device port
        port = find_device_port()
        
        if port is None:
            print("ERROR: Could not find STM device and device is not in DFU mode")
            sys.exit(1)
        
        # Send DFU mode command
        if not set_dfu_mode(port):
            print("ERROR: Failed to put device into DFU mode")
            sys.exit(1)
        
        # Verify device entered DFU mode
        if check_dfu() != 0:
            print("ERROR: Device did not enter DFU mode")
            sys.exit(1)
        
        print("Device is now in DFU mode")
    
    # Flash firmware
    if flash_firmware(firmware_path):
        print("\n=== Firmware update completed successfully! ===")
        sys.exit(0)
    else:
        print("\n=== Firmware update failed! ===")
        sys.exit(1)


if __name__ == "__main__":
    main()
