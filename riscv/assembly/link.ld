/*
 * The stack starts at the top of memory, defined by __sp, and grows down.
 * Unfortunately this means we must hardcode the size of memory.
 * Here we choose 64K. Change this value to change the working memory size.
 */

START_LOC = 0x0;
STACK_SIZE = 0x10000; /* 64 kB */
__sp = START_LOC + STACK_SIZE;

ENTRY(_start) /* Name of program entry */

SECTIONS
{
  . = START_LOC;
  .text.init : { *(.text.init) }
  .text : { *(.text) }
  . = ALIGN(0x1000);
  .data : { *(.data) }
  .bss : { *(.bss) }
  . = ALIGN(STACK_SIZE);
}
