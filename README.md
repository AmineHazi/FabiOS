# FabiOS

FabiOS is an operating system project developed by Me. It is designed to run on a floppy disk using the FAT12 format. Currently, the project structure is as follows:

## Project Structure

- `scripts` folder:
  - `run.sh`: Script to run the OS with QEMU.
  - `debug.sh`: Script to debug the OS with Bochs.
  - `bochs_config`: Config file for bochs debugger.

- `src` folder:
  - `bootloader` folder:
    - `bootloader.asm`: Assembly code for the bootloader.

  - `kernel` folder:
    - *Work in progress*

- `Makefile`: Used to compile the OS and all components using NASM with the correct configuration.

Please note that this project is still under development.

## Requirements

To build and run FabiOS, you need to install the following dependencies:

- NASM: `sudo apt install nasm`
- Make: `sudo apt install make`
- QEMU: `sudo apt install qemu`
- Bochs: `sudo apt install bochs-sdl bochsbios vgabios`

Make sure to install these dependencies before proceeding with the build process.
