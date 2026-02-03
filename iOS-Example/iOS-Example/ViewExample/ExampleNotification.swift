//
// ExampleNotification.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleNotification: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Notifiche")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleNotification {
    
    enum Destination: Hashable {
        case inline
        case page
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Notifica in linea", action: { path.append(Destination.inline) }),
            .default(title: "Notifica pagina", action: { path.append(Destination.page) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .inline:
            ExampleNotificaInline()
                .navigationTitle("Notifica in linea")
                .background(Color.colorBackground)
            
        case .page:
            ExampleNotificaPage()
                .navigationTitle("Notifica pagina")
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleNotification(path: .constant(NavigationPath()))
}
struct ExampleNotificaInline: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(SirioNotificaState.allCases, id: \.self) { type in
                VStack(alignment: .leading, spacing: 10) {
                    SirioText(text: "\(type)".capitalized, typography: .labelSmMiddle)
                    SirioNotificaInline(state: type, title: "Titolo notifica", subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", link: "Link opzionale", showCloseButton: true, onCloseAction: {}, onTapLinkAction: {})
                }
            }
            .padding()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .navigationBarTitle("Notification Inline", displayMode: .inline)
        .background(Color.colorBackground)
        
    }
}

struct ExampleNotificaPage: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(SirioNotificaState.allCases, id: \.self) { type in
                    SirioText(text: "\(type)".capitalized, typography: .labelSmMiddle)

                    SirioNotificaPage(state: type, title: "Titolo notifica", subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", link: "Link opzionale", onCloseAction: {}, onTapLinkAction: {})
                }
            }
            .padding()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .navigationBarTitle("Notifica Page", displayMode: .inline)
        .background(Color.colorBackground)
    }
    
}
