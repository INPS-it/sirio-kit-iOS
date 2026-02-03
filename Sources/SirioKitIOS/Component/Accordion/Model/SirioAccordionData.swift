//
// SirioAccordionData.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import UIKit

/// A representation of an accordion
///
/// - Parameters:
/// - iconData: The icon to be displayed in the accordion.
///   - title: The title of the accordion.
///   - text: Additional text displayed alongside the title.
///   - tag: A tag string used for display a tag component..
///   - content: A view builder that provides the content inside the accordion.
///   - isDisabled: Whether the accordion is disabled. Defaults to `false`.
///   - isOpen: Whether the accordion is initially open. Defaults to `false`.
///   - onTapAccordion: Callback executed when the accordion is tapped.
///   - accessibilityLabel: A string for accessibility purposes.
public class SirioAccordionData: Identifiable, ObservableObject {
    
    public var id = UUID()
    private(set) var iconData: SirioIconData?
    private(set) var title: String
    private(set) var text: String?
    private(set) var tag: String?
    private(set) var content: AnyView
    @Published public var isOpen: Bool
    private(set) var onTapAccordion: ((Bool) -> Void)?
    private(set) var accessibilityLabel: String?
    
    // Default
    public init<Content>(title: String,
                         @ViewBuilder content: @escaping () -> Content,
                         isOpen: Bool = false,
                         onTapAccordion: ((Bool) -> Void)? = nil,
                         accessibilityLabel: String? = nil) where Content: View {
        self.iconData = nil
        self.title = title
        self.text = nil
        self.tag = nil
        self.content = AnyView(content())
        self.isOpen = isOpen
        self.onTapAccordion = onTapAccordion
        self.accessibilityLabel = accessibilityLabel
    }
    
    // Accordion with text
    public init<Content>(title: String,
                         text: String,
                         @ViewBuilder content: @escaping () -> Content,
                         isOpen: Bool = false,
                         onTapAccordion: ((Bool) -> Void)? = nil,
                         accessibilityLabel: String? = nil) where Content: View {
        self.iconData = nil
        self.title = title
        self.text = text
        self.tag = nil
        self.content = AnyView(content())
        self.isOpen = isOpen
        self.onTapAccordion = onTapAccordion
        self.accessibilityLabel = accessibilityLabel
    }
    
    // Accordion with tag
    public init<Content>(title: String,
                         tag: String,
                         @ViewBuilder content: @escaping () -> Content,
                         isOpen: Bool = false,
                         onTapAccordion: ((Bool) -> Void)? = nil,
                         accessibilityLabel: String? = nil) where Content: View {
        self.iconData = nil
        self.title = title
        self.text = nil
        self.tag = tag
        self.content = AnyView(content())
        self.isOpen = isOpen
        self.onTapAccordion = onTapAccordion
        self.accessibilityLabel = accessibilityLabel
    }
    
    // Accordion with icon
    public init<Content>(iconData: SirioIconData,
                         title: String,
                         @ViewBuilder content: @escaping () -> Content,
                         isOpen: Bool = false,
                         onTapAccordion: ((Bool) -> Void)? = nil,
                         accessibilityLabel: String? = nil) where Content: View {
        self.iconData = iconData
        self.title = title
        self.text = nil
        self.tag = nil
        self.content = AnyView(content())
        self.isOpen = isOpen
        self.onTapAccordion = onTapAccordion
        self.accessibilityLabel = accessibilityLabel
    }
    
}
