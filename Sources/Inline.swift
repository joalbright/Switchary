//
//  Inline.swift
//  Switchary
//
//  Created by Jo Albright on 01/05/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//


import Foundation


public func ??? <T: Equatable>(lhs: T?, rhs: [(T,AnyObject)]) -> AnyObject? {
    
    for r in rhs { if lhs == r.0 { return r.1 } }; return nil
    
}

public func ??? <T: Equatable>(lhs: T, rhs: [(T,AnyObject)]) -> AnyObject? {
    
    for r in rhs { if lhs == r.0 { return r.1 } }; return nil
    
}


public func ||| <T>(lhs: (T,AnyObject), rhs: (T,AnyObject)) -> [(T,AnyObject)] {
    
    return [lhs,rhs]
    
}

public func ||| <T>(lhs: [(T,AnyObject)], rhs: (T,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs + [rhs]
    
}

public func ||| <T>(lhs: (Range<T>,AnyObject), rhs: (Range<T>,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs.0.map { ($0,lhs.1) } + rhs.0.map { ($0,rhs.1) }
    
}

public func ||| <T>(lhs: (Range<T>,AnyObject), rhs: (T,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs.0.map { ($0,lhs.1) } + [rhs]
    
}

public func ||| <T>(lhs: [(T,AnyObject)], rhs: (Range<T>,AnyObject)) -> [(T,AnyObject)] {
    
    return lhs + rhs.0.map { ($0,rhs.1) }
    
}

public func --> <T>(lhs: T, rhs: AnyObject) -> (T,AnyObject) {
    
    return (lhs,rhs)
    
}