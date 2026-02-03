//
// SirioFiltriFab.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriFab: View {
    
    var title: String
    var onTap: () -> Void
    
    public init(title: String = "Filtra", onTap: @escaping () -> Void) {
        self.title = title
        self.onTap = onTap
    }
    
    public var body: some View {
        SirioFloatingActionButton(data: .init(text: title, icon: .filter, action: onTap))
    }
}


#Preview {
    SirioFiltriFab(title: "Filtra", onTap: { })
}
