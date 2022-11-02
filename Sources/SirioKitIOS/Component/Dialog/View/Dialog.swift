//
// Dialog.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public enum DialogType: CaseIterable {
    case `default`, warning, alert
}

/// The Sirio dialog.
/// - Parameters:
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
public struct Dialog: View {
    var type: DialogType
    var title: String
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
    var onTapInfo: (() -> Void)?
    var onTapClose: (() -> Void)?
    
    var isVisibleInfoIcon: Bool
    
    @FocusState private var isTextField1Focused: Bool
    @FocusState private var isTextField2Focused: Bool
    
    public init(type: DialogType = .default,
                title: String,
                subtitle: String?,
                textfield1: ObservableTextField = .init(),
                textfield2: ObservableTextField = .init(),
                textFirstButton: String?,
                actionFirstButton: (() -> Void)?,
                textSecondButton: String?,
                actionSecondButton: (() -> Void)?,
                onTapInfo: (() -> Void)?,
                onTapClose: (() -> Void)?,
                isVisibleInfoIcon: Bool = true){
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
        self.onTapInfo = onTapInfo
        self.onTapClose = onTapClose
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
    
    private var styleFirstButton: SirioButtonStyle {
        return type == .alert ? .danger : .primary
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear
            VStack(spacing: Size.Dialog.spacing) { // Blur view
                Spacer()
                
                VStack(alignment: .leading, spacing: Size.Dialog.spacing) { // Dialog View
                    VStack(spacing: Size.Dialog.spacing){ // Icons View
                        HStack{ // Close
                            Spacer()
                            ButtonIconOnly(style: .ghost, size: .large, icon: .times, action: {
                                onTapClose?()
                            })
                        }
                        if let icon = icon, isVisibleInfoIcon {
                            HStack(spacing: Size.Dialog.spacing){
                                Button(action: {
                                    onTapInfo?()
                                    
                                }, label: {
                                    SirioIcon(icon: icon)
                                        .frame(width: Size.Dialog.InfoIcon.frame,
                                               height: Size.Dialog.InfoIcon.frame)
                                        .foregroundColor(iconColor)
                                })
                                
                                Spacer()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: Size.Dialog.spacingLeading){
                        SirioText(text: title, typography: Typography.Dialog.title)
                            .foregroundColor(Color.Dialog.title)
                        
                        ScrollView(showsIndicators: false, content: {
                            SirioText(text: subtitle ?? "", typography: Typography.Dialog.subtitle)
                                .foregroundColor(Color.Dialog.subtitle)
                        })
                        
                        ViewTextField(textfield: textfield1)
                        
                        ViewTextField(textfield: textfield2)
                        
                        ViewButton(style: styleFirstButton,
                                   text: textFirstButton,
                                   action: {
                            actionFirstButton?()
                        })
                        
                        ViewButton(style: .ghost,
                                   text: textSecondButton,
                                   action: {
                            actionSecondButton?()
                        })
                    } // VStack Title, subtitle, textfield etc..
                    .padding(.top, Size.Dialog.paddingTop)
                    
                } // Dialog View
                .frame(maxHeight: Size.Dialog.maxHeight)
                .padding(Size.Dialog.padding)
                .background(Color.Dialog.Background.default)
                .cornerRadius(Size.Dialog.cornerRadius)
                .fixedSize(horizontal: false, vertical: true)
            } // Blur View
            .background(Color.black.opacity(0.2))
            .frame(height: UIScreen.main.bounds.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ViewButton: View {
    var style: SirioButtonStyle
    var text: String?
    var action: (() -> Void)?
    
    var body: some View {
        if let text = text {
            ButtonTextOnly(style: style,
                           size: .large,
                           text: text,
                           isFullSize: true,
                           action: {
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
                SirioText(text: label, typography: Typography.Dialog.textfield)
                    .foregroundColor(Color.Dialog.TextField.text)
                
                SirioTextField(type: $textfield.type.toUnwrapped(defaultValue: .info),
                               textInfo: nil,
                               infoIcon: nil,
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

struct Dialog_Previews: PreviewProvider {
    static var previews: some View {
        Dialog(type: .warning,
               title: "Title",
               subtitle: "Subtitle",
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
               onTapInfo: nil,
               onTapClose: nil,
               isVisibleInfoIcon: true)
    }
}
