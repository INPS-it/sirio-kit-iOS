//
// ExampleFab.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleFab: View {

    @State var isPresented = false
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                HStack {
                    SirioText(text: "Light", typography: .label_md_400)
                    Spacer()
                    SirioText(text: "Dark", typography: .label_md_400)
                }
                .padding()
                
                VStack {
                    SirioText(text: "Small", typography: .label_md_400)
                    
                    HSchemeSwitcher {
                        SirioSmallFab(data: .init(icon: .plus, action: nil))
                    }
                }
                .padding()

                VStack {
                    SirioText(text: "Regular", typography: .label_md_400)
                    
                    HSchemeSwitcher {
                        SirioRegularFab(data: .init(icon: .plus, action: nil))
                    }
                }
                .padding()
                
                VStack {
                    SirioText(text: "Extended", typography: .label_md_400)
                    
                    HSchemeSwitcher {
                        SirioExtendedFab(data: .init(text: "Text", icon: .plus, action: nil))
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .onTapGesture {
            withAnimation {
                isPresented.toggle()
            }
        }
        .navigationBarTitle("Fab", displayMode: .automatic)
    }
}

#Preview {
    ExampleFab()
}
