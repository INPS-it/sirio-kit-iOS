//
// Function.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFunction: View {
    
    var text: String
    var colorScheme: ColorScheme
    
    public init(colorScheme: ColorScheme = .dark, text: String) {
        self.colorScheme = colorScheme
        self.text = text
    }
    
    public var body: some View {
        HStack {
            Spacer()
            SirioText(text: text, typography: .headlineSmMiddle)
                .foregroundStyle(textColor)
                .padding()
            Spacer()
        }
        .background(backgroundColor)
        .zIndex(1)
        .frame(minHeight: Size.NewAppNavigation.Function.height)
        
    }
    
    private var backgroundColor: Color {
        switch colorScheme {
        case .light:
            return Color.NewAppNavigation.Function.Background.light
        case .dark:
            return Color.NewAppNavigation.Function.Background.dark
        }
    }
    
    private var textColor: Color {
        switch colorScheme {
        case .light:
            return Color.NewAppNavigation.Function.Text.light
        case .dark:
            return Color.NewAppNavigation.Function.Text.dark
        }
    }
}


#Preview {
    SirioFunction(colorScheme: .light, text: "Titolo funzione")
    SirioFunction(colorScheme: .dark, text: "Titolo funzione")
    
}
