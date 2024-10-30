#include <stdint.h>
#include <stddef.h>


#define VGA_WIDTH 80
#define VGA_HEIGHT 25

// Define the VGA text mode buffer
volatile uint16_t* vga_buffer = (uint16_t*)0xB8000;
int vga_index = 0;

// Function to clear the screen
void clear_screen() {
  for (int y = 0; y < VGA_HEIGHT; y++) {
    for (int x = 0; x < VGA_WIDTH; x++) {
      vga_buffer[y * VGA_WIDTH + x] = (uint16_t) ' ' | (0x07 << 8);
    }
  }
  vga_index = 0;
}

// Function to print a string to the screen
void print_string(const char* str) {
  for (size_t i = 0; str[i] != '\0'; i++) {
    vga_buffer[vga_index++] = (uint16_t) str[i] | (0x07 << 8);
  }
}

// Kernel entry point
void kernel_main() {
  clear_screen();
  while(1){
    // Loop forever
    print_string("Hello, World! Welcome to FabiOS.");
  }
}