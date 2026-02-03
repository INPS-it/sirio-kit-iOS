//
// SirioPopover.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// MARK: - Popover Dynamic Container
public struct PopoverDynamicContainer: View {
    let title: String?
    let subtitle: String?
    let textButton: String?
    let onTapButton: (() -> Void)?
    let infoIconFrame: CGRect
    let inputFieldFrame: CGRect
    let componentFrame: CGRect
    let effectiveBottom: CGFloat
    let screenWidth: CGFloat
    let onClose: () -> Void
    
    @State private var measuredSize: CGSize = .zero
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black.opacity(0.001)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .simultaneousGesture(
                    TapGesture().onEnded {
                        onClose()
                        SirioWindowManager.shared.dismiss()
                    }
                )
            
            SirioPopover(title: title,
                         subtitle: subtitle,
                         textButton: textButton,
                         onTapButton: onTapButton)
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear { measuredSize = geo.size }
                        .onChange(of: geo.size) { measuredSize = $0 }
                }
            )
            .frame(maxWidth: Size.Popover.maxWidth, alignment: .leading)
            .opacity(measuredSize == .zero ? 0 : 1)
            .offset(x: calculateXOffset(), y: calculateYOffset())
        }
        .ignoresSafeArea()
    }
    
    /// Calcola l'offset X per centrare il box visibile sull'icona
    private func calculateXOffset() -> CGFloat {
        guard measuredSize.width > 0 else { return 0 }
        let screenWidth = UIScreen.main.bounds.width
        
        let leftMargin = inputFieldFrame.minX
        let rightMargin = screenWidth - inputFieldFrame.maxX
        
        let iconCenterX = infoIconFrame.midX
        let halfPopoverWidth = measuredSize.width / 2
        
        let canFitLeft = (iconCenterX - halfPopoverWidth) >= leftMargin
        let canFitRight = (iconCenterX + halfPopoverWidth) <= (screenWidth - rightMargin)
        
        let isCenter = canFitLeft && canFitRight
        
        let isIconInLeftHalf = iconCenterX < (screenWidth / 2)
        
        if isCenter {
            return iconCenterX - halfPopoverWidth
        } else {
            return isIconInLeftHalf ? leftMargin : (screenWidth - measuredSize.width - rightMargin)
        }
    }
    
    private func calculateYOffset() -> CGFloat {
        let baseBelowY = inputFieldFrame.minY
        let exitsBottom = (baseBelowY + measuredSize.height) > effectiveBottom
        
        if exitsBottom {
            return componentFrame.minY - measuredSize.height
        } else {
            return baseBelowY
        }
    }
}

private struct SirioPopoverOpenKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {
    var isPopoverOpenBinding: Binding<Bool> {
        get { self[SirioPopoverOpenKey.self] }
        set { self[SirioPopoverOpenKey.self] }
    }
}
