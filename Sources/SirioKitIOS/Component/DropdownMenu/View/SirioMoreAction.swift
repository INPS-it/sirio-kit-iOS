//
// SirioMoreAction.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

// MARK: - SirioMoreAction

public struct SirioMoreAction: View {
    let hierarchy: SirioButtonHierarchy
    let text: String?
    let size: SirioSize
    let items: [SirioActionItem]
    let positionToOpen: SirioDropdownMenuPosition
    let nVisibleItems: Int = 3

    @Binding var isOpen: Bool

    public init(hierarchy: SirioButtonHierarchy = .ghost,
                text: String? = nil,
                size: SirioSize = .medium,
                items: [SirioActionItem],
                positionToOpen: SirioDropdownMenuPosition,
                isOpen: Binding<Bool>) {
        self.hierarchy = hierarchy
        self.text = text
        self.size = size
        self.items = items
        self.positionToOpen = positionToOpen
        self._isOpen = isOpen
    }

    private var iconData: SirioIconData {
        .init(icon: text != nil ? .angleDown : .ellipsisV)
    }

    public var body: some View {
        GeometryReader { geometry in
            SirioButton(hierarchy: hierarchy, size: size, text: text, iconData: iconData) {
                withAnimation(.easeInOut) {
                    isOpen.toggle()
                    if isOpen {
                        let buttonFrame = geometry.frame(in: .global)
                        showDropdown(buttonFrame: buttonFrame)
                    } else {
                        SirioWindowManager.shared.dismiss()
                    }
                }
            }
        }
        .frame(width: buttonWidth, height: buttonHeight)
        .onChange(of: isOpen){ value in
            if !value {
                SirioWindowManager.shared.dismiss()
            }
        }
    }
    
    private var buttonWidth: CGFloat {
        // Se c'è solo l'icona (senza testo o con icona centrata)
        if isOnlyIcon {
            switch size {
            case .large:
                return Size.SirioButton.Large.height
            case .medium:
                return Size.SirioButton.Medium.height
            case .small:
                return Size.SirioButton.Small.height
            }
        }
        
        // Se c'è del testo, calcola la larghezza completa
        var width: CGFloat = 0
        
        // Aggiungi padding orizzontale (entrambi i lati)
        width += paddingHorizontal * 2
        
        // Se c'è un'icona (leading o trailing)
        if iconData != nil {
            width += iconFrame
            // Aggiungi lo spacing tra icona e testo
            width += Size.SirioButton.padding
        }
        
        // Calcola la larghezza del testo
        if let text = text {
            let textWidth = calculateTextWidth(text: text, typography: typography)
            width += textWidth
        }
        
        // Assicurati che rispetti la minWidth
        return max(width, minWidth)
    }

    private func calculateTextWidth(text: String, typography: Typography) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: typography.uiFont
        ]
        
        let size = (text as NSString).size(withAttributes: attributes)
        return ceil(size.width)
    }

    private var isOnlyIcon: Bool {
        return text == nil && iconData != nil
    }

    private var iconFrame: CGFloat {
        switch size {
        case .large:
            return Size.SirioButton.Large.icon
        case .medium:
            return Size.SirioButton.Medium.icon
        case .small:
            return Size.SirioButton.Small.icon
        }
    }

    private var paddingHorizontal: CGFloat {
        switch size {
        case .large:
            return isOnlyIcon ? Size.SirioButton.Large.OnlyIcon.paddingHorizontal : Size.SirioButton.Large.paddingHorizontal
        case .medium:
            return isOnlyIcon ? Size.SirioButton.Medium.OnlyIcon.paddingHorizontal : Size.SirioButton.Medium.paddingHorizontal
        case .small:
            return isOnlyIcon ? Size.SirioButton.Small.OnlyIcon.paddingHorizontal : Size.SirioButton.Small.paddingHorizontal
        }
    }

    private var minWidth: CGFloat {
        switch size {
        case .large:
            return Size.SirioButton.Large.minWidth
        case .medium:
            return Size.SirioButton.Medium.minWidth
        case .small:
            return isOnlyIcon ? Size.SirioButton.Small.minWidthWithIcon : Size.SirioButton.Small.minWidth
        }
    }

    private var typography: Typography {
        switch size {
        case .large:
            return Typography.labelMdHeavy
        case .medium:
            return Typography.labelMdHeavy
        case .small:
            return Typography.labelSmHeavy
        }
    }

    private var buttonHeight: CGFloat {
        switch size {
        case .large:
            return Size.SirioButton.Large.height
        case .medium:
            return Size.SirioButton.Medium.height
        case .small:
            return Size.SirioButton.Small.height
        }
    }
    
//    private var buttonWidth: CGFloat {
//        let existText: Bool = text != nil
//        let value = 300.0//CGFloat((text ?? "").count * 8 + 60)
//
//        switch size {
//        case .large:
//            return existText ? value : Size.SirioButton.Large.height
//        case .medium:
//            return existText ? value : Size.SirioButton.Medium.height
//        case .small:
//            return existText ? value : Size.SirioButton.Small.height
//        }
//    }
    
    private func showDropdown(buttonFrame: CGRect) {
        let menuWidth: CGFloat = 145
        let itemHeight: CGFloat = CGFloat(Size.DropdownMenu.singleItemHeight)
        let menuHeight: CGFloat = CGFloat(min(items.count, nVisibleItems)) * itemHeight
        let spacing: CGFloat = Size.s8
        
        // Ottieni le dimensioni dello schermo
        guard let screen = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let window = screen.windows.first else {
            return
        }
        
        let screenBounds = window.bounds
        let safeAreaInsets = window.safeAreaInsets
        let effectiveTop = safeAreaInsets.top
        let effectiveBottom = screenBounds.height - safeAreaInsets.bottom
        let effectiveLeft = safeAreaInsets.left
        let effectiveRight = screenBounds.width - safeAreaInsets.right
        
        var finalPosition = positionToOpen
        var xPos: CGFloat
        var yPos: CGFloat
        
        // Calcola la posizione iniziale
        switch positionToOpen {
        case .topLeft:
            xPos = buttonFrame.maxX - menuWidth
            yPos = buttonFrame.minY - menuHeight - spacing

        case .topRight:
            xPos = buttonFrame.minX
            yPos = buttonFrame.minY - menuHeight - spacing

        case .bottomLeft:
            xPos = buttonFrame.maxX - menuWidth
            yPos = buttonFrame.maxY + spacing

        case .bottomRight:
            xPos = buttonFrame.minX
            yPos = buttonFrame.maxY + spacing
        }
        
        // Verifica se il dropdown esce fuori dallo schermo e correggi
        var needsAdjustment = false
        
        // Controlla se esce in alto
        if yPos < effectiveTop {
            needsAdjustment = true
            switch finalPosition {
            case .topLeft:
                finalPosition = .bottomLeft
                yPos = buttonFrame.maxY + spacing
                print("⚠️ Dropdown fuori schermo (alto) - Posizione invertita: topLeft → bottomLeft")
            case .topRight:
                finalPosition = .bottomRight
                yPos = buttonFrame.maxY + spacing
                print("⚠️ Dropdown fuori schermo (alto) - Posizione invertita: topRight → bottomRight")
            default:
                break
            }
        }
        
        // Controlla se esce in basso
        if yPos + menuHeight > effectiveBottom {
            needsAdjustment = true
            switch finalPosition {
            case .bottomLeft:
                finalPosition = .topLeft
                yPos = buttonFrame.minY - menuHeight - spacing
                print("⚠️ Dropdown fuori schermo (basso) - Posizione invertita: bottomLeft → topLeft")
            case .bottomRight:
                finalPosition = .topRight
                yPos = buttonFrame.minY - menuHeight - spacing
                print("⚠️ Dropdown fuori schermo (basso) - Posizione invertita: bottomRight → topRight")
            default:
                break
            }
        }
        
        // Controlla se esce a sinistra
        if xPos < effectiveLeft {
            needsAdjustment = true
            switch finalPosition {
            case .topLeft:
                finalPosition = .topRight
                xPos = buttonFrame.minX
                print("⚠️ Dropdown fuori schermo (sinistra) - Posizione invertita: topLeft → topRight")
            case .bottomLeft:
                finalPosition = .bottomRight
                xPos = buttonFrame.minX
                print("⚠️ Dropdown fuori schermo (sinistra) - Posizione invertita: bottomLeft → bottomRight")
            default:
                break
            }
        }
        
        // Controlla se esce a destra
        if xPos + menuWidth > effectiveRight {
            needsAdjustment = true
            switch finalPosition {
            case .topRight:
                finalPosition = .topLeft
                xPos = buttonFrame.maxX - menuWidth
                print("⚠️ Dropdown fuori schermo (destra) - Posizione invertita: topRight → topLeft")
            case .bottomRight:
                finalPosition = .bottomLeft
                xPos = buttonFrame.maxX - menuWidth
                print("⚠️ Dropdown fuori schermo (destra) - Posizione invertita: bottomRight → bottomLeft")
            default:
                break
            }
        }
        
        if !needsAdjustment {
            print("✅ Dropdown posizionato correttamente: \(positionToOpen)")
        }

        SirioWindowManager.shared.present {
            ZStack(alignment: .topLeading) {
                GeometryReader { geo in
                    let safeInsets = geo.safeAreaInsets
                    
                    Color.black.opacity(0.001)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isOpen = false
                            SirioWindowManager.shared.dismiss()
                        }
                    
                    SirioDropdownMenu(items: items, isOpen: $isOpen)
                        .frame(width: menuWidth)
                        .offset(x: xPos - safeInsets.leading,
                                y: yPos - safeInsets.top)
                        .onDisappear {
                            SirioWindowManager.shared.dismiss()
                        }
                }
            }
        }
    }
}

#Preview("Popup"){
    VStack {
        
        HStack {
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
            ], positionToOpen: .topRight, isOpen: .constant(true))
            
            Spacer()
            
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
                .init(value: "Item #4", action: {}),
                .init(value: "Item #5", action: {}),
            ], positionToOpen: .topLeft, isOpen: .constant(true))
        }
        
        Spacer().frame(height: 250)
        
        HStack {
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
                .init(value: "Item #4", action: {}),
                .init(value: "Item #5", action: {}),
            ], positionToOpen: .bottomRight, isOpen: .constant(true))
            
            Spacer()
            
            SirioMoreAction(items: [
                .init(value: "Item #1", action: {}),
                .init(value: "Item #2", action: {}),
                .init(value: "Item #3", action: {}),
                .init(value: "Item #4", action: {}),
                .init(value: "Item #5", action: {}),
            ], positionToOpen: .bottomLeft, isOpen: .constant(true))
        }
    }
    .padding()
}
