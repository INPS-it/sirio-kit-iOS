//
// SirioNotificationInline.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// An inline notification with icon, title, subtitle and close button
/// - Parameters:
///   - type: The type of the notification
///   - title: The title of the notification
///   - subtitle: The subtitle of the notification
///   - onCloseAction: Callback that is executed when the close button is tapped
///   - onTapAction: Callback that is executed when the notification is tapped

@available(*, deprecated, message: "This view is deprecated. Use SirioNotificaInline instead.")
public struct SirioNotificationInline: View {
    var type: SirioNotificationType
    var title: String
    var subtitle: String
    var onCloseAction: (() -> Void)?
    var onTapAction: (() -> Void)?
    
    public init(type: SirioNotificationType,
                title: String,
                subtitle: String,
                onCloseAction: (() -> Void)? = nil,
                onTapAction: (() -> Void)? = nil){
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.onCloseAction = onCloseAction
        self.onTapAction = onTapAction
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            SirioNotificationIcon(type: type)
            
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: Size.Notification.Inline.spacingVertical){
                    SirioText(text: title, typography: Typography.Notification.Inline.title)
                        .foregroundColor(Color.Notification.Inline.Text.default)
                        .lineLimit(1)


                    SirioText(text: subtitle, typography: Typography.Notification.Inline.subtitle)
                        .foregroundColor(Color.Notification.Inline.Text.default)
                        .lineLimit(1)
                }
                
                Spacer()
                
                SirioIcon(data: .init(icon: .times))
                    .frame(width: Size.Notification.Inline.Icon.Right.frame, height: Size.Notification.Inline.Icon.Right.frame)
                    .foregroundColor(Color.Notification.Inline.Icon.default)
                    .onTapGesture {
                        onCloseAction?()
                    }
            }
            .padding(.horizontal, Size.Notification.Inline.paddingHorizontal)
            .padding(.vertical, Size.Notification.Inline.paddingVertical)
            .frame(height: Size.Notification.Inline.heigth)
            .background(Rectangle().fill(Color.Notification.Inline.Background.default))
        }
        .onTapGesture {
            self.onTapAction?()
        }
        .setAccessibilityLabel(title + subtitle)
    }
}

#Preview {
    VStack(spacing: 10) {
        SirioNotificationInline(type: .alert, title: "Error title", subtitle: "Lorem ipsum dolor sit amet")
        SirioNotificationInline(type: .info, title: "Informative title", subtitle: "Lorem ipsum dolor sit amet")
        SirioNotificationInline(type: .warning, title: "Warning title", subtitle: "Lorem ipsum dolor sit amet")
        SirioNotificationInline(type: .success, title: "Success title", subtitle: "Lorem ipsum dolor sit amet")
    }
}
