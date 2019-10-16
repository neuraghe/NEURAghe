# 
# Copyright (C) 2015 ETH Zurich and University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#
# Authors: Germain Haugou (germain.haugou@gmail.com)
#

from configs.pulp.PulpConfigCommon import *

class Padframe(Padframe_template):

	nbPads = 64

	pads = [

		# Alternate 1
		Pad( 9  -1 , 'gpio0',  muxId=1 ),
		Pad( 10 -1 , 'gpio1',  muxId=1 ),
		Pad( 11 -1 , 'gpio2',  muxId=1 ),
		Pad( 12 -1 , 'gpio3',  muxId=1 ),
		Pad( 17 -1 , 'gpio4',  muxId=1 ),
		Pad( 18 -1 , 'gpio5',  muxId=1 ),
		Pad( 19 -1 , 'gpio6',  muxId=1 ),
		Pad( 20 -1 , 'gpio7',  muxId=1 ),
		Pad( 21 -1 , 'gpio8',  muxId=1 ),
		Pad( 22 -1 , 'gpio9',  muxId=1 ),
		Pad( 23 -1 , 'gpio10', muxId=1 ),
		Pad( 24 -1 , 'gpio11', muxId=1 ),
		Pad( 25 -1 , 'gpio12', muxId=1 ),
		Pad( 26 -1 , 'gpio13', muxId=1 ),
		Pad( 27 -1 , 'gpio14', muxId=1 ),
		Pad( 28 -1 , 'gpio15', muxId=1 ),
		Pad( 29 -1 , 'gpio16', muxId=1 ),
		Pad( 30 -1 , 'gpio17', muxId=1 ),
		Pad( 31 -1 , 'gpio18', muxId=1 ),
		Pad( 32 -1 , 'gpio19', muxId=1 ),
		Pad( 33 -1 , 'gpio20', muxId=1 ),
		Pad( 34 -1 , 'gpio21', muxId=1 ),
		Pad( 35 -1 , 'gpio22', muxId=1 ),
		Pad( 36 -1 , 'gpio23', muxId=1 ),
		Pad( 37 -1 , 'gpio24', muxId=1 ),
		Pad( 38 -1 , 'gpio25', muxId=1 ),
		Pad( 39 -1 , 'gpio26', muxId=1 ),
		Pad( 40 -1 , 'gpio27', muxId=1 ),
		Pad( 44 -1 , 'gpio28', muxId=1 ),
		Pad( 45 -1 , 'gpio29', muxId=1 ),
		Pad( 46 -1 , 'gpio30', muxId=1 ),
		Pad( 47 -1 , 'gpio31', muxId=1 ),
		Pad( 51 -1 , 'gpio32', muxId=1 ),
		Pad( 52 -1 , 'gpio33', muxId=1 ),

	]

	def __init__(self):
		super(Padframe, self).__init__(self.nbPads, self.pads)