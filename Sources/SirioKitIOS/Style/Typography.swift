//
// Typography.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit
import SwiftUI

// This is the typography model for text components
public struct Typography {
    var fontFamily: Typography.FontFamily
    var fontSize: CGFloat
    var fontWeight: Typography.FontWeight
    var lineHeight: CGFloat
    
    public init (fontFamily: Typography.FontFamily,
                 fontSize: CGFloat,
                 fontWeight: Typography.FontWeight,
                 lineHeight: CGFloat){
        self.fontFamily = fontFamily
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.lineHeight = lineHeight
    }
    
    // Font name
    public var name: String {
        return "\(fontFamily.rawValue) \(fontWeight.rawValue)"
    }
    
    // Font
    public var font: Font {
        return .custom(name, size: fontSize)
    }
    
    // UIFont
    public var uiFont: UIFont {
        return UIFont(name: name, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    public enum FontFamily: String {
        case RobotoMono = "Roboto Mono"
        case TitilliumWeb = "Titillium Web"
        case Lora = "Lora"
    }
    
    public enum FontWeight: String {
        case Bold = "Bold"
        case BoldItalic = "Bold Italic"
        case Italic = "Italic"
        case Light = "Light"
        case LightItalic = "Light Italic"
        case Medium = "Medium"
        case MediumItalic = "Medium Italic"
        case Regular = "Regular"
        case SemiBold = "SemiBold"
        case SemiBoldItalic = "SemiBold Italic"
    }
}

// Here generic styles from sirio toolkit
extension Typography {
    
    public static let label_md_700: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                 fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                                 fontWeight: StyleDictionaryTypography.globalFontWeights700,
                                                 lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    public static let label_md_600: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)

    public static let label_md_400: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    public static let h4_md: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                            fontSize: StyleDictionarySize.globalFontSize07.cgFloat,
                                            fontWeight: StyleDictionaryTypography.globalFontWeights700,
                                            lineHeight: StyleDictionarySize.globalLineHeights07.cgFloat)

    public static let p_md_01: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                            fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                            fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                            lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    public static let helper_text_xs_400: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                    fontSize: StyleDictionarySize.globalFontSize02.cgFloat,
                                                    fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                                    lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    public static let label_md_number_400: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily03,
                                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    public static let ios_tabbar_label_xs: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                          fontSize: StyleDictionarySize.aliasLabelXsSize02.cgFloat,
                                                          fontWeight: StyleDictionaryTypography.aliasLabelFontWeight400,
                                                          lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    public static let app_navigation_title_md: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                          fontSize: StyleDictionarySize.globalLineHeights01.cgFloat,
                                                          fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                                          lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)

    
    public static let app_navigation_title_xl: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                          fontSize: StyleDictionarySize.globalLineHeights04.cgFloat,
                                                          fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                                          lineHeight: StyleDictionarySize.globalLineHeights06.cgFloat)
    
    public static let placeholder_md_400: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                               lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    public static let text_md_400: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                               lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    public static let link_h4_md_01: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize07.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights700,
                                               lineHeight: StyleDictionarySize.globalLineHeights07.cgFloat)

    public static let h6_md: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize05.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                               lineHeight: StyleDictionarySize.globalLineHeights05.cgFloat)
    
    public static let signature_p_md_02: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily02,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights700I,
                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    static let h2_md: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize11.cgFloat,
                                               fontWeight: StyleDictionaryTypography.aliasH2FontWeight700,
                                               lineHeight: StyleDictionarySize.globalLineHeights11.cgFloat)
}

// MARK: Fab
extension Typography {
    public struct Fab {
        public static let style: Typography = .label_md_700
    }
}

// MARK: AppNavigation
extension Typography {
    public struct AppNavigation {
        public static let md: Typography = .app_navigation_title_md
        public static let xl: Typography = .app_navigation_title_xl
        public static let profile: Typography = .label_md_700
    }
}

// MARK: TabBar
extension Typography {
    public struct TabBar {
        public static let style: Typography = .ios_tabbar_label_xs
    }
}

// MARK: Accordion
extension Typography {
    public struct Accordion {
        public static let style: Typography = .label_md_600
    }
}

// MARK: Tag
extension Typography {
    public struct Tag {
        public static let style: Typography = .label_md_700
    }
}

// MARK: Chips
extension Typography {
    public struct Chips {
        public static let style: Typography = .label_md_700
    }
}

// MARK: CheckBox
extension Typography {
    public struct CheckBox {
        public static let style: Typography = .label_md_400
    }
}

// MARK: RadioButton
extension Typography {
    public struct RadioButton {
        public static let style: Typography = .label_md_400
    }
}

// MARK: Toggle
extension Typography {
    public struct Toggle {
        public static let style: Typography = .label_md_400
    }
}

// MARK: Slider
extension Typography {
    public struct Slider {
        public static let title: Typography = .label_md_600
        public static let subtitle: Typography = .helper_text_xs_400
        public static let number: Typography = .label_md_number_400
    }
}

// MARK: ProgressBar
extension Typography {
    public struct ProgressBar {
        public static let label: Typography = .label_md_600
        public static let number: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily03,
                                                      fontSize: StyleDictionarySize.globalFontSize02.cgFloat,
                                                      fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                                      lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    }
}

// MARK: FileUpload
extension Typography {
    public struct FileUpload {
        public static let title: Typography = .label_md_600
        public static let subtitle: Typography = .helper_text_xs_400
        public static let text: Typography = .label_md_700
    }
}

// MARK: Buttons
extension Typography {
    public struct Buttons {
        public static let text: Typography = .label_md_700
    }
}

// MARK: Notification Inline & Toast
extension Typography {
    public struct Notification {
        public struct Inline {
            public static let title: Typography = .label_md_700
            public static let subtitle: Typography = .p_md_01
        }
        
        public struct Toast {
            public static let title: Typography = .label_md_700
            public static let subtitle: Typography = .p_md_01
        }
    }
}

// MARK: Dialog
extension Typography {
    public struct Dialog {
        public static let title: Typography = .h4_md
        public static let subtitle: Typography = .p_md_01
        public static let textfield: Typography = .label_md_600
    }
}

// MARK: TextField
extension Typography {
    public struct TextField {
        public static let label: Typography = .placeholder_md_400
        public static let text: Typography = .text_md_400
        public static let helper: Typography = .helper_text_xs_400
    }
}

// MARK: Tab
extension Typography {
    public struct Tab {
        public static let selected: Typography = .label_md_700
        public static let unselected: Typography = .label_md_400
    }
}

// MARK: SearchBar
extension Typography {
    public struct SearchBar {
        public static let label: Typography = .label_md_600
        public static let searchText: Typography = .placeholder_md_400
        public static let helper: Typography = .helper_text_xs_400
    }
}

// MARK: Pagination
extension Typography {
    public struct Pagination {
        public static let number: Typography = .label_md_number_400
        public static let dots: Typography = .label_md_number_400
    }
}


// MARK: Card
extension Typography {
    public struct Card {
        public static let date: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily03,
                                                      fontSize: StyleDictionarySize.globalFontSize03.cgFloat,
                                                      fontWeight: StyleDictionaryTypography.globalFontWeights500,
                                                      lineHeight: StyleDictionarySize.globalLineHeights03.cgFloat)
        
        public struct Editorial {
            public static let title: Typography = .link_h4_md_01
            public static let subtitle: Typography = .h6_md
            public static let body: Typography = .p_md_01
            public static let signature: Typography = .signature_p_md_02
        }
        
        public struct Process {
            public static let title: Typography = .h4_md
            public static let body: Typography = .p_md_01
        }
    }
}
