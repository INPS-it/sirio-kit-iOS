//
// ClearModifier.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//


import SwiftUI
import UIKit

public struct ClearModifier<FullScreenContent: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let fullScreenContent: () -> (FullScreenContent)
    
    public func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { _ in
                UIView.setAnimationsEnabled(false)
            }
            .fullScreenCover(isPresented: $isPresented,
                             content: {
                ZStack {
                    fullScreenContent()
                }
                .edgesIgnoringSafeArea(.all)
                .background(ClearBackgroundView())
                .onAppear {
                    if !UIView.areAnimationsEnabled {
                        UIView.setAnimationsEnabled(true)
                    }
                }
                .onDisappear {
                    if !UIView.areAnimationsEnabled {
                        UIView.setAnimationsEnabled(true)
                    }
                }
            })
    }
    
}


private struct ClearBackgroundView: UIViewRepresentable {
    
    private class ClearView: UIView {
        
        override func didMoveToWindow() {
            super.didMoveToWindow()
            superview?.superview?.backgroundColor = .clear
        }
    }
    
    func makeUIView(context: Context) -> UIView {
        return ClearView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
}
