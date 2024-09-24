//
// SirioMenuSpallaSection.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation
import SwiftUI

public struct SirioMenuSpallaSection: View {
    private var section: SirioMenuSpallaSectionItemData
    @Binding var selectedID: UUID
    
    public init(section: SirioMenuSpallaSectionItemData, selectedID: Binding<UUID>) {
        self.section = section
        _selectedID = selectedID
    }
    
    public var body: some View {
        VStack(spacing: Size.MenuSpalla.spacing) {
            if let title = section.titleSection, !title.isEmpty {
                SirioMenuSpallaItemTitleSection(title: title)
            }
            ForEach(section.items){ item in
                SirioMenuSpallaExpandleItem(item: item, selectedID: $selectedID)
            }
        }
        
    }
}
