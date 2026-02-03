//
// SirioSearchNoResult.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// A view displayed when a search yields no results.
///
/// `SirioSearchNoResult` shows a title and an optional subtitle to inform the user
/// that the search operation did not return any items.
/// It is typically used inside search-based interfaces to provide clear and
/// user-friendly feedback.
///
/// - Parameters:
///   - title: An optional main message to display (e.g., "Nessun risultato").
///   - subtitle: An optional secondary message that provides additional context
///               (e.g., "Prova a modificare i termini della ricerca").

public struct SirioSearchNoResult: View {
    var title: String?
    var subtitle: String?
    
    public init(title: String? = nil,
                subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            SirioText(text: title ?? "Nessun risultato trovato", typography: .displaySmHeavy)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                .padding(.top, Size.p8)
                .padding(.bottom, Size.p16)
            
            Image("search_no_results", bundle: .bundleModule)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
            
            Rectangle()
                .fill(Color.aliasTextColorPrimaryLight50)
                .frame(height: 1)
            
            SirioText(text: subtitle ?? "Prova ad effettuare una nuova ricerca", typography: .bodyMdRegular)
                .foregroundStyle(Color.aliasTextColorSecondaryDark100)
                .padding(.vertical, Size.p8)
        }
        .padding(.horizontal, Size.p16)

    }
}

#Preview {
    SirioSearchNoResult()
}
