//
// SirioDialogSort.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import UIKit

// MARK: - Order Dialog
/// A dialog that lets the user choose one option (radio) and apply it.
/// On "Apply", the selected option's action is executed.
///
/// - Parameters:
///   - title: Dialog title.
///   - options: The list of radio options. Each one provides an `onApply` action.
///   - initiallySelectedID: (Optional) The preselected option id.
///   - applyButtonText: Text for the Apply button. Defaults to "Apply".
///   - onApply: (Optional) Called after the selected option's action is performed, passing the chosen option.
///   - onClose: Called when the close button is tapped.
///

public struct SirioDialogSort: View {
    // Input
    var title: String
    var options: [SirioActionItem]
    var applyButtonText: String
    var onApply: ((SirioActionItem) -> Void)?
    var onClose: (() -> Void)?

    @State private var selectedID: UUID?

    public init(
        title: String = "Ordina",
        options: [SirioActionItem],
        applyButtonText: String = "Applica",
        onApply: ((SirioActionItem) -> Void)? = nil,
        onClose: (() -> Void)? = nil
    ) {
        self.title = title
        self.options = options
        self.applyButtonText = applyButtonText
        self.onApply = onApply
        self.onClose = onClose
    }

    public var body: some View {
        VStack(spacing: Size.zero) {
            Color.clear

            VStack(alignment: .leading, spacing: Size.zero) {
                HStack {
                    Spacer()
                    SirioButton(
                        hierarchy: .ghost,
                        size: .medium,
                        text: nil,
                        iconData: .init(icon: .times),
                        action: { onClose?() }
                    )
                }
                .padding(.bottom, Size.p24)

                // Title
                SirioText(text: title, typography: Typography.Dialog.title)
                    .foregroundColor(Color.Dialog.title)
                    .padding(.bottom, Size.p16)

                // Radio list
                VStack(alignment: .leading, spacing: Size.p12) {
                    ForEach(options) { option in
                        SirioRadioButton(text: option.value, isChecked: .constant(selectedID == option.id)) { value in
                            selectedID = option.id
                        }
                        .padding(.vertical, Size.p4)
                    }
                }

                VStack(spacing: Size.p16) {
                    SirioButton(
                        hierarchy: .primary,
                        size: .large,
                        text: applyButtonText,
                        iconData: nil,
                        isDisabled: .constant(selectedID == nil),
                        isFullSize: true,
                        action: {
                            guard
                                let id = selectedID,
                                let chosen = options.first(where: { $0.id == id })
                            else { return }
                            chosen.action?()
                            onApply?(chosen)
                            onClose?()
                        }
                    )
                }
                .padding(.top, Size.p24)

            }
            .frame(maxHeight: Size.Dialog.maxHeight)
            .padding(.horizontal, Size.p24)
            .padding(.top, Size.p24)
            .padding(.bottom, Size.p32)
            .background(Color.Dialog.Background.default)
            .cornerRadius(Size.Dialog.cornerRadius, corners: [.topLeft, .topRight])
            .fixedSize(horizontal: false, vertical: true)
            .shadow(color: StyleDictionaryBoxShadow.elevation04.0.color,
                    radius: StyleDictionaryBoxShadow.elevation04.3.cgFloat,
                    x: StyleDictionaryBoxShadow.elevation04.1.cgFloat,
                    y: StyleDictionaryBoxShadow.elevation04.2.cgFloat)
        }
        .background(Color.black.opacity(0.2))
        .frame(height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview
#Preview {
    SirioDialogSort(
        title: "Ordina",
        options: [
            .init(value: "Action #1", action: { print("Action #1") }),
            .init(value: "Action #2", action: { print("Action #2") }),
            .init(value: "Action #3", action: { print("Action #3") }),
            .init(value: "Action #4", action: { print("Action #4") }),
            .init(value: "Action #5", action: { print("Action #5") }),
            .init(value: "Action #6", action: { print("Action #6") }),
            .init(value: "Action #7", action: { print("Action #7") }),
        ],
        applyButtonText: "Applica",
        onApply: { chosen in
            print("Applied option: \(chosen.value)")
        },
        onClose: {
            print("Closed")
        }
    )
}
