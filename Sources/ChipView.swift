//
//  ChipView.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct ChipView<T: ChipItemProtocol>: View {
    private let width: CGFloat
    @State private var selectedItemBackgroundColor: AnyView
    @State private var deselectedItemBackgroundColor: AnyView
    @State private var selectedTextColor: Color
    @State private var deselectedTextColor: Color
    @State private var customFont: Font
    private let items: [T]
    private var type: Selection
    private let onItemTapped: (T) -> Void
    @State var selected = false

    public init(
            type: Selection,
            width: CGFloat,
            selectedItemBackgroundColor: AnyView,
            deselectedItemBackgroundColor: AnyView,
            selectedTextColor: Color,
            deselectedTextColor: Color,
            customFont: Font,
            items: [T],
            onItemTapped: @escaping (T) -> Void
    ) {
        self.width = width
        self.type = type
        self.selectedItemBackgroundColor = selectedItemBackgroundColor
        self.deselectedItemBackgroundColor = deselectedItemBackgroundColor
        self.selectedTextColor = selectedTextColor
        self.deselectedTextColor = deselectedTextColor
        self.customFont = customFont
        self.items = items
        self.onItemTapped = onItemTapped
    }

    public var body: some View {
        FlexibleView(
                availableWidth: width,
                data: items.map {
                    ItemContainer(item: $0)
                },
                spacing: 15,
                alignment: .leading
        ) { item in
            ItemView(item: item.item)
        }
                .padding(.horizontal, 30)
                .padding(.leading, 5)
                .padding(.trailing, 10)
    }

    private func ItemView(item: T) -> some View {
        Group {

            ChipItemView<T>(
                    item: item,
                    isSelected: item.isSelected,
                    selectedTextColor: selectedTextColor,
                    deselectedTextColor: deselectedTextColor,
                    selectedItemBackgroundColor: selectedItemBackgroundColor,
                    deselectedItemBackgroundColor: deselectedItemBackgroundColor,
                    customFont: customFont) { item in
                select(item: item)
                onItemTapped(item)
            }
        }
    }

    private func select(item: T) {
        switch type {
        case .multi:
            break
        case .single:
            for item in items {
                item.isSelected = false
            }
        case .none:
            return
        }
        guard !item.isSelected else {
            item.isSelected = false
            return
        }
        item.isSelected = true
    }
}

struct ChipItemView<T: ChipItemProtocol>: View {
    let item: T
    let isSelected: Bool
    let selectedTextColor: Color
    let deselectedTextColor: Color
    let selectedItemBackgroundColor: AnyView
    let deselectedItemBackgroundColor: AnyView
    let customFont: Font
    let onItemSelected: (T) -> Void

    init(item: T,
         isSelected: Bool,
         selectedTextColor: Color,
         deselectedTextColor: Color,
         selectedItemBackgroundColor: AnyView,
         deselectedItemBackgroundColor: AnyView,
         customFont: Font,
         onItemSelected: @escaping (T) -> ()) {
        self.item = item
        self.isSelected = isSelected
        self.selectedTextColor = selectedTextColor
        self.deselectedTextColor = deselectedTextColor
        self.selectedItemBackgroundColor = selectedItemBackgroundColor
        self.deselectedItemBackgroundColor = deselectedItemBackgroundColor
        self.customFont = customFont
        self.onItemSelected = onItemSelected
    }

    var body: some View {
        ZStack {
            isSelected ? selectedItemBackgroundColor : deselectedItemBackgroundColor
            Button(action: {
                onItemSelected(item)
            }, label: {
                Text(item.name)
                        .padding(.all, 5)
                        .foregroundColor(isSelected ? selectedTextColor : deselectedTextColor)
                        .font(customFont)
            })
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
        }
    }

}
