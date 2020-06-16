//
//  File.swift
//  
//
//  Created by Evan Mckee on 6/15/20.
//

import Foundation

///Adding the limit check to the cyclic iterator protocol lets us safely add sequence conformance with all of the higher order functions that come along with it.
protocol FiniteCyclicIteratorProtocol:CyclicIteratorProtocol, Sequence {
    var limit:Int {get}
}



