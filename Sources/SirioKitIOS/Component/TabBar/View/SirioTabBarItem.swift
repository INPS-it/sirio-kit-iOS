//
// SirioTabBarItem.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A representation of a single tab bar item
/// - Parameters:
///   - itemData: The data of the item
///   - isSelected: A boolean to manage selected tab
public struct SirioTabBarItem: View {
    
    @EnvironmentObject var orientationInfo: OrientationInfo
    
    private let itemData: SirioTabItemData
    private let isSelected: Bool
    
    public init(itemData: SirioTabItemData, isSelected: Bool){
        self.itemData = itemData
        self.isSelected = isSelected
    }
    
    public var body: some View {
        VStack {
            if orientationInfo.orientation == .landscape && UIDevice.isIPad {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(indicatorColor)
                        .frame(height: Size.TabBar.Item.Indicator.height)
                    HStack(spacing: 0){
                        SirioIcon(data: .init(icon: itemData.icon))
                            .frame(width: Size.TabBar.Item.Icon.frame, height: Size.TabBar.Item.Icon.frame)
                            .foregroundColor(iconColor)
                            .if(itemData.hasBadge, transform: {
                                $0.overlay(alignment: .topTrailing, content: {
                                    SirioBadge()
                                        .padding(.top, Size.AppNavigation.Badge.paddingTop)
                                        .padding(.trailing, Size.AppNavigation.Badge.paddingTrailing)
                                })
                            })
                            .padding(.leading, Size.TabBar.Item.Landscape.Icon.paddingLeading)
                            .padding(.trailing, Size.TabBar.Item.Landscape.Icon.paddingTrailing)
                            .padding(.top, Size.TabBar.Item.Landscape.Icon.paddingTop)
                            .padding(.bottom, Size.TabBar.Item.Landscape.Icon.paddingBottom)
                        
                        SirioText(text: itemData.name, typography: Typography.TabBar.style)
                            .foregroundColor(textColor)
                            .padding(.top, Size.TabBar.Item.Landscape.Text.paddingTop)
                            .padding(.bottom, Size.TabBar.Item.Landscape.Text.paddingBottom)
                            .padding(.trailing, Size.TabBar.Item.Landscape.Text.paddingTrailing)
                    }
                }
            } else {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(indicatorColor)
                        .frame(height: Size.TabBar.Item.Indicator.height)
                    
                    SirioIcon(data: .init(icon: itemData.icon))
                        .frame(width: Size.TabBar.Item.Icon.frame, height: Size.TabBar.Item.Icon.frame)
                        .foregroundColor(iconColor)
                        .if(itemData.hasBadge, transform: {
                            $0.overlay(alignment: .topTrailing, content: {
                                SirioBadge()
                                    .padding(.top, Size.AppNavigation.Badge.paddingTop)
                                    .padding(.trailing, Size.AppNavigation.Badge.paddingTrailing)
                            })
                        })
                        .padding(.horizontal, Size.TabBar.Item.Portrait.Icon.paddingHorizontal)
                        .padding(.top, Size.TabBar.Item.Portrait.Icon.paddingTop)
                    
                    SirioText(text: itemData.name, typography: Typography.TabBar.style)
                        .foregroundColor(textColor)
                        .padding(.top, Size.TabBar.Item.Portrait.Text.paddingTop)
                        .padding(.bottom, Size.TabBar.Item.Portrait.Text.paddingBottom)
                }
            }
        }
        .setAccessibilityLabel(itemData.accessibilityLabel)
    }
}

extension SirioTabBarItem {
    
    private var iconColor: Color {
        return isSelected ? Color.TabBar.Item.Icon.selected : Color.TabBar.Item.Icon.default
    }
    
    private var textColor: Color {
        return isSelected ? Color.TabBar.Item.Text.selected : Color.TabBar.Item.Text.default
    }
    
    private var indicatorColor: Color {
        return isSelected ? Color.TabBar.Item.Indicator.selected : Color.TabBar.Item.Indicator.default
    }
}
#Preview {
    SirioTabBarItem(itemData: SirioTabItemData.preview, isSelected: false)
        .previewLayout(PreviewLayout.sizeThatFits)
        .padding()
        .environmentObject(OrientationInfo())
}
