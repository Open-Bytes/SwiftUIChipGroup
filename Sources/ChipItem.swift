//
// Created by Shaban Kamel on 13/01/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public struct ChipItem: ChipItemProtocol {
    
    public var id: String
    public var name: String
    public var isDefault: Bool = false
    
    public init(id: String, name: String,isDefault: Bool = false) {
        self.id = id
        self.name = name
        self.isDefault = isDefault
    }
}
