//
// AppNavigationTypePreferenceKeys.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
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

/// App Navigation Bar - First right item
struct AppNavigationRightFirstItemPreferenceKeys: PreferenceKey {
    static var defaultValue: AppNavigationItemData? = nil
    
    static func reduce(value: inout AppNavigationItemData?, nextValue: () -> AppNavigationItemData?) {
        value = nextValue()
    }
}

/// App Navigation Bar - Second right item
struct AppNavigationRightSecondItemPreferenceKeys: PreferenceKey {
    static var defaultValue: AppNavigationItemData? = nil
    
    static func reduce(value: inout AppNavigationItemData?, nextValue: () -> AppNavigationItemData?) {
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
    
    private func appNavigationRightFirstItem(_ rightFirstItem: AppNavigationItemData?) -> some View {
        self.preference(key: AppNavigationRightFirstItemPreferenceKeys.self, value: rightFirstItem)
    }
    
    private func appNavigationRightSecondItem(_ rightSecondItem: AppNavigationItemData?) -> some View {
        self.preference(key: AppNavigationRightSecondItemPreferenceKeys.self, value: rightSecondItem)
    }

    private func appNavigationSearchPlaceholder(_ value: String) -> some View {
        self.preference(key: AppNavigationSearchPlaceholderPreferenceKeys.self, value: value)
    }
    
    /// This method sets items in navigation bar
    public func setAppNavigationBarItems(leftItem: AppNavigationItemData?, rightFirstItem: AppNavigationItemData?, rightSecondItem: AppNavigationItemData?) -> some View {
        self.appNavigationLeftItem(leftItem)
            .appNavigationRightFirstItem(rightFirstItem)
            .appNavigationRightSecondItem(rightSecondItem)
    }
    
    /// This method sets title navigation bar
    public func setAppNavigationTitle(title: String) -> some View {
        self.appNavigationTitle(title)
    }
    
    /// This method sets type of navigation bar (standard, long, big)
    public func setAppNavigationType(type: AppNavigationType) -> some View {
        self.appNavigationType(type)
    }
    
    /// This method sets placeholder of navigation bar Search
    public func setAppNavigationSearchPlaceholder(placeholder: String) -> some View {
        self.appNavigationSearchPlaceholder(placeholder)
    }
}
