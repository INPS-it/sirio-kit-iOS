//
// ExampleTextField.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleTextField: View {
    @State var text: String = ""
    @State var disabled: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(SemanticTextField.allCases, id: \.self){ type in
                    VStack(spacing: 10) {
                        SirioText(text: type.rawValue.capitalized, typography: .label_md_600)
                        SirioGenericTextField(type: .constant(type),
                                              textInfo: "Label",
                                              placeholder: "Text",
                                              value: $text,
                                              iconData: getIconBy(type: type),
                                              helperText:"*Helper text",
                                              isDisabled: $disabled,
                                              isSecureText: .constant(false),
                                              onTapInfoAction: nil)
                        .padding()
                    }
                }
                
                SirioText(text: "Disabled", typography: .label_md_600)
                
                SirioGenericTextField(type: .constant(.info),
                                      textInfo: "Label",
                                      placeholder: "Text",
                                      value: $text,
                                      iconData: .init(icon: .calendar),
                                      helperText: "*Helper text",
                                      isDisabled: .constant(true),
                                      isSecureText: .constant(false),
                                      onTapInfoAction: nil)
                .padding()
                
                Spacer()
                
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("TextField")
    }
    
    private func getIconBy(type: SemanticTextField) -> SirioIconData {
        switch type {
        case .warning:
            return .init(icon: .exclamationCircle)
        case .alert:
            return .init(icon: .exclamationTriangle)
        case .success:
            return .init(icon: .check)
        case .info:
            return .init(icon: .calendar)
        }
    }
}

#Preview {
    ExampleTextField()
}
