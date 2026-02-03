//
// SirioFiltriAction.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioFiltriAction: View {
    
    var title: String
    var onTap: () -> Void
    
    public init(title: String = "Filtra", onTap: @escaping () -> Void) {
        self.title = title
        self.onTap = onTap
    }
    
    
    public var body: some View {
        HStack {
            Spacer()
            
            SirioButton(hierarchy: .ghostLight,
                        size: .small,
                        text: title,
                        iconData: .previewFilter,
                        iconAlignment: .leading,
                        action: {
                onTap()
            })
            .padding(.horizontal, Size.p16)
            .padding(.bottom, Size.p12)
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: Size.Filtri.cFrame)
        .background(Color.aliasBackgroundColorPrimaryLight0)

    }
}


#Preview {
    SirioFiltriChips(texts: ["Valore selezionato", "Valore 1", "Valore 2", "Valore 3", "Valore 4"],
                     selectedTypes: .constant(["Valore selezionato"]))
}
