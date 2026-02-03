//
// SirioNotificationToastModifier.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioNotificaPageModifier: ViewModifier {
    
    var isPresented: Binding<Bool>
    var state: SirioNotificaState
    var title: String
    var subtitle: String
    var link: String?
    var onTapLinkAction: (() -> Void)?
    
    public init(
        isPresented: Binding<Bool>,
        state: SirioNotificaState,
        title: String,
        subtitle: String,
        link: String? = nil,
        onTapLinkAction: (() -> Void)? = nil
    ) {
        self.isPresented = isPresented
        self.state = state
        self.title = title
        self.subtitle = subtitle
        self.link = link
        self.onTapLinkAction = onTapLinkAction
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(notificationContent(), alignment: .bottom)
    }
    
    @ViewBuilder
    private func notificationContent() -> some View {
        if isPresented.wrappedValue {
            SirioNotificaPage(
                state: state,
                title: title,
                subtitle: subtitle,
                link: link,
                onCloseAction: {
                    withAnimation {
                        isPresented.wrappedValue = false
                    }
                },
                onTapLinkAction: onTapLinkAction
            )
            .transition(.move(edge: .bottom))
            .animation(
                .spring(response: 0.4, dampingFraction: 0.85),
                value: isPresented.wrappedValue
            )
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

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
        .sirioNotificaPage(isPresented: $showNotification,
                           state: .success,
                           title: "Operazione completata",
                           subtitle: "La richiesta è stata inviata correttamente",
                           link: "Vai ai dettagli",
                           onTapLinkAction: {
            print("Link tappato")
        }
        )
        
    }
}
