//
// Created by Shaban Kamel on 13/01/2022.
// Copyright (c) 2022 sha. All rights reserved.
//

import Foundation

public struct ChipItem: ChipItemProtocol {
    public var id: String
    public var name: String

    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
