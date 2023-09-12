//
// Fonts.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct Fonts {
    
    // This method registers fonts in your app, use it in your AppDelegate
    public static func registerFonts() {
        Fonts.TitilliumWeb.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
        
        Fonts.Lora.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
        
        Fonts.RobotoMono.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}

public extension Fonts {
    enum TitilliumWeb: String, CaseIterable {
        case regular = "Titillium Web Regular"
        case italic = "Titillium Web Italic"
        case semiBold = "Titillium Web SemiBold"
        case bold = "Titillium Web Bold"
    }
    
    enum Lora: String, CaseIterable {
        case boldItalic = "Lora Bold Italic"
        case bold = "Lora Bold"
        case mediumItalic = "Lora Medium Italic"
        case italic = "Lora Italic"
        case medium = "Lora Medium"
        case regular = "Lora Regular"
        case semiboldItalic = "Lora SemiBold Italic"
        case semibold = "Lora SemiBold"
    }
    
    enum RobotoMono: String, CaseIterable {
        case boldItalic = "RobotoMono Bold Italic"
        case bold = "RobotoMono Bold"
        case italic = "RobotoMono Italic"
        case lightItalic = "RobotoMono Light Italic"
        case light = "RobotoMono Light"
        case mediumItalic = "RobotoMono Medium Italic"
        case medium = "RobotoMono Medium"
        case regular = "RobotoMono Regular"
        case semiboldItalic = "RobotoMono SemiBold Italic"
        case semibold = "RobotoMono SemiBold"
    }
}
