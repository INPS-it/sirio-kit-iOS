//
// SirioButtonControls.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioButtonControls: View {
    var text: String?
    var iconData: SirioIconData?
    @Binding var isSelected: Bool
    
    init(text: String, isSelected: Binding<Bool>) {
        self.text = text
        self.iconData = nil
        self._isSelected = isSelected
    }
    
    init(iconData: SirioIconData, isSelected: Binding<Bool>) {
        self.text = nil
        self.iconData = iconData
        self._isSelected = isSelected
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            if let text = text {
                createTextButton(with: text)
            } else if let iconData = iconData {
                createIconButton(with: iconData)
            }
            Spacer()
        }
        .frame(height: Size.SirioSegmentedControls.SirioButtonControls.height)
        .background(isSelected ? Color.SegmentedControls.Button.Background.selected : Color.SegmentedControls.Button.Background.default)
        .clipShape(RoundedRectangle(cornerRadius: Size.SirioSegmentedControls.SirioButtonControls.cornerRadius))
    }
    
    @ViewBuilder
    private func createTextButton(with text: String) -> some View {
        SirioText(text: text, typography: .labelMdHeavy)
            .foregroundStyle(isSelected ? Color.SegmentedControls.Button.Text.selected : Color.SegmentedControls.Button.Text.default)
            .padding(.horizontal, Size.SirioSegmentedControls.SirioButtonControls.paddingHorizontal)
    }
    
    @ViewBuilder
    private func createIconButton(with iconData: SirioIconData) -> some View {
        SirioIcon(data: iconData)
            .foregroundStyle(isSelected ? Color.SegmentedControls.Button.Icon.selected : Color.SegmentedControls.Button.Icon.default)
            .frame(width: Size.SirioSegmentedControls.SirioButtonControls.iconFrame, height: Size.SirioSegmentedControls.SirioButtonControls.iconFrame)
    }
}

#Preview {
    SirioButtonControls(iconData: .previewHeart, isSelected: .constant(true))
    SirioButtonControls(iconData: .previewHeart, isSelected: .constant(false))
    SirioButtonControls(text: "Label", isSelected: .constant(true))
    SirioButtonControls(text: "Label", isSelected: .constant(true))
}


