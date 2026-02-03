//
// SirioNotificationInlineModifier.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A modifier that shows an inline notification with icon, title, subtitle and close button
/// - Parameters:
///   - isPresented: The boolean that manages the presentation of the notification
///   - state: The state of the notification (alert, info, warning, success)
///   - title: The title of the notification
///   - subtitle: The subtitle of the notification
///   - link: Optional link text
///   - showCloseButton: Whether to show the close button
///   - onCloseAction: Callback that is executed when the close button is tapped
///   - onTapLinkAction: Callback that is executed when the link is tapped
///   
public struct SirioNotificationInlineModifier: ViewModifier {
    var isPresented: Binding<Bool>
    var state: SirioNotificaState
    var title: String
    var subtitle: String
    var link: String?
    var showCloseButton: Bool
    var onCloseAction: (() -> Void)?
    var onTapLinkAction: (() -> Void)?
    
    public init(
        isPresented: Binding<Bool>,
        state: SirioNotificaState,
        title: String,
        subtitle: String,
        link: String? = nil,
        showCloseButton: Bool = true,
        onCloseAction: (() -> Void)? = nil,
        onTapLinkAction: (() -> Void)? = nil
    ) {
        self.isPresented = isPresented
        self.state = state
        self.title = title
        self.subtitle = subtitle
        self.link = link
        self.showCloseButton = showCloseButton
        self.onCloseAction = onCloseAction
        self.onTapLinkAction = onTapLinkAction
    }
    
    public func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            
            if isPresented.wrappedValue {
                SirioNotificaInline(
                    state: state,
                    title: title,
                    subtitle: subtitle,
                    link: link,
                    showCloseButton: showCloseButton,
                    onCloseAction: {
                        onCloseAction?()
                        withAnimation {
                            isPresented.wrappedValue = false
                        }
                    },
                    onTapLinkAction: onTapLinkAction
                )
                .padding(.horizontal)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NotificationPreviewView()
}

private struct NotificationPreviewView: View {
    @State private var showNotification = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Demo Notifica Inline")
                    .font(.title)
                    .padding(.top, 40)
                
                Spacer()
                
                Button(showNotification ? "Nascondi notifica" : "Mostra notifica") {
                    withAnimation {
                        showNotification.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Text("Contenuto della pagina")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        }
        .padding()
        .sirioNotificationInline(
            isPresented: $showNotification,
            state: .success,
            title: "Operazione completata",
            subtitle: "La richiesta è stata inviata correttamente",
            link: "Vai ai dettagli",
            onCloseAction: {
                print("Notifica chiusa")
            },
            onTapLinkAction: {
                print("Link tappato")
            }
        )
        
    }
}
