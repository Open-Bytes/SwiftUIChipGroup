//
//  TagListView.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct ChipGroup<T: ChipItemProtocol>: View {
    @ObservedObject var vm: ChipGroupVM = ChipGroupVM<T>()

    private let width: CGFloat
    private let chips: [T]
    private let selection: Selection
    private var selectedBackground: AnyView
    private var deselectedBackground: AnyView
    private var selectedTextColor: Color
    private var deselectedTextColor: Color
    private let font: Font?
    private let onItemSelected: ((T) -> Void)?

    public init(
            chips: [T],
            width: CGFloat,
            selection: Selection = .single,
            selectedBackground: AnyView = AnyView(Capsule().fill(.blue)),
            deselectedBackground: AnyView = AnyView(Capsule().fill(.purple.opacity(0.8))),
            selectedTextColor: Color = .white,
            deselectedTextColor: Color = .white,
            font: Font? = nil,
            onItemSelected: ((T) -> Void)? = nil) {
        self.chips = chips
        self.width = width
        self.selection = selection
        self.selectedBackground = selectedBackground
        self.deselectedBackground = deselectedBackground
        self.selectedTextColor = selectedTextColor
        self.deselectedTextColor = deselectedTextColor
        self.font = font
        self.onItemSelected = onItemSelected
    }

    public var body: some View {
        ChipItemsView()
    }

    private func ChipItemsView() -> some View {
        ChipView(
                type: selection,
                width: width,
                selectedItemBackgroundColor: selectedBackground,
                deselectedItemBackgroundColor: deselectedBackground,
                selectedTextColor: selectedTextColor,
                deselectedTextColor: deselectedTextColor,
                customFont: font ?? .system(size: 20, weight: .light, design: .default),
                items: chips
        ) { item in
            updateSelectedItems(item: item)
            onItemSelected?(item)
        }
    }

    private func updateSelectedItems(item: T) {
        guard !item.isSelected else {
            vm.selectedItems.removeAll {
                $0.id == item.id
            }
            return
        }
        vm.selectedItems.append(item)
    }
}
