//
// SirioNotificationIcon.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The icon used for the notification component
/// - Parameters:
///   - type: The type of notification

struct SirioNotificationIcon: View {
    var type: SirioNotificationType
    
    var body: some View {
        VStack {
            SirioIcon(data: .init(icon: icon))
                .frame(width: Size.Notification.Inline.Icon.Left.frame, height: Size.Notification.Inline.Icon.Left.frame)
                .foregroundColor(Color.Notification.Inline.Icon.default)
        }
        .frame(width: Size.Notification.Inline.Icon.Left.containerWidth, height: Size.Notification.Inline.Icon.Left.containerHeight)
        .background(Rectangle().fill(backgroundColor))
    }
    
    var backgroundColor: Color {
        switch type {
        case .alert:
            return Color.Notification.Inline.Icon.Container.alert
        case .info:
            return Color.Notification.Inline.Icon.Container.info
        case .warning:
            return Color.Notification.Inline.Icon.Container.warning
        case .success:
            return Color.Notification.Inline.Icon.Container.success
        }
    }
    
    var icon: AwesomeIcon {
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

#Preview {
    VStack(spacing: 10) {
        SirioNotificationIcon(type: .alert)
        SirioNotificationIcon(type: .info)
        SirioNotificationIcon(type: .warning)
        SirioNotificationIcon(type: .success)
    }
}
