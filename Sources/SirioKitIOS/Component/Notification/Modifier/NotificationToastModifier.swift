//
// NotificationToastModifier.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A modifier that shows toast notification with icon, title, subtitle and close button
/// - Parameters:
///   - isPresented: The boolean that manages the presentation of the notification
///   - type: The type of the notification
///   - title: The title of the notification
///   - subtitle: The subtitle of the notification
///   - textButton: The button text
///   - onCloseAction: Callback that is executed when the close button is tapped
///   - onTapAction: Callback that is executed when the notification is tapped
public struct NotificationToastModifier: ViewModifier {
    var isPresented: Binding<Bool>
    var type: NotificationType
    var title: String
    var subtitle: String?
    var textButton: String?
    var onCloseAction: (() -> Void)?
    var onTapButtonAction:  (() -> Void)?
    
    public init(isPresented: Binding<Bool>,
                type: NotificationType,
                title: String,
                subtitle: String?,
                textButton: String?,
                onCloseAction: (() -> Void)?,
                onTapButtonAction: (() -> Void)?) {
        self.isPresented = isPresented
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.textButton = textButton
        self.onCloseAction = onCloseAction
        self.onTapButtonAction = onTapButtonAction
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(notificationContent())
    }
    
    @ViewBuilder private func notificationContent() -> some View {
        
        ZStack {
            if isPresented.wrappedValue {
                NotificationToast(type: type,
                                  title: title,
                                  subtitle: subtitle,
                                  textButton: textButton,
                                  onTapCloseAction: onCloseAction,
                                  onTapButtonAction: onTapButtonAction)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
