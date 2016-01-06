//
//  Closure.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//


public func ??? <T: Comparable>(lhs: T, rhs: T -> AnyObject?) -> AnyObject? {
    
    return rhs(lhs)
    
}