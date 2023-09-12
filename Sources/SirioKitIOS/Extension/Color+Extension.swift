//
// Color+Extension.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: TAB BAR
extension Color {
    
    struct TabBar {
        
        static let background = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        
        struct Item {
            
            struct Text {
                static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                static let selected = StyleDictionaryColor.aliasAppInteractivePrimaryActive.color
            }
            
            struct Icon {
                static let `default` = StyleDictionaryColor.aliasAppInteractiveSecondaryDefault.color
                static let selected = StyleDictionaryColor.aliasAppInteractivePrimaryActive.color
            }
            struct Indicator {
                static let `default` = Color.clear
                static let selected = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            }
        }
    }
}

// MARK: BADGE
extension Color {
    
    struct Badge {
        static let background = StyleDictionaryColor.globalSemanticAlert100.color
        static let border = StyleDictionaryColor.globalPrimary000.color
    }
}

// MARK: FAB
extension Color {
    
    struct Fab {
                
        struct Icon {
            struct Default {
                static let light = StyleDictionaryColor.globalPrimary000.color
                static let dark = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            }
        }
        
        struct Background {
            struct Default {
                static let light = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                static let dark = StyleDictionaryColor.aliasAppInteractivePrimary000Default.color
            }
            
            struct Hover {
                static let light = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                static let dark = StyleDictionaryColor.aliasInteractiveAccentHover.color
            }
            
            struct Pressed {
                static let light = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                static let dark = StyleDictionaryColor.aliasInteractiveAccentDefault.color
            }
        }
    }
}

// MARK: APP NAVIGATION
extension Color {
    
    struct AppNavigation {
        
        struct Default { // App Navigation Default
            struct Background {
                static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                static let dark = StyleDictionaryColor.aliasBackgroundColorPrimaryDark120.color
            }
            
            struct Text {
                static let light = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
                static let dark = StyleDictionaryColor.aliasTextColorPrimaryLight50.color
            }
            
            struct Item {
                
                struct Icon {
                    static let light = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                    static let dark = StyleDictionaryColor.aliasInteractivePrimary000Default.color
                }
                
                struct Background {
                    static let light = StyleDictionaryColor.aliasOverlay15Secondary100.color
                    static let dark = StyleDictionaryColor.aliasOverlay25Primary000.color
                }
                
                struct Profile { // Item Profile
                    
                    struct Background {
                        static let light = StyleDictionaryColor.globalLightPrimary50.color
                        static let dark = StyleDictionaryColor.globalDarkPrimary115.color
                    }
                    
                    struct Text {
                        static let light = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                        static let dark = StyleDictionaryColor.aliasInteractivePrimary000Default.color
                    }
                }
            }
        }
        
        struct Selection { // App Navigation Selection
            struct Background {
                static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryDark120.color
                static let dark = StyleDictionaryColor.aliasAppInteractivePrimary000Default.color
            }
            
            struct Text {
                static let light = StyleDictionaryColor.aliasTextColorPrimaryLight50.color
                static let dark = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
            }
            
            struct Item {
                struct Icon {
                    static let light = StyleDictionaryColor.aliasAppInteractivePrimary000Default.color
                    static let dark = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                }
            }
        }
        
        struct Search { // App Navigation Search
            static let background = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            
            static let border = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            
            static let text = StyleDictionaryColor.aliasAppInteractiveSecondaryDefault.color
            
            struct Item {
                static let icon = StyleDictionaryColor.aliasAppInteractiveSecondaryDefault.color
            }
        }
        
        struct LogoInps {
            static let light = StyleDictionaryColor.globalPrimary100.color
            static let dark = StyleDictionaryColor.globalPrimary000.color
        }
    }
}

// MARK: Accordion
extension Color {
    struct Accordion {
        
        struct Background {
            struct Default {
                static let dark = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                static let light = StyleDictionaryColor.globalPrimary000.color
            }
            
            struct Hover {
                static let dark = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            }
            
            struct Active {
                static let dark = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            }
            static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            
        }
        
        struct Border {
            static let dark = Color.clear
            static let light = StyleDictionaryColor.globalLightPrimary50.color
            static let content = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
        }
        
        
        struct Text {
            static let dark = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            static let light = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        struct Icon {
            static let dark = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            static let light = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
    }
}

// MARK: Chips
extension Color {
    
    struct Chips {
        
        struct Background {
            static let activeDefault = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            static let activeHover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            static let activePressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
            static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            static let disactive = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        
        struct Border {
            static let disactiveDefault = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            static let disactiveHover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            static let disactivePressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
        }
        
        struct Text {
            static let active = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            static let disactiveDefault = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            static let disactiveHover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            static let disactivePressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
        }
        
        struct WithClose {
            
            struct Background {
                static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                static let pressed = StyleDictionaryColor.aliasInteractiveSecondaryPressed.color
                static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            }
            
            struct Text {
                static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            }
            
            struct Icon {
                static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
            
            struct Circle {
                
                struct Background {
                    static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                    static let pressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                }
                
                struct Border {
                    static let `default` = StyleDictionaryColor.globalMidPrimary70.color
                }
            }
        }
    }
}


// MARK: Tag
extension Color {
    struct Tag {
        struct Background {
            static let gray =  StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            static let blue =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            static let red =  StyleDictionaryColor.aliasInteractiveAlertDefault.color
            static let orange =  StyleDictionaryColor.globalSemanticWarning80.color
            static let green =  StyleDictionaryColor.globalSemanticSuccess100.color
            static let white =  StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        
        struct Text {
            static let `default` =  StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            static let secondary =  StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            static let dark =  StyleDictionaryColor.aliasTextColorSecondaryDark130.color
        }
    }
}

// MARK: RadioButton
extension Color {
    
    struct RadioButton {
        
        struct Circle {
            static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
            static let hover = StyleDictionaryColor.specificDataEntryBorderColorHover.color
            static let checked = StyleDictionaryColor.specificDataEntryBorderColorValued.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        struct Text {
            static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            static let hover = StyleDictionaryColor.specificDataEntryLabelColorHover.color
            static let checked = StyleDictionaryColor.specificDataEntryLabelColorValued.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
    }
}

// MARK: Checkbox
extension Color {
    
    struct Checkbox {
        
        struct Check {
            static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
            static let hover = StyleDictionaryColor.specificDataEntryBorderColorHover.color
            static let checked = StyleDictionaryColor.specificDataEntryBorderColorValued.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        struct Text {
            static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            static let hover = StyleDictionaryColor.specificDataEntryLabelColorHover.color
            static let checked = StyleDictionaryColor.specificDataEntryLabelColorValued.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
    }
}


// MARK: Toggle
extension Color {
    
    struct Toggle {
        
        struct Off {
            
            struct Circle {
                static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
                static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            struct Border {
                static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
                static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            struct Text {
                static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
        }
        
        struct On {
            struct Circle {
                static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            struct Border {
                static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            struct Text {
                static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
        }
    }
}


// MARK: Slider
extension Color {
    
    struct Slider {
        
        struct Line {
            static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            static let pressed = StyleDictionaryColor.specificOptionBackgroundColorPressed.color
        }
        
        struct Text {
            static let title = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            static let subtitle = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            static let number = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        }
        
        struct TextField {
            struct Background {
                static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            struct Text {
                static let `default` = StyleDictionaryColor.specificDataEntryPlaceholderColorValued.color
                static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
        }
    }
}

// MARK: ProgressBar
extension Color {
    
    struct ProgressBar {
        
        struct Label {
            static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            
        }
        
        struct Number {
            static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color

        }
        
        struct Background {
            static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            static let gradient: [Color] = StyleDictionaryColor.specificProgressbarBackgroundColor.map({ $0.color })
        }
    }
}

// MARK: FileUpload
extension Color {
    struct FileUpload {
        struct Background {
            static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            static let pressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
            static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
        }
        
        struct Label {
            static let title = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            static let subtitle = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            static let button = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        struct Icon {
            static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
    }
}

// MARK: Button (SirioButton)
extension Color {
    
    struct SirioButton {
        // MARK: Primary
        struct Primary {
            
            struct Background {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            struct Icon {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            struct Text {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
        
        // MARK: Secondary
        struct Secondary {
            
            struct Background {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractiveSecondaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractiveSecondaryPressed.color)
            }
            
            struct Icon {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            struct Text {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
        
        // MARK: Tertiary Light
        struct TertiaryLight {
            
            struct Background {
                static let state: ColorState = .init(default: Color.clear,
                                                     disabled: Color.clear,
                                                     hover: Color.clear,
                                                     pressed: Color.clear)
            }
            
            struct Border {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            struct Icon {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            struct Text {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
        }
        
        // MARK: Tertiary Dark
        struct TertiaryDark {
            
            struct Background {
                static let state: ColorState = .init(default: Color.clear,
                                                     disabled: Color.clear,
                                                     hover: Color.clear,
                                                     pressed: Color.clear)
            }
            
            struct Border {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAccentDefault.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractiveAccentHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractiveAccentPressed.color)
            }
            
            struct Icon {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAccentDefault.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractiveAccentHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractiveAccentPressed.color)
            }
            
            struct Text {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAccentDefault.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractiveAccentHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractiveAccentPressed.color)
            }
        }
        
        // MARK: Danger
        struct Danger {
            
            struct Background {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAlertDefault.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractiveAlertHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractiveAlertPressed.color)
            }
            
            struct Icon {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            struct Text {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
        
        // MARK: Ghost
        struct Ghost {
            
            struct Background {
                static let state: ColorState = .init(default: Color.clear,
                                                     disabled: Color.clear,
                                                     hover: Color.clear,
                                                     pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            struct Icon {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            struct Text {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                     disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
    }
}

// MARK: Notification
extension Color {
    struct Notification {
        struct Inline {
            struct Background {
                static let `default` =  StyleDictionaryColor.globalDarkPrimary120.color
            }
            
            struct Icon {
                static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                
                struct Container {
                    static let alert = StyleDictionaryColor.globalSemanticAlert100.color
                    static let info = StyleDictionaryColor.globalSemanticInfo100.color
                    static let warning = StyleDictionaryColor.globalSemanticWarning100.color
                    static let success = StyleDictionaryColor.globalSemanticSuccess100.color
                }
            }
            
            struct Text {
                static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            }
        }
        
        struct Toast {
            struct Background {
                static let `default` =  StyleDictionaryColor.globalDarkPrimary120.color
            }
            
            struct Icon {
                static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                
                struct Rectangle {
                    static let alert = StyleDictionaryColor.globalSemanticAlert100.color
                    static let info = StyleDictionaryColor.globalSemanticInfo100.color
                    static let warning = StyleDictionaryColor.globalSemanticWarning100.color
                    static let success = StyleDictionaryColor.globalSemanticSuccess100.color
                }
            }
            
            struct Text {
                static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                static let link = StyleDictionaryColor.aliasInteractiveAccentDefault.color
            }
        }
    }
}

// MARK: SirioTextField
extension Color {
    struct SirioTextField {
    
        struct Text {
            static let hover = StyleDictionaryColor.specificDataEntryPlaceholderColorHover.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
            static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            static let placeholder = StyleDictionaryColor.specificDataEntryPlaceholderColorDefault.color
        }
        
        struct Background {
            static let `default` = Color.clear
        }
        
        struct Border {
            static let hover = StyleDictionaryColor.specificDataEntryBorderColorHover.color
            static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
            static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
        }
        
        struct InfoIcon {
            static let hover = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            static let `default` = StyleDictionaryColor.globalSemanticInfo100.color
            static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
        }
        
        struct Icon {
            static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
            static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
        }
    }
}

// MARK: Tab
extension Color {
    struct Tab {
        struct Rectangle {
            struct Top {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractivePrimaryDefault.color)
            }
            
            struct Bottom {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                     pressed: StyleDictionaryColor.aliasInteractivePrimaryDefault.color)
            }
            
            
        }
        
        struct Text {
            static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                 disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                 hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                 pressed: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color)
        }
        
        struct Icon {
            static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight50.color,
                                                 disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                 hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                 pressed: StyleDictionaryColor.aliasInteractivePrimaryDefault.color)
        }
        
        struct Background {
            
            struct Top {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                     hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                     pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color)
            }
            
            struct Bottom {
                static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color,
                                                     disabled: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color,
                                                     hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                     pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color)
            }
            
        }
    }
}

// MARK: SearchBar
extension Color {
    struct SearchBar {
        
        struct Background {
            static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        
        struct Text {
            static let `default` = StyleDictionaryColor.specificDataEntryPlaceholderColorDefault.color
            static let focused = StyleDictionaryColor.specificDataEntryLabelColorFocus.color
            static let valued = StyleDictionaryColor.specificDataEntryLabelColorValued.color
        }
        
        struct Button {
            struct Icon {
                static let clear = StyleDictionaryColor.globalPrimary100.color
                static let search = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
            struct Background {
                static let search = StyleDictionaryColor.globalPrimary100.color
            }
        }
        
        struct OptionValue {
            
            struct Text {
                static let `default` = StyleDictionaryColor.specificDataEntryPlaceholderColorDefault.color
                static let pressed = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            }
            
            struct Background {
                static let pressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
        }
                
        struct Border {
            static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
            static let focused = StyleDictionaryColor.specificDataEntryBorderColorFocus.color
            static let valued = StyleDictionaryColor.specificDataEntryBorderColorValued.color
            
        }
    }
}

// MARK: Dialog
extension Color {
    struct Dialog {
        
        static let title = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        static let subtitle = StyleDictionaryColor.aliasTextColorSecondaryDark100.color

        struct InfoIcon {
            static let `default` = StyleDictionaryColor.globalSemanticInfo100.color
            static let alert = StyleDictionaryColor.globalSemanticAlert100.color
            static let warning = StyleDictionaryColor.globalSemanticWarning100.color
        }
        
        struct TextField {
            static let text = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        }
        
        struct Background {
            static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
    }
}

// MARK: Pagination
extension Color {
    struct Pagination {
        struct Background {
            static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        struct Button {
            struct Background {
                static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
                static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                static let active = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
            }
            
            struct Text {
                static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
                static let hover = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                static let active = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
        }
        
        struct Dots {
            static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
        }
    }
}
