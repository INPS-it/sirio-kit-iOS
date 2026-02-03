//
// SirioListItemModel.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// MARK: - Model

public struct SirioListItemModel: Identifiable {
    public let id = UUID()
    public var type: SirioListItemType
    public var title: String?
    public var subtitle: String?
    public var leadingIconData: SirioIconData?
    public var disclosureIconData: SirioIconData?
    public var action: (() -> Void)?
    public var titleDialog: String?
    public var subtitleDialog: String?
    
    public init(
        type: SirioListItemType = .default,
        title: String? = nil,
        subtitle: String? = nil,
        leadingIconData: SirioIconData? = nil,
        disclosureIconData: SirioIconData? = .init(icon: .angleRight),
        action: (() -> Void)? = nil,
        titleDialog: String? = nil,
        subtitleDialog: String? = nil
    ) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.leadingIconData = leadingIconData
        self.disclosureIconData = disclosureIconData
        self.action = action
        self.titleDialog = titleDialog
        self.subtitleDialog = subtitleDialog
    }
}

// MARK: - Factory Methods
public extension SirioListItemModel {
    
    static func `default`(
        title: String? = nil,
        subtitle: String? = nil,
        action: (() -> Void)? = nil
    ) -> Self {
        .init(
            type: .default,
            title: title,
            subtitle: subtitle,
            action: action
        )
    }
    
    static func icon(
        title: String? = nil,
        subtitle: String? = nil,
        iconData: SirioIconData,
        action: (() -> Void)? = nil
    ) -> Self {
        .init(
            type: .icon,
            title: title,
            subtitle: subtitle,
            leadingIconData: iconData,
            action: action
        )
    }
    
    static func info(
        title: String? = nil,
        subtitle: String? = nil,
        action: (() -> Void)? = nil,
        titleDialog: String? = nil,
        subtitleDialog: String? = nil
    ) -> Self {
        .init(
            type: .info,
            title: title,
            subtitle: subtitle,
            leadingIconData: .init(icon: .infoCircle),
            action: action,
            titleDialog: titleDialog,
            subtitleDialog: subtitleDialog
        )
    }
}
