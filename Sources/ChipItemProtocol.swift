//
//  ItemProtocol.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import Foundation

public protocol ChipItemProtocol: Hashable {
    var id: String { get set }
    var name: String { get set }
    var isDefault: Bool { get set }
}
