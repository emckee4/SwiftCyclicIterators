//
//  RandomAccessCyclicIterator.swift
//  
//
//  Created by Evan Mckee on 6/12/20.
//

import Foundation

/// Uses RandomAccess indices for O(1) striding
public struct RandomAccessCyclicIterator<C:RandomAccessCollection>:CyclicIteratorProtocol {
    public let elements:C
    public var nextIndex:C.Index
    public let stride:Int
            
    public mutating func next() -> C.Element? {
        guard !elements.isEmpty else {return nil}
        let output = self.elements[nextIndex]
        self.nextIndex = elements.cyclicNext(from: self.nextIndex, offset: stride)
        return output
    }

    public init(cycleElements:C, stride:Int = 1, startOffset:Int? = nil) {
        self.elements = cycleElements
        self.stride = stride
        self.nextIndex = cycleElements.startIndex
        if !elements.isEmpty && (startOffset != nil || stride < 0) {
            let offset = startOffset ?? stride
            self.nextIndex = self.elements.cyclicNext(from: self.nextIndex, offset: offset)
        }
    }
}

