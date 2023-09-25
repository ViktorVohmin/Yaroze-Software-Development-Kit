Quickstart introduction
-----------------------


	This directory holds some quick-start programs,
and subdirectories tackling specific topics.

	The quick-start programs are there to enable you to quickly 
check that everything is working on your Black PlayStation 
development system.


	Here is the basic material to run through the whole cycle of
software development on the Black PlayStation :-


(1)	Create/edit C files 
		[these already present in this directory: tuto0.c and tuto1.c]



(2)	Compile and link the C files to create executables
		[this done via 'make']



(3)	Run the 'siocons' console tool to establish contact
	between the Black PlayStation and the PC



(4)	Run a special batch file to download and run the executables
	(try batch0 and batch1)



	      		
 
The way forward
---------------

(1)	Set up the Black PlayStation: link to the PC, to the TV,
	attach the controller pad, etc.	See the Startup Guide
	for details.



(2)	Turn on the PC, TV and the Black PlayStation;
	wait for the ready-to-go screen to appear, 
	which looks like this :-


  	  ----------------------------------------------------	
  	 |      CIP VERSION 2.0 STARTUP                       |
   	 |      ACCESS CARD CHECKING...OK                     |
 	 |      MEMORY CARD CHECKING...NOT FOUND              |
 	 |      TERMINAL SPEED 9600 BPS                       |
 	 |                                                    |
 	 |						      |
 	 |						      |
 	 |						      |
 	 |						      |
 	 |						      |
 	 |						      |
 	 |						      |
 	 |						      |
 	 |                 DTL-S3035 CONSOLE                  |
	  ----------------------------------------------------


	[The background on which this text appears is grey brick].

	This screen should appear within 30 seconds of turning on
	or resetting the Black PlayStation, after the Sony and
	PlayStation logo screens.


	
(3)	On the PC, bring up an MS-DOS box;
	if the batch file needed for the Black PlayStation
	has not been invoked for this MS-DOS box,
	invoke it now (see Startup Guide for details).



(4)	Compile the sample programs. This is done by invoking the
	'make' utility: type 'make' to the DOS prompt.
	This creates the executable programs from the source files. 
			
	e.g. 		c:\psx\quick> make


			
(5)	Invoke the console tool:

	c:\psx\quick> siocons

	or, if you have already changed the baud rate, type

	c:\ps\quick> siocons -B<baud-rate>

	Now you are in siocons, the console tool used to communicate
	with the Black PlayStation from the PC.

	Screen output should look like this :-

	C:\psx\quick> siocons -B115200
	siocons -- PlayStation debug system console prog
	   for DTLH3000 1996/05/10 00:00:03
	   type  F1   ----> display help
	   when hung up try type  ESC
	 I/O addr = 0x03F8, IRQ=4(vect=0x000C,8259=20)
	 BAUDRATE = 115200



(6)	Check that the Black PlayStation is responsive by 
	pressing return: if all is well, the siocons prompt 
	will appear, which is a double-right arrow:

	>>



(7)	Run a special batch file to run a sample program:
	firstly press [F3] on the PC, this will cause 
	an Auto[1]: prompt to be displayed. Then enter the 
	name of the batch file; e.g. batch0 or batch1

	E.g. [after pressing F3]:

	Auto[1]: batch0				

	batch0 will cause program tuto0 to be downloaded and run.



(8)	Downloading: immediately after invoking
	the batch file, downloading messages should appear;
	those on the MS-DOS box should look like this: 

	tuto0 [ .text] address:80100000-801001ef size:0001f0  0001f0:    1sec.
	tuto0 [.rdata] address:801001f0-8010020f size:000020  000020:    1sec.
	tuto0 [ .data] address:80100210-8010035f size:000150  000150:    2sec.
	tuto0 [.sdata] address:80100360-801003df size:000080  000080:    2sec.

	the donwloading messages on the TV screen 
	should look like this:

	BINARY DATA TRANSFER - BWR
	ADRS = 80100000
	SIZE = 000001F0 BYTES
	INTO BURST TRANSFER  SUM:11		1F0/		1F0 BYTES
	DONE.



(9)	What the sample programs do:

	Tuto0 (invoked by batch0) prints "Hello World!" 
	to the TV screen; terminate this program by pressing 
	<select> on the Black PlayStation controller pad.

	Tuto1 (invoked by batch1) prints "Hello World!" 
	to the siocons console on the PC, and terminates
	automatically.



(10)	After you have run one program, when it has terminated
	the Black PlayStation will reset itself, going back
	to the ready-to-download screen	(see (2) above);
	siocons will produce its prompt again (>>).
	Now you can invoke other batch files to run more programs.



(11)	To quit siocons and return to the MS-DOS prompt, 
	press [F10] then [F2],
	or just press ESCAPE.


			

(12)	Moving on:

		The source files, makefile and batch files
	are all simple text files and are easily edited to 
	see their contents. 
				
		Look at the sample code to get to grips with what the
	Black PlayStation can do, and how to achieve this 
	by writing C programs.







Directory contents
------------------

C files for the sample programs :-

	tuto0.c			
	tuto1.c	
	pad.c				

Makefile:
   		
	makefile

Batch files:

	batch0			downloads and runs tuto0
	batch1			downloads and runs tuto1 
		
			
Subdirectories:
	make - a help file on the program updating utility 'make' 
				and some example makefiles

	batch - a help file on batch (autoexecution) files
				and some example batch files

	baudrate - a help file on changing the baud rate
				(rate of data downloading from the PC)
