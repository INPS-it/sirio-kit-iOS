//
// View+Extension.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

extension View {
    
    // This method apply the Typography to the Text component
    func sirioFont(typography: Typography) -> some View {
        ModifiedContent(content: self, modifier: SirioFontModifier(typography: typography))
    }
    
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

// MARK: Notification Modifier
public extension View {
    /// Use this method to bring up an inline notification.
    /// - Parameters:
    ///   - isPresented: The condition for showing the notification.
    ///   - type: The type of notification.
    ///   - title: The title of notification.
    ///   - subtitle: The subtitle of notification.
    ///   - alignment: The alignment of notification (top, bottom). Default is bottom.
    ///   - direction: The direction of notification (top, bottom). Default is bottom.
    ///   - life: The notification visibility.
    ///   - onCloseAction: The action on tap close button.
    ///   - onTapAction: The action on tap notification.
    /// - Returns: Either the original `View` or the notification `View` if isPresented  is `true`.
    func notificationInline(
        isPresented: Binding<Bool>,
        type: SirioNotificationType,
        title: String,
        subtitle: String,
        alignment: Alignment = .bottom,
        direction: SirioNotificationInlineModifier.Direction = .bottom,
        life: SirioNotificationInlineModifier.Life? = nil,
        onCloseAction: @escaping () -> Void,
        onTapAction: @escaping () -> Void
    ) -> some View {
        return modifier(SirioNotificationInlineModifier(isPresented: isPresented,
                                                   type: type,
                                                   title: title,
                                                   subtitle: subtitle,
                                                   alignment: alignment,
                                                   direction: direction,
                                                   life: life,
                                                   onCloseAction: onCloseAction,
                                                   onTapAction: onTapAction))
    }
    
    
    /// Use this method to bring up a notification toast.
    /// - Parameters:
    ///   - isPresented: The condition for showing the notification toast.
    ///   - type: The type of notification toast..
    ///   - title: The title of notification toast.
    ///   - subtitle: The subtitle of notification toast.
    ///   - textButton: The button text inside notification toast.
    ///   - onCloseAction: The action on tap close button.
    ///   - onTapAction: The tap action for notification toast.
    /// - Returns: Either the original `View` or the notification toast `View` if isPresented  is `true`.
    func notificationToast(
        isPresented: Binding<Bool>,
        type: SirioNotificationType,
        title: String,
        subtitle: String?,
        textButton: String?,
        alignment: Alignment = .bottom,
        direction: SirioNotificationToastModifier.Direction = .bottom,
        onCloseAction: @escaping () -> Void,
        onTapButtonAction: @escaping () -> Void
    ) -> some View {
        return modifier(SirioNotificationToastModifier(isPresented: isPresented,
                                                  type: type,
                                                  title: title,
                                                  subtitle: subtitle,
                                                  textButton: textButton,
                                                  alignment: alignment,
                                                  direction: direction,
                                                  onCloseAction: onCloseAction,
                                                  onTapButtonAction: onTapButtonAction))
    }
}

// MARK: Dialog Modifier
public extension View {
    /// Use this method to bring up a dialog.
    /// - Parameters:
    ///   - isPresented: The condition for showing dialog.
    ///   - type: The type of dialog.
    ///   - title: The title of dialog.
    ///   - subtitle: The subtitle of dialog.
    ///   - textfield1: The first observable textfield model.
    ///   - textfield2: The second observable textfield model.
    ///   - textFirstButton: The first button text.
    ///   - actionFirstButton: The first button tap action.
    ///   - textSecondButton: The second button text.
    ///   - actionSecondButton: The second button tap action.
    ///   - onTapInfo: The action on tap info button.
    ///   - onTapClose: The action on tap close button.
    ///   - isVisibleInfoIcon: The boolean for show or hide info icon.
    ///   - accessibilityLabelInfoIcon: A string that identifies the info icon accessibility element
    ///   - accessibilityLabelSubtitle: A string that identifies the subtitle accessibility element
    ///   - accessibilityLabelButtonClose: A string that identifies the button close accessibility element
    /// - Returns: Either the original `View` or the notification toast `View` if isPresented  is `true`.
    func dialog(
        isPresented: Binding<Bool>,
        type: DialogType,
        title: String?,
        subtitle: String?,
        textfield1: ObservableTextField = .init(),
        textfield2: ObservableTextField = .init(),
        textFirstButton: String? = nil,
        actionFirstButton: (() -> Void)? = nil,
        textSecondButton: String? = nil,
        actionSecondButton: (() -> Void)? = nil,
        onTapInfoAction: (() -> Void)? = nil,
        onTapCloseAction: (() -> Void)? = nil,
        isVisibleInfoIcon: Bool = true,
        accessibilityLabelInfoIcon: String? = nil,
        accessibilityLabelSubtitle: String? = nil,
        accessibilityLabelButtonClose: String? = nil) -> some View {
            return modifier(ClearModifier(isPresented: isPresented, fullScreenContent: {
                SirioDialog(type: type,
                       title: title,
                       subtitle: subtitle,
                       textfield1: textfield1,
                       textfield2: textfield2,
                       textFirstButton: textFirstButton,
                       actionFirstButton: actionFirstButton,
                       textSecondButton: textSecondButton,
                       actionSecondButton: actionSecondButton,
                       onTapInfoAction: onTapInfoAction,
                       onTapCloseAction: onTapCloseAction,
                       isVisibleInfoIcon: isVisibleInfoIcon,
                       accessibilityLabelInfoIcon: accessibilityLabelInfoIcon,
                       accessibilityLabelSubtitle: accessibilityLabelSubtitle,
                       accessibilityLabelButtonClose: accessibilityLabelButtonClose)
            }))
        }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}


private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

public extension View {
    func setAccessibilityLabel(_ label: String?) -> some View {
        if let label = label {
            return AnyView(self.accessibilityLabel(label))
        } else {
            return AnyView(self)
        }
    }
}

extension View {
    func textEditorBackground (_ content: Color) -> some View {
        if #available(iOS 16.0, *) {
            return self.scrollContentBackground(.hidden)
                .background(content)
        } else {
            UITextView.appearance().backgroundColor = .clear
            return self.background (content)
        }
    }
}

extension View {
    func dismissKeyboard() -> some View {
        return modifier(DismissKeyboardModifier())
    }
}

extension View {
    /// Adds a press action to the view, triggering separate closures when the view is pressed and released.
    ///
    /// - Parameters:
    ///   - onPress: A closure executed when the view is pressed down.
    ///   - onRelease: A closure executed when the press is released.
    ///
    /// This method uses a `DragGesture` with `minimumDistance: 0` to detect
    func pressAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        self
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in onPress() })
                    .onEnded({ _ in onRelease() })
            )
    }
}
