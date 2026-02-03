//
//  ExampleSegmentedControls.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleSegmentedControls: View {
    @Binding var path: NavigationPath
    @State private var selectedIndexLabel: Int = 0
    @State private var selectedIndexIcon: Int = 0
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Segmented Controls")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleSegmentedControls {
    
    enum Destination: Hashable {
        case label
        case icon
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Label", action: { path.append(Destination.label) }),
            .default(title: "Icon", action: { path.append(Destination.icon) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .label:
            ScrollView {
                SirioSegmentedControls(selectedIndex: $selectedIndexLabel, options: Array(repeating: "Label", count: 5))
                    .padding()
                
                SirioSegmentedControlsSectionDemo(elements: 2, showText: true)
                SirioSegmentedControlsSectionDemo(elements: 3, showText: true)
                SirioSegmentedControlsSectionDemo(elements: 4, showText: true)
                SirioSegmentedControlsSectionDemo(elements: 5, showText: true)
            }
            .navigationTitle("Segmented Controls Label")
            .background(Color.colorBackground)
            
        case .icon:
            ScrollView {
                SirioSegmentedControls(selectedIndex: $selectedIndexIcon, icons: Array(repeating: .previewCube, count: 5))
                    .padding()
                
                SirioSegmentedControlsSectionDemo(elements: 2, showText: false)
                SirioSegmentedControlsSectionDemo(elements: 3, showText: false)
                SirioSegmentedControlsSectionDemo(elements: 4, showText: false)
                SirioSegmentedControlsSectionDemo(elements: 5, showText: false)
            }
            .navigationTitle("Segmented Controls Icon")
            .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleSegmentedControls(path: .constant(NavigationPath()))
}

struct SirioSegmentedControlsSectionDemo: View {
    var elements: Int
    var showText: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(0..<elements, id: \.self) { i in
                if showText {
                    SirioSegmentedControls(
                        selectedIndex: .constant(i),
                        options: Array(repeating: "Label", count: elements)
                    )
                } else {
                    SirioSegmentedControls(
                        selectedIndex: .constant(i),
                        icons: Array(repeating: .previewCube, count: elements)
                    )
                }
            }
        }
        .padding()
    }
}
