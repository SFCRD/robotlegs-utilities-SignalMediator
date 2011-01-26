//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package org.robotlegs.mvcs
{
	import org.hamcrest.assertThat;
	import org.hamcrest.core.isA;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.sameInstance;
	import org.osflash.signals.ISignalOwner;
	import org.osflash.signals.Signal;
	import org.robotlegs.core.ISignalMap;
	import org.robotlegs.mvcs.SignalMediator;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  26.01.2011
	 */
	public class SignalMediatorFixture extends SignalMediator
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description='provides a signal map accessor')]
		public function test_provides_a_signal_map_accessor( ) : void
		{
			assertThat( signalMap, isA( ISignalMap ) );
		}
		
		[Test(description='retrieving signal map twice should yield same object')]
		public function test_retrieving_signal_map_twice_should_yield_same_object( ) : void
		{
			assertThat( signalMap, sameInstance( signalMap ) );
		}
		
		[Test(description='unmaps all signals on removal')]
		public function test_unmaps_all_signals_on_removal( ) : void
		{
			var signal : ISignalOwner = new Signal( );
			
			assertThat( signal.numListeners, equalTo( 0 ) );
			
			signalMap.mapSignal( signal, function( ) : void { } );
			
			assertThat( signal.numListeners, equalTo( 1 ) );
			
			preRemove( );
			
			assertThat( signal.numListeners, equalTo( 0 ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SignalMediatorFixture( )
		{
		}

	}

}
