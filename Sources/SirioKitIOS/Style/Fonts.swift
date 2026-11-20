//
// Fonts.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import UIKit
import CoreText

public struct Fonts {
    
    // This method registers fonts in your app, use it in your AppDelegate
    public static func registerFonts() {
        Typography.FontFamily.allCases.forEach { family in
            family.supportedWeights.forEach { weight in
                
                let fontName = "\(family.rawValue)-\(weight.rawValue)"
                registerFont(bundle: .module,
                             fontName: fontName,
                             fontExtension: "ttf")
            }
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        // Se il font è già registrato, esci
        if UIFont(name: fontName, size: 12) != nil {
            print("Font already registered: \(fontName)")
            return
        }
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("❌ Could not load font: \(fontName)")
            return
            
        }
        
        var error: Unmanaged<CFError>?
        if CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Successfully registered font: \(fontName)")
        } else {
            print("Failed to register font: \(fontName), error: \(error?.takeRetainedValue())")
        }
    }
}

public extension Fonts {
    enum TitilliumWeb: String, CaseIterable {
        case regular = "TitilliumWeb-Regular"
        case italic = "TitilliumWeb-Italic"
        case italicSemiBold = "TitilliumWeb-SemiBoldItalic"
        case semiBold = "TitilliumWeb-SemiBold"
        case bold = "TitilliumWeb-Bold"
        case black = "TitilliumWeb-Black"
    }
    
    enum Lora: String, CaseIterable {
        case boldItalic = "Lora-BoldItalic"
        case bold = "Lora-Bold"
        case mediumItalic = "Lora-MediumItalic"
        case italic = "Lora-Italic"
        case medium = "Lora-Medium"
        case regular = "Lora-Regular"
        case semiboldItalic = "Lora-SemiBoldItalic"
        case semibold = "Lora-SemiBold"
    }
    
    enum RobotoMono: String, CaseIterable {
        case boldItalic = "RobotoMono-BoldItalic"
        case bold = "RobotoMono-Bold"
        case italic = "RobotoMono-Italic"
        case lightItalic = "RobotoMono-LightItalic"
        case light = "RobotoMono-Light"
        case mediumItalic = "RobotoMono-MediumItalic"
        case medium = "RobotoMono-Medium"
        case regular = "RobotoMono-Regular"
        case semiboldItalic = "RobotoMono-SemiBoldItalic"
        case semibold = "RobotoMono-SemiBold"
    }
}
