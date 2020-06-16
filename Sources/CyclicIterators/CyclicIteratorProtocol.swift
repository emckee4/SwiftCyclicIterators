import Foundation

public protocol CyclicIteratorProtocol:IteratorProtocol {
    associatedtype C where C:BidirectionalCollection, C.Element == Element
    var elements:C {get}
    var stride:Int {get}
}

