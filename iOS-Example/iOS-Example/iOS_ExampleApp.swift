//
// iOS_ExampleApp.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

@main
struct iOS_ExampleApp: App {
    
    init() {
        // Register fonts from library
        Fonts.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
