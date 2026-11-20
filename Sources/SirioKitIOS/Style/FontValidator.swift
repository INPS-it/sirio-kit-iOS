//
// FontValidator.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

#if DEBUG
public struct FontValidator {
    
    public static func validateAllFonts() {
        print("\n🔎 ===== FONT VALIDATION START =====\n")
        
        var missingFonts: [String] = []
        
        for family in Typography.FontFamily.allCases {
            
            for weight in family.supportedWeights {
                
                let fontName = "\(family.rawValue)-\(weight.rawValue)"
                
                if UIFont(name: fontName, size: 14) == nil {
                    missingFonts.append(fontName)
                    print("❌ Missing font: \(fontName)")
                } else {
                    print("✅ Found: \(fontName)")
                }
            }
        }
        
        if missingFonts.isEmpty {
            print("\n🎉 All fonts are correctly registered.\n")
        } else {
            print("\n⚠️ Missing \(missingFonts.count) fonts:")
            missingFonts.forEach { print("   - \($0)") }
        }
        
        print("\n🔎 ===== FONT VALIDATION END =====\n")
    }
}
#endif
