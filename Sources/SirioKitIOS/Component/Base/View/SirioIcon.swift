//
// SirioIcon.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A basic struct used for represent an icon component
/// - Parameters:
///   - icon: The AwesomeIcon icon
///   - iconName: The icon name (to be used if you want to use an icon outside the package)
///   - bundle: The bundle (to be used if you want to use an icon outside the package)
///   - accessibilityLabel: A string that identifies the accessibility element

public struct SirioIconData: Identifiable {
    public var id = UUID()
    public var icon: AwesomeIcon?
    public var iconName: String?
    public var systemName: String?
    public var bundle: Bundle?
    public var text: String?
    public var accessibilityLabel: String?
    public var action: (() -> Void)
    
    public init(icon: AwesomeIcon, bundle: Bundle = .bundleModule, text: String? = nil, accessibilityLabel: String? = nil, action: @escaping () -> Void = {}){
        self.icon = icon
        self.bundle = bundle
        self.text = text
        self.accessibilityLabel = accessibilityLabel
        self.action = action
        precondition(bundle == .bundleModule, "Make sure the bundle you are using is the correct one")
    }
    
    public init(iconName: String, bundle: Bundle = .bundleModule, text: String? = nil, accessibilityLabel: String? = nil, action: @escaping () -> Void = {}){
        self.iconName = iconName
        self.bundle = bundle
        self.text = text
        self.accessibilityLabel = accessibilityLabel
        self.action = action
        precondition(bundle != .bundleModule, "Make sure the bundle you are using is the correct one")
    }
    
    public init(systemName: String, bundle: Bundle? = nil, text: String? = nil, accessibilityLabel: String? = nil, action: @escaping () -> Void = {}){
        self.systemName = systemName
        self.bundle = bundle
        self.text = text
        self.accessibilityLabel = accessibilityLabel
        self.action = action
        precondition(bundle != .bundleModule, "Make sure the bundle you are using is the correct one")
    }
    
    public static let previewEllipsis = SirioIconData(icon: .ellipsisH)
    public static let previewHeart = SirioIconData(icon: .heart)
    public static let previewPdf = SirioIconData(icon: .filePdf)
    public static let previewDownload = SirioIconData(icon: .download)
    public static let previewTrash = SirioIconData(icon: .trash)
    public static let previewArrowLeft = SirioIconData(icon: .arrowLeft)
    public static let previewArrowRight = SirioIconData(icon: .arrowRight)
    public static let previewCube = SirioIconData(icon: .cube)
}

/// A basic component that represent an icon using the data
/// - Parameters:
///   - data: The  data for represent component

public struct SirioIcon: View {
    private var data: SirioIconData
    
    public init(data: SirioIconData){
        self.data = data
    }
    
    public var body: some View {
        VStack(spacing: 0){
            if let icon = data.icon {
                Image(icon.rawValue, bundle: data.bundle)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if let iconName = data.iconName {
                Image(iconName, bundle: data.bundle)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if let systemName = data.systemName {
                Image(systemName: systemName)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .setAccessibilityLabel(data.accessibilityLabel)
        .accessibilityHidden(data.accessibilityLabel == nil)
    }
}

#Preview {
    SirioIcon(data: .previewPdf)
        .padding()
}
