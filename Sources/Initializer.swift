//
//  Initializer.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//

import Foundation

public protocol SwitchInit { init() }

public extension SwitchInit {
    
    init<T>(_ a: T, @noescape _ b: (T, inout Self) -> Void) { self.init(); b(a,&self) }
    init<T: RawRepresentable>(_ a: T, @noescape _ b: (T, inout Self) -> Void) { self.init(); b(a,&self) }
    
}
