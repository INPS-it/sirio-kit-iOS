//
// SirioMenuSpallaItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioMenuSpalla: View {
    @State private var selectedID: UUID = UUID()
    @State private var isOpen: Bool = false
    @Binding public var titleDrawer: String
    @Binding public var subtitle: String
    public var sections: [SirioMenuSpallaSectionItemData]
    public var onTapDrawer: ((Bool) -> Void)?
    
    public init(titleDrawer: Binding<String>,
                subtitle: Binding<String> = .constant(""),
                sections: [SirioMenuSpallaSectionItemData],
                onTapDrawer: ((Bool) -> Void)? = nil) {
        self._titleDrawer = titleDrawer
        self._subtitle = subtitle
        self.sections = sections
        self.onTapDrawer = onTapDrawer
        
        // Validazione della profondità degli elementi
        validateSectionsDepth()
    }
    
    private func validateSectionsDepth() {
        let allItems = sections.flatMap { $0.items }
        
        if allItems.contains(where: { $0.hasInvalidDepth() }) {
            fatalError("Menu spalla invalid deep > 3")
        }
    }
    
    public var body: some View {
        VStack(spacing: Size.MenuSpalla.spacing) {
            SirioMenuSpallaDrawerItem(title: titleDrawer,
                                      subtitle: subtitle,
                                      isOpen: $isOpen,
                                      onTapAction: {
                selectedID = UUID()
                onTapDrawer?(isOpen)
                
            })
            if isOpen {
                ForEach(sections) { section in
                    SirioMenuSpallaSection(section: section, selectedID: $selectedID)
                }
            }
        }
    }
}

struct TestSirioMenuSpalla: View {
    var items: [SirioMenuSpallaItemData] = [
        SirioMenuSpallaItemData(value: "Label 1 ", children: [
            SirioMenuSpallaItemData(value: "Label 1.1", children: [
                SirioMenuSpallaItemData(value: "Label 1.1.1"),
                SirioMenuSpallaItemData(value: "Label 1.1.2"),
            ]),
            SirioMenuSpallaItemData(value: "Label 1.2", children: [
                SirioMenuSpallaItemData(value: "Label 1.2.1"),
                
            ])
        ]),
        SirioMenuSpallaItemData(value: "Label 2", children: [
            SirioMenuSpallaItemData(value: "Label 2.1", children: [
                SirioMenuSpallaItemData(value: "Label 2.1.1"),
                SirioMenuSpallaItemData(value: "Label 2.1.2"),
            ]),
            SirioMenuSpallaItemData(value: "Label 2.2", children: [
                SirioMenuSpallaItemData(value: "Label 2.2.1"),
                SirioMenuSpallaItemData(value: "Label 2.2.2"),
            ]),
        ])
    ]
    
    var body: some View {
        VStack {
            Spacer()
            SirioMenuSpalla(titleDrawer: .constant("Title"), subtitle: .constant("Subtitle"), sections: [
                .init(titleSection: "Sezione", items: items)])
        }
    }
}

#Preview {
    TestSirioMenuSpalla()
}
