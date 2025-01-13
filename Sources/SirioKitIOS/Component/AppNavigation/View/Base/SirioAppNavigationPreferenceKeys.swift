//
// SirioAppNavigationPreferenceKeys.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Various struct  that manage app navigation preferences


/// App Navigation Type: standard, long, big
struct SirioAppNavigationTypePreferenceKeys: PreferenceKey {
    static var defaultValue: SirioAppNavigationType = .standard
    
    static func reduce(value: inout SirioAppNavigationType, nextValue: () -> SirioAppNavigationType) {
        value = nextValue()
    }
}

/// App Navigation Title
struct SirioAppNavigationTitlePreferenceKeys: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

/// App Navigation Bar - Left item
struct SirioAppNavigationLeftItemPreferenceKeys: PreferenceKey {
    static var defaultValue: SirioAppNavigationItemData? = nil
    
    static func reduce(value: inout SirioAppNavigationItemData?, nextValue: () -> SirioAppNavigationItemData?) {
        value = nextValue()
    }
}

/// App Navigation Bar - Right items (Max 2 items)
struct SirioAppNavigationRightItemsPreferenceKeys: PreferenceKey {
    static var defaultValue: [SirioAppNavigationItemData]? = nil
    
    static func reduce(value: inout [SirioAppNavigationItemData]?, nextValue: () -> [SirioAppNavigationItemData]?) {
        value = nextValue()
    }
}

/// App Navigation Search Placeholder
struct SirioAppNavigationSearchPlaceholderPreferenceKeys: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    
    private func appNavigationType(_ type: SirioAppNavigationType) -> some View {
        self.preference(key: SirioAppNavigationTypePreferenceKeys.self, value: type)
    }
    private func appNavigationTitle(_ title: String) -> some View{
        self.preference(key: SirioAppNavigationTitlePreferenceKeys.self, value: title)
    }

    private func appNavigationLeftItem(_ leftItem: SirioAppNavigationItemData?) -> some View {
        self.preference(key: SirioAppNavigationLeftItemPreferenceKeys.self, value: leftItem)
    }
    
    private func appNavigationRightItems(_ rightItems: [SirioAppNavigationItemData]?) -> some View {
        self.preference(key: SirioAppNavigationRightItemsPreferenceKeys.self, value: rightItems)
    }
    
    private func appNavigationSearchPlaceholder(_ value: String) -> some View {
        self.preference(key: SirioAppNavigationSearchPlaceholderPreferenceKeys.self, value: value)
    }
    
    /// This method set navigation bar items
    public func setAppNavigationBarItems(leftItem: SirioAppNavigationItemData?, rightItems: [SirioAppNavigationItemData]?) -> some View {
        self.appNavigationLeftItem(leftItem)
            .appNavigationRightItems(rightItems)
    }
    
    /// This method set title navigation bar
    public func setAppNavigationTitle(title: String) -> some View {
        self.appNavigationTitle(title)
    }
    
    /// This method set type of navigation bar (standard, long, big)
    public func setAppNavigationType(type: SirioAppNavigationType) -> some View {
        self.appNavigationType(type)
    }
    
    /// This method set placeholder of navigation bar search
    public func setAppNavigationSearchPlaceholder(placeholder: String) -> some View {
        self.appNavigationSearchPlaceholder(placeholder)
    }
}
