//
//  Example.swift
//  iOS-Example
//

import SwiftUI
import SirioKitIOS

struct Example: View {
    
    var body: some View {
        ButtonTextOnly(style: .primary,
                       size: .medium,
                       text: "Text",
                       action: {})
    }
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        Example()
    }
}
