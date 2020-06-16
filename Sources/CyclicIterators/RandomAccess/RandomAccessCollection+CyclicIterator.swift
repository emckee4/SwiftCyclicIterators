//
//  RandomAccessCollection+CyclicIterator.swift
//  
//
//  Created by Evan Mckee on 6/12/20.
//

import Foundation

extension RandomAccessCollection {
    func cyclicNext(from i:Index, offset:Int) -> Index  {
        let adjustedOffset = (self.distance(from: self.startIndex, to: i) + (offset % self.indices.count) + self.indices.count) % self.indices.count
        return self.index(self.startIndex, offsetBy: adjustedOffset)
    }
    
    public func cyclicIterator(stride:Int = 1, startOffset:Int? = nil) -> RandomAccessCyclicIterator<Self> {
        return RandomAccessCyclicIterator(cycleElements:self, stride:stride, startOffset:startOffset)
    }
    
    public func finiteCyclicIterator(limit: Int, stride: Int = 1, startOffset: Int? = nil) -> RandomAccessFiniteCyclicIterator<Self> {
        return RandomAccessFiniteCyclicIterator(cycleElements: self, limit: limit, stride: stride, startOffset: startOffset)
    }
}
