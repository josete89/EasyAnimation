//
//  RBBSpringAnimation.h
//  RBBAnimation
//
//  Created by Robert Böhnke on 10/14/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

//
//  RBBBlockBasedArray.swift
//
//  Swift intepretation of the Objective-C original by Marin Todorov
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

import Foundation

typealias RBBBlockBasedArrayBlock = (Int) -> Any

class RBBBlockBasedArray: NSArray {
    
    fileprivate var countBlockBased: Int = 0
    fileprivate var block: RBBBlockBasedArrayBlock? = nil
    
    //can't do custom init because it's declared in an NSArray extension originally
    //and can't override it from here in Swift 1.2; need to do initialization from an ordinary method
    
    func setCount(_ count: Int, block: @escaping RBBBlockBasedArrayBlock) {
        self.countBlockBased = count;
        self.block = block
    }
    
    override var count: Int {
        return countBlockBased
    }
    
    //will crash if block is not set
    override func object(at index: Int) -> Any {
        return block!(index)
    }
    
}
