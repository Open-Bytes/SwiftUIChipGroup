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

    public init(selectedBackground: AnyView = AnyView(Capsule().background(Color.blue)),
                deselectedBackground: AnyView = AnyView(Capsule().background(Color.gray.opacity(0.2))),
                selectedTextColor: Color = .gray.opacity(0.2),
                deselectedTextColor: Color = .blue) {
        self.selectedBackground = selectedBackground
        self.deselectedBackground = deselectedBackground
        self.selectedTextColor = selectedTextColor
        self.deselectedTextColor = deselectedTextColor
    }
}
