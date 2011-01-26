//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package org.robotlegs.core
{
	import org.osflash.signals.ISignalOwner;

	/**
	 * Interface describing the contract for...
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  26.01.2011
	 */
	public interface ISignalMap
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		/**
		 * adds a handler to a signal
		 * @param signal ISignal
		 * @param handler Function
		 */
		function mapSignal( signal : ISignalOwner, handler : Function ) : void;
		
		/**
		 * removes a handler from a signal
		 * @param signal ISignal
		 * @param handler Function
		 */
		function unmapSignal( signal : ISignalOwner, handler : Function ) : void;
		
		/**
		 * removes all handlers from all signals that have been mapped
		 */
		function unmapSignals( ) : void;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
	}

}
