//
// SirioHero.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

/// A hero section component that displays a title, subtitle, text, and optional image or button.
/// - Parameters:
///   - title: The main title displayed in the hero section.
///   - subtitle: The optional subtitle displayed under the title.
///   - text: Optional additional text displayed below the subtitle.
///   - textButton: The label for the button displayed below the text.
///   - onTapButtonAction: Closure that is triggered when the button is tapped.
///   - url: An optional URL for an image to be displayed.
///   - base64: An optional base64 string for an image to be displayed.

public struct SirioHero: View {
    var title: String
    var subtitle: String?
    var text: String?
    var textButton: String?
    var onTapButtonAction: (() -> Void)?
    var url: URL? = nil
    var base64: String? = nil
    
    public init(title: String,
                subtitle: String? = nil,
                text: String? = nil,
                textButton: String? = nil,
                onTapButtonAction: (() -> Void)? = nil,
                url: URL? = nil,
                base64: String? = nil){
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.textButton = textButton
        self.onTapButtonAction = onTapButtonAction
        self.url = url
        self.base64 = base64
        // Inizialize plugin for svg images
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
    
    private var existImage: Bool {
        return url != nil || base64 != nil
    }
    
    public var body: some View {
        VStack {
            HStack {
                VStack(spacing: Size.zero){
                    VStack(alignment: .leading, spacing: Size.zero) {
                        SirioText(text: title, typography: .h2_md)
                            .foregroundStyle(titleColor)
                            .padding(.top, Size.Hero.paddingTop)
                        if let subtitle = subtitle {
                            SirioText(text: subtitle, typography: .h4_md)
                                .foregroundStyle(subtitleColor)
                                .padding(.top)
                        }
                        
                        if let text = text {
                            SirioText(text: text, typography: .p_md_01)
                                .foregroundStyle(textColor)
                                .padding(.top)
                        }
                        
                        if let textButton = textButton {
                            SirioButton(hierarchy: .tertiaryLight,
                                        size: .large,
                                        text: textButton,
                                        iconData: nil,
                                        action: {
                                onTapButtonAction?()
                            }, accessibilityLabel: textButton)
                            .padding(.vertical)
                        }
                        
                        Spacer()
                        
                        if existImage && existUrl() {
                            image
                                .background()
                                .padding(.top)
                        }
                    }.padding(.horizontal)
                    
                    Divider()
                        .background(dividerColor)
                    
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(edges: .all)
    }
    
    private var titleColor: Color = Color.Hero.title
    
    private var subtitleColor: Color = Color.Hero.subtitle
    
    private var textColor: Color = Color.Hero.text
    
    private var backgroundColor: Color = Color.Hero.background
    
    private var dividerColor: Color = Color.Hero.divider

    private var image: some View {
        WebImage(url: url) { image in
                image.resizable()
            } placeholder: {
                    Rectangle().foregroundColor(.gray)
            }
            .onSuccess { image, data, cacheType in
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: Size.Card.Editorial.imageHeight, alignment: .center)
    }
}

#Preview {
    SirioHero(title: "Titolo Hero",
              subtitle: "Sottotitolo",
              text: .loremIpsum,
              textButton: "Text",
              url: URL(string: "https://www.inps.it/content/dam/inps-site/immagini/INPS-home.svg")!)
}

extension SirioHero {
    private func saveBase64StringToLocalFile(base64String: String) -> URL? {
        guard let data = Data(base64Encoded: base64String) else {
            return nil
        }
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let fileURL = documentsDirectory.appendingPathComponent("image")
        
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving file (Editorial Card): \(error)")
            return nil
        }
    }
    
    private func getImageUrl() -> URL? {
        if let url = url {
            return url
        } else if let base64 = base64, let localUrl = saveBase64StringToLocalFile(base64String: base64) {
            return localUrl
        }
        return nil
    }
    
    private func existUrl() -> Bool {
        return getImageUrl() != nil
    }
}
