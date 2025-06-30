//
// SirioEditorialCard.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

/// A custom editorial card view that displays an article with an optional image, title, subtitle, body text, and other metadata.
/// It also supports interactive icons that can trigger actions when tapped.
///
/// - Parameters:
///   - url: The URL of the image to display at the top of the card (optional).
///   - imageName: The image name string of the image to display at the top of the card (optional).
///   - bundle: The bundle (to be used if you want to use an image outside the package)
///   - category: The category name associated with the article (optional).
///   - date: The publication date of the article, displayed on the card.
///   - title: The title of the article, displayed prominently in the card.
///   - subtitle: An optional subtitle for the article.
///   - text: The body text or summary of the article.
///   - signature: An optional signature or byline associated with the article.
///   - iconsData: An array of up to two icons, each with an associated action that can be triggered when tapped.
///   - onTapCardAction: A callback that is triggered when the card is tapped.

public struct SirioEditorialCard: View {
    var url: URL?
    var imageName: String?
    var bundle: Bundle?
    var category: String?
    var date: String
    var title: String
    var subtitle: String?
    var text: String
    var iconsData: [SirioIconData]?
    var onTapCardAction: (() -> Void)?
    
    // Without immagine
    public init(category: String? = nil, date: String, title: String, subtitle: String? = nil, text: String, iconsData: [SirioIconData]? = nil, onTapCardAction: (() -> Void)? = nil) {
        self.url = nil
        self.imageName = nil
        self.bundle = nil
        self.category = category
        self.date = date
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.iconsData = iconsData
        self.onTapCardAction = onTapCardAction
        
        // Inizialize plugin for svg images
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
    
    // With url image
    public init(url: URL, category: String? = nil, date: String, title: String, subtitle: String? = nil, text: String, iconsData: [SirioIconData]? = nil, onTapCardAction: (() -> Void)? = nil) {
        self.url = url
        self.imageName = nil
        self.bundle = nil
        self.category = category
        self.date = date
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.iconsData = iconsData
        self.onTapCardAction = onTapCardAction
        
        // Inizialize plugin for svg images
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
    
    // With assets image
    public init(imageName: String, bundle: Bundle, category: String? = nil, date: String, title: String, subtitle: String? = nil, text: String, iconsData: [SirioIconData]? = nil, onTapCardAction: (() -> Void)? = nil) {
        self.url = nil
        self.imageName = imageName
        self.bundle = bundle
        self.category = category
        self.date = date
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.iconsData = iconsData
        self.onTapCardAction = onTapCardAction
        
        // Inizialize plugin for svg images
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
    
    private var existImage: Bool {
        return url != nil || (imageName != nil && bundle != nil)
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.s0) {

            if existImage {
               image
            }
            
            VStack(alignment: .leading, spacing: Size.s0) {

                firstSection
                
                SirioText(text: title, typography: Typography.Card.Editorial.title, isUnderlined: true)
                    .foregroundColor(Color.Card.Editorial.Text.title)
                    .lineLimit(1)
                    .padding(.top, Size.p12)
                
                if let subtitle = subtitle {
                    SirioText(text: subtitle, typography: Typography.Card.Editorial.subtitle)
                        .foregroundColor(Color.Card.Editorial.Text.subtitle)
                        .lineLimit(1)
                        .padding(.top, Size.p4)
                }
                
                SirioText(text: text, typography: Typography.Card.Editorial.body)
                    .foregroundColor(Color.Card.Editorial.Text.body)
                    .lineLimit(3)
                    .padding(.top, Size.p4)
                
                if let items = iconsData?.prefix(2), items.count > 0 {
                    HStack(spacing: Size.s16) {
                        Spacer()
                        
                        ForEach(items){ item in
                            Button(action: {
                                item.action()
                            }, label: {
                                SirioIcon(data: item)
                                    .frame(width: Size.Card.Editorial.Item.width,
                                           height: Size.Card.Editorial.Item.height)
                                    .foregroundColor(Color.Card.Editorial.Item.default)
                            })
                            .frame(width: Size.Card.Editorial.Item.containerFrame,
                                   height: Size.Card.Editorial.Item.containerFrame)
                        }
                    }
                    .padding(.top, Size.p12)
                }
            }
            .padding(.horizontal, Size.p12)
            .padding(.bottom, Size.p16)
            .padding(.top, Size.p16)
        }
        .background(Color.Card.Editorial.Background.default)
        .cornerRadius(Size.Card.Editorial.cornerRadius)
        .shadow(color: StyleDictionaryBoxShadow.elevation01.0.color,
                radius: StyleDictionaryBoxShadow.elevation01.3.cgFloat,
                x: StyleDictionaryBoxShadow.elevation01.1.cgFloat,
                y: StyleDictionaryBoxShadow.elevation01.2.cgFloat)
        .onTapGesture {
            self.onTapCardAction?()
        }
    }
    
    var firstSection: some View {
        return VStack(spacing: Size.s0) {
            if let category = category {
                categoryView(with: category)
            } else {
                dateView()
            }
        }
    }
    
    var image: some View {
        if let url = url {
            return  AnyView(GeometryReader { geometry in
                WebImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                }
                .onSuccess { _, _, _ in }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
            }
            .frame(height: Size.Card.Editorial.imageHeight))
        } else if let imageName = imageName {
            return  AnyView(GeometryReader { geometry in
                Image(imageName, bundle: bundle)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .frame(height: Size.Card.Editorial.imageHeight))
        }
        return AnyView(EmptyView())
        
    }
}

extension SirioEditorialCard {
    
    @ViewBuilder
    private func categoryView(with category: String) -> some View {
        HStack {
            SirioTag(type: .gray, text: category)
            Spacer()
            SirioText(text: date, typography: Typography.Card.date)
                .foregroundColor(Color.Card.Generic.Text.date)
        }
    }
    
    @ViewBuilder
    private func dateView() -> some View {
        HStack {
            Spacer()
            
            SirioText(text: date, typography: Typography.Card.date)
                .foregroundColor(Color.Card.Generic.Text.date)
        }
    }
}

#Preview {
    HStack {
        SirioEditorialCard(url: URL(string: "https://www.inps.it/content/dam/inps-site/immagini/INPS-home.svg")!,
                           category: "Categoria",
                           date: "13 Nov 2023",
                           title: "Titolo della card",
                           subtitle: "Sottotitolo",
                           text: .loremIpsum,
                           iconsData: [.previewShare, .previewBookmark])
        .padding()
    }
    
    HStack {
        SirioEditorialCard(imageName: "image_editorial_card",
                           bundle: .bundleModule,
                           category: "Categoria",
                           date: "13 Nov 2023",
                           title: "Titolo della card",
                           subtitle: "Sottotitolo",
                           text: .loremIpsum,
                           iconsData: [.previewShare, .previewBookmark])
        .padding()
    }
}
