/********************************************************
 *							*
 *	Tuto1.c						*
 *	   Getting Started				*
 *							*
 *  Copyright (C) 1996 Sony Computer Entertainment Inc.	*
 *	All Rights Reserved				*
 *							*
 ********************************************************/



/******
Minimal program that prints the "hello world" message to the 
siocons console in the MS-DOS box on the PC.

Note: the program will terminate almost immediately after
invocation; the black playstation will reset itself to its
standard start screen (DTL-S3030 CONSOLE).
******/


#include <libps.h>


void main (void)
{
	printf("\n\n\nHello World!\n\n\n\n");
}
