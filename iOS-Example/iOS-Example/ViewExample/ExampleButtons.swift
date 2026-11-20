//
// ExampleButtons.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

import SwiftUI
import SirioKitIOS

struct ExampleButtons: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Buttons")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleButtons {
    
    enum Destination: Hashable {
        case primary
        case secondary
        case tertiaryLight
        case tertiaryDark
        case ghostLight
        case ghostDark
        case danger
        case dangerTertiary
        case dangerGhost
        
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Primary", action: { path.append(Destination.primary) }),
            .default(title: "Secondary", action: { path.append(Destination.secondary) }),
            .default(title: "Tertiary Light", action: { path.append(Destination.tertiaryLight) }),
            .default(title: "Tertiary Dark", action: { path.append(Destination.tertiaryDark) }),
            .default(title: "Ghost Light", action: { path.append(Destination.ghostLight) }),
            .default(title: "Ghost Dark", action: { path.append(Destination.ghostDark) }),
            .default(title: "Danger", action: { path.append(Destination.danger) }),
            .default(title: "Danger Tertiary", action: { path.append(Destination.dangerTertiary) }),
            .default(title: "Danger Ghost", action: { path.append(Destination.dangerGhost) }),

        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .primary:
            SirioButtonDemo(hierarchy: .primary)
                .background(Color.colorBackground)
                .navigationTitle("Primary")
        case .secondary:
            SirioButtonDemo(hierarchy: .secondary)
                .background(Color.colorBackground)
                .navigationTitle("Secondary")
        case .tertiaryLight:
            SirioButtonDemo(hierarchy: .tertiaryLight)
                .background(Color.colorBackground)
                .navigationTitle("Tertiary Light")
        case .tertiaryDark:
            SirioButtonDemo(hierarchy: .tertiaryDark)
                .background(Color.colorBackground)
                .navigationTitle("Tertiary Dark")
        case .ghostLight:
            SirioButtonDemo(hierarchy: .ghostLight)
                .background(Color.colorBackground)
                .navigationTitle("Ghost Light")
                .onTapGesture { self.hideKeyboard() }
        case .ghostDark:
            SirioButtonDemo(hierarchy: .ghostDark)
                .background(Color.colorBackground)
                .navigationTitle("Ghost Dark")
                .onTapGesture { self.hideKeyboard() }
            
        case .danger:
            SirioButtonDemo(hierarchy: .danger)
                .background(Color.colorBackground)
                .navigationTitle("Danger")
            
        case .dangerTertiary:
            SirioButtonDemo(hierarchy: .dangerTertiary)
                .background(Color.colorBackground)
                .navigationTitle("Danger")
            
        case .dangerGhost:
            SirioButtonDemo(hierarchy: .dangerGhost)
                .background(Color.colorBackground)
                .navigationTitle("Danger")
        }
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
