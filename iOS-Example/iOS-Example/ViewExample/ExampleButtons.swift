//
// ExampleButtons.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleButtons: View {
    var body: some View {
        List {
            // Primary
            NavigationLink(destination: {
                SirioButtonDemo(hierarchy: .primary)
                    .background(Color.colorBackground)
                    .navigationTitle("Primary")
            }, label: {
                SirioText(text: "Primary", typography: .label_md_400)
            })
            
            // Secondary
            NavigationLink(destination: {
                SirioButtonDemo(hierarchy: .secondary)
                    .navigationTitle("Secondary")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Secondary", typography: .label_md_400)
            })
            
            // Tertiary Light
            NavigationLink(destination: {
                SirioButtonDemo(hierarchy: .tertiaryLight)
                    .navigationTitle("Tertiary Light")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Tertiary Light", typography: .label_md_400)
            })
            
            // Tertiary Dark
            NavigationLink(destination: {
                SirioButtonDemo(hierarchy: .tertiaryDark)
                    .navigationTitle("Tertiary Dark")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Tertiary Dark", typography: .label_md_400)
            })
            
            // Danger
            NavigationLink(destination: {
                SirioButtonDemo(hierarchy: .danger)
                    .navigationTitle("Danger")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Danger", typography: .label_md_400)
            })
            
            // Ghost
            NavigationLink(destination: {
                SirioButtonDemo(hierarchy: .ghost)
                    .navigationTitle("Ghost")
                    .background(Color.colorBackground)
                    .onTapGesture {
                        self.hideKeyboard()
                    }
            }, label: {
                SirioText(text: "Ghost", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Buttons")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    SirioButtonDemo(hierarchy: .primary)
}

struct SirioButtonDemo: View {
    var hierarchy: SirioButtonHierarchy
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(SirioSize.allCases, id: \.self) { size in
                    VStack(alignment: .leading) {
                        SirioText(text: "\(size.rawValue.capitalized)", typography: .headlineSmMiddle)
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: nil, action: {})
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: nil, isDisabled: .constant(true), action: {})
                                Spacer()
                                
                            }
                            HStack {
                                Spacer()
                                
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowRight, action: {})
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowRight, isDisabled: .constant(true), action: {})
                                Spacer()
                                
                            }
                            HStack {
                                Spacer()
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowLeft, iconAlignment: .leading, action: {})
                                
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowLeft, iconAlignment: .leading, isDisabled: .constant(true), action: {})
                                Spacer()
                                
                            }
                            HStack {
                                Spacer()
                                
                                SirioButton(hierarchy: hierarchy, size: size, text: nil, iconData: .previewArrowRight, action: {})
                                SirioButton(hierarchy: hierarchy, size: size, text: nil, iconData: .previewArrowRight, isDisabled: .constant(true), action: {})
                                Spacer()
                                
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
