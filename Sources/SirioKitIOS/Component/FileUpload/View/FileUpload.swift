//
// FileUpload.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

/// Component that handle file selection
/// - Parameters:
///   - title: The title of the component
///   - subtitle: The subtitle of the component
///   - text: The upload button text
///   - icon: The icon inside the upload button
///   - isDisabled: Whether the file upload is disabled
///   - uploads: The list of the uploaded files
///   - onUploadAction: Callback that is executed when the button upload is tapped
///   - onRemoveUploadAction: Callback that is executed when one file is removed
public struct FileUpload: View {
    private var title: String
    private var subtitle: String
    private var text: String
    private var icon: AwesomeIcon
    @Binding private var isDisabled: Bool
    @Binding private var uploads: [String]
    private var onUploadAction: (() -> Void)
    private var onRemoveUploadAction: ((_ index: Int, _ value: String) -> Void)
    
    public init(title: String,
                subtitle: String,
                text: String,
                icon: AwesomeIcon = .arrowUp,
                isDisabled: Binding<Bool> = .constant(false),
                uploads: Binding<[String]>,
                onUploadAction: @escaping (() -> Void),
                onRemoveUploadAction: @escaping ((_ index: Int, _ value: String) -> Void)){
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.icon = icon
        self._isDisabled = isDisabled
        self._uploads = uploads
        self.onUploadAction = onUploadAction
        self.onRemoveUploadAction = onRemoveUploadAction
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Size.FileUpload.spacing){
            SirioText(text: title, typography: Typography.FileUpload.title)
                .foregroundColor(Color.FileUpload.Label.title)
            SirioText(text: subtitle, typography: Typography.FileUpload.subtitle)
                .foregroundColor(Color.FileUpload.Label.subtitle)
            
            ButtonTextIcon(style: .primary,
                           size: .large,
                           text: text,
                           icon: icon,
                           isDisabled: $isDisabled,
                           action: {
                onUploadAction()
            })
            
            VStack {
                FlexibleView(data: uploads,
                             spacing: 0,
                             alignment: .leading) { item in
                    ChipsLabelClose(text: item,
                                    isDisabled: .constant(false),
                                    onTapChips: nil,
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
        
        FileUpload(title: "Label",
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

struct FileUpload_Previews: PreviewProvider {
    static var previews: some View {
        TestFileUpload()
    }
}
