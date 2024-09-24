//
// SirioTableHeader.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A view representing a table header with an optional checkbox, title, and a button.
///
/// - Parameters:
///   - schemeColor: The color scheme of the header.
///   - alignment: The alignment of the title within the header.
///   - size: The size of the header.
///   - title: The title displayed in the header.
///   - scroll: A boolean indicating whether the header supports scrolling.
///   - hasCheckBox: A boolean indicating whether the header includes a checkbox.
///   - isChecked: A binding to a boolean value indicating whether the checkbox is checked.
///   - onTapCheckBoxAction: A callback executed when the checkbox is tapped.
///   - onTapButtonAction: A callback executed when the button is tapped.

public struct SirioTableHeader: View {
    var schemeColor: SchemeColor
    var alignment: SirioAligment
    var size: SirioTableSize
    var title: String
    var scroll: Bool
    var hasCheckBox: Bool
    @Binding var isChecked: Bool
    var withSort: Bool
    var onTapCheckBoxAction: (() -> Void)?
    var onTapButtonAction: (() -> Void)?
    
    public init(schemeColor: SchemeColor = .dark,
                alignment: SirioAligment,
                size: SirioTableSize,
                title: String,
                scroll: Bool = false,
                hasCheckBox: Bool = false,
                isChecked: Binding<Bool> = .constant(false),
                withSort: Bool = false,
                onTapCheckBoxAction: (() -> Void)? = nil,
                onTapButtonAction: (() -> Void)? = nil) {
        self.schemeColor = schemeColor
        self.alignment = alignment
        self.size = size
        self.title = title
        self.scroll = scroll
        self.hasCheckBox = hasCheckBox
        self._isChecked = isChecked
        self.withSort = withSort
        self.onTapCheckBoxAction = onTapCheckBoxAction
        self.onTapButtonAction = onTapButtonAction
    }
    
    public var body: some View {
        HStack(spacing: Size.Table.Header.spacing) {
            VStack(spacing: Size.Table.Header.spacing) {
                headerContent
                Divider().background(borderColor)
            }
            sideBar
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
    }
    
    private var headerContent: some View {
        HStack(spacing: Size.Table.Header.spacing) {
            if hasCheckBox {
                SirioCheckbox(text: "", isChecked: $isChecked, callback: { _ in
                    onTapCheckBoxAction?()
                })
            }
            
            SirioText(text: title, typography: Typography.Table.Header.title)
                .foregroundStyle(titleColor)
                .frame(maxWidth: .infinity, alignment: alignment == .leading ? .leading : .trailing)
//                .padding(alignment == .trailing ? .trailing : .leading, alignment == .trailing ? paddingLeading : Size.Table.Header.Icon.Padding.small)
                .padding(.trailing, paddingLeading)
            
            if withSort {
                Button(action: {
                    onTapButtonAction?()
                }) {
                    SirioIcon(data: .init(icon: .sort))
                        .frame(width: Size.Table.Header.Icon.frame, height: Size.Table.Header.Icon.frame)
                        .foregroundStyle(iconColor)
                        .padding(.trailing, scroll ? Size.Table.Header.Icon.Padding.small : Size.Table.Header.Icon.Padding.large)
                }
            }
        }
        .padding(.leading, padding)
        .frame(height: height - 1)
    }
    
    private var paddingLeading: CGFloat {
        switch size {
        case .xsmall:
            Size.Table.Header.Padding.xsmall
        case .small:
            Size.Table.Header.Padding.small
        case .medium:
            Size.Table.Header.Padding.medium
        case .large:
            Size.Table.Header.Padding.large
        }
    }
    
    private var sideBar: some View {
        Rectangle()
            .fill(scroll ? scrollColor : borderColor)
            .frame(width: sideBarWidth)
            .frame(maxHeight: .infinity)
    }
    
    private var iconColor: Color {
        schemeColor == .dark ? Color.Table.Header.Icon.dark : Color.Table.Header.Icon.light
    }
    
    private var sideBarWidth: CGFloat {
        return scroll ? Size.Table.Header.SideBar.large : Size.Table.Header.SideBar.small
    }
    private var titleColor: Color {
        schemeColor == .dark ? Color.Table.Header.Title.dark : Color.Table.Header.Title.light
    }
    
    private var backgroundColor: Color {
        schemeColor == .dark ? Color.Table.Header.Background.dark : Color.Table.Header.Background.light
    }
    
    private var borderColor: Color {
        Color.Table.Header.border
    }
    
    private var scrollColor: Color {
        Color.Table.Header.scroll
    }
    
    private var padding: CGFloat {
        switch size {
        case .xsmall: return Size.Table.Header.Padding.xsmall
        case .small: return Size.Table.Header.Padding.small
        case .medium: return Size.Table.Header.Padding.medium
        case .large: return Size.Table.Header.Padding.large
        }
    }
    
    private var height: CGFloat {
        switch size {
        case .xsmall: return Size.Table.Header.Height.xsmall
        case .small: return Size.Table.Header.Height.small
        case .medium: return Size.Table.Header.Height.medium
        case .large: return Size.Table.Header.Height.large
        }
    }
}

#Preview {
    ScrollView {
        ForEach(SirioTableSize.allCases, id: \.self){ size in
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    SirioTableHeader(schemeColor: .light, alignment: .leading, size: size, title: "Header", scroll: false, isChecked: .constant(false), onTapButtonAction: {})
                    SirioTableHeader(schemeColor: .dark, alignment: .leading, size: size, title: "Header", scroll: false, isChecked: .constant(false), onTapButtonAction: {})
                }
                
                HStack(spacing: 10) {
                    SirioTableHeader(schemeColor: .light, alignment: .trailing, size: size, title: "Header", scroll: false, isChecked: .constant(false), onTapButtonAction: {})
                    SirioTableHeader(schemeColor: .dark, alignment: .trailing, size: size, title: "Header", scroll: false, isChecked: .constant(false), onTapButtonAction: {})
                }
                
                HStack(spacing: 10) {
                    SirioTableHeader(schemeColor: .light, alignment: .leading, size: size, title: "Header", scroll: true, isChecked: .constant(false), onTapButtonAction: {})
                    SirioTableHeader(schemeColor: .dark, alignment: .leading, size: size, title: "Header", scroll: true, isChecked: .constant(false), onTapButtonAction: {})
                }
                
            }
            .padding()
        }
    }
}

