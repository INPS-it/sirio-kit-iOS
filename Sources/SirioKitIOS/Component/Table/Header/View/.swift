//
// SirioTableHeader.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A view representing a table header with an optional checkbox,
/// title, and sort button.
///
/// The header supports title alignment and allows handling taps
/// on the checkbox and sort button.
///
/// - Note:
///   - When `hasCheck` is `true`, a checkbox is displayed on the left.
///   - When `hasOrderBy` is `true`, a sort icon button is displayed.
///   - Title alignment is controlled by `textAlignment`.
///
/// - Parameters:
///   - schemeColor: The color scheme applied to the header.
///   - textAlignment: The alignment of the title within the header.
///   - size: The size of the header (affects padding, height, etc.).
///   - title: The text displayed as the header title.
///   - hasCheck: If `true`, displays a checkbox.
///   - hasOrderBy: If `true`, displays the sort button.
///   - isChecked: A binding to the checkbox state.
///   - onTapCheckBoxAction: A closure executed when the checkbox is tapped.
///   - onTapOrderBy: A closure executed when the sort button is tapped.

public struct SirioTableHeader: View {
    var schemeColor: SchemeColor
    var textAlignment: SirioAlignment
    var size: SirioTableSize
    var data: SirioTableHeaderData

    @Binding var isChecked: Bool
    var onTapCheckBoxAction: (() -> Void)?
    var onTapOrderBy: (() -> Void)?
    
    public init(
        schemeColor: SchemeColor = .dark,
        textAlignment: SirioAlignment,
        size: SirioTableSize,
        data: SirioTableHeaderData,
        isChecked: Binding<Bool> = .constant(false),
        onTapCheckBoxAction: (() -> Void)? = nil,
        onTapOrderBy: (() -> Void)? = nil
    ) {
        self.schemeColor = schemeColor
        self.textAlignment = textAlignment
        self.size = size
        self.data = data
        self._isChecked = isChecked
        self.onTapCheckBoxAction = onTapCheckBoxAction
        self.onTapOrderBy = onTapOrderBy
    }
    
    public var body: some View {
        HStack(spacing: Size.zero) {
            VStack(spacing: Size.zero) {
                headerContent
                Divider().background(borderColor)
            }
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
    }
    
    private var headerContent: some View {
        HStack(spacing: Size.zero) {
            if data.hasCheck {
                SirioCheckbox(text: "", isChecked: $isChecked, callback: { _ in
                    onTapCheckBoxAction?()
                })
                
            }
            
            if textAlignment == .trailing {
                Spacer()
            }
            
            SirioText(text: data.title, typography: Typography.Table.Header.title)
                .foregroundStyle(titleColor)
                .padding(.horizontal, paddingText)
            
            if textAlignment == .leading {
                Spacer()
            }
            
            if data.hasOrderBy {
                Button(action: {
                    onTapOrderBy?()
                }) {
                    SirioIcon(data: .init(icon: .sort))
                        .frame(width: Size.Table.Header.Icon.frame, height: Size.Table.Header.Icon.frame)
                        .foregroundStyle(iconColor)
                }
            }
        }
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .overlay(
            VStack(spacing: 0) {
                Spacer()
                Rectangle()
                    .frame(height: 1) // bottom
                    .foregroundColor(borderColor)
            },
            alignment: .bottom
        )
        .overlay(
            HStack(spacing: 0) {
                Spacer()
                Rectangle()
                    .frame(width: 1) // trailing
                    .foregroundColor(borderColor)
            },
            alignment: .trailing
        )
    }

    
    private var paddingText: CGFloat {
        return 8
    }
    
    private var iconColor: Color {
        schemeColor == .dark ? Color.Table.Header.Icon.dark : Color.Table.Header.Icon.light
    }
    
    private var titleColor: Color {
        schemeColor == .dark ? Color.Table.Header.Title.dark : Color.Table.Header.Title.light
    }
    
    private var backgroundColor: Color {
        schemeColor == .dark ? Color.Table.Header.Background.dark : Color.Table.Header.Background.light
    }
    
    private var borderColor: Color {
       return Color.Table.Header.border
    }
    
    private var scrollColor: Color {
        return Color.Table.Header.scroll
    }
    
    private var paddingVertical: CGFloat {
        switch size {
        case .small: return 8
        case .large: return 16
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .small: return 8
        case .large: return 12
        }
    }
//    private var height: CGFloat {
//        switch size {
//        case .small: return Size.Table.Header.Height.small
//        case .large: return Size.Table.Header.Height.large
//        }
//    }
}

#Preview {
    
    SirioTableHeader(schemeColor: .light,
                      textAlignment: .leading,
                      size: .large,
                      data: .init(title: "Header", hasCheck: true, hasOrderBy: true, isChecked: false),
                      isChecked: .constant(false))
    
    SirioTableHeader(schemeColor: .dark,
                      textAlignment: .leading,
                      size: .large,
                      data: .init(title: "Header", hasCheck: true, hasOrderBy: true, isChecked: false),
                      isChecked: .constant(false))
    
    SirioTableHeader(schemeColor: .light,
                      textAlignment: .trailing,
                      size: .large,
                      data: .init(title: "Header", hasCheck: true, hasOrderBy: true, isChecked: false),
                      isChecked: .constant(false))
    
    SirioTableHeader(schemeColor: .dark,
                      textAlignment: .trailing,
                      size: .large,
                      data: .init(title: "Header", hasCheck: true, hasOrderBy: true, isChecked: false),
                      isChecked: .constant(false))
}

