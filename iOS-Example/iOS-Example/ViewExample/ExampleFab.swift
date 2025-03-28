//
// ExampleFab.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
                    SirioText(text: "Light", typography: .headlineSmMiddle)
                    Spacer()
                    SirioText(text: "Dark", typography: .headlineSmMiddle)

                }
                .padding()
                
                VStack {
                    SirioText(text: "Small", typography: .label_md_400)
                    
                    HSchemeSwitcher {
                        SirioFloatingActionButton(data: .init(icon: .plus, size: .small, action: {
                            
                        }))
                    }
                }
                .padding()

                VStack {
                    SirioText(text: "Regular", typography: .label_md_400)
                    
                    HSchemeSwitcher {
                        SirioFloatingActionButton(data: .init(icon: .plus, size: .regular, action: {
                            
                        }))
                    }
                }
                .padding()
                
                VStack {
                    SirioText(text: "Extended", typography: .label_md_400)
                    
                    HSchemeSwitcher {
                        SirioFloatingActionButton(data: .init(text: "Text", icon: .plus, action: {
                            
                        }))
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
