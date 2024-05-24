//
// EditorialCard.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SDWebImageSwiftUI

/// The Sirio Editorial Card
/// - Parameters:
///   - url: The url of an image
///   - base64: The base64 of an image
///   - category: The name of category
///   - date: The date
///   - title: The card's title
///   - subtitle: The card's subtitle
///   - text: The card's body
///   - signature: The card's signature
///   - items: The card's items. (Max 2 items)
///
public struct EditorialCard: View {
    var url: URL?
    var base64: String?
    var category: String?
    var date: String
    var title: String
    var subtitle: String?
    var text: String
    var signature: String?
    var iconsData: [SirioIconData]?
    var onTapCardAction: (() -> Void)?
    
    public init(url: URL? = nil, base64: String? = nil, category: String? = nil, date: String, title: String, subtitle: String? = nil, text: String, signature: String? = nil, iconsData: [SirioIconData]? = nil, onTapCardAction: (() -> Void)? = nil) {
        self.url = url
        self.base64 = base64
        self.category = category
        self.date = date
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.signature = signature
        self.iconsData = iconsData
        self.onTapCardAction = onTapCardAction
    }
    
    private var existImage: Bool {
        return url != nil || base64 != nil
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            if existImage && existUrl() {
                image
            }
            
            VStack(alignment: .leading, spacing: 0){
                
                firstSection
                    .padding(.top, Size.Card.Editorial.spacing)
                
                SirioText(text: title, typography: Typography.Card.Editorial.title, isUnderlined: true)
                    .foregroundColor(Color.Card.Editorial.Text.title)
                    .lineLimit(1)
                    .padding(.top, Size.Card.Editorial.spacing)
                
                if let subtitle = subtitle {
                    SirioText(text: subtitle, typography: Typography.Card.Editorial.subtitle)
                        .foregroundColor(Color.Card.Editorial.Text.subtitle)
                        .lineLimit(1)
                }
                
                SirioText(text: text, typography: Typography.Card.Editorial.body)
                    .foregroundColor(Color.Card.Editorial.Text.body)
                    .lineLimit(3)
                    .padding(.top, Size.Card.Editorial.spacing)
                
                if let signature = signature {
                    HStack {
                        SirioText(text: signature, typography: Typography.Card.Editorial.signature)
                            .foregroundColor(Color.Card.Editorial.Text.signature)
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    .padding(.top, Size.Card.Editorial.spacing)
                }
                
                if let items = iconsData?.prefix(2), items.count > 0 {
                    HStack(spacing: Size.Card.Editorial.spacingItems) {
                        Spacer()
                        
                        ForEach(items){ item in
                            SirioIcon(data: item)
                                .frame(width: Size.Card.Editorial.Item.width,
                                       height: Size.Card.Editorial.Item.height)
                                .foregroundColor(Color.Card.Editorial.Item.default)
                                .onTapGesture{
                                    item.action()
                                }
                        }
                    }
                    .padding(.top, Size.Card.Editorial.spacing)
                }
            }
            .padding(.horizontal, Size.Card.Editorial.paddingHorizontal)
            .padding(.bottom, Size.Card.Editorial.paddingBottom)
            .padding(.top, Size.Card.Editorial.paddingTop)
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
        return VStack(spacing: 0) {
            if let category = category {
                categoryView(with: category)
            } else {
                dateView()
            }
        }
    }
    
    var image: some View {
        return ZStack(alignment: .top) {
            WebImage(url: url,
                     options: [],
                     context: [.imageThumbnailPixelSize : CGSize.zero])
            .placeholder {
                ProgressView()
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: Size.Card.Editorial.imageHeight, alignment: .center)
        }
    }
}

extension EditorialCard {
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
    
    @ViewBuilder
    private func categoryView(with category: String) -> some View {
        HStack {
            Tag(type: .gray, text: category)
            Spacer()
            SirioText(text: date, typography: Typography.Card.date)
                .foregroundColor(Color.Card.Generic.Text.date)
        }
    }
    
    @ViewBuilder
    private func dateView() -> some View {
        HStack {
            SirioText(text: date, typography: Typography.Card.date)
                .foregroundColor(Color.Card.Generic.Text.date)
            Spacer()
        }
    }
}

#Preview {
    
    EditorialCard(url: URL(string: "https://www.inps.it/content/dam/inps-site/immagini/INPS-home.svg")!,
                  category: "Categoria",
                  date: "13 Nov 2023",
                  title: "Titolo della card",
                  subtitle: "Sottotitolo",
                  text: .loremIpsum,
                  signature: "Firma Autore",
                  iconsData: [.previewEllipsis, .previewHeart])
        .padding()
}
