//
//  ChipView.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

public struct ChipView: View {
    
    @State private var backgroundColorOfSelectedItem : Color
    @State private var backgroundColorOfUnSelectedItem : Color
    @State private var textSelectedColor : Color
    @State private var textUnselectedColor : Color
    @State private var customFont: Font
    private let items: [Item]
    private var type: Selection
    private let onItemTapped: (Item) -> Void
    @State var selected = false
    @Binding private var selectedItems: [Item]
    let contentView: () -> AnyView

    public init(type: Selection,
                backgroundColorOfSelectedItem: Color,
                backgroundColorOfUnSelectedItem: Color,
                textSelectedColor: Color,
                textUnselectedColor: Color,
                customFont: Font,
                items: [Item],
                selectedItems: Binding<[Item]>,
                onItemTapped: @escaping (Item) -> Void,
                @ViewBuilder contentView: @escaping () -> AnyView

    ) {
        self.type = type
        self.backgroundColorOfSelectedItem = backgroundColorOfSelectedItem
        self.backgroundColorOfUnSelectedItem = backgroundColorOfUnSelectedItem
        self.textSelectedColor = textSelectedColor
        self.textUnselectedColor = textUnselectedColor
        self.customFont = customFont
        self.items = items
        _selectedItems = selectedItems
        self.onItemTapped = onItemTapped
        self.contentView = contentView
    }
  
    public var body: some View {
        FlexibleView(
                availableWidth: UIScreen.main.bounds.width - 120,
                data: items,
                spacing: 15,
                alignment: .leading
        ) { (item: Item) in
            Button(action: {
                print("item is", item)
                selectItem(item)
                onItemTapped(item)
            }, label: {
                Text(item.name)
                        .padding(.all, 5)
                        .foregroundColor(selectedItems.contains(item) ? textSelectedColor : textUnselectedColor)
                        .font(customFont)
            })
                    .padding(.horizontal, 10)
                    .padding(.vertical, 3)
                    .background(
                        contentView().foregroundColor(selectedItems.contains(item) ? backgroundColorOfSelectedItem : backgroundColorOfUnSelectedItem)
                    )
        }
                .padding(.horizontal, 30)
                .padding(.leading, 5)
                .padding(.trailing, 10)
    }

    private func selectItem(_ item: Item) {
        select(type: type, item: item)
    }
    
    func multiSelect(item: Item){
        if selectedItems.contains(item) {
            selectedItems.removeAll {
                $0.id == item.id
            }
            return
        }

        selectedItems.append(item)
    }
    func singleSelect(item: Item){
        selectedItems.removeAll()
        if selectedItems.contains(item) {
            selectedItems.removeAll {
                $0.id == item.id
            }
            return
        }
        selectedItems.append(item)
    }
    
    func select(type: Selection,item: Item){
        switch type {
        case .multiSelection:
            multiSelect(item: item)
        case .singleSelection:
            singleSelect(item: item)
        case .noSelection:
            break
        }
    }
}
