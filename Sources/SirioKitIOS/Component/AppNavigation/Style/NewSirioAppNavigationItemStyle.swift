//
// NewSirioAppNavigationItemStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct that defines the style for AppNavigation component
struct NewSirioAppNavigationItemStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    var item: SirioAppNavigationItemData?
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(spacing: Size.zero) {
            if let item = item {
                VStack(spacing: Size.zero) {
                    if item.isUserLogged {
                        SirioText(text: item.textProfile.prefix(2).uppercased(), typography: Typography.NewAppNavigation.profile)
                            .foregroundColor(textColor)
                            .lineLimit(1)
                    } else {
                        SirioIcon(data: .init(icon: item.icon))
                            .foregroundColor(iconColor)
                            .frame(width: Size.NewAppNavigation.Item.icon, height: Size.NewAppNavigation.Item.icon)
                            .if(item.hasBadge, transform: {
                                $0.overlay(alignment: .topTrailing, content: {
                                    SirioBadge()
                                        .padding(.top, Size.Badge.paddingTop)
                                        .padding(.trailing, Size.Badge.paddingTrailing)
                                })
                            })
                    }
                }
                .frame(width: Size.NewAppNavigation.Item.circle, height: Size.NewAppNavigation.Item.circle)
                .background(getBackgroundColor(configuration: configuration))
                .clipShape(Circle())
            }
        }
        .frame(width: Size.NewAppNavigation.Item.area, height: Size.NewAppNavigation.Item.area)
    }
    
    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        let colorDefault: Color = .clear
        let colorPressed: Color = colorScheme == .light ? Color.NewAppNavigation.Default.Item.Background.light : Color.NewAppNavigation.Default.Item.Background.dark
        
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

extension NewSirioAppNavigationItemStyle {
    
    // ICON COLOR
    private var iconColor: Color {
        switch colorScheme {
        case .light:
            return Color.aliasAppInteractiveSecondaryDefault
        case .dark:
            return Color.aliasInteractivePrimary000Default
        @unknown default:
            return Color.aliasAppInteractiveSecondaryDefault
        }
    }
    
    // TEXT COLOR
    private var textColor: Color {
        switch colorScheme {
        case .light:
            return Color.aliasInteractivePrimaryDefault
        case .dark:
            return Color.aliasInteractivePrimary000Default
        @unknown default:
            return Color.aliasInteractivePrimaryDefault
        }
    }
    
    // CIRCLE BACKGROUND COLOR FOR USER LOGGED
    private var userLoggedBackgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.aliasBackgroundColorPrimaryLight50
        case .dark:
            return Color.aliasBackgroundColorPrimaryDark115
        @unknown default:
            return Color.aliasBackgroundColorPrimaryLight50
        }
    }
    
    // CIRCLE BACKGROUND COLOR FOR ICON
    private var iconBackgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.aliasOverlay15Secondary100
        case .dark:
            return Color.aliasOverlay25Primary000
        @unknown default:
            return Color.aliasOverlay15Secondary100
        }
    }
}
