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
	import org.osflash.signals.ISignalOwner;
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
	public class SignalMap implements ISignalMap
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SignalMap( )
		{
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _signals : Array;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * @private
		 */
		private function get signals( ) : Array
		{
			return _signals || ( _signals = new Array( ) );
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 * @param signal ISignal
		 * @param handler Function
		 */
		public function mapSignal( signal : ISignalOwner, handler : Function ) : void
		{
			var params : Object;
			
			var i : int = signals.length;
			
			while( i-- )
			{
				params = signals[ i ];
				
				if( params.signal == signal && params.handler == handler )
				{
					return;
				}
			}
			
			signals.push( { signal : signal, handler : handler } );
			
			signal.add( handler );
		}

		/**
		 * @inheritDoc
		 * @param signal ISignal
		 * @param handler Function
		 */
		public function unmapSignal( signal : ISignalOwner, handler : Function ) : void
		{
			var params : Object;
			
			var i : int = signals.length;
			
			while( i-- )
			{
				params = signals[ i ];
				
				if( params.signal == signal && params.handler == handler )
				{
					signals.splice( i, 1 );
				}
			}
			
			signal.remove( handler );
		}

		/**
		 * @inheritDoc
		 */
		public function unmapSignals( ) : void
		{
			var params : Object;
			
			var signal : ISignalOwner;
			
			while( signals.length )
			{
				params = signals.pop( );
				
				signal = params.signal;
				
				signal.removeAll( );
			}
		}
	
	}

}
