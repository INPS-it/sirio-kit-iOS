//
// AccordionData.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import UIKit

/// A representation of an accordion
/// - Parameters:
///   - data: The structure of the component
///   - content: The content inside accordion
///   - isDisabled: Whether the accordion is disabled
///   - isOpen: Whether the accordion is open
///   - onTapAccordion: Callback that is executed when the accordion is tapped
public class AccordionData: Identifiable, ObservableObject {
    
    public var id = UUID()
    private(set) var text: String
    private(set) var content: AnyView
    @Published public var isDisabled: Bool
    @Published public var isOpen: Bool
    private(set) var onTapAccordion: ((Bool) -> Void)?
    
    public init<Content>(text: String,
                         @ViewBuilder content: @escaping () -> Content,
                         isDisabled: Bool = false,
                         isOpen: Bool = false,
                         onTapAccordion: ((Bool) -> Void)? = nil) where Content: View {
        self.text = text
        self.content = AnyView(content())
        self.isDisabled = isDisabled
        self.isOpen = isOpen
        self.onTapAccordion = onTapAccordion
    }
    
}
