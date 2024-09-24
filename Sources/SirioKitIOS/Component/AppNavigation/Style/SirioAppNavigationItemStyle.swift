//
// SirioAppNavigationItemStyle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for AppNavigation component
struct SirioAppNavigationItemStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var item: SirioAppNavigationItemData?
    
    func makeBody(configuration: Self.Configuration) -> some View {
        if let item = item {
            VStack(spacing: 0) {
                if item.isUserLogged {
                    SirioText(text: item.textProfile.prefix(2).uppercased(), typography: Typography.AppNavigation.profile)
                        .foregroundColor(textColor)
                        .lineLimit(1)
                    
                } else {
                    SirioIcon(data: .init(icon: item.icon))
                        .foregroundColor(iconColor)
                        .frame(width: Size.AppNavigation.Item.icon, height: Size.AppNavigation.Item.icon)
                        .if(item.hasBadge, transform: {
                            $0.overlay(alignment: .topTrailing, content: {
                                SirioBadge()
                                    .padding(.top, Size.AppNavigation.Badge.paddingTop)
                                    .padding(.trailing, Size.AppNavigation.Badge.paddingTrailing)
                            })
                        })
                }
            }
            .frame(width: Size.AppNavigation.Item.area, height: Size.AppNavigation.Item.area)
            .background(getBackgroundColor(configuration: configuration))
            .clipShape(Circle())
        } else {
            SirioAppNavigationItemEmpty()
        }
        
    }
    
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        let colorDefault: Color = .clear
        let colorPressed: Color = colorScheme == .light ? Color.AppNavigation.Default.Item.Background.light : Color.AppNavigation.Default.Item.Background.dark
        
        let backgroundColor: Color = configuration.isPressed ? colorPressed : colorDefault
        
        guard let item = item else {
            return colorDefault
        }
        
        if item.isUserLogged && configuration.isPressed {
            return backgroundColor
        } else if item.isUserLogged {
            return iconBackgroundColor
        }
        return backgroundColor
    }
}

extension SirioAppNavigationItemStyle {
    
    // ICON COLOR
    private var iconColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Default.Item.Icon.light
        case .dark:
            return Color.AppNavigation.Default.Item.Icon.dark
        @unknown default:
            return Color.AppNavigation.Default.Item.Icon.light
        }
    }
    
    // TEXT COLOR
    private var textColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Default.Item.Profile.Text.light
        case .dark:
            return Color.AppNavigation.Default.Item.Profile.Text.dark
        @unknown default:
            return Color.AppNavigation.Default.Item.Profile.Text.light
        }
    }
    
    // CIRCLE BACKGROUND COLOR FOR USER LOGGED
    private var userLoggedBackgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Default.Item.Background.light
        case .dark:
            return Color.AppNavigation.Default.Item.Background.dark
        @unknown default:
            return Color.AppNavigation.Default.Item.Background.light
        }
    }
    
    // CIRCLE BACKGROUND COLOR FOR ICON
    private var iconBackgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.AppNavigation.Default.Item.Profile.Background.light
        case .dark:
            return Color.AppNavigation.Default.Item.Profile.Background.dark
        @unknown default:
            return Color.AppNavigation.Default.Item.Profile.Background.light
        }
    }
}
