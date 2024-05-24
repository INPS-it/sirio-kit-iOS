//
// ExampleTextArea.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTextArea: View {
    @State var text: String = ""
    @State var disabled: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(SemanticTextArea.allCases, id: \.self){ type in
                    VStack(spacing: 10) {
                        SirioText(text: type.rawValue.capitalized, typography: .label_md_600)
                        SirioTextArea(type: .constant(type),
                                      textInfo: "Label",
                                      infoIcon: type == .info ? .infoCircle : nil,
                                      placeholder: "Text",
                                      text: $text,
                                      helperText: "*Helper text",
                                      isDisabled: $disabled,
                                      onTapInfoAction: nil)
                        .padding()
                    }
                }
                
                SirioText(text: "Disabled", typography: .label_md_600)
                
                SirioTextArea(type: .constant(.info),
                              textInfo: "Label",
                              infoIcon: .infoCircle,
                              placeholder: "Text",
                              text: .constant(""),
                              helperText: "*Helper text",
                              isDisabled: .constant(true),
                              onTapInfoAction: nil)
                .padding()
                
                Spacer()
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("TextArea")
    }
}

#Preview {
    ExampleTextArea()
}
