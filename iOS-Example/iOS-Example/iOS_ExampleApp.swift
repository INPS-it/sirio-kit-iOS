//
// iOS_ExampleApp.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS
import SDWebImageSVGCoder

@main
struct iOS_ExampleApp: App {
    
    init() {
        setDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func setDependencies() {
        // Register fonts from library
        Fonts.registerFonts()
        // Svg Coder
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
