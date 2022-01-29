//
//  TagListView.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct ChipGroup<T: ChipItemProtocol>: View {
    let builder: ChipBuilder<T>
    @ObservedObject var vm: ChipGroupVM = ChipGroupVM<T>()

    public var body: some View {
        ChipItemsView()
    }

    private func ChipItemsView() -> some View {
        Group {
            ChipView(
                    type: builder.selection,
                    selectedItemBackgroundColor: builder.chipStyle.selectedBackground,
                    deselectedItemBackgroundColor: builder.chipStyle.deselectedBackground,
                    selectedTextColor: builder.chipStyle.selectedTextColor,
                    deselectedTextColor: builder.chipStyle.deselectedTextColor,
                    customFont: builder.customFont ?? .system(size: 20, weight: .light, design: .default),
                    items: builder.chips,
                    defaultItems: builder.defaultChips,
                    selectedItems: $vm.listSelectedItems
            ) { _ in
            }
        }
    }

    public static func build(
            chips: [T],
            build: @escaping ChipBuilderClosure<T>) -> ChipGroup {
        let builder = ChipBuilder(chips: chips)
        build(builder)
        return ChipGroup(builder: builder)
    }
}

public extension View {

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

}
