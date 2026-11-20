//
// SirioPopoverButton.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

public struct SirioPopoverButton: View {
    private let semantic: SirioSemantic
    private let title: String?
    private let subtitle: String?
    private let textButton: String?
    private let onTapButton: (() -> Void)?
    
    @State private var infoIconFrame: CGRect = .zero
    @State var isPopoverOpen: Bool = false
    @State private var componentFrame: CGRect = .zero
    
    public init(semantic: SirioSemantic = .info, title: String?, subtitle: String?, textButton: String? = nil, onTapButton: (() -> Void)? = nil) {
        self.semantic = semantic
        self.title = title
        self.subtitle = subtitle
        self.textButton = textButton
        self.onTapButton = onTapButton
    }
    
    public var body: some View {
        HStack {
            Button(action: {
                if true {
                    isPopoverOpen.toggle()
                    if isPopoverOpen {
                        showPopover()
                    } else {
                        SirioWindowManager.shared.dismiss()
                    }
                }
            }, label: {
                SirioIcon(data: .init(icon: .infoCircle))
                    .frame(width: Size.SirioTextField.Icon.frame1,
                           height: Size.SirioTextField.Icon.frame1)
                    .foregroundColor(infoIconColor)
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onAppear { infoIconFrame = geo.frame(in: .global) }
                                .onChange(of: geo.frame(in: .global)) { infoIconFrame = $0 }
                        }
                    )
            })
            .background(
                GeometryReader { geo in
                    Color.clear.onAppear { componentFrame = geo.frame(in: .global) }
                        .onChange(of: geo.frame(in: .global)) { componentFrame = $0 }
                }
            )
        }
    }
    
    private func showPopover() {
        guard let screen = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let window = screen.windows.first else { return }
        
        SirioWindowManager.shared.present {
            PopoverDynamicContainer(
                title: title,
                subtitle: subtitle,
                textButton: textButton,
                onTapButton: onTapButton,
                infoIconFrame: infoIconFrame,
                componentFrame: componentFrame,
                effectiveBottom: window.bounds.height - window.safeAreaInsets.bottom,
                screenWidth: window.bounds.width,
                onClose: { self.isPopoverOpen = false }
            )
        }
    }
    
    private var infoIconColor: Color {
        switch semantic {
        case .warning: return Color.SirioTextField.InfoIcon.warning
        case .alert: return Color.SirioTextField.InfoIcon.alert
        case .success: return Color.SirioTextField.InfoIcon.success
        case .info: return Color.SirioTextField.InfoIcon.default
        }
    }
}

#Preview {
    SirioPopoverButton(title: "Titolo",
                           subtitle: "Lorem ipsum sed eu consequat cras vitae eros.",
                           textButton: "Azione",
                           onTapButton: {})
}
