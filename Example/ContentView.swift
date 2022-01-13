//
// Created by Shaban on 25/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaglistView<listItem>.build { builder in
            builder.backgroundColorOfSelectedItem = .red
            builder.backgroundColorOfUnSelectedItem = .blue.opacity(0.2)
            builder.customFont = .system(size: 30, weight: .bold, design: .default)
            builder.type = .multiSelection
            builder.textSelectedColor = .white
            builder.textUnselectedColor = .red
            builder.listItems = [listItem(id: "1", name: "first")
                                 ,listItem(id: "2", name: "sec")
                                 ,listItem(id: "3", name: "third")]
            builder.contentView = CustomView().eraseToAnyView
        }
    }
}
struct CustomView: View {
  
    var body: some View {
        content()
    }

    private func content() -> some View {
        VStack(spacing: 6) {
         Capsule()
       }
    }
}

struct listItem : ItemProtocol{
    var id: String
    var name: String

    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

