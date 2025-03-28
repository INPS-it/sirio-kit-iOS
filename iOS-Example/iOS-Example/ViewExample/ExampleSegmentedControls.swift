//
//  ExampleSegmentedControls.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SirioKitIOS
import SwiftUI

struct ExampleSegmentedControls: View {
    
    @State var selectedIndexLabel: Int = 0
    @State var selectedIndexIcon: Int = 0
    
    var body: some View {
        List{
            NavigationLink(destination: {
                ScrollView {
                    SirioSegmentedControls(selectedIndex: $selectedIndexLabel, options: Array(repeating: "Label", count: 5)).padding()
                    
                    SirioSegmentedControlsSectionDemo(elements: 2, showText: true)
                    SirioSegmentedControlsSectionDemo(elements: 3, showText: true)
                    SirioSegmentedControlsSectionDemo(elements: 4, showText: true)
                    SirioSegmentedControlsSectionDemo(elements: 5, showText: true)
                }
                .navigationTitle("Segmented Controls Label")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Label", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                ScrollView {
                    SirioSegmentedControls(selectedIndex: $selectedIndexIcon, icons: Array(repeating: .previewCube, count: 5)).padding()
                    
                    SirioSegmentedControlsSectionDemo(elements: 2, showText: false)
                    SirioSegmentedControlsSectionDemo(elements: 3, showText: false)
                    SirioSegmentedControlsSectionDemo(elements: 4, showText: false)
                    SirioSegmentedControlsSectionDemo(elements: 5, showText: false)
                }
                .navigationTitle("Segmented Controls Icon")
                .background(Color.colorBackground)
                
            }, label: {
                SirioText(text: "Icon", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Segmented Controls")
        .listStyle(GroupedListStyle())
    }
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
