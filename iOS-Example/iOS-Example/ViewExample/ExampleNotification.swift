//
// ExampleNotification.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleNotification: View {
    var body: some View {
        List {
            
            ForEach(NotificationType.allCases, id: \.self) { type in
                NavigationLink(destination: {
                    ExampleNotificationInline(type: type)
                }, label: {
                    SirioText(text: "Notification Inline \(type)", typography: .label_md_400)
                })
            }
            
            ForEach(NotificationType.allCases, id: \.self) { type in
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

struct ExampleNotification_Previews: PreviewProvider {
    static var previews: some View {
        ExampleNotification()
    }
}

struct ExampleNotificationInline: View {
    var type: NotificationType

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                NotificationInline(type: type,
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
    var type: NotificationType

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
                NotificationToast(type: type,
                                  title: "Titolo di Errore",
                                  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  textButton: "Azione",
                                  onTapCloseAction: nil,
                                  onTapButtonAction: nil)
                
                NotificationToast(type: type,
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
