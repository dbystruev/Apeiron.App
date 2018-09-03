//
//  TrackedArray.swift
//  ARKit Animation
//
//  Created by Denis Bystruev on 13/06/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//
//  Derived from https://www.raywenderlich.com/139591/building-custom-collection-swift

/// Array which stores the current index we are working with
struct TrackedArray<Element> {
    
    // using Array as internal data structure
    fileprivate var contents: [Element] = []
    
    /// The current index
    var currentIndex = 0 {
        didSet {
            currentIndex = safeIndex(currentIndex)
        }
    }
    
    /// The current element
    var current: Element {
        get {
            return self[currentIndex]
        }
        set {
            contents[currentIndex] = newValue
        }
    }
    
    /// The next element
    var next: Element {
        mutating get {
            currentIndex += 1
            return current
        }
    }
    
    /// The previous element
    var prev: Element {
        mutating get {
            currentIndex -= 1
            return current
        }
    }
    
    /// Initialize with array of elements
    ///
    /// - Parameter elements: array to initialize with
    init(_ elements: [Element]) {
        contents = elements
    }
    
    /// Initialize with variable number of elements
    ///
    /// - Parameter elements: list of elements to initialize with
    init(_ elements: Element...) {
        self.init(elements)
    }
    
    /// Calculate safe index to access array's elements
    ///
    /// - Parameter index: Unsafe index (out of range)
    /// - Returns: Safe index (in a range)
    /// - Note: If array has no elements safeIndex has no effect
    func safeIndex(_ index: Int) -> Int {
        // return index if there is no data
        guard !contents.isEmpty else { return index }
        
        // calculate and return safe index even if index < 0
        return (index % contents.count + contents.count) % contents.count
    }
}

// MARK: - Conforming to Sequence protocol
extension TrackedArray: Sequence {
    
    /// Iterator that can step through each element of the sequence
    func makeIterator() -> IndexingIterator<[Element]> {
        // return new array iterator
        return contents.makeIterator()
    }
}

// MARK: - Conforming to Collection protocol
extension TrackedArray: Collection {
    
    /// Start index from context
    var startIndex: Int {
        return contents.startIndex
    }
    
    /// End index from context
    var endIndex: Int {
        return contents.endIndex
    }
    
    /// Returns value at index
    ///
    /// - Parameter position: index in the array of elements
    subscript (position: Int) -> Element {
        return contents[safeIndex(position)]
    }
    
    /// Returns the next index
    ///
    /// - Parameter i: index after which to return next index
    /// - Returns: the value of next index
    func index(after i: Int) -> Int {
        return contents.index(after: i)
    }
}

extension TrackedArray: RangeReplaceableCollection {    
    
    /// Empty initializer
    init() { }
    
    /// Replaces the specified subrange of elements with the given collection
    ///
    /// - Parameters:
    ///   - subrange: The subrange of the collection to replace
    ///   - newElements: The new elements to add to the collection
    mutating func replaceSubrange<C, R>(_ subrange: R, with newElements: C) where C : Collection, R : RangeExpression, Element == C.Element, Int == R.Bound {
        contents.replaceSubrange(subrange, with: newElements)
    }
}
