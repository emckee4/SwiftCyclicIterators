//
//  RandomAccessFiniteCyclicIterator.swift
//  
//
//  Created by Evan Mckee on 6/15/20.
//

import Foundation

/// Uses RandomAccess indices for O(1) striding
public struct RandomAccessFiniteCyclicIterator<C:RandomAccessCollection>:FiniteCyclicIteratorProtocol {
    public let elements:C
    public let stride:Int
    public let limit:Int
    var nextIndex:C.Index
    var outputCount:Int
            
    public mutating func next() -> C.Element? {
        guard outputCount < limit && !elements.isEmpty else {return nil}
        let output = self.elements[nextIndex]
        self.outputCount += 1
        self.nextIndex = elements.cyclicNext(from: self.nextIndex, offset: stride)
        return output
    }

    public init(cycleElements:C, limit:Int, stride:Int = 1, startOffset:Int? = nil) {
        self.elements = cycleElements
        self.stride = stride
        self.nextIndex = cycleElements.startIndex
        self.limit = limit
        self.outputCount = 0
        if !elements.isEmpty && (startOffset != nil || stride < 0) {
            let offset = startOffset ?? -1
            self.nextIndex = self.elements.cyclicNext(from: self.nextIndex, offset: offset)
        }
    }
}
