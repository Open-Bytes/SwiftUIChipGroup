//
//  TagListView.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct ChipGroup<T: ChipItemProtocol,
                       SelectedBackground: View,
                       DeselectedBackground: View>: View {
    @ObservedObject var vm: ChipGroupVM = ChipGroupVM<T>()

    private let width: CGFloat
    private let chips: [T]
    private let selection: Selection
    private var selectedBackground: SelectedBackground
    private var deselectedBackground: DeselectedBackground
    private var selectedTextColor: Color
    private var deselectedTextColor: Color
    private let font: Font?
    private let onItemSelected: ((T) -> Void)?

    public init(
            chips: [T],
            width: CGFloat,
            selection: Selection = .single,
            selectedBackground: SelectedBackground,
            deselectedBackground: DeselectedBackground,
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
                selectedItemBackgroundColor: selectedBackground.eraseToAnyView(),
                deselectedItemBackgroundColor: deselectedBackground.eraseToAnyView(),
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

extension ChipGroup where SelectedBackground == AnyView {
    public init(
            chips: [T],
            width: CGFloat,
            selection: Selection = .single,
            deselectedBackground: DeselectedBackground,
            selectedTextColor: Color = .white,
            deselectedTextColor: Color = .white,
            font: Font? = nil,
            onItemSelected: ((T) -> Void)? = nil) {
        self.init(
                chips: chips,
                width: width,
                selection: selection,
                selectedBackground: Capsule().fill(.blue).eraseToAnyView(),
                deselectedBackground: deselectedBackground,
                selectedTextColor: selectedTextColor,
                deselectedTextColor: deselectedTextColor,
                font: font,
                onItemSelected: onItemSelected)
    }
}

extension ChipGroup where DeselectedBackground == AnyView {
    public init(
            chips: [T],
            width: CGFloat,
            selection: Selection = .single,
            selectedBackground: SelectedBackground,
            selectedTextColor: Color = .white,
            deselectedTextColor: Color = .white,
            font: Font? = nil,
            onItemSelected: ((T) -> Void)? = nil) {
        self.init(
                chips: chips,
                width: width,
                selection: selection,
                selectedBackground: selectedBackground,
                deselectedBackground: Capsule().fill(.purple.opacity(0.8)).eraseToAnyView(),
                selectedTextColor: selectedTextColor,
                deselectedTextColor: deselectedTextColor,
                font: font,
                onItemSelected: onItemSelected)
    }
}

extension ChipGroup where SelectedBackground == AnyView, DeselectedBackground == AnyView {
    public init(
            chips: [T],
            width: CGFloat,
            selection: Selection = .single,
            selectedTextColor: Color = .white,
            deselectedTextColor: Color = .white,
            font: Font? = nil,
            onItemSelected: ((T) -> Void)? = nil) {
        self.init(
                chips: chips,
                width: width,
                selection: selection,
                selectedBackground: Capsule().fill(.blue).eraseToAnyView(),
                deselectedBackground: Capsule().fill(.purple.opacity(0.8)).eraseToAnyView(),
                selectedTextColor: selectedTextColor,
                deselectedTextColor: deselectedTextColor,
                font: font,
                onItemSelected: onItemSelected)
    }
}
