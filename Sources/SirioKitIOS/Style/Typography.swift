//
// Typography.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
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
public extension Typography {
    
    static let label_md_700: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                 fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                                 fontWeight: StyleDictionaryTypography.globalFontWeights700,
                                                 lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    static let label_md_600: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)

    static let label_md_400: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    static let h4_md: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                            fontSize: StyleDictionarySize.globalFontSize07.cgFloat,
                                            fontWeight: StyleDictionaryTypography.globalFontWeights700,
                                            lineHeight: StyleDictionarySize.globalLineHeights07.cgFloat)

    static let p_md_01: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                            fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                            fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                            lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    static let helper_text_xs_400: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                    fontSize: StyleDictionarySize.globalFontSize02.cgFloat,
                                                    fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                                    lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    static let label_md_number_400: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily03,
                                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
    
    static let ios_tabbar_label_xs: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                          fontSize: StyleDictionarySize.aliasLabelXsSize02.cgFloat,
                                                          fontWeight: StyleDictionaryTypography.aliasLabelFontWeight400,
                                                          lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    static let app_navigation_title_md: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                          fontSize: StyleDictionarySize.globalLineHeights01.cgFloat,
                                                          fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                                          lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)

    
    static let app_navigation_title_xl: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                                          fontSize: StyleDictionarySize.globalLineHeights04.cgFloat,
                                                          fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                                          lineHeight: StyleDictionarySize.globalLineHeights06.cgFloat)
    
    static let placeholder_md_400: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                               lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    static let text_md_400: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                               lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    
    static let link_h4_md_01: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize07.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights700,
                                               lineHeight: StyleDictionarySize.globalLineHeights07.cgFloat)

    static let h6_md: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily01,
                                               fontSize: StyleDictionarySize.globalFontSize05.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights600,
                                               lineHeight: StyleDictionarySize.globalLineHeights05.cgFloat)
    
    static let signature_p_md_02: Typography = Typography(fontFamily: StyleDictionaryTypography.globalFontFamily02,
                                               fontSize: StyleDictionarySize.globalFontSize04.cgFloat,
                                               fontWeight: StyleDictionaryTypography.globalFontWeights700I,
                                               lineHeight: StyleDictionarySize.globalLineHeights04.cgFloat)
}

// MARK: Fab
public extension Typography {
    struct Fab {
        static let style: Typography = .label_md_700
    }
}

// MARK: AppNavigation
public extension Typography {
    struct AppNavigation {
        static let md: Typography = .app_navigation_title_md
        static let xl: Typography = .app_navigation_title_xl
        static let profile: Typography = .label_md_700
    }
}

// MARK: TabBar
public extension Typography {
    struct TabBar {
        static let style: Typography = .ios_tabbar_label_xs
    }
}

// MARK: Accordion
public extension Typography {
    struct Accordion {
        static let style: Typography = .label_md_600
    }
}

// MARK: Tag
public extension Typography {
    struct Tag {
        static let style: Typography = .label_md_700
    }
}

// MARK: Chips
public extension Typography {
    struct Chips {
        static let style: Typography = .label_md_700
    }
}

// MARK: CheckBox
public extension Typography {
    struct CheckBox {
        static let style: Typography = .label_md_400
    }
}

// MARK: RadioButton
public extension Typography {
    struct RadioButton {
        static let style: Typography = .label_md_400
    }
}

// MARK: Toggle
public extension Typography {
    struct Toggle {
        static let style: Typography = .label_md_400
    }
}

// MARK: Slider
public extension Typography {
    struct Slider {
        static let title: Typography = .label_md_600
        static let subtitle: Typography = .helper_text_xs_400
        static let number: Typography = .label_md_number_400
    }
}

// MARK: ProgressBar
public extension Typography {
    struct ProgressBar {
        static let label: Typography = .label_md_600
        static let number: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily03,
                                                      fontSize: StyleDictionarySize.globalFontSize02.cgFloat,
                                                      fontWeight: StyleDictionaryTypography.globalFontWeights400,
                                                      lineHeight: StyleDictionarySize.globalLineHeights01.cgFloat)
    }
}

// MARK: FileUpload
public extension Typography {
    struct FileUpload {
        static let title: Typography = .label_md_600
        static let subtitle: Typography = .helper_text_xs_400
        static let text: Typography = .label_md_700
    }
}

// MARK: Buttons
public extension Typography {
    struct Buttons {
        static let text: Typography = .label_md_700
    }
}

// MARK: Notification Inline & Toast
public extension Typography {
    struct Notification {
        struct Inline {
            static let title: Typography = .label_md_700
            static let subtitle: Typography = .p_md_01
        }
        
        struct Toast {
            static let title: Typography = .label_md_700
            static let subtitle: Typography = .p_md_01
        }
    }
}

// MARK: Dialog
public extension Typography {
    struct Dialog {
        static let title: Typography = .h4_md
        static let subtitle: Typography = .p_md_01
        static let textfield: Typography = .label_md_600
    }
}

// MARK: TextField
public extension Typography {
    struct TextField {
        static let label: Typography = .placeholder_md_400
        static let text: Typography = .text_md_400
        static let helper: Typography = .helper_text_xs_400
    }
}

// MARK: Tab
public extension Typography {
    struct Tab {
        static let selected: Typography = .label_md_700
        static let unselected: Typography = .label_md_400
    }
}

// MARK: SearchBar
public extension Typography {
    struct SearchBar {
        static let label: Typography = .label_md_600
        static let searchText: Typography = .placeholder_md_400
        static let helper: Typography = .helper_text_xs_400
    }
}

// MARK: Pagination
public extension Typography {
    struct Pagination {
        static let number: Typography = .label_md_number_400
        static let dots: Typography = .label_md_number_400
    }
}


// MARK: Card
public extension Typography {
    struct Card {
        static let date: Typography = Typography.init(fontFamily: StyleDictionaryTypography.globalFontFamily03,
                                                      fontSize: StyleDictionarySize.globalFontSize03.cgFloat,
                                                      fontWeight: StyleDictionaryTypography.globalFontWeights500,
                                                      lineHeight: StyleDictionarySize.globalLineHeights03.cgFloat)
        
        struct Editorial {
            static let title: Typography = .link_h4_md_01
            static let subtitle: Typography = .h6_md
            static let body: Typography = .p_md_01
            static let signature: Typography = .signature_p_md_02
        }
        
        struct Process {
            static let title: Typography = .h4_md
            static let body: Typography = .p_md_01
        }
    }
}
