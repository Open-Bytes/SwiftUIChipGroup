//
// Created by Shaban on 25/05/2021.
// Copyright (c) 2021 sha. All rights reserved.
//

import SwiftUI
import ChipGroup

struct FirstExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Spacer().frame(height: 100)
                ChipGroup1()
                ChipGroup2()
                ChipGroup3()
            }
        }
    }

    private func ChipGroup1() -> some View {
        Group {
            let items = [
                ChipItem(name: "Reg"),
                ChipItem(name: "Green"),
                ChipItem(name: "Blue"),
                ChipItem(name: "Purple"),
                ChipItem(name: "Orange")
            ]

            ChipGroup(
                    chips: items,
                    width: UIScreen.main.bounds.width - 120,
                    selection: .single,
                    selectedBackground: Capsule().fill(Color.orange),
                    deselectedBackground: Capsule().fill(Color.pink.opacity(0.8)),
                    selectedTextColor: .white,
                    deselectedTextColor: .white,
                    font: .system(size: 20, weight: .bold, design: .default)
            )
        }
    }

    private func ChipGroup2() -> some View {
        Group {
            let items = [
                ChipItem(name: "1", isSelected: true),
                ChipItem(name: "2"),
                ChipItem(name: "3")
            ]

            ChipGroup(
                    chips: items,
                    width: UIScreen.main.bounds.width - 120,
                    selection: .single,
                    selectedBackground: CircleBackground(color: .green),
                    deselectedBackground: CircleBackground(color: .yellow),
                    selectedTextColor: .white,
                    deselectedTextColor: .white,
                    font: .system(size: 20, weight: .bold, design: .default)
            )
        }
    }

    private func ChipGroup3() -> some View {
        Group {
            let items = [
                ChipItem(name: "First"),
                ChipItem(name: "Second"),
                ChipItem(name: "Third")
            ]

            ChipGroup(
                    chips: items,
                    width: UIScreen.main.bounds.width - 120,
                    selection: .multi,
                    font: .system(size: 20, weight: .bold, design: .default)
            )
        }
    }

}

struct CircleBackground: View {
    var color: Color
    var body: some View {
        content()
    }

    private func content() -> some View {
        VStack(spacing: 6) {
            Circle().fill(color)
                    .frame(width: 70, height: 70)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstExample()
    }
}

