//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package org.robotlegs.base
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;
	import org.osflash.signals.ISignalOwner;
	import org.osflash.signals.Signal;
	import org.robotlegs.base.SignalMap;
	import org.robotlegs.core.ISignalMap;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  26.01.2011
	 */
	public class SignalMapFixture
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var signalOne : ISignalOwner;
		
		private var signalTwo : ISignalOwner;
		
		private var signalMap : ISignalMap;
		
		//--------------------------------------
		//  STARTUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			signalOne = new Signal( );
			
			signalTwo = new Signal( );
			
			signalMap = new SignalMap( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description='maps a signal')]
		public function test_maps_a_signal( ) : void
		{
			assertThat( signalOne.numListeners, equalTo( 0 ) );
			
			signalMap.mapSignal( signalOne, function( ) : void { } );
			
			assertThat( signalOne.numListeners, equalTo( 1 ) );
		}
		
		[Test(description='unmaps a signal')]
		public function test_unmaps_a_signal( ) : void
		{
			var handler : Function = function( ) : void { };
			
			signalMap.mapSignal( signalOne, handler );
			
			assertThat( signalOne.numListeners, equalTo( 1 ) );
			
			signalMap.unmapSignal( signalOne, handler );
			
			assertThat( signalOne.numListeners, equalTo( 0 ) );
		}
	
		[Test(description='maps one signal to handler')]
		public function test_maps_one_signal_to_handler( ) : void
		{
			var called : Boolean = false;
			
			var handler : Function = function( ) : void
			{
				called = true;
			}
			
			signalMap.mapSignal( signalOne, handler );
			
			signalOne.dispatch( );
			
			assertThat( called, isTrue( ) );
		}
		
		[Test(description='maps two signals to handlers')]
		public function test_maps_two_signals_to_handlers( ) : void
		{
			var oneCalled : Boolean = false;
			
			var twoCalled : Boolean = false;
			
			var oneHandler : Function = function( ) : void
			{
				oneCalled = true;
			}
			
			var twoHandler : Function = function( ) : void
			{
				twoCalled = true;
			}
			
			signalMap.mapSignal( signalOne, oneHandler );
			
			signalMap.mapSignal( signalTwo, twoHandler );
			
			signalOne.dispatch( );
			
			signalTwo.dispatch( );
			
			assertThat( oneCalled, isTrue( ) );
			
			assertThat( twoCalled, isTrue( ) );
		}
		
		[Test(description='unmaps a signal to handler')]
		public function test_unmaps_a_signal_to_handler( ) : void
		{
			var called : Boolean = false;
			
			var handler : Function = function( ) : void
			{
				called = true;
			}
			
			signalMap.mapSignal( signalOne, handler );
			
			signalMap.unmapSignal( signalOne, handler );
			
			signalOne.dispatch( );
			
			assertThat( called, isFalse( ) );
		}
		
		[Test(description='unmaps all signals')]
		public function test_unmaps_all_signals( ) : void
		{
			signalMap.mapSignal( signalOne, function( ) : void { } );
			
			signalMap.mapSignal( signalTwo, function( ) : void { } );
			
			assertThat( signalOne.numListeners, equalTo( 1 ) );
			
			assertThat( signalTwo.numListeners, equalTo( 1 ) );
			
			signalMap.unmapSignals( );
			
			assertThat( signalOne.numListeners, equalTo( 0 ) );
			
			assertThat( signalTwo.numListeners, equalTo( 0 ) );
		}
		
		[Test(description='signal can be added twice with different handlers')]
		public function test_signal_can_be_added_twice_with_different_handlers( ) : void
		{
			var handlerOne : Function = function( ) : void { };
			
			var handlerTwo : Function = function( ) : void { };
			
			assertThat( signalOne.numListeners, equalTo( 0 ) );
			
			signalMap.mapSignal( signalOne, handlerOne );
			
			assertThat( signalOne.numListeners, equalTo( 1 ) );
			
			signalMap.mapSignal( signalOne, handlerTwo );
			
			assertThat( signalOne.numListeners, equalTo( 2 ) );
		}
		
		[Test(description='signal cannot be added with the same handler twice')]
		public function test_signal_cannot_be_added_with_the_same_handler_twice( ) : void
		{
			var handler : Function = function( ) : void { };
			
			assertThat( signalOne.numListeners, equalTo( 0 ) );
			
			signalMap.mapSignal( signalOne, handler );
			
			assertThat( signalOne.numListeners, equalTo( 1 ) );
			
			signalMap.mapSignal( signalOne, handler );
			
			assertThat( signalOne.numListeners, equalTo( 1 ) );
		}
		
		[Test(description='signal cannot be unmapped from a handler to which it has not been mapped')]
		public function test_signal_cannot_be_unmapped_from_a_handler_to_which_it_has_not_been_mapped( ) : void
		{
			var handler : Function = function( ) : void { };
			
			assertThat( signalOne.numListeners, equalTo( 0 ) );
			
			signalMap.unmapSignal( signalOne, handler );
		}
	
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SignalMapFixture( )
		{
		}

	}

}
