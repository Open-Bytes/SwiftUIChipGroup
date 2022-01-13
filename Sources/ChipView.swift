//
//  ChipView.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct ChipView<T: ChipItemProtocol>: View {

    @State private var selectedItemBackgroundColor: AnyView
    @State private var deselectedItemBackgroundColor: AnyView
    @State private var selectedTextColor: Color
    @State private var deselectedTextColor: Color
    @State private var customFont: Font
    private let items: [T]
    private var type: Selection
    private let onItemTapped: (T) -> Void
    @State var selected = false
    @Binding private var selectedItems: [T]

    public init(type: Selection,
                selectedItemBackgroundColor: AnyView,
                deselectedItemBackgroundColor: AnyView,
                selectedTextColor: Color,
                deselectedTextColor: Color,
                customFont: Font,
                items: [T],
                selectedItems: Binding<[T]>,
                onItemTapped: @escaping (T) -> Void

    ) {
        self.type = type
        self.selectedItemBackgroundColor = selectedItemBackgroundColor
        self.deselectedItemBackgroundColor = deselectedItemBackgroundColor
        self.selectedTextColor = selectedTextColor
        self.deselectedTextColor = deselectedTextColor
        self.customFont = customFont
        self.items = items
        _selectedItems = selectedItems
        self.onItemTapped = onItemTapped
    }

    public var body: some View {
        FlexibleView(
                availableWidth: UIScreen.main.bounds.width - 120,
                data: items,
                spacing: 15,
                alignment: .leading
        ) { (item: T) in
            Button(action: {
                print("item is", item)
                selectItem(item)
                onItemTapped(item)
            }, label: {
                Text(item.name)
                        .padding(.all, 5)
                        .foregroundColor(selectedItems.contains(item) ? selectedTextColor : deselectedTextColor)
                        .font(customFont)
            })
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .background(
                            selectedItems.contains(item) ? selectedItemBackgroundColor : deselectedItemBackgroundColor
                    )
        }
                .padding(.horizontal, 30)
                .padding(.leading, 5)
                .padding(.trailing, 10)
    }

    private func selectItem(_ item: T) {
        select(type: type, item: item)
    }

    func multiSelect(item: T) {
        if selectedItems.contains(item) {
            selectedItems.removeAll {
                $0.id == item.id
            }
            return
        }

        selectedItems.append(item)
    }

    func singleSelect(item: T) {
        selectedItems.removeAll()
        if selectedItems.contains(item) {
            selectedItems.removeAll {
                $0.id == item.id
            }
            return
        }
        selectedItems.append(item)
    }

    func select(type: Selection, item: T) {
        switch type {
        case .multi:
            multiSelect(item: item)
        case .single:
            singleSelect(item: item)
        case .none:
            break
        }
    }
}
