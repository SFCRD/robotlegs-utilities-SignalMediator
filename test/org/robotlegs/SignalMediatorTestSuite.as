//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package org.robotlegs
{
	import org.robotlegs.base.SignalMapFixture;
	import org.robotlegs.mvcs.SignalMediatorFixture;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  2011-01-26
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SignalMediatorTestSuite
	{
		//--------------------------------------
		//  TEST FIXTURES
		//--------------------------------------
		
		public var signalMapFixture : SignalMapFixture;
		
		public var signalMediatorFixture : SignalMediatorFixture;
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SignalMediatorTestSuite( )
		{
		}
	
	}

}
