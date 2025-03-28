//
// SirioButtonTextIcon.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A customizable button that can display both text and an icon (or either one).
/// The button supports various styles and interactions, with custom size, hierarchy, and actions.
///
/// - Parameters:
///   - hierarchy: The hierarchy of the button, defining its style (e.g., primary, secondary).
///   - size: The size of the button, which can be set to predefined values (e.g., small, medium, large).
///   - text: The text label displayed on the button (optional, must be provided if iconData is not).
///   - iconData: The icon data for the button, displayed alongside or instead of the text (optional, must be provided if text is not).
///   - iconAlignment: The alignment of the icon relative to the text (optional, defaults to trailing).
///   - isDisabled: A binding that determines whether the button is disabled or not.
///   - isFullSize: A flag to determine if the button should take up the full available width (optional).
///   - action: A closure that is executed when the button is tapped.
///   - accessibilityLabel: A string used to identify the button for accessibility purposes (optional).



public struct SirioButton: View {
    
    private var hierarchy: SirioButtonHierarchy
    private var size: SirioSize
    private var text: String?
    private var iconData: SirioIconData?
    private var iconAlignment: SirioAlignment?
    @Binding private var isDisabled: Bool
    private var isFullSize: Bool
    private var action: () -> Void
    private var accessibilityLabel: String?

    ///
    public init(hierarchy: SirioButtonHierarchy,
                size: SirioSize,
                text: String?,
                iconData: SirioIconData?,
                iconAlignment: SirioAlignment? = .trailing,
                isDisabled: Binding<Bool> = .constant(false),
                isFullSize: Bool = false,
                action: @escaping () -> Void,
                accessibilityLabel: String? = nil){
        self.hierarchy = hierarchy
        self.size = size
        self.text = text
        self.iconData = iconData
        self.iconAlignment = iconAlignment
        self._isDisabled = isDisabled
        self.isFullSize = isFullSize
        self.action = action
        self.accessibilityLabel = accessibilityLabel
        
        if text == nil && iconData == nil {
            fatalError("Either text or iconData must be provided")
        }
    }
    
    /// Initializes a button that can have both text and an icon (at least one is required).
    public init(hierarchy: SirioButtonHierarchy,
                size: SirioSize,
                iconData: SirioIconData?,
                iconAlignment: SirioAlignment? = .trailing,
                isDisabled: Binding<Bool> = .constant(false),
                isFullSize: Bool = false,
                action: @escaping () -> Void,
                accessibilityLabel: String? = nil){
        self.hierarchy = hierarchy
        self.size = size
        self.text = nil
        self.iconData = iconData
        self.iconAlignment = iconAlignment
        self._isDisabled = isDisabled
        self.isFullSize = isFullSize
        self.action = action
        self.accessibilityLabel = accessibilityLabel
        
        if iconData == nil {
            fatalError("iconData must be provided")
        }
    }
    
    /// Initializes a button with text only.
    public init(hierarchy: SirioButtonHierarchy,
                size: SirioSize,
                text: String,
                isDisabled: Binding<Bool> = .constant(false),
                isFullSize: Bool = false,
                action: @escaping () -> Void,
                accessibilityLabel: String? = nil){
        self.hierarchy = hierarchy
        self.size = size
        self.text = text
        self.iconData = nil
        self.iconAlignment = nil
        self._isDisabled = isDisabled
        self.isFullSize = isFullSize
        self.action = action
        self.accessibilityLabel = accessibilityLabel
        
        if text.isEmpty {
            fatalError("Either text or iconData must be provided")
        }
    }
    
    
    public var body: some View {
        
        Button(action: {
            action()
        }, label: {
            // Inside style
        })
        .disabled(isDisabled)
        .buttonStyle(SirioButtonStyle(hierarchy: hierarchy,
                                              size: size,
                                              text: text,
                                              iconData: iconData,
                                              iconAlignment: iconAlignment,
                                              isDisabled: $isDisabled,
                                              isFullSize: isFullSize))
        .setAccessibilityLabel(accessibilityLabel)
    }
}


struct TestSirioButtons: View {
    var type: String
    var hierarchy: SirioButtonHierarchy
    
    var body: some View {
        VStack(alignment: .center){
            SirioText(text: "\(type)" , typography: .label_md_700)
            HStack(spacing: 8) {
                VStack {
                    ForEach(SirioSize.allCases, id: \.self, content: { size in
                        VStack {
                            HStack {
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: nil, isDisabled: .constant(false), action: {})
                                
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: nil, isDisabled: .constant(true), action: {})
                            }
                            HStack {
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowRight, iconAlignment: .trailing, isDisabled: .constant(false), action: {})
                                
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowRight, iconAlignment: .trailing, isDisabled: .constant(true), action: {})
                            }
                            HStack {
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowLeft, iconAlignment: .leading, isDisabled: .constant(false), action: {})
                                SirioButton(hierarchy: hierarchy, size: size, text: "Text", iconData: .previewArrowLeft, iconAlignment: .leading, isDisabled: .constant(true), action: {})
                            }
                            HStack {
                                SirioButton(hierarchy: hierarchy, size: size, text: nil, iconData: .previewArrowRight, isDisabled: .constant(false), action: {})
                                SirioButton(hierarchy: hierarchy, size: size, text: nil, iconData: .previewArrowRight, isDisabled: .constant(true), action: {})
                            }
                        }
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    ScrollView(showsIndicators: false, content: {
        VStack(alignment: .leading, spacing: 8) {
            TestSirioButtons(type: "Primary", hierarchy: .primary)
            TestSirioButtons(type: "Secondary", hierarchy: .secondary)
            TestSirioButtons(type: "Tertiary Light", hierarchy: .tertiaryLight)
            TestSirioButtons(type: "Tertiary Dark", hierarchy: .tertiaryDark)
            TestSirioButtons(type: "Danger", hierarchy: .danger)
            TestSirioButtons(type: "Ghost", hierarchy: .ghost)
        }
    })
}
