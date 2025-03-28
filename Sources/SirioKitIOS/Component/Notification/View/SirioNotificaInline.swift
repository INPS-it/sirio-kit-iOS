//
// SirioNotificInline.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Inline notification component for displaying various states (alert, info, warning, success).
/// - Parameters:
///   - state: The current state of the notification (alert, info, warning, success).
///   - title: The title text of the notification.
///   - subtitle: The subtitle text for additional information.
///   - link: An optional link that can trigger an action when tapped.
///   - showCloseButton: A flag indicating whether the close button is displayed.
///   - onCloseAction: A callback function to be executed when the close button is tapped.
///   - onTapLinkAction: A callback function to be executed when the link is tapped.

public struct SirioNotificaInline: View {
    var state: SirioNotificaState
    var title: String
    var subtitle: String
    var link: String?
    var showCloseButton: Bool
    var onCloseAction: (() -> Void)?
    var onTapLinkAction: (() -> Void)?
    
    public init(state: SirioNotificaState,
                title: String,
                subtitle: String,
                link: String? = nil,
                showCloseButton: Bool = true,
                onCloseAction: (() -> Void)? = nil,
                onTapLinkAction: (() -> Void)? = nil){
        self.state = state
        self.title = title
        self.subtitle = subtitle
        self.link = link
        self.showCloseButton = showCloseButton
        self.onCloseAction = onCloseAction
        self.onTapLinkAction = onTapLinkAction
    }
    
    public var body: some View {
        HStack(spacing: Size.zero){
            Rectangle()
                .fill(color)
                .frame(maxHeight: .infinity)
                .frame(width: Size.Notifica.Inline.rectangleWidth)
            
            VStack(spacing: Size.zero){
                
                HStack(spacing: Size.zero){
                    SirioIcon(data: .init(icon: icon))
                        .frame(width: Size.Notifica.iconFrame, height: Size.Notifica.iconFrame)
                        .foregroundStyle(color)
                    Spacer()
                    if showCloseButton {
                        Button(action: {
                            onCloseAction?()
                        }, label: {
                            SirioIcon(data: .init(icon: .times))
                                .frame(width: Size.Notifica.iconCloseFrame, height: Size.Notifica.iconCloseFrame)
                                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                        })
                    }
                }
                .padding(.bottom, Size.Notifica.Inline.paddingBottom)

                HStack {
                    VStack(alignment: .leading, spacing: Size.zero) {
                        SirioText(text: title, typography: .headlineSmHeavy)
                            .lineLimit(0)
                            .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                            .padding(.bottom, Size.Notifica.paddingBottom)

                        SirioText(text: subtitle, typography: .bodySmRegular)
                            .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                            .padding(.bottom, Size.Notifica.paddingBottom)
                        
                        if let link = link {
                            Button(action: {
                                onTapLinkAction?()
                            }, label: {
                                SirioText(text: link, typography: .link_p_md_01, isUnderlined: true)
                                    .foregroundStyle(Color.aliasInteractivePrimaryDefault)
                            })
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            .padding(.top, Size.Notifica.paddingTop)
            .padding(.horizontal, Size.Notifica.paddingHorizontal)
        }
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity)
        .background(Color.aliasBackgroundColorPrimaryLight0)
        .cornerRadius(Size.Notifica.Inline.cornerRadius) // Arrotonda il contenuto
        .overlay(
            RoundedRectangle(cornerRadius: Size.Notifica.Inline.cornerRadius) // Applica un bordo arrotondato
                .stroke(color, lineWidth: Size.Notifica.Inline.lineWidth)
        )
        .setAccessibilityLabel(title + subtitle + (link ?? ""))
    }
   
    var color: Color {
        switch state {
        case .alert:
            return Color.globalSemanticAlert100 // controllare perche alias background color alert non ci sta nei foundation
        case .info:
            return Color.globalPrimary100 // controllare perche alias background color info non ci sta nei foundation
        case .warning:
            return Color.globalSemanticWarning100 // controllare perche alias background color warning non ci sta nei foundation
        case .success:
            return Color.globalSemanticSuccess100 // controllare perche alias background color success non ci sta nei foundation
        }
    }
    
    var icon: AwesomeIcon {
        switch state {
        case .alert:
            return .exclamationTriangle
        case .info:
            return .infoCircle
        case .warning:
            return .exclamationCircle
        case .success:
            return .checkCircle
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 10) {
            SirioNotificaInline(state: .alert, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")

            SirioNotificaInline(state: .info, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
            
            SirioNotificaInline(state: .warning, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
            
            SirioNotificaInline(state: .success, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
        }
        .padding()
    }
}
