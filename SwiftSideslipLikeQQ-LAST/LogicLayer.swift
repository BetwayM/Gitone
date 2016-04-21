//
//  LogicLayer.swift
//  Graceful
//
//  Created by MacBook on 16/4/12.
//  Copyright © 2016年 com.lvwenhan. All rights reserved.
//

import Foundation

class LogicLayer: NSObject {
    var logicer:LogicLayer!
    func createLogicObject() ->LogicLayer{
        if logicer==nil
        {
            logicer=LogicLayer()
        }
        return logicer
    }
    func getUserFromServer(callback:(NSMutableArray!,NSError!)) ->Void {
        
    }
}