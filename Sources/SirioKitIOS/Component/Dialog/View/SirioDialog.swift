//
// SirioDialog.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum DialogType: CaseIterable {
    case info, warning, alert
}

/// A custom dialog component that can be used for various purposes like showing alerts.
///
/// - Parameters:
///   - type: The type of the dialog, e.g., `.info`, `.warning`, or `.alert`.
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
///   
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
    
    public init(type: DialogType = .info,
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
                isVisibleInfoIcon: Bool = true,
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
            case .info:
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
        case .info:
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
        VStack(spacing: Size.zero) { // Blur view
            Color.clear
            
            VStack(alignment: .leading, spacing: Size.zero) {
                VStack(spacing: Size.zero){
                    HStack {
                        Spacer()
                        SirioButton(hierarchy: .ghost, size: .medium, text: nil, iconData: .init(icon: .times), action: {
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
                .padding(.bottom, Size.p24)

                if let title = title {
                    SirioText(text: title, typography: Typography.Dialog.title)
                        .foregroundColor(Color.Dialog.title)
                        .if(subtitle != nil && !subtitle!.isEmpty, transform: { view in
                            view.padding(.bottom, Size.p8)
                        })
                }
                if let subtitle = subtitle {
                    ScrollView(showsIndicators: false, content: {
                        SirioText(text: subtitle ?? "", typography: Typography.Dialog.subtitle)
                            .foregroundColor(Color.Dialog.subtitle)
                            .setAccessibilityLabel(accessibilityLabelSubtitle != nil ? accessibilityLabelSubtitle : subtitle)
                            .if(textfield1.isEmpty() == false, transform: { view in
                                view.padding(.bottom, Size.p16)
                            })
                    })
                }
                
                if type == .info {
                    ViewTextField(textfield: textfield1)
                        .if(textfield2.isEmpty() == false, transform: { view in
                            view.padding(.bottom, Size.p16)
                        })
                    
                    ViewTextField(textfield: textfield2)
                }
                
                VStack(spacing: Size.p16) {
                    ViewButton(hierarchy: hierarchy,
                               text: textFirstButton,
                               action: {
                        actionFirstButton?()
                    })
                    
                    ViewButton(hierarchy: .secondary,
                               text: textSecondButton,
                               action: {
                        actionSecondButton?()
                    })
                }
                .padding(.top, Size.p24)
                
            } // Dialog View
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
            VStack(alignment: .leading, spacing: Size.s16) {
                SirioGenericTextField(type: $textfield.type.toUnwrapped(defaultValue: .info),
                               textInfo: label,
                               placeholder: placeholder,
                               value: $textfield.text.toUnwrapped(defaultValue: ""),
                               iconData: nil,
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
           textfield1: .init(),
           textfield2: .init(),
           textFirstButton: "Text",
           actionFirstButton: nil,
           textSecondButton: "Text",
           actionSecondButton: nil,
           onTapInfoAction: nil,
           onTapCloseAction: nil,
           isVisibleInfoIcon: true)
}


#Preview {
    SirioDialog(type: .info,
           title: "Title",
           subtitle: .loremIpsum,
           textfield1: .init(type: .info,
                             label: "Label",
                             placeholder: "Placeholder",
                             text: "text"),
           textfield2: .init(type: .info,
                             label: "Label",
                             placeholder: "Placeholder",
                             text: "text"),
           textFirstButton: "Text",
           actionFirstButton: nil,
           textSecondButton: "Text",
           actionSecondButton: nil,
           onTapInfoAction: nil,
           onTapCloseAction: nil,
           isVisibleInfoIcon: true)
}
