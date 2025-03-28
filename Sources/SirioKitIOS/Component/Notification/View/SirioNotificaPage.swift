//
// SirioNotifica.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Page notification component to display page notifications for various states (alert, info, warning, success).
/// - Parameters:
///   - state: The current state of the notification (alert, info, warning, success).
///   - title: The title text of the notification.
///   - subtitle: The subtitle text for additional information.
///   - link: An optional link that can trigger an action when tapped.
///   - onCloseAction: A callback function to be executed when the close button is tapped.
///   - onTapLinkAction: A callback function to be executed when the link is tapped.

public struct SirioNotificaPage: View {
    var state: SirioNotificaState
    var title: String
    var subtitle: String
    var link: String?
    var onCloseAction: (() -> Void)?
    var onTapLinkAction: (() -> Void)?
    
    public init(state: SirioNotificaState,
                title: String,
                subtitle: String,
                link: String? = nil,
                onCloseAction: (() -> Void)? = nil,
                onTapLinkAction: (() -> Void)? = nil){
        self.state = state
        self.title = title
        self.subtitle = subtitle
        self.link = link
        self.onCloseAction = onCloseAction
        self.onTapLinkAction = onTapLinkAction
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            VStack(spacing: Size.zero) {
                HStack {
                    SirioIcon(data: .init(icon: icon))
                        .frame(width: Size.Notifica.iconFrame, height: Size.Notifica.iconFrame)
                        .foregroundStyle(Color.aliasBackgroundColorPrimaryLight0)
                    Spacer()
                    Button(action: {
                        onCloseAction?()
                    }, label: {
                        SirioIcon(data: .init(icon: .times))
                            .frame(width: Size.Notifica.iconCloseFrame, height: Size.Notifica.iconCloseFrame)
                            .foregroundStyle(Color.aliasBackgroundColorPrimaryLight0)
                    })
                }
                .padding(.horizontal, Size.Notifica.paddingHorizontal)
                .padding(.vertical, Size.Notifica.Page.paddingVertical)
                .frame(height: Size.Notifica.Page.coloredHeight)
                .background(color)
                .cornerRadius(Size.Notifica.Page.cornerRadius, corners: [.topLeft, .topRight])
            }
            
            HStack {
                VStack(alignment: .leading, spacing: Size.zero) {
                    SirioText(text: title, typography: .headlineSmHeavy)
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
                }
                Spacer()
            }
            .padding(.horizontal, Size.Notifica.paddingHorizontal)
            .padding(.top, Size.Notifica.paddingTop)
            .padding(.bottom, 24)
        }
        .background(Color.aliasBackgroundColorPrimaryLight0)
        .cornerRadius(Size.Notifica.Page.cornerRadius, corners: [.topLeft, .topRight])
        .shadow(color: SirioFoundationBoxShadow.elevation04.0.color,
                radius: SirioFoundationBoxShadow.elevation04.3.cgFloat,
                x: SirioFoundationBoxShadow.elevation04.1.cgFloat,
                y: SirioFoundationBoxShadow.elevation04.2.cgFloat)
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
            SirioNotificaPage(state: .alert, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
            SirioNotificaPage(state: .info, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
            SirioNotificaPage(state: .warning, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
            SirioNotificaPage(state: .success, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
            
        }
        .padding()
    }
}

#Preview {
    
    Test()
}

struct Test: View {
    var body: some View {
        Color.yellow.ignoresSafeArea()
            .modifier(SirioNotificaModifier(state: .alert,
                                            title: "Titolo",
                                            subtitle: .loremIpsum,
                                            link: "Link opzionale",
                                            onCloseAction: {
                                                
                                            }
                                        ))
    }
}

struct SirioNotificaModifier: ViewModifier {
    var state: SirioNotificaState
    var title: String
    var subtitle: String
    var link: String?
    var onCloseAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom, content: {
                SirioNotificaPage(
                    state: state,
                    title: title,
                    subtitle: subtitle,
                    link: link,
                    onCloseAction: onCloseAction
                )
            })
            .ignoresSafeArea()
    }
}
