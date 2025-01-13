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
                        SirioTextField(type: .constant(type),
                                       textInfo: "Label",
                                       infoIcon: .infoCircle,
                                       placeholder: "Text",
                                       text: $text,
                                       icon: getIconBy(type: type),
                                       helperText: "*Helper text",
                                       isDisabled: $disabled,
                                       onTapInfoAction: nil)
                        .padding()
                    }
                }
                
                SirioText(text: "Disabled", typography: .label_md_600)
                
                SirioTextField(type: .constant(.info),
                               textInfo: "Label",
                               infoIcon: .infoCircle,
                               placeholder: "Text",
                               text: .constant(""),
                               icon: .calendar,
                               helperText: "*Helper text",
                               isDisabled: .constant(true),
                               onTapInfoAction: nil)
                .padding()
                
                Spacer()
                
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("TextField")
    }
    
    private func getIconBy(type: SemanticTextField) -> AwesomeIcon {
        switch type {
        case .warning:
            return .exclamationCircle
        case .alert:
            return .exclamationTriangle
        case .success:
            return .check
        case .info:
            return .calendar
        }
    }
}

#Preview {
    ExampleTextField()
}
