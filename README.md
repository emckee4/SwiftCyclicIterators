
# CyclicIterators

  

Implementation of cyclic permutation iterators in Swift for RandomAccessCollections and BidirectionalCollections. The basic iterators returned by some variation of the`cyclicIterator()` method will endlessly return values. This iterator doesn't conform to Sequence in order to prevent endless loops from calling higher order functions like map. The `finiteCyclicIterator(limit:Int)` methods on the other hand may only emit the designated number of values and has Sequence conformance enabled. The optional parameters are otherwise the same.

#### Optional Parameters
**stride**: Can be any integer, positive, negative, or zero, including one larger in magnitude than the length of the collection. Default is 1.
**startOffset**: Number of steps to offset for the first value. The default value of nil will be treated as an offset of zero when the stride is >= 0 and an offset f the stride if stride is < 0.

### Basic Use Examples
    let x = "abc".finiteCyclicIterator(limit:6).reduce(""){$0 + String($1)}
    /// x == "abcabc" => true
Or alternately with the infinite iterator:

    var  bd = "abc".cyclicIterator()
    for  _  in  0..<6 {
    print(bd.next() ?? "", terminator: " ")
    }
    ///yields:   a b c a b c
With a negative stride on a random access collection:

    let x = (1...3).finiteCyclicIterator(limit:6, stride:-1).map{$0}
    /// x == [3,2,1,3,2,1] => true

Combining multiple options:

    let x = (1...3).finiteCyclicIterator(limit:6, stride:6, startOffset: 3).map{$0}
    /// x == [1,1,1,1,1,1]  => true


    for word in ["one", "two", "three, "four"].finiteCyclicIterator(limit:6, startOffset: 1) {
            print(word)
    }
    /// yields:  two three four one two three
    
    
Copyright © 2020 by Evan McKee
