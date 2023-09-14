//
// AppNavigationTypePreferenceKeys.swift
//
// SPDX-FileCopyrightText: 2023 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Various struct  that manage app navigation preferences


/// App Navigation Type: standard, long, big
struct AppNavigationTypePreferenceKeys: PreferenceKey {
    static var defaultValue: AppNavigationType = .standard
    
    static func reduce(value: inout AppNavigationType, nextValue: () -> AppNavigationType) {
        value = nextValue()
    }
}

/// App Navigation Title
struct AppNavigationTitlePreferenceKeys: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

/// App Navigation Bar - Left item
struct AppNavigationLeftItemPreferenceKeys: PreferenceKey {
    static var defaultValue: AppNavigationItemData? = nil
    
    static func reduce(value: inout AppNavigationItemData?, nextValue: () -> AppNavigationItemData?) {
        value = nextValue()
    }
}

/// App Navigation Bar - Right items (Max 2 items)
struct AppNavigationRightItemsPreferenceKeys: PreferenceKey {
    static var defaultValue: [AppNavigationItemData]? = nil
    
    static func reduce(value: inout [AppNavigationItemData]?, nextValue: () -> [AppNavigationItemData]?) {
        value = nextValue()
    }
}

/// App Navigation Search Placeholder
struct AppNavigationSearchPlaceholderPreferenceKeys: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    
    private func appNavigationType(_ type: AppNavigationType) -> some View {
        self.preference(key: AppNavigationTypePreferenceKeys.self, value: type)
    }
    private func appNavigationTitle(_ title: String) -> some View{
        self.preference(key: AppNavigationTitlePreferenceKeys.self, value: title)
    }

    private func appNavigationLeftItem(_ leftItem: AppNavigationItemData?) -> some View {
        self.preference(key: AppNavigationLeftItemPreferenceKeys.self, value: leftItem)
    }
    
    private func appNavigationRightItems(_ rightItems: [AppNavigationItemData]?) -> some View {
        self.preference(key: AppNavigationRightItemsPreferenceKeys.self, value: rightItems)
    }
    
    private func appNavigationSearchPlaceholder(_ value: String) -> some View {
        self.preference(key: AppNavigationSearchPlaceholderPreferenceKeys.self, value: value)
    }
    
    /// This method set navigation bar items
    public func setAppNavigationBarItems(leftItem: AppNavigationItemData?, rightItems: [AppNavigationItemData]?) -> some View {
        self.appNavigationLeftItem(leftItem)
            .appNavigationRightItems(rightItems)
    }
    
    /// This method set title navigation bar
    public func setAppNavigationTitle(title: String) -> some View {
        self.appNavigationTitle(title)
    }
    
    /// This method set type of navigation bar (standard, long, big)
    public func setAppNavigationType(type: AppNavigationType) -> some View {
        self.appNavigationType(type)
    }
    
    /// This method set placeholder of navigation bar search
    public func setAppNavigationSearchPlaceholder(placeholder: String) -> some View {
        self.appNavigationSearchPlaceholder(placeholder)
    }
}
