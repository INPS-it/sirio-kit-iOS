//
// SirioHero.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
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
///   - link: The label for the button displayed below the text.
///   - onTapButtonAction: Closure that is triggered when the button is tapped.
///   - url: An optional URL for an image to be displayed.
///   - base64: An optional base64 string for an image to be displayed.

public enum SirioImageScaleMode {
    case fit
    case fill
}

public struct SirioHero: View {
    var title: String
    var subtitle: String?
    var link: String?
    var iconData: SirioIconData?
    var onTapLinkAction: (() -> Void)?
    var url: URL?
    var base64: String?
    var imageName: String?
    var bundle: Bundle?
    var imageScaleMode: SirioImageScaleMode
    
    @State private var resolvedBase64Url: URL? = nil

    public init(title: String,
                subtitle: String? = nil,
                link: String? = nil,
                iconData: SirioIconData? = nil,
                onTapLinkAction: (() -> Void)? = nil,
                url: URL? = nil,
                base64: String? = nil,
                imageName: String? = nil,
                bundle: Bundle? = nil,
                imageScaleMode: SirioImageScaleMode = .fill) {
        self.title = title
        self.subtitle = subtitle
        self.link = link
        self.iconData = iconData
        self.onTapLinkAction = onTapLinkAction
        self.url = url
        self.base64 = base64
        self.imageName = imageName
        self.bundle = bundle
        self.imageScaleMode = imageScaleMode
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
    
    private var hasImage: Bool {
        url != nil || base64 != nil || imageName != nil
    }
    
    public var body: some View {
        VStack(spacing: Size.zero) {
            VStack(spacing: Size.zero) {
                VStack(spacing: Size.s8){
                    HStack {
                        SirioText(text: title, typography: .displaySmHeavy)
                            .foregroundStyle(Color.Hero.title)
                            .lineLimit(2)
                        Spacer()
                        
                        if let iconData {
                            Button(action: {
                                iconData.action()
                            }, label: {
                                SirioIcon(data: iconData)
                                    .foregroundColor(StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
                                    .frame(width: 20, height: 20)
                                    .overlay(alignment: .topTrailing, content: {
                                        SirioBadge()
                                    })
                            })
                            
                        }
                    }
                    
                    if let subtitle, !subtitle.isEmpty {
                        HStack {
                            SirioText(text: subtitle, typography: .headlineMdMiddle)
                                .foregroundStyle(Color.Hero.subtitle)
                            Spacer()
                        }
                    }
                    
                    if let link, !link.isEmpty {
                        HStack {
                            Button(action: { onTapLinkAction?() }) {
                                SirioText(text: link,
                                          typography: .linkMdHeavy,
                                          isUnderlined: true)
                                .foregroundStyle(Color.aliasInteractiveAccentDefault)
                            }
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, Size.p16)
                .padding(.vertical, Size.p8)
                
                if hasImage {
                    image
                        .padding(.top)
                }
                
            }
            Divider().background(Color.Hero.divider)
        }
        .background(Color.Hero.background)
        .onAppear {
            resolveBase64IfNeeded()
        }
    }
}

// MARK: - Image Handling
private extension SirioHero {

    var image: some View {
        if let name = imageName {
            AnyView(
                Image(name, bundle: bundle)
                    .resizable()
                    .applyScaleMode(imageScaleMode)
                    .frame(maxWidth: UIScreen.main.bounds.width,
                           maxHeight: Size.Card.Editorial.imageHeight)
                    .clipped()
            )
        } else if let finalUrl = resolvedBase64Url ?? url {
            AnyView(
                WebImage(url: finalUrl)
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .applyScaleMode(imageScaleMode)
                    .frame(maxWidth: UIScreen.main.bounds.width,
                           maxHeight: Size.Card.Editorial.imageHeight)
                    .clipped()                           
            )
        } else {
            AnyView(EmptyView())
        }
    }

    func resolveBase64IfNeeded() {
        guard let base64 else { return }
        if let url = saveBase64StringToLocalFile(base64String: base64) {
            resolvedBase64Url = url
        }
    }

    func saveBase64StringToLocalFile(base64String: String) -> URL? {
        guard let data = Data(base64Encoded: base64String) else { return nil }

        let fileURL = FileManager.default
            .temporaryDirectory
            .appendingPathComponent("hero_image")
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Error saving base64 image: \(error)")
            return nil
        }
    }
}

extension View {
    @ViewBuilder
    func applyScaleMode(_ mode: SirioImageScaleMode) -> some View {
        switch mode {
        case .fit:
            self.scaledToFit()
        case .fill:
            self.scaledToFill()
        }
    }
}

// MARK: - Preview

#Preview {
    SirioHero(
        title: "Titolo",
        subtitle: "Sottotitolo",
        link: "Link",
        onTapLinkAction: {
            print("Tap sul link della Hero")
        },
        //url: URL(string: "https://www.inps.it/content/dam/inps-site/immagini/INPS-home.svg")
        // oppure:
        imageName: "hero",
        // oppure:
        // base64: "..."
        bundle: .bundleModule
    )
    Spacer()
}
