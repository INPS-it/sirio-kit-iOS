import SwiftUI

/// A customizable text field component supporting different types, icons, and interactions.
///
/// - Parameters:
///   - type: The semantic type of the text field, which defines its visual style (e.g., info, warning, alert, success).
///   - textInfo: An optional label displayed above the text field.
///   - placeholder: The placeholder text shown when the text field is empty.
///   - value: A binding to the value entered in the text field, supporting generic types conforming to `LosslessStringConvertible`.
///   - iconData: An optional icon displayed inside the text field.
///   - helperText: Additional text displayed below the text field, often used for hints or validation messages.
///   - isDisabled: A binding that determines whether the text field is disabled.
///   - isSecureText: A binding that determines whether the text field hides the input (for passwords).
///   - onTapInfoAction: An optional action triggered when the info icon is tapped.
///   - onTapIconAction: An optional action triggered when the main icon inside the text field is tapped.
///   - onTapTextFieldAction: An optional action triggered when the text field is tapped.
///   - accessibilityLabelInfo: A string used as an accessibility label for the info icon.
///   - accessibilityLabelIcon: A string used as an accessibility label for the main icon.

public struct SirioGenericTextField<T: LosslessStringConvertible>: View {
    @Binding var type: SemanticTextField
    var textInfo: String?
    var placeholder: String
    var iconData: SirioIconData?
    var helperText: String?
    @Binding var isDisabled: Bool
    @Binding var isSecureText: Bool
    var onTapInfoAction: (() -> Void)?
    var onTapIconAction: (() -> Void)?
    var onTapTextFieldAction: (() -> Void)?
    var accessibilityLabelInfo: String?
    var accessibilityLabelIcon: String?

    @FocusState private var isFocused: Bool
    @Binding var value: T

    public init(
        type: Binding<SemanticTextField> = .constant(.info),
        textInfo: String? = nil,
        placeholder: String,
        value: Binding<T>,
        iconData: SirioIconData? = nil,
        helperText: String? = nil,
        isDisabled: Binding<Bool> = .constant(false),
        isSecureText: Binding<Bool> = .constant(false),
        onTapInfoAction: (() -> Void)? = nil,
        onTapIconAction: (() -> Void)? = nil,
        onTapTextFieldAction: (() -> Void)? = nil,
        accessibilityLabelInfo: String? = nil,
        accessibilityLabelIcon: String? = nil) {
        self._type = type
        self.textInfo = textInfo
        self.placeholder = placeholder
        self._value = value
        self.iconData = iconData
        self.helperText = helperText
        self._isDisabled = isDisabled
        self._isSecureText = isSecureText
        self.onTapInfoAction = onTapInfoAction
        self.onTapIconAction = onTapIconAction
        self.onTapTextFieldAction = onTapTextFieldAction
        self.accessibilityLabelInfo = accessibilityLabelInfo
        self.accessibilityLabelIcon = accessibilityLabelIcon
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: Size.SirioTextField.spacing){
                if let textInfo = textInfo {
                    SirioText(text: textInfo, typography: Typography.TextField.label)
                        .foregroundColor(textColor)
                }
                
                if let onTapInfoAction = onTapInfoAction {
                    Button(action: {
                        onTapInfoAction()
                    }, label: {
                        SirioIcon(data: .init(icon: .infoCircle))
                            .frame(width: Size.SirioTextField.Icon.frame1,
                                   height: Size.SirioTextField.Icon.frame1)
                            .foregroundColor(infoIconColor)
                    })
                    .setAccessibilityLabel(accessibilityLabelInfo)
                }
            }

            HStack {
                
                ZStack(alignment: .leading) {
                    if valueBinding.wrappedValue.isEmpty {
                        SirioText(text: placeholder, typography: textTypography)
                            .foregroundColor(textColor)
                            .lineLimit(1)
                    }
                    
                    if isSecureText {
                        SecureField("", text: valueBinding)
                            .sirioFont(typography: Typography.TextField.text)
                            .foregroundColor(textFieldTextColor)
                            .focused($isFocused)
                            .disabled(onTapTextFieldAction != nil)
                            .if(onTapTextFieldAction != nil, transform: { view in
                                view.overlay(
                                    Button(action: {
                                        self.onTapTextFieldAction?()
                                    },
                                           label: {
                                               Color.clear
                                           })
                                )
                            })
                    } else {
                        TextField("", text: valueBinding)
                            .sirioFont(typography: textTypography)
                            .foregroundColor(textFieldTextColor)
                            .focused($isFocused)
                            .disabled(onTapTextFieldAction != nil)
                            .if(onTapTextFieldAction != nil, transform: { view in
                                view.overlay(
                                    Button(action: {
                                        self.onTapTextFieldAction?()
                                    },
                                           label: {
                                               Color.clear
                                           })
                                )
                            })
                    }
                }
                
                Spacer()
                
                if let iconData = iconData {
                    SirioIcon(data: iconData)
                        .frame(width: Size.SirioTextField.Icon.frame2,
                               height: Size.SirioTextField.Icon.frame2)
                        .foregroundColor(iconColor)
                        .onTapGesture {
                            self.onTapIconAction?()
                        }
                        .setAccessibilityLabel(accessibilityLabelIcon)
                }
            }
            .padding(.horizontal, Size.SirioTextField.paddingHorizontal)
            .frame(height: Size.SirioTextField.height)
            .overlay(
                RoundedRectangle(cornerRadius: Size.SirioTextField.cornerRadius)
                    .stroke(borderColor, lineWidth: Size.SirioTextField.borderWidth)
            )
            .background(backgroundColor)
            .cornerRadius(Size.SirioTextField.cornerRadius)
            
            if let helperText = helperText, !helperText.isEmpty {
                SirioText(text: helperText, typography: Typography.TextField.helper)
                    .foregroundColor(textColor)
            }
        }
        .disabled(isDisabled)
        .onTapGesture {
            onTapTextFieldAction?()
        }
    }

    /// Binding che converte il valore generico in stringa e viceversa
    private var valueBinding: Binding<String> {
        Binding<String>(
            get: { String(value) },
            set: { newValue in
                if let convertedValue = T(newValue) {
                    value = convertedValue
                }
            }
        )
    }

    private var textTypography: Typography {
        if T.self == Int.self {
            return Typography.TextField.number
        } else {
            return Typography.TextField.text
        }
    }
    
    private var textColor: Color {
        if isDisabled {
            return Color.SirioTextField.Text.disabled
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.Text.warning
            case .alert:
                return Color.SirioTextField.Text.alert
            case .success:
                return Color.SirioTextField.Text.success
            case .info:
                return Color.SirioTextField.Text.default
            }
        }
    }
    
    private var textFieldTextColor: Color {
        if isDisabled {
            return Color.SirioTextField.Text.disabled
        } else {
            if valueBinding.wrappedValue.isEmpty {
                return Color.SirioTextField.Text.placeholder
            } else {
                switch type {
                case .warning:
                    return Color.SirioTextField.Text.warning
                case .alert:
                    return Color.SirioTextField.Text.alert
                case .success:
                    return Color.SirioTextField.Text.success
                case .info:
                    return Color.SirioTextField.Text.default
                }
            }
        }
    }
    
    private var backgroundColor: Color {
        return isDisabled ? Color.SirioTextField.Background.disabled : Color.SirioTextField.Background.default
    }
    
    private var borderColor: Color {
        if isDisabled {
            return Color.SirioTextField.Border.disabled
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.Border.warning
            case .alert:
                return Color.SirioTextField.Border.alert
            case .success:
                return Color.SirioTextField.Border.success
            case .info:
                return Color.SirioTextField.Border.default
            }
        }
    }
    
    private var iconColor: Color {
        if isDisabled {
            return Color.SirioTextField.Icon.disabled
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.Icon.warning
            case .alert:
                return Color.SirioTextField.Icon.alert
            case .success:
                return Color.SirioTextField.Icon.success
            case .info:
                return Color.SirioTextField.Icon.default
            }
        }
    }
    
    private var infoIconColor: Color {
        if isDisabled {
            return Color.SirioTextField.InfoIcon.disabled
        } else {
            switch type {
            case .warning:
                return Color.SirioTextField.InfoIcon.warning
            case .alert:
                return Color.SirioTextField.InfoIcon.alert
            case .success:
                return Color.SirioTextField.InfoIcon.success
            case .info:
                return Color.SirioTextField.InfoIcon.default
            }
        }
    }
}

#Preview {
    @State var userText: String = "Text"
    @State var userNumber: Int = 10

    return VStack {
        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "String Input",
            placeholder: "Enter text",
            value: $userText,
            iconData: .previewTrash,
            helperText: "Helper"
        )
        .padding()

        SirioGenericTextField(
            type: .constant(.info),
            textInfo: "Number Input",
            placeholder: "Enter number",
            value: $userNumber,
            iconData: .previewTrash,
            helperText: "Helper"
        )
        .padding()
    }
}
