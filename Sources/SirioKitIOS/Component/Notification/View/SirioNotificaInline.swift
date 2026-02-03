//
// SirioNotificInline.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
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
    
    @State private var contentHeight: CGFloat = 0
    
    public var body: some View {
        HStack(alignment: .top, spacing: Size.zero) {
            Rectangle()
                .fill(color)
                .frame(width: Size.Notifica.Inline.rectangleWidth)
                .frame(height: max(contentHeight, 1))
            
            VStack(alignment: .leading, spacing: Size.zero) {
                
                HStack(spacing: Size.zero) {
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
                
                VStack(alignment: .leading, spacing: Size.zero) {
                    SirioText(text: title, typography: .headlineSmHeavy)
                        .lineLimit(0)
                        .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                        .padding(.bottom, Size.Notifica.paddingBottom)
                    
                    SirioText(text: subtitle, typography: .bodySmRegular)
                        .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                        .padding(.bottom, link != nil ? Size.Notifica.paddingBottom : 0)
                    
                    if let link = link {
                        Button(action: {
                            onTapLinkAction?()
                        }, label: {
                            SirioText(text: link, typography: .link_p_md_01, isUnderlined: true)
                                .foregroundStyle(Color.aliasInteractivePrimaryDefault)
                        })
                    }
                }
            }
            .padding(.vertical, Size.Notifica.paddingTop)
            .padding(.leading, Size.Notifica.Inline.paddingHorizontalLeading)
            .padding(.trailing, Size.Notifica.Inline.paddingHorizontalTrailing)
            .overlay(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            contentHeight = geometry.size.height
                        }
                        .onChange(of: geometry.size.height) { newHeight in
                            contentHeight = newHeight
                        }
                }
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.aliasBackgroundColorPrimaryLight0)
        .cornerRadius(Size.Notifica.Inline.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Size.Notifica.Inline.cornerRadius)
                .stroke(color, lineWidth: Size.Notifica.Inline.lineWidth)
        )
        .setAccessibilityLabel(title + subtitle + (link ?? ""))
    }
    
    // Aggiungi questa struct fuori dal body
    private struct HeightPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
    
    var color: Color {
        switch state {
        case .alert:
            return Color.globalSemanticAlert100
        case .info:
            return Color.globalPrimary100
        case .warning:
            return Color.globalSemanticWarning100
        case .success:
            return Color.globalSemanticSuccess100
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
    SirioNotificaInline(state: .alert, title: "Titolo notifica", subtitle: "Sottotitolo")
//    ScrollView {
//        VStack(spacing: 10) {
//            SirioNotificaInline(state: .alert, title: "Titolo notifica", subtitle: "Sottotitolo", link: "Link opzionale")
//            
//            SirioNotificaInline(state: .info, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
//            
//            SirioNotificaInline(state: .warning, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
//            
//            SirioNotificaInline(state: .success, title: "Titolo notifica", subtitle: .loremIpsum, link: "Link opzionale")
//        }
//        .padding()
//    }
}
