//
// SirioDialogSortModifier.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// MARK: - ViewModifier
public struct SirioDialogSortModifier: ViewModifier {
    @Binding var isPresented: Bool
    
    public var title: String
    public var options: [SirioActionItem]
    public var applyButtonText: String
    public var onApply: ((SirioActionItem) -> Void)?
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                SirioDialogSort(
                    title: title,
                    options: options,
                    applyButtonText: applyButtonText,
                    onApply: { chosen in
                        onApply?(chosen)
                        isPresented = false
                    },
                    onClose: {
                        isPresented = false
                    }
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.easeInOut, value: isPresented)
            }
        }
    }
}

// MARK: - View extension
extension View {
    public func sirioDialogSort(
        isPresented: Binding<Bool>,
        title: String = "Ordina",
        options: [SirioActionItem],
        applyButtonText: String = "Applica",
        onApply: ((SirioActionItem) -> Void)? = nil
    ) -> some View {
        self.modifier(
            SirioDialogSortModifier(
                isPresented: isPresented,
                title: title,
                options: options,
                applyButtonText: applyButtonText,
                onApply: onApply
            )
        )
    }
}

struct ContentVieww: View {
    @State private var showDialog = false
    
    var body: some View {
        VStack {
            Button("Mostra dialogo") {
                showDialog = true
            }
        }
        .sirioDialogSort(
            isPresented: $showDialog,
            title: "Scegli un'opzione",
            options: [
                .init(value: "Prima", action: { print("Prima") }),
                .init(value: "Seconda", action: { print("Seconda") })
            ],
            applyButtonText: "Conferma",
            onApply: { chosen in
                print("Hai scelto: \(chosen.value)")
            }
        )
    }
}

#Preview {
    ContentVieww()
}
