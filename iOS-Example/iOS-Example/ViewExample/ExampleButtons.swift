//
// ExampleButtons.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleButtons: View {
    var body: some View {
        List {
            // Primary
            NavigationLink(destination: {
                ButtonsPreview(type: "Primary", style: .primary)
                    .navigationTitle("Primary")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Primary", typography: .label_md_400)
            })
            
            // Secondary
            NavigationLink(destination: {
                ButtonsPreview(type: "Secondary", style: .secondary)
                    .navigationTitle("Secondary")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Secondary", typography: .label_md_400)
            })

            // Tertiary Light
            NavigationLink(destination: {
                ButtonsPreview(type: "Tertiary Light", style: .tertiaryLight)
                    .navigationTitle("Tertiary Light")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Tertiary Light", typography: .label_md_400)
            })

            // Tertiary Dark
            NavigationLink(destination: {
                ButtonsPreview(type: "Tertiary Dark", style: .tertiaryDark)
                    .navigationTitle("Tertiary Dark")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Tertiary Dark", typography: .label_md_400)
            })
            
            // Danger
            NavigationLink(destination: {
                ButtonsPreview(type: "Danger", style: .danger)
                    .navigationTitle("Danger")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Danger", typography: .label_md_400)
            })

            // Ghost
            NavigationLink(destination: {
                ButtonsPreview(type: "Ghost", style: .ghost)
                    .navigationTitle("Ghost")
                    .background(Color.colorBackground)
                .onTapGesture {
                    self.hideKeyboard()
                }
            }, label: {
                SirioText(text: "Ghost", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Buttons")
        .listStyle(GroupedListStyle())
    }
}

struct ExampleButtons_Previews: PreviewProvider {
    static var previews: some View {
        ExampleButtons()
    }
}

struct TrilogyButtons: View {
    var style: SirioButtonStyle
    var size: SirioButtonSize
    @State var isDisabled: Bool = true
    
    var body: some View {
        HStack(spacing: 8){
            
            ButtonTextOnly(style: style,
                           size: size,
                           text: "Text",
                           isDisabled: $isDisabled,
                           action: {})
            
            ButtonTextIcon(style: style,
                           size: size,
                           text: "Text",
                           icon: .arrowRight,
                           isDisabled: $isDisabled,
                           action: {})
            
            ButtonIconOnly(style: style,
                           size: size,
                           icon: .arrowRight,
                           isDisabled: $isDisabled,
                           action: {})
        }
        .padding(.horizontal)
    }
}



struct ButtonsPreview: View {
    var type: String
    var style: SirioButtonStyle
    
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(SirioButtonSize.allCases, id: \.self, content: { size in
                VStack(spacing: 8){
                    SirioText(text: "\(size.rawValue.capitalized)" , typography: .label_md_400)
                        .padding()
                    
                    TrilogyButtons(style: style, size: size, isDisabled: false)
                    TrilogyButtons(style: style, size: size, isDisabled: true)
                }
            })
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
    }
}


