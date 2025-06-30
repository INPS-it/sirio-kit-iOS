//
// TabStyle.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

#Preview {
    ExampleTabGroup()
}

// A struct that defines the style for Tab component
struct TabStyle: ButtonStyle {
    var isSelected: Bool
    var item: SirioTabData
    
    func makeBody(configuration: Self.Configuration) -> some View {
        tabOnTop(configuration: configuration)
    }
    
    func tabOnTop(configuration: Self.Configuration) -> some View {
        VStack(spacing: Size.s0){
            
            Spacer()
            
            HStack(spacing: Size.s8){
                if let icon = item.icon {
                    SirioIcon(data: .init(icon: icon))
                        .frame(width: Size.Tab.iconFrame, height: Size.Tab.iconFrame)
                        .foregroundColor(iconColor)
                }
                
                SirioText(text: item.text, typography: typography)
                    .foregroundColor(textColor)
            }
            .padding(.horizontal, Size.p8)
            
            Spacer()
            
            Rectangle()
                .frame(height: Size.Tab.rectangleHeight)
                .foregroundColor(rectangleColor)
                .cornerRadius(3, corners: [.topLeft, .topRight])
        }
        .frame(height: Size.Tab.height)
        .background(backgroundColor)
        .fixedSize()

    }
    
//    func tabOnBottom(configuration: Self.Configuration) -> some View {
//        VStack(spacing: Size.zero){
//            
//            Spacer()
//            
//            HStack(spacing: Size.Tab.spacingHorizontal){
//                if let icon = item.icon {
//                    SirioIcon(data: .init(icon: icon))
//                        .frame(width: Size.Tab.Icon.frame, height: Size.Tab.Icon.frame)
//                        .foregroundColor(iconColor)
//                }
//                
//                SirioText(text: item.text, typography: typography)
//                    .foregroundColor(textColor)
//            }
//            .padding(.horizontal, item.icon == nil ? Size.Tab.paddingHorizontal : Size.Tab.paddingHorizontalWithIcon)
//            
//            Spacer()
//            
//            Rectangle()
//                .frame(height: Size.Tab.Rectangle.height)
//                .foregroundColor(rectangleColor)
//        }
//        .frame(height: Size.Tab.height)
//        .background(backgroundColor)
//        .onHover { isHover in
//            self.isHover = isHover
//        }
//    }
    
     private var rectangleColor: Color {
         if item.isDisabled {
             return Color.Tab.Rectangle.disabled
         } else {
             if isSelected {
                 return Color.Tab.Rectangle.selected
             }
             return Color.Tab.Rectangle.default
         }
     }
     
     private var iconColor: Color {
         if item.isDisabled {
             return Color.Tab.Icon.disabled
         } else {
             return isSelected ? Color.Tab.Icon.selected : Color.Tab.Icon.default
         }
     }
    
    private var textColor: Color {
        if item.isDisabled {
            return Color.Tab.Text.disabled
        } else {
            return isSelected ? Color.Tab.Text.selected : Color.Tab.Text.default
        }
    }
     
     private var backgroundColor: Color {
         if item.isDisabled {
             return Color.Tab.Background.disabled
         } else {
             if isSelected {
                 return Color.Tab.Background.selected
             }
             return Color.Tab.Background.default
         }
     }
     
     private var typography: Typography {
         isSelected ? Typography.Tab.selected : Typography.Tab.unselected
     }
}
