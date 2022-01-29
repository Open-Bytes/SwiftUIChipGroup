//
//  TagViewBuilder.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public typealias ChipBuilderClosure<T: ChipItemProtocol> = (_ builder: ChipBuilder<T>) -> Void

public class ChipBuilder<T: ChipItemProtocol> {
    public var chips: [T]
    public var defaultChips: [T] = []
    public var selection: Selection = .single
    public var chipStyle = ChipStyle()
    public var customFont: Font? = nil

    public init(chips: [T]) {
        self.chips = chips
    }
}

public struct ChipStyle {
    public var selectedBackground: AnyView
    public var deselectedBackground: AnyView
    public var selectedTextColor: Color
    public var deselectedTextColor: Color

    public init(selectedBackground: AnyView = AnyView(Capsule().fill(.blue.opacity(0.2))),
                deselectedBackground: AnyView = AnyView(Capsule().fill(.red)),
                selectedTextColor: Color = .red,
                deselectedTextColor: Color = .blue.opacity(0.5)) {
        self.selectedBackground = selectedBackground
        self.deselectedBackground = deselectedBackground
        self.selectedTextColor = selectedTextColor
        self.deselectedTextColor = deselectedTextColor
    }
}
