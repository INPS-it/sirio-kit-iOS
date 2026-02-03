//
// TabStyle.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

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
                    .fixedSize(horizontal: true, vertical: false)
            }
            .padding(.horizontal, Size.p8)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundColor(rectangleColor)
                    .frame(height: Size.Tab.rectangleHeight * 2)
                    .cornerRadius(Size.Tab.cornerRadius, corners: [.topLeft, .topRight])
            }
            .frame(height: Size.Tab.rectangleHeight, alignment: .top)
            .clipped()
        }
        .frame(height: Size.Tab.height)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
    }
    
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

#Preview {
    ExampleTabGroup()
}
