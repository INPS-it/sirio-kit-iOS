//
// SirioWindowManager.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit
import SwiftUI

// MARK: - SirioWindowManager

final class SirioWindowManager {
    static let shared = SirioWindowManager()

    private var window: UIWindow?

    func present<Content: View>(@ViewBuilder content: @escaping () -> Content) {
        guard window == nil else { return }

        let hosting = UIHostingController(rootView: content())
        hosting.view.backgroundColor = .clear

        guard let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
            return
        }

        let newWindow = UIWindow(windowScene: windowScene)
        newWindow.rootViewController = hosting
        newWindow.backgroundColor = .clear
        newWindow.windowLevel = .alert + 1
        newWindow.makeKeyAndVisible()

        self.window = newWindow
    }

    func dismiss() {
        window?.isHidden = true
        window = nil
    }
}
