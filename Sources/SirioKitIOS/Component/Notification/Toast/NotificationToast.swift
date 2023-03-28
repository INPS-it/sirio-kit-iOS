//
// NotificationToast.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A toast notification with icon, title, subtitle and close button
/// - Parameters:
///   - isPresented: The boolean that manages the presentation of notification
///   - type: The type of the notification
///   - title: The title of the notification
///   - subtitle: The subtitle of the notification
///   - textButton: The button text
///   - onCloseAction: Callback that is executed when the close button is tapped
///   - onTapAction: Callback that is executed when the notification is tapped

public struct NotificationToast: View {
    var type: NotificationType
    var title: String
    var subtitle: String?
    var textButton: String?
    var onTapCloseAction: (() -> Void)?
    var onTapButtonAction: (() -> Void)?
    
    
    public init(type: NotificationType,
                title: String,
                subtitle: String?,
                textButton: String? = nil,
                onTapCloseAction: (() -> Void)?,
                onTapButtonAction: (() -> Void)? = nil){
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.textButton = textButton
        self.onTapCloseAction = onTapCloseAction
        self.onTapButtonAction = onTapButtonAction
    }
    
    public var body: some View {
        HStack(spacing: Size.Notification.Toast.spacing) {
            Rectangle()
                .fill(fillColor)
                .frame(width: Size.Notification.Toast.Rectangle.frame)
            
            VStack(alignment: .leading, spacing: Size.Notification.Toast.spacing) {
                HStack() {
                    SirioIcon(data: .init(icon: icon))
                        .frame(width: Size.Notification.Toast.Icon.Left.frame, height: Size.Notification.Toast.Icon.Left.frame)
                        .foregroundColor(Color.Notification.Toast.Icon.default)
                    
                    Spacer()
                     
                    Button(action: {
                        onTapCloseAction?()
                    }, label: {
                        SirioIcon(data: .init(icon: .times))
                            .frame(width: Size.Notification.Toast.Icon.Left.frame, height: Size.Notification.Toast.Icon.Right.frame)
                            .foregroundColor(Color.Notification.Toast.Icon.default)
                    })
                }
                
                SirioText(text: title, typography: Typography.Notification.Toast.title)
                    .foregroundColor(Color.Notification.Toast.Text.default)
                    .lineLimit(1)
                    .padding(.top, Size.Notification.Toast.Text.paddingTitleTop)
                
                if let subtitle = subtitle {
                    SirioText(text: subtitle, typography: Typography.Notification.Toast.subtitle)
                        .foregroundColor(Color.Notification.Toast.Text.default)
                        .padding(.top, Size.Notification.Toast.Text.paddingSubtitleTop)
                }
                
                if let textButton = textButton {
                    ButtonTextOnly(style: .tertiaryDark,
                                   size: .large,
                                   text: textButton,
                                   action: {
                        onTapButtonAction?()
                    })
                    .padding(.top, Size.Notification.Toast.Text.paddingButtonTop)
                }
            }
            .padding(.vertical, Size.Notification.Toast.paddingVertical)
            .padding(.horizontal, Size.Notification.Toast.paddingHorizontal)
            .background(Rectangle().fill(Color.Notification.Toast.Background.default))
        }
        .fixedSize(horizontal: false, vertical: true)
        
    }
    
    private var fillColor: Color {
        switch type {
        case .alert:
            return Color.Notification.Toast.Icon.Rectangle.alert
        case .info:
            return Color.Notification.Toast.Icon.Rectangle.info
        case .warning:
            return Color.Notification.Toast.Icon.Rectangle.warning
        case .success:
            return Color.Notification.Toast.Icon.Rectangle.success
        }
    }
    
    private var icon: AwesomeIcon {
        switch type {
        case .alert:
            return .exclamationTriangle
        case .info:
            return .infoCircle
        case .warning:
            return AwesomeIcon.exclamationCircle
        case .success:
            return .check
        }
    }
}

struct NotificationToast_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 10) {
                NotificationToast(type: .alert,
                                  title: "Error title",
                                  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  textButton: "Action",
                                  onTapCloseAction: nil,
                                  onTapButtonAction: nil)
                
                NotificationToast(type: .alert,
                                  title: "Error title",
                                  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                  onTapCloseAction: nil)
            }
        }
    }
}
