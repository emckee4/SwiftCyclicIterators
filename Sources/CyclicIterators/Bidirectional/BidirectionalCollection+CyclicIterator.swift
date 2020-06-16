//
//  BidirectionalCollection+CyclicIterator.swift
//  
//
//  Created by Evan Mckee on 6/12/20.
//

import Foundation

extension BidirectionalCollection {
    func cyclicNext(from i:Index, offset:Int) -> Index {
        var i = i
        if offset > 0 {
            for _ in 0..<offset {
                i = self.index(after: i)
                if i == self.endIndex {
                    i = self.startIndex
                }
            }
        } else if offset < 0 {
            for _ in 0..<(-offset) {
                if i == self.startIndex {
                    i = self.endIndex
                }
                i = self.index(before: i)
            }
        }
        return i
    }
    
    public func cyclicIterator(stride:Int = 1, startOffset:Int? = nil) -> BidirectionalCyclicIterator<Self> {
        return BidirectionalCyclicIterator(cycleElements:self, stride:stride, startOffset:startOffset)
    }
    
    public func finiteCyclicIterator(limit:Int, stride:Int = 1, startOffset:Int? = nil) -> BidirectionalFiniteCyclicIterator<Self> {
        return BidirectionalFiniteCyclicIterator(cycleElements:self, limit:limit, stride:stride, startOffset:startOffset)
    }
}
