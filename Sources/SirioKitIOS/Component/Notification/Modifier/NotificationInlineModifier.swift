//
// NotificationInlineModifier.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import UIKit

/// A modifier that shows an inline notification with icon, title, subtitle and close button
/// - Parameters:
///   - isPresented: The boolean that manages the presentation of the notification
///   - type: The type of the notification
///   - title: The title of the notification
///   - subtitle: The subtitle of the notification
///   - alignment: The alignment of the notification
///   - direction: The direction in which the notification appears
///   - life: The time the notification is visible
///   - onCloseAction: Callback that is executed when the close button is tapped
///   - onTapAction: Callback that is executed when the notification is tapped
public struct NotificationInlineModifier: ViewModifier {
    var isPresented: Binding<Bool>
    var type: NotificationType
    var title: String
    var subtitle: String
    var alignment: Alignment
    var direction: Direction
    var life: NotificationInlineModifier.Life?
    var onCloseAction: (() -> Void)?
    var onTapAction: (() -> Void)?
    
    public init(isPresented: Binding<Bool>,
                type: NotificationType,
                title: String,
                subtitle: String,
                alignment: Alignment,
                direction: Direction,
                life: Life?,
                onCloseAction: (() -> Void)?,
                onTapAction: (() -> Void)?) {
        self.isPresented = isPresented
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.alignment = alignment
        self.direction = direction
        self.life = life
        self.onCloseAction = onCloseAction
        self.onTapAction = onTapAction
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(notificationContent())
    }
    
    @ViewBuilder private func notificationContent() -> some View {
        
        GeometryReader { geometry in
            if isPresented.wrappedValue {
                NotificationInline(type: type,
                                   title: title,
                                   subtitle: subtitle,
                                   onCloseAction: { onCloseAction?() },
                                   onTapAction: { onTapAction?()} )
                .animation(.spring())
                .transition(.offset(x: 0,
                                    y: direction.offset(popupFrame: geometry.frame(in: .global))))
                .frame(width: geometry.size.width,
                       height: geometry.size.height, alignment: alignment)
                .onAppear {
                    if let life = life {
                        DispatchQueue.main.asyncAfter(deadline: .now() + life.rawValue) {
                            withAnimation{
                                self.isPresented.wrappedValue = false
                            }
                        }
                    }
                }
            }
        }
    }
}

public extension NotificationInlineModifier {
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
    
    enum Life: CGFloat {
        case short = 4
        case long = 10
    }
}
