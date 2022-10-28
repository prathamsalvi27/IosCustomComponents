//
//  HigherOrderFunctions.swift
//  IosCustomComponents
//
//  Created by Prathamesh Salvi on 26/10/22.
//

import Foundation
extension Array {
    //Map
    func customMap<T>(transfrom: (Element) -> T) -> [T] {
        var mapArray = [T]()
        forEach { element in
            mapArray.append(transfrom(element))
        }
        return mapArray
    }
    //Compact Map
    func customCompactMap<T>(transfrom: (Element) -> T?) -> [T] {
        var compactMapArray = [T]()
        forEach { element in
            if let value = transfrom(element) {
                compactMapArray.append(value)
            }
        }
        return compactMapArray
    }
    //Filter
    func customFilter(isIncluded: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        forEach { element in
            if isIncluded(element) {
                result.append(element)
            }
        }
        return result
    }
    //Reduce
    func customReduce<T>(into: T, reduce: (T,Element) -> T) -> T {
        var result: T = into
        forEach { element in
            result = reduce(result, element)
        }
        return result
    }
}
