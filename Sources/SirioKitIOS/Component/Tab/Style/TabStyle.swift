//
// TabStyle.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// A struct to manage single tab style
struct TabStyle: ButtonStyle {
    var isSelected: Bool
    var position: Position
    var item: TabData

    @State var isHover = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        if position == .top {
            tabOnTop(configuration: configuration)
        } else {
            tabOnBottom(configuration: configuration)
        }
    }
    
    func tabOnTop(configuration: Self.Configuration) -> some View {
        VStack(spacing: Size.Tab.spacingVertical){
            Rectangle()
                .frame(height: Size.Tab.Rectangle.height)
                .foregroundColor(rectangleColor)
                .cornerRadius(Size.Tab.Rectangle.cornerRadius)
            
            Spacer()
            
            HStack(spacing: Size.Tab.spacingHorizontal){
                if let icon = item.icon {
                    SirioIcon(data: .init(icon: icon))
                        .frame(width: Size.Tab.Icon.frame, height: Size.Tab.Icon.frame)
                        .foregroundColor(iconColor)
                }
                
                SirioText(text: item.text, typography: typography)
                    .foregroundColor(textColor)
            }
            .padding(.horizontal, item.icon == nil ? Size.Tab.paddingHorizontal : Size.Tab.paddingHorizontalWithIcon)
            
            Spacer()
        }
        .frame(height: Size.Tab.height)
        .background(backgroundColor)
        .onHover { isHover in
            self.isHover = isHover
        }

    }
    
    func tabOnBottom(configuration: Self.Configuration) -> some View {
        VStack(spacing: Size.Tab.spacingVertical){
            
            Spacer()
            
            HStack(spacing: Size.Tab.spacingHorizontal){
                if let icon = item.icon {
                    SirioIcon(data: .init(icon: icon))
                        .frame(width: Size.Tab.Icon.frame, height: Size.Tab.Icon.frame)
                        .foregroundColor(iconColor)
                }
                
                SirioText(text: item.text, typography: typography)
                    .foregroundColor(textColor)
            }
            .padding(.horizontal, item.icon == nil ? Size.Tab.paddingHorizontal : Size.Tab.paddingHorizontalWithIcon)
            
            Spacer()
            
            Rectangle()
                .frame(height: Size.Tab.Rectangle.height)
                .foregroundColor(rectangleColor)
        }
        .frame(height: Size.Tab.height)
        .background(backgroundColor)
        .onHover { isHover in
            self.isHover = isHover
        }
    }
    
    
     private var rectangleColor: Color {
         if item.isDisabled {
             return position == .top ? Color.Tab.Rectangle.Top.state.disabled : Color.Tab.Rectangle.Bottom.state.disabled
         } else if isHover {
             return position == .top ? Color.Tab.Rectangle.Top.state.hover : Color.Tab.Rectangle.Bottom.state.hover
         } else {
             if isSelected {
                 return position == .top ? Color.Tab.Rectangle.Top.state.pressed : Color.Tab.Rectangle.Bottom.state.pressed
             }
             return position == .top ? Color.Tab.Rectangle.Top.state.default : Color.Tab.Rectangle.Bottom.state.default
         }
     }
     
     private var iconColor: Color {
         if item.isDisabled {
             return Color.Tab.Icon.state.disabled
         } else if isHover {
             return Color.Tab.Icon.state.hover
         } else {
             return isSelected ? Color.Tab.Icon.state.pressed : Color.Tab.Icon.state.default
         }
     }
    
    private var textColor: Color {
        if item.isDisabled {
            return Color.Tab.Text.state.disabled
        } else if isHover {
            return Color.Tab.Text.state.hover
        } else {
            return isSelected ? Color.Tab.Text.state.pressed : Color.Tab.Text.state.default
        }
    }
     
     private var backgroundColor: Color {
         if item.isDisabled {
             return position == .top ? Color.Tab.Background.Top.state.disabled : Color.Tab.Background.Bottom.state.disabled
         } else if isHover {
             return position == .top ? Color.Tab.Background.Top.state.hover : Color.Tab.Background.Bottom.state.hover
         } else {
             if isSelected {
                 return position == .top ? Color.Tab.Background.Top.state.pressed : Color.Tab.Background.Bottom.state.pressed
             }
             return position == .top ? Color.Tab.Background.Top.state.default : Color.Tab.Background.Bottom.state.default
         }
     }
     
     private var typography: Typography {
         isSelected ? Typography.Tab.selected : Typography.Tab.unselected
     }
}
