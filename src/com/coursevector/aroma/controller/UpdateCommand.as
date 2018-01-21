////////////////////////////////////////////////////////////////////////////////
//
//  COURSE VECTOR
//  Copyright 2008 Course Vector
//  All Rights Reserved.
//
//  NOTICE: Course Vector permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
/**
* Manages all settings pertaining to the PlayListProxy
* 
* @author Gabriel Mariani
* @version 0.1
*/

package com.coursevector.aroma.controller {
	
	import org.puremvc.as3.multicore.interfaces.ICommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	import com.coursevector.aroma.ApplicationFacade;
	import com.coursevector.aroma.model.UpdateProxy;
	
	public class UpdateCommand extends SimpleCommand implements ICommand {
		
		override public function execute(note:INotification):void {
			var u:UpdateProxy = facade.retrieveProxy(UpdateProxy.NAME) as UpdateProxy;
			
			switch(note.getName()) {
				case ApplicationFacade.INITIALIZED :
				case ApplicationFacade.UPDATE_CHECK :
					u.check();
					break;
				case ApplicationFacade.UPDATE_INSTALL :
					u.update();
					break;
			}
		}
	}
}