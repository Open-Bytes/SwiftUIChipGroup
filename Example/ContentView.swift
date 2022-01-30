//
// Created by Shaban on 25/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI
import ChipGroup

struct FirstExample: View {
    var body: some View {
        let items = [
            ChipItem(id: "1", name: "first"),
            ChipItem(id: "2", name: "sec"),
            ChipItem(id: "3", name: "third")
        ]
     
        ChipGroup<ChipItem>.build(chips: items) { builder in
            builder.chipStyle = ChipStyle(
                selectedBackground: AnyView(Capsule().fill(Color.red)),
                deselectedBackground: AnyView(Capsule().fill(Color.blue.opacity(0.2))),
                    selectedTextColor: .white,
                    deselectedTextColor: .red
            )
            builder.customFont = .system(size: 30, weight: .bold, design: .default)
            builder.selection = .single
        }
    }
}

struct SecondExample: View {
    var body: some View {
        let items = [
            ChipItem(id: "1", name: "first",isDefault: true),
            ChipItem(id: "2", name: "sec"),
            ChipItem(id: "3", name: "third")
        ]

        ChipGroup<ChipItem>.build(chips: items) { builder in
            builder.chipStyle = ChipStyle(
                selectedBackground: AnyView(CustomView(color: .green)),
                deselectedBackground: AnyView(CustomView(color: .yellow)),
                    selectedTextColor: .yellow,
                    deselectedTextColor: .green
            )
            builder.customFont = .system(size: 30, weight: .bold, design: .default)
            builder.selection = .single
        }
    }
}

struct ThirdExample: View {
    var body: some View {
        let items = [
            ChipItem(id: "1", name: "first"),
            ChipItem(id: "2", name: "sec"),
            ChipItem(id: "3", name: "third")
        ]

        ChipGroup<ChipItem>.build(chips: items) { builder in

        }
    }
}
struct CustomView: View {
    var color: Color
    var body: some View {
        content()
    }

    private func content() -> some View {
        VStack(spacing: 6) {
            Circle().fill(color)
                .frame(width: 80, height: 80)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstExample()
    }
}

