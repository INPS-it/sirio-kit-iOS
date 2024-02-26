//
// UIApplication+Extension.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import UIKit

extension UIApplication {
    func endEditing(_ force: Bool) {
        if let keyWindowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) {
            
            keyWindowScene.windows
                .filter { $0.isKeyWindow }
                .first?
                .endEditing(force)
        }
    }
}
