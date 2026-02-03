//
// SirioFiltriDate.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriDate: View {
    
    var textInfo: String
    var placeholder: String
    @Binding var value: String
    @Binding var isDisabled: Bool
    @State private var isShowingDatePicker = false
    @State private var date = Date()
    var onTapDismiss: (() -> Void)?
    
    private static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    private let datePickerId = "datePicker"
    
    private var iconSelectionDatePicker: AwesomeIcon {
        value.isEmpty ? .calendar : .times
    }
    
    private var formattedDate: String {
        Self.formatter.string(from: date)
    }
    
    public init(
        textInfo: String,
        placeholder: String,
        value: Binding<String>,
        isDisabled: Binding<Bool> = .constant(false),
        onTapDismiss: (() -> Void)? = nil
    ) {
        self.textInfo = textInfo
        self.placeholder = placeholder
        self._value = value
        self._isDisabled = isDisabled
        self.onTapDismiss = onTapDismiss
    }
    
    public var body: some View {
        ScrollViewReader { reader in
            VStack {
                SirioGenericTextField(
                    type: .constant(.info),
                    textInfo: textInfo,
                    placeholder: placeholder,
                    value: $value,
                    iconData: .init(icon: iconSelectionDatePicker),
                    helperText: nil,
                    isDisabled: $isDisabled,
                    onTapInfoAction: nil,
                    onTapIconAction: {
                        if iconSelectionDatePicker == .times {
                            value = ""
                            toggleDatePicker(false, reader: reader)
                        }
                    },
                    onTapTextFieldAction: {
                        if !isDisabled {
                            toggleDatePicker(reader: reader)
                        }
                    }
                )
                
                DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .frame(height: isShowingDatePicker ? nil : 0, alignment: .top)
                .clipped()
                .onChange(of: date) { _ in
                    value = formattedDate
                    toggleDatePicker(false, reader: reader)
                }
                .labelsHidden()
                .id(datePickerId)
            }
            .onAppear {
                if let parsedDate = Self.formatter.date(from: value) {
                    date = parsedDate
                }
            }
            .padding(.horizontal, Size.p24)
            .padding(.vertical, Size.p8)
            .background(Color.aliasBackgroundColorPrimaryLight0)
        }
    }
    
    private func toggleDatePicker(_ show: Bool? = nil, reader: ScrollViewProxy) {
        withAnimation(.easeOut) {
            isShowingDatePicker = show ?? !isShowingDatePicker
            if isShowingDatePicker {
                reader.scrollTo(datePickerId, anchor: .top)
            } else {
                onTapDismiss?()
            }
        }
    }
}

#Preview {
    SirioFiltriDate(textInfo: "Label", placeholder: "Text", value: .constant(""))
}
