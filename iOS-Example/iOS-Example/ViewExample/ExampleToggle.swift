//
// ExampleToggle.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleToggle: View {
    @State var isOn1: Bool = false
    @State var isOn2: Bool = false
    @State var isOn3: Bool = true
    @State var isOn4: Bool = true
    @State var isOn5: Bool = false
    @State var isOn6: Bool = false
    @State var isOn7: Bool = true
    @State var isOn8: Bool = true
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 16){
                Group {
                    SirioText(text: "Toggle Only False", typography: .label_md_400)
                        .padding()
                    SirioToggle(isOn: $isOn1, isDisabled: .constant(false))
                    SirioToggle(isOn: $isOn2, isDisabled: .constant(true))
                }
                
                Group {
                    SirioText(text: "Toggle Only True", typography: .label_md_400)
                        .padding()
                    SirioToggle(isOn: $isOn3, isDisabled: .constant(false))
                    SirioToggle(isOn: $isOn4, isDisabled: .constant(true))
                }
                
                Group {
                    SirioText(text: "Toggle Text False", typography: .label_md_400)
                        .padding()
                    SirioToggle(text: "Title", isOn: $isOn5, isDisabled: .constant(false))
                    SirioToggle(text: "Title", isOn: $isOn6, isDisabled: .constant(true))
                }
                
                Group {
                    SirioText(text: "Toggle Text True", typography: .label_md_400)
                        .padding()
                    SirioToggle(text: "Title", isOn: $isOn7, isDisabled: .constant(false))
                    SirioToggle(text: "Title", isOn: $isOn8, isDisabled: .constant(true))
                }

            }.padding()
        }
        .padding(.top, 20)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top)
        .background(Color.colorBackground)
        .navigationTitle("Toggle")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleToggle()
}
