//
// SirioTabBarItem.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A representation of a single tab bar item
/// - Parameters:
///   - itemData: The data representing the tab item [SirioTabItemData]
///   - isSelected: A boolean to manage the selected state of the tab
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
            // Landscape
            if orientationInfo.orientation == .landscape {
                landscape
            } else { // Portrait
                portrait
            }
        }
        .frame(height: Size.TabBar.height)
        .background(Color.white)
        .setAccessibilityLabel(itemData.accessibilityLabel)
    }
    
    private var landscape: some View {
        VStack(spacing: Size.zero) {
            Rectangle()
                .fill(indicatorColor)
                .frame(width: hStackFrame.width, height: Size.TabBar.Item.indicator)

            Spacer()

            HStack(spacing: Size.TabBar.Item.Landscape.spacing) {
                SirioIcon(data: .init(icon: itemData.icon))
                    .frame(width: Size.TabBar.Item.icon, height: Size.TabBar.Item.icon)
                    .foregroundStyle(iconColor)
                    .if(itemData.hasBadge, transform: {
                        $0.overlay(alignment: .topTrailing, content: {
                            SirioBadge()
                                .padding(.top, Size.Badge.paddingTop)
                                .padding(.trailing, Size.Badge.paddingTrailing)
                        })
                    })
                SirioText(text: itemData.name, typography: Typography.TabBar.style)
                    .foregroundColor(textColor)
            }
            .padding(.horizontal, Size.TabBar.Item.paddingHorizontal)
            .frame(height: Size.TabBar.Item.Landscape.height)
            .readSize { size in
                hStackFrame = size
            }

            Spacer()
        }
        .frame(height: Size.TabBar.height)
        
    }
    // Variabile di stato per salvare la larghezza dell'HStack
    @State private var hStackFrame: CGSize = .zero

    
    private var portrait: some View {
        VStack(spacing: Size.zero) {
            Rectangle()
                .fill(indicatorColor)
                .frame(height: Size.TabBar.Item.indicator)
            Spacer()
            VStack(spacing: Size.TabBar.Item.Portrait.spacing){
                
                SirioIcon(data: .init(icon: itemData.icon))
                    .frame(width: Size.TabBar.Item.icon, height: Size.TabBar.Item.icon)
                    .foregroundStyle(iconColor)
                    .if(itemData.hasBadge, transform: {
                        $0.overlay(alignment: .topTrailing, content: {
                            SirioBadge()
                                .padding(.top, Size.Badge.paddingTop)
                                .padding(.trailing, Size.Badge.paddingTrailing)
                        })
                    })
                SirioText(text: itemData.name, typography: Typography.TabBar.style)
                    .foregroundColor(textColor)
                Spacer()
            }
            .padding(.horizontal, Size.TabBar.Item.paddingHorizontal)
            .frame(height: Size.TabBar.Item.Portrait.height)
        }
        .frame(height: Size.TabBar.height)
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
    VStack {
        HStack(spacing: 10) {
            SirioTabBarItem(itemData: SirioTabItemData.preview, isSelected: true)
            SirioTabBarItem(itemData: SirioTabItemData.preview, isSelected: false)
            
        }
    }
    .padding(.horizontal)
    .environmentObject(OrientationInfo())
}
