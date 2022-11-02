//
// DialogModifier.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// The Sirio dialog modiefier. It can be used to show Dialog.
/// - Parameters:
///   - isPresented: The boolean that manages the presentation of the dialog
///   - type: The type of the Dialog
///   - title: The title of the dialog
///   - subtitle: The subtitle of the dialog
///   - textfield1: The first textfield
///   - textfield2: The second textfield
///   - textFirstButton: The first button text
///   - actionFirstButton: The first button action
///   - textSecondButton: The second button text
///   - actionSecondButton: The second button action
///   - onTapInfo: Callback that is executed when the info button is tapped
///   - onTapClose: Callback that is executed when the close button is tapped
///   - isVisibleInfoIcon: A boolean to show the info icon
public struct DialogModifier: ViewModifier {
    var isPresented: Binding<Bool>
    var type: DialogType
    var title: String
    var subtitle: String?
    var textfield1: ObservableTextField
    var textfield2: ObservableTextField
    var textFirstButton: String?
    var actionFirstButton: (() -> Void)?
    var textSecondButton: String?
    var actionSecondButton: (() -> Void)?
    var onTapInfoAction: (() -> Void)?
    var onTapCloseAction: (() -> Void)?
    var isVisibleInfoIcon: Bool
    
    public init(isPresented: Binding<Bool>,
                type: DialogType = .default,
                title: String,
                subtitle: String?,
                textfield1: ObservableTextField = .init(),
                textfield2: ObservableTextField = .init(),
                textFirstButton: String?,
                actionFirstButton: (() -> Void)?,
                textSecondButton: String?,
                actionSecondButton: (() -> Void)?,
                onTapInfoAction: (() -> Void)?,
                onTapCloseAction: (() -> Void)?,
                isVisibleInfoIcon: Bool = true){
        self.isPresented = isPresented
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.textfield1 = textfield1
        self.textfield2 = textfield2
        self.textFirstButton = textFirstButton
        self.actionFirstButton = actionFirstButton
        self.textSecondButton = textSecondButton
        self.actionSecondButton = actionSecondButton
        self.onTapInfoAction = onTapInfoAction
        self.onTapCloseAction = onTapCloseAction
        self.isVisibleInfoIcon = isVisibleInfoIcon
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(dialogContent())
    }
    
    @ViewBuilder private func dialogContent() -> some View {
        
        GeometryReader { geometry in
            if isPresented.wrappedValue {
                Dialog(type: type,
                       title: title,
                       subtitle: subtitle,
                       textfield1: textfield1,
                       textfield2: textfield2,
                       textFirstButton: textFirstButton,
                       actionFirstButton: actionFirstButton,
                       textSecondButton: textSecondButton,
                       actionSecondButton: actionSecondButton,
                       onTapInfo: onTapInfoAction,
                       onTapClose: onTapCloseAction,
                       isVisibleInfoIcon: isVisibleInfoIcon)
            }
        }
    }
}
