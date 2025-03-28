//
// ExampleNotification.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleNotification: View {
    var body: some View {
        List {
            
            NavigationLink(destination: {
                ExampleNotificaInline()
            }, label: {
                SirioText(text: "Notifica in linea", typography: .label_md_400)
            })
            
            
            NavigationLink(destination: {
                ExampleNotificaPage()
            }, label: {
                SirioText(text: "Notifica pagina", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Notifiche")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleNotification()
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
