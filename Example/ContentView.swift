//
// Created by Shaban on 25/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI
import ChipGroup

struct ContentView: View {
    var body: some View {
        let items = [
            ChipItem(id: "1", name: "first"),
            ChipItem(id: "2", name: "sec"),
            ChipItem(id: "3", name: "third")
        ]
        ChipGroup<ChipItem>.build(chips: items) { builder in
            builder.chipStyle = ChipStyle(
                    selectedBackground: AnyView(Color.blue.opacity(0.2)),
                    deselectedBackground: AnyView(Color.red),
                    selectedTextColor: .white,
                    deselectedTextColor: .red
            )
            builder.customFont = .system(size: 30, weight: .bold, design: .default)
            builder.selection = .multi
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

