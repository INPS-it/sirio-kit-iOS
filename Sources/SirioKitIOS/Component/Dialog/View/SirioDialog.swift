//
// SirioDialog.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum DialogType: CaseIterable {
    case `default`, warning, alert
}

/// A custom dialog component that can be used for various purposes like showing alerts.
///
/// - Parameters:
///   - type: The type of the dialog, e.g., `.default`, `.warning`, or `.alert`.
///   - title: The title text of the dialog.
///   - subtitle: The subtitle text of the dialog.
///   - textfield1: The first text field to be displayed in the dialog.
///   - textfield2: The second text field to be displayed in the dialog.
///   - textFirstButton: The text for the first action button.
///   - actionFirstButton: The action to be executed when the first button is tapped.
///   - textSecondButton: The text for the second action button.
///   - actionSecondButton: The action to be executed when the second button is tapped.
///   - onTapInfo: Callback executed when the info icon is tapped.
///   - onTapClose: Callback executed when the close button is tapped.
///   - isVisibleInfoIcon: A boolean flag to determine if the info icon should be shown.
///   - accessibilityLabelInfoIcon: Accessibility label for the info icon.
///   - accessibilityLabelSubtitle: Accessibility label for the subtitle.
///   - accessibilityLabelButtonClose: Accessibility label for the close button.
public struct SirioDialog: View {
    var type: DialogType
    var title: String?
    var subtitle: String?
    
    // TextField 1
    @ObservedObject var textfield1: ObservableTextField
    
    // TextField 2
    @ObservedObject var textfield2: ObservableTextField
    
    // First Button
    var textFirstButton: String?
    var actionFirstButton: (() -> Void)?
    
    // Second Button
    var textSecondButton: String?
    var actionSecondButton: (() -> Void)?
    
    // Action
    var onTapInfoAction: (() -> Void)?
    var onTapCloseAction: (() -> Void)?
    
    var isVisibleInfoIcon: Bool
    
    var accessibilityLabelInfoIcon: String?
    var accessibilityLabelSubtitle: String?
    var accessibilityLabelButtonClose: String?
    
    @FocusState private var isTextField1Focused: Bool
    @FocusState private var isTextField2Focused: Bool
    
    public init(type: DialogType = .default,
                title: String?,
                subtitle: String?,
                textfield1: ObservableTextField = .init(),
                textfield2: ObservableTextField = .init(),
                textFirstButton: String?,
                actionFirstButton: (() -> Void)?,
                textSecondButton: String?,
                actionSecondButton: (() -> Void)?,
                onTapInfoAction: (() -> Void)?,
                onTapCloseAction: (() -> Void)?,
                isVisibleInfoIcon: Bool,
                accessibilityLabelInfoIcon: String? = nil,
                accessibilityLabelSubtitle: String? = nil,
                accessibilityLabelButtonClose: String? = nil){
        self.type = type
        self.isVisibleInfoIcon = isVisibleInfoIcon
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
        self.accessibilityLabelInfoIcon = accessibilityLabelInfoIcon
        self.accessibilityLabelSubtitle = accessibilityLabelSubtitle
        self.accessibilityLabelButtonClose = accessibilityLabelButtonClose
    }
    
    private var iconColor: Color {
        if let _ = icon, isVisibleInfoIcon {
            switch type {
            case .default:
                return Color.Dialog.InfoIcon.default
            case .warning:
                return Color.Dialog.InfoIcon.warning
            case .alert:
                return Color.Dialog.InfoIcon.alert
            }
        }
        return Color.clear
    }
    
    private var icon: AwesomeIcon? {
        if !isVisibleInfoIcon {
            return nil
        }
        switch type {
        case .default:
            return .infoCircle
        case .warning:
            return .exclamationCircle
        case .alert:
            return .exclamationTriangle
        }
    }
    
    private var hierarchy: SirioButtonHierarchy {
        return type == .alert ? .danger : .primary
    }
    
    public var body: some View {
        VStack(spacing: Size.Dialog.spacing) { // Blur view
            Color.clear
            
            VStack(alignment: .leading, spacing: Size.Dialog.spacing) { // Dialog View
                VStack(spacing: Size.zero){ // Icons View
                    HStack { // Close
                        Spacer()
                        SirioButton(hierarchy: .ghost, size: .large, text: nil, iconData: .init(icon: .times), action: {
                            onTapCloseAction?()
                        }, accessibilityLabel: accessibilityLabelButtonClose)
                    }
                    if let icon = icon, isVisibleInfoIcon {
                        HStack(spacing: Size.zero){
                            Button(action: {
                                onTapInfoAction?()
                                
                            }, label: {
                                SirioIcon(data: .init(icon: icon))
                                    .frame(width: Size.Dialog.InfoIcon.frame,
                                           height: Size.Dialog.InfoIcon.frame)
                                    .foregroundColor(iconColor)
                            })
                            .accessibilityHidden(accessibilityLabelInfoIcon == nil)
                            
                            Spacer()
                        }
                    }
                }
                
                if let title = title {
                    SirioText(text: title, typography: Typography.Dialog.title)
                        .foregroundColor(Color.Dialog.title)
                }
                
                ScrollView(showsIndicators: false, content: {
                    SirioText(text: subtitle ?? "", typography: Typography.Dialog.subtitle)
                        .foregroundColor(Color.Dialog.subtitle)
                        .setAccessibilityLabel(accessibilityLabelSubtitle != nil ? accessibilityLabelSubtitle : subtitle)
                })
                
                
                ViewTextField(textfield: textfield1)
                
                ViewTextField(textfield: textfield2)
                
                VStack(spacing: Size.Dialog.spacing) {
                    ViewButton(hierarchy: hierarchy,
                               text: textFirstButton,
                               action: {
                        actionFirstButton?()
                    })
                    
                    ViewButton(hierarchy: .ghost,
                               text: textSecondButton,
                               action: {
                        actionSecondButton?()
                    })
                }
                
            } // Dialog View
            .frame(maxHeight: Size.Dialog.maxHeight)
            .padding(Size.Dialog.padding)
            .background(Color.Dialog.Background.default)
            .cornerRadius(Size.Dialog.cornerRadius, corners: [.topLeft, .topRight])
            .fixedSize(horizontal: false, vertical: true)
        } // Blur View
        .background(Color.black.opacity(0.2))
        .frame(height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.all)
        .dismissKeyboard()
    }
}

struct ViewButton: View {
    var hierarchy: SirioButtonHierarchy
    var text: String?
    var action: (() -> Void)?
    
    var body: some View {
        if let text = text {
            
            SirioButton(hierarchy: hierarchy, size: .large, text: text, iconData: nil, isFullSize: true, action: {
                action?()
            })
        }
    }
}

struct ViewTextField: View {
    @ObservedObject var textfield: ObservableTextField
    
    var body: some View {
        if let label = textfield.label,
           let _ = textfield.type,
           let placeholder = textfield.placeholder,
           let _ = textfield.text {
            VStack(alignment: .leading, spacing: Size.Dialog.spacing){
                SirioTextField(type: $textfield.type.toUnwrapped(defaultValue: .info),
                               textInfo: label,
                               placeholder: placeholder,
                               text: $textfield.text.toUnwrapped(defaultValue: ""),
                               icon: nil,
                               helperText: nil,
                               isDisabled: .constant(false),
                               onTapInfoAction: nil,
                               onTapTextFieldAction: nil)
            }
        }
    }
}

#Preview {
    SirioDialog(type: .warning,
           title: "Title",
           subtitle: .loremIpsum,
           textfield1: .init(type: .info,
                             label: "Label",
                             placeholder: "Placeholder",
                             text: ""),
           textfield2: .init(type: .info,
                             label: "Label",
                             placeholder: "Placeholder",
                             text: ""),
           textFirstButton: "Text",
           actionFirstButton: nil,
           textSecondButton: "Text",
           actionSecondButton: nil,
           onTapInfoAction: nil,
           onTapCloseAction: nil,
           isVisibleInfoIcon: true)
}
