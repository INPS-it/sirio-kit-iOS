//
// Avviso.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A view that represents an informational alert with an icon, title, text, and an optional link.
/// This component is used to display an alert message with customizable content and a link action.
///
/// - Parameters:
///   - title: The title of the alert, typically a short and bold message describing the alert.
///   - text: The body of the alert, providing more detailed information about the alert.
///   - link: The text displayed on the link button, which is optional. If provided, a clickable link will appear below the alert text.
///   - onTapLinkAction: A callback that is executed when the link is tapped. This is optional and will be triggered if a link is provided.

public struct SirioAvviso: View {
    var title: String
    var text: String
    var link: String?
    var onTapLinkAction: (() -> Void)?
    
    public init(schemeColor: SchemeColor = .dark,
                title: String,
                text: String,
                link: String? = nil,
                onTapLinkAction: (() -> Void)? = nil){
        self.title = title
        self.text = text
        self.link = link
        self.onTapLinkAction = onTapLinkAction
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.Avviso.vSpacing){
            
            HStack(spacing: Size.Avviso.hSpacing){
                SirioIcon(data: .init(icon: .infoCircle))
                    .frame(width: Size.Avviso.icon, height: Size.Avviso.icon)
                    .foregroundColor(iconColor)
                SirioText(text: title, typography: .headlineSmHeavy)
                    .foregroundColor(titleColor)
                    .lineLimit(1)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                
                SirioText(text: text, typography: .bodySmRegular)
                    .foregroundColor(textColor)
                
                if let link = link, !link.isEmpty {
                    Button(action: {
                        onTapLinkAction?()
                    }, label: {
                        SirioText(text: link, typography: .linkSmHeavy, isUnderlined: true)
                            .foregroundColor(linkColor)
                    })
                }
            }
            .padding(.leading, Size.Avviso.paddingLeading)
        }
        .padding(Size.Avviso.padding)
        .background(Rectangle().fill(backgroundColor).cornerRadius(Size.Avviso.cornerRadius))
    }
    
    private var iconColor: Color {
        return Color.Avviso.icon
    }
    
    private var titleColor: Color {
        return Color.Avviso.title
    }
    
    private var textColor: Color {
        return Color.Avviso.text
    }
    
    private var linkColor: Color {
        return Color.Avviso.link
    }
    
    private var backgroundColor: Color {
        return Color.Avviso.background
    }
}

#Preview {
    
    SirioAvviso(title: "Titolo avviso", text: .loremIpsum)
        .padding()
    
    SirioAvviso(title: "Titolo avviso", text: .loremIpsum, link: "Link opzionale")
        .padding()
}

