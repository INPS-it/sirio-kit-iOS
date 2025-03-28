//
// SchemeSwitcher.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//
import SwiftUI
import SirioKitIOS

struct VSchemeSwitcher<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                SirioText(text: "Light", typography: .label_md_400)
                content.colorScheme(.light)
                
                SirioText(text: "Dark", typography: .label_md_400)
                content.colorScheme(.dark)
                
            }
        }
    }
}

struct HSchemeSwitcher<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        ScrollView {
            HStack {
                
                content.colorScheme(.light)
                
                Spacer()
                
                content.colorScheme(.dark)
                
            }
            .padding()
        }
    }
}

#Preview {
    HSchemeSwitcher(content: {
        
    })
}

#Preview {
    VSchemeSwitcher(content: {
        
    })
}
