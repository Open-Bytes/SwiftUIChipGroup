//
//  TagViewBuilder.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public typealias TagViewBuilderClosure = (_ builder: TagViewBuilder) -> Void

public class TagViewBuilder {
    public var backgroundColorOfSelectedItem: Color? = nil
    public var backgroundColorOfUnSelectedItem: Color? = nil
    public var textSelectedColor: Color? = nil
    public var textUnselectedColor: Color? = nil
    public var customFont: Font? = nil
    public var type: Selection = .singleSelection
    public var listItems: [ItemProtocol]? = nil
    public var contentView: (() -> AnyView)? = nil
}
