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
            
            ForEach(SirioNotificationType.allCases, id: \.self) { type in
                NavigationLink(destination: {
                    ExampleNotificationInline(type: type)
                }, label: {
                    SirioText(text: "Notification Inline \(type)", typography: .label_md_400)
                })
            }
            
            ForEach(SirioNotificationType.allCases, id: \.self) { type in
                NavigationLink(destination: {
                    ExampleNotificationToast(type: type)
                }, label: {
                    SirioText(text: "Notification Toast \(type)", typography: .label_md_400)
                })
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("Notification")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleNotification()
}

struct ExampleNotificationInline: View {
    var type: SirioNotificationType

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                SirioNotificationInline(type: type,
                                   title: "Titolo di errore",
                                   subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                   onCloseAction: {})
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .navigationBarTitle("Notification Inline \(notificationType)", displayMode: .inline)
        .background(Color.colorBackground)
    }
    
    var notificationType: String {
        switch type {
        case .alert:
            return "Alert"
        case .info:
            return "Info"
        case .warning:
            return "Warning"
        case .success:
            return "Success"
        }
    }
}

struct ExampleNotificationToast: View {
    var type: SirioNotificationType

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                SirioNotificationToast(type: type,
                                  title: "Titolo di Errore",
                                  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  textButton: "Azione",
                                  onTapCloseAction: nil,
                                  onTapButtonAction: nil)
                
                SirioNotificationToast(type: type,
                                  title: "Titolo di Errore",
                                  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  onTapCloseAction: nil)
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .navigationBarTitle("Notification Toast \(notificationType)", displayMode: .inline)
        .background(Color.colorBackground)
    }
    
    var notificationType: String {
        switch type {
        case .alert:
            return "Alert"
        case .info:
            return "Info"
        case .warning:
            return "Warning"
        case .success:
            return "Success"
        }
    }
}
