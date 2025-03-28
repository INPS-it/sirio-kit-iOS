//
// SirioFileUpload.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Component that handles file selection and uploads.
///
/// - Parameters:
///   - title: The title of the component
///   - subtitle: The subtitle of the component
///   - text: The upload button text
///   - iconData: The iconData model for the icon. Arrow up is default
///   - isDisabled: Whether the file upload is disabled
///   - uploads: The list of the uploaded files
///   - onUploadAction: Callback that is executed when the upload button is tapped
///   - onRemoveUploadAction: Callback that is executed when one file is removed

public struct SirioFileUpload: View {
    private var title: String
    private var subtitle: String
    private var text: String
    private var iconData: SirioIconData
    @Binding private var isDisabled: Bool
    @Binding private var uploads: [String]
    private var onUploadAction: (() -> Void)
    private var onRemoveUploadAction: ((_ index: Int, _ value: String) -> Void)
    
    public init(title: String,
                subtitle: String,
                text: String,
                iconData: SirioIconData = .init(icon: .arrowUp),
                isDisabled: Binding<Bool> = .constant(false),
                uploads: Binding<[String]>,
                onUploadAction: @escaping (() -> Void),
                onRemoveUploadAction: @escaping ((_ index: Int, _ value: String) -> Void)){
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.iconData = iconData
        self._isDisabled = isDisabled
        self._uploads = uploads
        self.onUploadAction = onUploadAction
        self.onRemoveUploadAction = onRemoveUploadAction
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.FileUpload.spacing){
            SirioText(text: title, typography: Typography.FileUpload.title)
                .foregroundStyle(Color.FileUpload.Label.title)
            SirioText(text: subtitle, typography: Typography.FileUpload.subtitle)
                .foregroundStyle(Color.FileUpload.Label.subtitle)
            
            SirioButton(hierarchy: .primary,
                        size: .large,
                        text: text,
                        iconData: iconData,
                        isDisabled: $isDisabled,
                        action: {
                onUploadAction()
            })
            
            VStack {
                FlexibleView(data: uploads,
                             spacing: Size.zero,
                             alignment: .leading) { item in
                    SirioChips(text: item,
                               iconData: nil,
                               isDisabled: .constant(false),
                               onTapClose: {
                        if let index = uploads.firstIndex(of: item){
                            onRemoveUploadAction(index, item)
                        }
                    })
                    .padding(Size.FileUpload.padding)
                }
            }
        }
    }
}

struct TestFileUpload: View {
    @State private var uploads: [String] = []
    @State var count: Int = 0
    
    var body: some View {
        
        SirioFileUpload(title: "Label",
                   subtitle: "*Info upload file",
                   text: "Upload",
                   uploads: $uploads,
                   onUploadAction: {
            let newUpload = "File \(count)"
            uploads.append(newUpload)
            self.count += 1
        }, onRemoveUploadAction: { _, _ in
            // Do something...
        })
        .padding(.horizontal)
    }
}

#Preview {
    TestFileUpload()
}
