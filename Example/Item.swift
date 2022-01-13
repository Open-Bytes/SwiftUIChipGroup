//
//  Item.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import Foundation

public struct Item: Identifiable, Hashable, ItemProtocol {
    public var id: String
    public var name: String
}

public enum Selection{
    case multiSelection
    case singleSelection
    case noSelection
}
