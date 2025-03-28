//
// SirioTag.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// Various type of colored tag
public enum SirioTagType: CaseIterable {
    case gray, blue, red, orange, green, white
}

/// SirioTag component representing a color-coded label
/// - Parameters:
///   - type: The color type of the tag [SirioTagType]
///   - text: The label text displayed within the tag

public struct SirioTag: View {
    private var type: SirioTagType
    private var text: String
    
    public init(type: SirioTagType, text: String){
        self.type = type
        self.text = text
    }
    
    public var body: some View {
        SirioText(text: text, typography: Typography.labelMdHeavy)
            .lineLimit(1)
            .foregroundColor(textColor)
            .padding(.horizontal, Size.Tag.paddingHorizontal)
            .background(backgroundColor)
            .cornerRadius(Size.Tag.cornerRadius)
            .frame(height: Size.Tag.height)
    }
}

extension SirioTag {
    private var textColor: Color {
        switch type {
        case .white:
            return Color.Tag.Text.secondary
        case .orange:
            return Color.Tag.Text.dark
        default:
            return Color.Tag.Text.default
        }
    }
    
    private var backgroundColor: Color {
        switch type {
        case .gray:
            return Color.Tag.Background.gray
        case .blue:
            return Color.Tag.Background.blue
        case .red:
            return Color.Tag.Background.red
        case .orange:
            return Color.Tag.Background.orange
        case .green:
            return Color.Tag.Background.green
        case .white:
            return Color.Tag.Background.white
        }
    }
}

#Preview {
    VStack {
        ForEach(SirioTagType.allCases, id: \.self){ type in
            SirioTag(type: type, text: "Label Tag")
        }
    }
    .padding()
    .background(Color.gray.opacity(0.2))
}
