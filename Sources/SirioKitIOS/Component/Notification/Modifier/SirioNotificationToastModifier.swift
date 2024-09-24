//
// SirioNotificationToastModifier.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
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
public struct SirioNotificationToastModifier: ViewModifier {
    var isPresented: Binding<Bool>
    var type: SirioNotificationType
    var title: String
    var subtitle: String?
    var textButton: String?
    var alignment: Alignment
    var direction: Direction
    var onCloseAction: (() -> Void)?
    var onTapButtonAction:  (() -> Void)?
    
    public init(isPresented: Binding<Bool>,
                type: SirioNotificationType,
                title: String,
                subtitle: String?,
                textButton: String?,
                alignment: Alignment,
                direction: Direction = .bottom,
                onCloseAction: (() -> Void)?,
                onTapButtonAction: (() -> Void)?) {
        self.isPresented = isPresented
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.textButton = textButton
        self.alignment = alignment
        self.direction = direction
        self.onCloseAction = onCloseAction
        self.onTapButtonAction = onTapButtonAction
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(notificationContent())
    }
    
    @ViewBuilder private func notificationContent() -> some View {
        
        GeometryReader { geometry in
            if isPresented.wrappedValue {
                SirioNotificationToast(type: type,
                                  title: title,
                                  subtitle: subtitle,
                                  textButton: textButton,
                                  onTapCloseAction: onCloseAction,
                                  onTapButtonAction: onTapButtonAction)
                .animation(.spring())
                .transition(.offset(x: 0,
                                    y: direction.offset(popupFrame: geometry.frame(in: .global))))
                .frame(width: geometry.size.width,
                       height: geometry.size.height, alignment: alignment)
                
            }
        }
        .ignoresSafeArea(edges: .all)
    }
}


public extension SirioNotificationToastModifier {
    enum Direction {
        case top, bottom
        
        func offset(popupFrame: CGRect) -> CGFloat {
            switch self {
            case .top:
                let aboveScreenEdge = -popupFrame.maxY
                return aboveScreenEdge
            case .bottom:
                let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
                return belowScreenEdge
            }
        }
    }
}
