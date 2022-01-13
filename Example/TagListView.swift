//
//  TagListView.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import SwiftUI

struct TaglistView<T:ItemProtocol>: View{
    let builder: TagViewBuilder
    @ObservedObject var vm : TagListViewVM = TagListViewVM()

    
    var body: some View {
      TagView()
    }
    private func TagView() -> some View {
        Group{
            //TODO:- FORCE UNWRAPP
      ChipView(
            type: builder.type,
            backgroundColorOfSelectedItem: builder.backgroundColorOfSelectedItem ?? .blue,
            backgroundColorOfUnSelectedItem:builder.backgroundColorOfUnSelectedItem ?? .gray.opacity(0.2),
            textSelectedColor: builder.textSelectedColor ?? .gray,
            textUnselectedColor: builder.textUnselectedColor ?? .white,
            customFont: builder.customFont ?? .system(size: 20, weight: .light, design: .default),
            items: builder.listItems!.map{ Element in
                Item(id: Element.id, name: Element.name)

            },
                selectedItems: $vm.listSelectedItems
      ) {_ in

      } contentView:{
          guard let content = builder.contentView else {
                  return Capsule().eraseToAnyView()
              }
          return content()
      }
        }
    }
    
   public static func build(builder: @escaping TagViewBuilderClosure) -> TaglistView {
        let obj = TagViewBuilder()
        builder(obj)
       return TaglistView(builder: obj)
    }
}
public extension View {

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

}
