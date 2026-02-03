//
// SirioTableHeader.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
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
///   - When `isSortable` is `true`, a sort icon button is displayed.
///   - Title alignment is controlled by `textAlignment`.
///
/// - Parameters:
///   - schemeColor: The color scheme applied to the header.
///   - textAlignment: The alignment of the title within the header.
///   - size: The size of the header (affects padding, height, etc.).
///   - title: The text displayed as the header title.
///   - hasCheck: If `true`, displays a checkbox.
///   - isSortable: If `true`, displays the sort button.
///   - isChecked: A binding to the checkbox state.
///   - onTapCheckBoxAction: A closure executed when the checkbox is tapped.
///   - onTapOrderBy: A closure executed when the sort button is tapped.

public struct SirioTableHeader: View {
    var schemeColor: SchemeColor
    var textAlignment: SirioAlignment
    var size: SirioTableSize
    @ObservedObject var data: SirioTableHeaderData
    
    var order: SirioTableOrder?
    var onSortRequest: ((SirioTableOrder) ->Void)?
    
    var width: CGFloat
    var height: CGFloat
    var withSeparator: Bool
    
    public init(
        schemeColor: SchemeColor = .dark,
        textAlignment: SirioAlignment = .leading,
        size: SirioTableSize,
        data: SirioTableHeaderData,
        order: SirioTableOrder? = nil,
        onSortRequest: ((SirioTableOrder) ->Void)? = nil, // Callback per il padre
        width: CGFloat = 0,
        height: CGFloat = 0,
        withSeparator: Bool = false
    ) {
        self.schemeColor = schemeColor
        self.textAlignment = textAlignment
        self.size = size
        self.data = data
        self.order = order
        self.onSortRequest = onSortRequest
        self.width = width
        self.height = height
        self.withSeparator = withSeparator
    }
    
    public var body: some View {
        headerContent
            .background(backgroundColor)
    }

    private var hAlignment: HorizontalAlignment {
        switch textAlignment {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
    
    private var alignment: Alignment {
        switch textAlignment {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
    
    private var minHeight: CGFloat {
        switch size {
        case .large:
            return max(height, Size.Table.Header.Height.large)
        case .small:
            return max(height, Size.Table.Header.Height.small)
        }
    }
    
    private var headerContent: some View {
        
        HStack(spacing: Size.zero) {
            if data.hasCheck {
                SirioCheckbox(text: "", isChecked: $data.isChecked) { _ in
                    
                }
            }
            
            VStack(alignment: hAlignment) {
                SirioText(text: data.title, typography: Typography.Table.Header.title)
                    .foregroundStyle(titleColor)
                    .padding(.leading, data.hasCheck ?  paddingText : Size.zero)
                    .padding(.trailing, data.isSortable ? paddingText + Size.Table.Header.Icon.frame : Size.zero)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .frame(minWidth: width, minHeight: minHeight, alignment: alignment)
        .overlay(
            VStack(spacing: Size.zero) {
                Spacer()
                Rectangle()
                    .frame(height: Size.Table.borderWidth) // bottom
                    .foregroundColor(borderColor)
            },
            alignment: .bottom
        )
        .if(withSeparator, transform: { view in
            view.overlay(
                HStack(spacing: Size.zero) {
                    Spacer()
                    Rectangle()
                        .frame(width: Size.Table.borderWidth) // trailing
                        .foregroundColor(borderColor)
                },
                alignment: .trailing
            )
        })
        .overlay(
            HStack {
                if data.isSortable {
                    Spacer()
                    
                    Button {
                        guard let nextOrder = order?.next() else {
                            return
                        }
                        print(nextOrder)
                        onSortRequest?(nextOrder)
                    } label: {
                        SirioIcon(data: .init(icon: .sort))
                            .frame(
                                width: Size.Table.Header.Icon.frame,
                                height: Size.Table.Header.Icon.frame
                            )
                            .foregroundStyle(iconColor)
                            .overlay(alignment: .center) {
                                if let overlayIcon = orderOverlayIcon(for: order ?? .none) {
                                    SirioIcon(data: overlayIcon)
                                        .frame(
                                            width: Size.Table.Header.Icon.frame,
                                            height: Size.Table.Header.Icon.frame
                                        )
                                        .foregroundStyle(Color.aliasBackgroundColorPrimaryLight0)
                                }
                            }
                    }
                    .padding(.trailing, paddingHorizontal)
//                    .accessibilityLabel(
//                        Text(
//                            activeOrder == .ascending ? "Ordine crescente" :
//                                activeOrder == .descending ? "Ordine decrescente" :
//                                "Nessun ordinamento"
//                        )
//                    )
                }
            }
        )
    }
    
    private var paddingText: CGFloat {
        return Size.Table.Padding.text
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
        case .small: return Size.Table.Padding.Vertical.small
        case .large: return Size.Table.Padding.Vertical.large
        }
    }
    
    private var paddingHorizontal: CGFloat {
        switch size {
        case .small: return Size.Table.Padding.Horizontal.small
        case .large: return Size.Table.Padding.Horizontal.large
        }
    }
    
    private func orderOverlayIcon(for order: SirioTableOrder) -> SirioIconData? {
        switch order {
        case .ascending:
            return .init(icon: .sortUp)
        case .descending:
            return .init(icon: .sortDown)
        case .none:
            return nil
        }
    }
}
//
//#Preview {
//    
//    SirioTableHeader(schemeColor: .light,
//                     textAlignment: .leading,
//                     size: .large,
//                     data: .init(title: "Header", hasCheck: true, isSortable: true, isChecked: false))
//    
//    SirioTableHeader(schemeColor: .dark,
//                     textAlignment: .leading,
//                     size: .large,
//                     data: .init(title: "Header", hasCheck: true, isSortable: true, isChecked: false))
//    
//    SirioTableHeader(schemeColor: .light,
//                     textAlignment: .trailing,
//                     size: .large,
//                     data: .init(title: "Header", hasCheck: true, isSortable: true, isChecked: false))
//    
//    SirioTableHeader(schemeColor: .dark,
//                     textAlignment: .trailing,
//                     size: .large,
//                     data: .init(title: "Header", hasCheck: true, isSortable: true, isChecked: false))
//}
//
