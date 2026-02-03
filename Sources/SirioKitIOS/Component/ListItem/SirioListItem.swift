//
// SirioListItem.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI


// MARK: - SirioListItem (Single)
public struct SirioListItem: View {
    public var model: SirioListItemModel
    public var showsDivider: Bool?
    
    public init(model: SirioListItemModel, showsDivider: Bool? = true) {
        self.model = model
        self.showsDivider = showsDivider
    }
    
    @State private var isPresentedDialog = false
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            Button(action: {
                model.action?()
            }) {
                HStack(spacing: Size.s12) {
                    
                    if let iconData = model.leadingIconData {
                        if model.type == .info {
                            Button {
                                isPresentedDialog.toggle()
                            } label: {
                                SirioIcon(data: iconData)
                                    .frame(width: Size.ListItem.iconFrame, height: Size.ListItem.iconFrame)
                                    .foregroundStyle(model.type.iconColor)
                            }
                            .buttonStyle(.plain)
                        } else {
                            SirioIcon(data: iconData)
                                .frame(width: Size.ListItem.iconFrame, height: Size.ListItem.iconFrame)
                                .foregroundStyle(model.type.iconColor)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: Size.s2) {
                        if let title = model.title {
                            SirioText(text: title, typography: .headlineSmMiddle)
                                .foregroundColor(.aliasTextColorSecondaryDark100)
                        }
                        if let subtitle = model.subtitle {
                            SirioText(text: subtitle, typography: .bodySmRegular)
                                .foregroundColor(.aliasTextColorSecondaryDark100)
                        }
                    }
                    
                    Spacer()
                    
                    if let disclosureIconData = model.disclosureIconData {
                        SirioIcon(data: disclosureIconData)
                            .frame(width: Size.ListItem.disclosureFrame,
                                   height: Size.ListItem.disclosureFrame)
                            .foregroundColor(.globalSecondary100)
                    }
                }
                .padding(Size.p16)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .accessibilityElement(children: .combine)
            .accessibilityLabel(Text(model.title ?? ""))
            .accessibilityHint(Text(model.subtitle ?? ""))
            .accessibilityAddTraits(.isButton)
            
            if let showsDivider, showsDivider {
                Rectangle()
                    .fill(Color.aliasTextColorPrimaryLight50)
                    .frame(height: 1)
                    .padding(.horizontal, Size.p16)
            }
        }
        .dialog(isPresented: $isPresentedDialog,
                type: .info,
                title: model.titleDialog,
                subtitle: model.subtitleDialog,
                onTapCloseAction: {
            self.isPresentedDialog = false
        })
    }
}

// MARK: - SirioListItems (List)

public struct SirioListItems: View {
    var items: [SirioListItemModel]
    
    public init(items: [SirioListItemModel]) {
        self.items = items
    }
    
    public var body: some View {
        List(items) { item in
            SirioListItem(
                model: item,
                showsDivider: item.id != items.last?.id
            )
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

// MARK: - Preview
#Preview {
    SirioListItems(items: [
        .default(title: "Titolo list item",
                 subtitle: "Lorem ipsum dolor sit amet",
                 action: {
                     print("Default item tapped")
                 }),
        .icon(title: "Titolo list item",
              subtitle: "Lorem ipsum dolor sit amet",
              iconData: .init(icon: .cube),
              action: {
                  print("Icon item tapped") }
             ),
        .info(title: "Titolo list item",
              subtitle: "Lorem ipsum dolor sit amet",
              action: {
                  print("Info item tapped")
              },
              titleDialog: "Titolo",
              subtitleDialog: .loremIpsum),
    ])
}
