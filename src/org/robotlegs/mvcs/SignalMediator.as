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
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.core.ISignalMap;
	import org.robotlegs.base.SignalMap;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  26.01.2011
	 */
	public class SignalMediator extends Mediator
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SignalMediator( )
		{
			super( );
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		protected var _signalMap : ISignalMap;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * Local SignalMap
		 * 
		 * @return The ISignalMap for this Mediator
		 */
		protected function get signalMap( ) : ISignalMap
		{
			return _signalMap || ( _signalMap = new SignalMap( ) );
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 */
		override public function preRemove( ) : void
		{
			if( _signalMap )
			{
				_signalMap.unmapSignals( );
			}
			
			super.preRemove( );
		}
	
	}

}