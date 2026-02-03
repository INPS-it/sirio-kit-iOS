//
// SirioPopover.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioPopover: View {
    private let title: String?
    private let subtitle: String?
    private let textButton: String?
    private let onTapButton: (() -> Void)?
    
    public init(title: String?, subtitle: String?, textButton: String? = nil, onTapButton: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.textButton = textButton
        self.onTapButton = onTapButton
    }
    
    private let backgroundColor: Color = .aliasBackgroundColorPrimaryDark120
    private let textColor: Color = .aliasTextColorPrimaryLight0
    private let cornerRadius: CGFloat = Size.k8
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.s12) {
            if let title, !title.isEmpty {
                SirioText(text: title, typography: .labelMdHeavy)
                    .foregroundStyle(textColor)
            }
            
            if let subtitle, !subtitle.isEmpty {
                SirioText(text: subtitle, typography: .bodySmRegular)
                    .foregroundStyle(textColor)
            }
            
            if let textButton, let onTapButton, !textButton.isEmpty {
                SirioButton(
                    hierarchy: .tertiaryDark,
                    size: .medium,
                    text: textButton,
                    action: onTapButton
                )
                .padding(.top, Size.s4)
            }
        }
        .padding(Size.p12)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}


#Preview {
    VStack {
        SirioPopover(title: "Titolo",
                     //subtitle: "Lorem ipsum sed eu consequat cras vitae eros.",
                     subtitle: .loremIpsum,
                     textButton: "Azione",
                     onTapButton: {})
        
        SirioPopover(title: "Titolo",
                     subtitle: "Lorem ipsum sed eu consequat cras vitae eros.",
                     textButton: "Azione",
                     onTapButton: {})
    }
    .padding()
}
