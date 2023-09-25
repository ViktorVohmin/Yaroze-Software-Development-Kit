/********************************************************
 *							*
 *	Tuto0.c						*
 *	   Getting Started				*
 *							*
 *  Copyright (C) 1996 Sony Computer Entertainment Inc.	*
 *	All Rights Reserved				*
 *							*
 ********************************************************/




/******
Minimal program that prints the "hello world" message to 
the TV screen; the program quits when user presses 'select' 
on the standard controller.

After termination, the black playstation will reset itself to its
standard start screen (DTL-S3035 CONSOLE).
******/

   	

	// include libraries
#include <libps.h>

#include "pad.h"


	// constants

	// GPU packet space
#define PACKETMAX		(10000)
#define PACKETMAX2		(PACKETMAX*24)

	// size of ordering table: 2 << OT_LENGTH
	// i.e.	16384 levels of z resolution
#define OT_LENGTH		(14)	  


	// globals

	// Ordering Table handlers
GsOT		WorldOrderingTable[2];
	// actual Ordering Tables themselves							
GsOT_TAG	zSortTable[2][1<<OT_LENGTH];   
	// GPU packet work area
PACKET		GpuOutputPacket[2][PACKETMAX2];



	// main function
	// see pad.h and pad.c for the controller pad interface
  		
int main (void)
{
	u_long PadStatus = 0;		// state of controller pad
	int outputBufferIndex;		// which buffer is active (drawn on)


		// initialisation						
	SetVideoMode( MODE_NTSC );	// NTSC mode
//	SetVideoMode( MODE_PAL );	// PAL mode

		// graphical initialisation:
		// screen resolution 512 by 240,
		// non-interlace, use GsGPU offset
	ResetGraph(0);
	GsInitGraph(512 ,240, GsOFSGPU|GsNONINTER, 1, 0);			
	GsDefDispBuff(0, 0, 0, 256);

		// set up print-to-screen font
	FntLoad(960, 256);	
	FntOpen(32, 32, 256, 200, 0, 512);

		// set up the controller pad
	PadInit();

		// set up the ordering table handlers
	WorldOrderingTable[0].length = OT_LENGTH;
	WorldOrderingTable[1].length = OT_LENGTH;
	WorldOrderingTable[0].org = zSortTable[0];
	WorldOrderingTable[1].org = zSortTable[1];



	for (;;)			// main loop
		{
			// find status of controller pad
		PadStatus = PadRead();

			// if 'select' pressed, exit main loop
		if (PadStatus & PADselect)
			break;

			// find which buffer is active
		outputBufferIndex = GsGetActiveBuff();

			// set address for GPU scratchpad area
		GsSetWorkBase( (PACKET*)GpuOutputPacket[outputBufferIndex]);

			// clear the ordering table
		GsClearOt(0, 0, &WorldOrderingTable[outputBufferIndex]);

			// wait for end of drawing
		DrawSync(0);

			// wait for V_BLANK interrupt
		VSync(0);

			// swap double buffers
		GsSwapDispBuff();

			// register clear-command: clear to black
		GsSortClear(0x0, 0x0, 0x0,
				&WorldOrderingTable[outputBufferIndex]);

			// register request to draw ordering table
		GsDrawOt(&WorldOrderingTable[outputBufferIndex]);

					// print text to screen
		FntPrint("Hello World!\n");
		FntFlush(-1);
		}


		// clean up
	ResetGraph(3);
	return 0;
}
