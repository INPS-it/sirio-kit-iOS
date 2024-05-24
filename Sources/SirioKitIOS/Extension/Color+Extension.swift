//
// Color+Extension.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
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
    
    public struct TabBar {
        
        public static let background = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        
        public struct Item {
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                public static let selected = StyleDictionaryColor.aliasAppInteractivePrimaryActive.color
            }
            
            public struct Icon {
                public static let `default` = StyleDictionaryColor.aliasAppInteractiveSecondaryDefault.color
                public static let selected = StyleDictionaryColor.aliasAppInteractivePrimaryActive.color
            }
            public struct Indicator {
                public static let `default` = Color.clear
                public static let selected = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            }
        }
    }
}

// MARK: BADGE
extension Color {
    
    public struct Badge {
        public static let background = StyleDictionaryColor.globalSemanticAlert100.color
        public static let border = StyleDictionaryColor.globalPrimary000.color
    }
}

// MARK: FAB
extension Color {
    
    public struct Fab {
        
        public struct Icon {
            public struct Default {
                public static let light = StyleDictionaryColor.globalPrimary000.color
                public static let dark = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            }
        }
        
        public struct Background {
            public struct Default {
                public static let light = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let dark = StyleDictionaryColor.aliasAppInteractivePrimary000Default.color
            }
            
            public struct Hover {
                public static let light = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                public static let dark = StyleDictionaryColor.aliasInteractiveAccentHover.color
            }
            
            public struct Pressed {
                public static let light = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                public static let dark = StyleDictionaryColor.aliasInteractiveAccentDefault.color
            }
        }
    }
}

// MARK: APP NAVIGATION
extension Color {
    
    public struct AppNavigation {
        
        public struct Default { // App Navigation Default
            public struct Background {
                public static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                public static let dark = StyleDictionaryColor.aliasBackgroundColorPrimaryDark120.color
            }
            
            public struct Text {
                public static let light = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
                public static let dark = StyleDictionaryColor.aliasTextColorPrimaryLight50.color
            }
            
            public struct Item {
                
                public struct Icon {
                    public static let light = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                    public static let dark = StyleDictionaryColor.aliasInteractivePrimary000Default.color
                }
                
                public struct Background {
                    public static let light = StyleDictionaryColor.aliasOverlay15Secondary100.color
                    public static let dark = StyleDictionaryColor.aliasOverlay25Primary000.color
                }
                
                public struct Profile { // Item Profile
                    
                    public struct Background {
                        public static let light = StyleDictionaryColor.globalLightPrimary50.color
                        public static let dark = StyleDictionaryColor.globalDarkPrimary115.color
                    }
                    
                    public struct Text {
                        public static let light = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                        public static let dark = StyleDictionaryColor.aliasInteractivePrimary000Default.color
                    }
                }
            }
        }
        
        public struct Selection { // App Navigation Selection
            public struct Background {
                public static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryDark120.color
                public static let dark = StyleDictionaryColor.aliasAppInteractivePrimary000Default.color
            }
            
            public struct Text {
                public static let light = StyleDictionaryColor.aliasTextColorPrimaryLight50.color
                public static let dark = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
            }
            
            public struct Item {
                public struct Icon {
                    public static let light = StyleDictionaryColor.aliasAppInteractivePrimary000Default.color
                    public static let dark = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                }
            }
        }
        
        public struct Search { // App Navigation Search
            public static let background = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            
            public static let border = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            
            public static let text = StyleDictionaryColor.aliasAppInteractiveSecondaryDefault.color
            
            public struct Item {
                public static let icon = StyleDictionaryColor.aliasAppInteractiveSecondaryDefault.color
            }
        }
        
        public struct LogoInps {
            public static let light = StyleDictionaryColor.globalPrimary100.color
            public static let dark = StyleDictionaryColor.globalPrimary000.color
        }
    }
}

// MARK: Accordion
extension Color {
    public struct Accordion {
        
        public struct Background {
            public struct Default {
                public static let dark = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let light = StyleDictionaryColor.globalPrimary000.color
            }
            
            public struct Hover {
                public static let dark = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                public static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            }
            
            public struct Active {
                public static let dark = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                public static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            }
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            
        }
        
        public struct Border {
            public static let dark = Color.clear
            public static let light = StyleDictionaryColor.globalLightPrimary50.color
            public static let content = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
        }
        
        
        public struct Text {
            public static let dark = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            public static let light = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Icon {
            public static let dark = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            public static let light = StyleDictionaryColor.aliasTextColorPrimaryDark110.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
    }
}

// MARK: Chips
extension Color {
    
    public struct Chips {
        
        public struct Background {
            public static let activeDefault = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let activeHover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            public static let activePressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            public static let disactive = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        
        public struct Border {
            public static let disactiveDefault = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let disactiveHover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            public static let disactivePressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
        }
        
        public struct Text {
            public static let active = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            public static let disactiveDefault = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let disactiveHover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            public static let disactivePressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
        }
        
        public struct WithClose {
            
            public struct Background {
                public static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                public static let pressed = StyleDictionaryColor.aliasInteractiveSecondaryPressed.color
                public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            }
            
            public struct Icon {
                public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
            
            public struct Circle {
                
                public struct Background {
                    public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                    public static let pressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                }
                
                public struct Border {
                    public static let `default` = StyleDictionaryColor.globalMidPrimary70.color
                }
            }
        }
    }
}


// MARK: Tag
extension Color {
    public struct Tag {
        public struct Background {
            public static let gray =  StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            public static let blue =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let red =  StyleDictionaryColor.aliasInteractiveAlertDefault.color
            public static let orange =  StyleDictionaryColor.globalSemanticWarning80.color
            public static let green =  StyleDictionaryColor.globalSemanticSuccess100.color
            public static let white =  StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        
        public struct Text {
            public static let `default` =  StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            public static let secondary =  StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            public static let dark =  StyleDictionaryColor.aliasTextColorSecondaryDark130.color
        }
    }
}

// MARK: RadioButton
extension Color {
    
    public struct RadioButton {
        
        public struct Circle {
            public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
            public static let hover = StyleDictionaryColor.specificDataEntryBorderColorHover.color
            public static let checked = StyleDictionaryColor.specificDataEntryBorderColorValued.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Text {
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            public static let hover = StyleDictionaryColor.specificDataEntryLabelColorHover.color
            public static let checked = StyleDictionaryColor.specificDataEntryLabelColorValued.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
        }
        
        public struct Border {
            public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
            public static let hover = StyleDictionaryColor.specificDataEntryBorderColorHover.color
            public static let checked = StyleDictionaryColor.specificDataEntryBorderColorValued.color
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
        }
        
    }
}

// MARK: Checkbox
extension Color {
    
    public struct Checkbox {
        
        public struct Text {
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            public static let hover = StyleDictionaryColor.specificDataEntryLabelColorHover.color
            public static let checked = StyleDictionaryColor.specificDataEntryLabelColorValued.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Icon {
            public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
        }
        
        public struct Border {
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            public static let hover = StyleDictionaryColor.specificDataEntryLabelColorHover.color
            public static let checked = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
            public static let disabled = Color.clear
        }
        
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
        }
    }
}


// MARK: Toggle
extension Color {
    
    public struct Toggle {
        
        public struct Off {
            
            public struct Circle {
                public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
                public static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            public struct Border {
                public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
                public static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                public static let hover = StyleDictionaryColor.aliasInteractiveSecondaryHover.color
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            public struct Background {
                public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
        }
        
        public struct On {
            public struct Circle {
                public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            public struct Border {
                public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            public struct Background {
                public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
        }
    }
}


// MARK: Slider
extension Color {
    
    public struct Slider {
        
        public struct Line {
            public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            public static let pressed = StyleDictionaryColor.specificOptionBackgroundColorPressed.color
        }
        
        public struct Text {
            public static let title = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            public static let subtitle = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            public static let number = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        }
        
        public struct TextField {
            public struct Background {
                public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.specificDataEntryPlaceholderColorValued.color
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
        }
    }
}

// MARK: ProgressBar
extension Color {
    
    public struct ProgressBar {
        
        public struct Label {
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            
        }
        
        public struct Number {
            public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            
        }
        
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
            public static let gradient: [Color] = StyleDictionaryColor.specificProgressbarBackgroundColor.map({ $0.color })
        }
    }
}

// MARK: FileUpload
extension Color {
    public struct FileUpload {
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            public static let pressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
            public static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
        }
        
        public struct Label {
            public static let title = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            public static let subtitle = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            public static let button = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Icon {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
    }
}

// MARK: Button (SirioButton)
extension Color {
    
    public struct SirioButton {
        // MARK: Primary
        public struct Primary {
            
            public struct Background {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            public struct Icon {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            public struct Text {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
        
        // MARK: Secondary
        public struct Secondary {
            
            public struct Background {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractiveSecondaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractiveSecondaryPressed.color)
            }
            
            public struct Icon {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            public struct Text {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
        
        // MARK: Tertiary Light
        public struct TertiaryLight {
            
            public struct Background {
                public static let state: ColorState = .init(default: Color.clear,
                                                            disabled: Color.clear,
                                                            hover: Color.clear,
                                                            pressed: Color.clear)
            }
            
            public struct Border {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            public struct Icon {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            public struct Text {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
        }
        
        // MARK: Tertiary Dark
        public struct TertiaryDark {
            
            public struct Background {
                public static let state: ColorState = .init(default: Color.clear,
                                                            disabled: Color.clear,
                                                            hover: Color.clear,
                                                            pressed: Color.clear)
            }
            
            public struct Border {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAccentDefault.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractiveAccentHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractiveAccentPressed.color)
            }
            
            public struct Icon {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAccentDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractiveAccentHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractiveAccentPressed.color)
            }
            
            public struct Text {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAccentDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractiveAccentHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractiveAccentPressed.color)
            }
        }
        
        // MARK: Danger
        public struct Danger {
            
            public struct Background {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveAlertDefault.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractiveAlertHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractiveAlertPressed.color)
            }
            
            public struct Icon {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            public struct Text {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasTextColorPrimaryLight0.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
        
        // MARK: Ghost
        public struct Ghost {
            
            public struct Background {
                public static let state: ColorState = .init(default: Color.clear,
                                                            disabled: Color.clear,
                                                            hover: Color.clear,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
            }
            
            public struct Icon {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
            
            public struct Text {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractivePrimaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
            }
        }
    }
}

// MARK: Notification
extension Color {
    public struct Notification {
        public struct Inline {
            public struct Background {
                public static let `default` =  StyleDictionaryColor.globalDarkPrimary120.color
            }
            
            public struct Icon {
                public static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                
                public struct Container {
                    public static let alert = StyleDictionaryColor.globalSemanticAlert100.color
                    public static let info = StyleDictionaryColor.globalSemanticInfo100.color
                    public static let warning = StyleDictionaryColor.globalSemanticWarning100.color
                    public static let success = StyleDictionaryColor.globalSemanticSuccess100.color
                }
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            }
        }
        
        public struct Toast {
            public struct Background {
                public static let `default` =  StyleDictionaryColor.globalDarkPrimary120.color
            }
            
            public struct Icon {
                public static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                
                public struct Rectangle {
                    public static let alert = StyleDictionaryColor.globalSemanticAlert100.color
                    public static let info = StyleDictionaryColor.globalSemanticInfo100.color
                    public static let warning = StyleDictionaryColor.globalSemanticWarning100.color
                    public static let success = StyleDictionaryColor.globalSemanticSuccess100.color
                }
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                public static let link = StyleDictionaryColor.aliasInteractiveAccentDefault.color
            }
        }
    }
}

// MARK: SirioTextField
extension Color {
    public struct SirioTextField {
        
        public struct Text {
            public static let hover = StyleDictionaryColor.specificDataEntryPlaceholderColorHover.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            public static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            public static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            public static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            public static let placeholder = StyleDictionaryColor.specificDataEntryPlaceholderColorDefault.color
        }
        
        public struct Background {
            public static let `default` = Color.clear
        }
        
        public struct Border {
            public static let hover = StyleDictionaryColor.specificDataEntryBorderColorHover.color
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            public static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            public static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            public static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
        }
        
        public struct InfoIcon {
            public static let hover = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            public static let `default` = StyleDictionaryColor.globalSemanticInfo100.color
            public static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            public static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            public static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
        }
        
        public struct Icon {
            public static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            public static let warning = StyleDictionaryColor.specificDataEntryBorderColorWarning.color
            public static let alert = StyleDictionaryColor.specificDataEntryBorderColorError.color
            public static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
            public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
        }
    }
}

// MARK: Tab
extension Color {
    public struct Tab {
        public struct Rectangle {
            public struct Top {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryDefault.color)
            }
            
            public struct Bottom {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryDefault.color)
            }
            
            
        }
        
        public struct Text {
            public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                        disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                        hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                        pressed: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color)
        }
        
        public struct Icon {
            public static let state: ColorState = .init(default: StyleDictionaryColor.aliasTextColorPrimaryLight50.color,
                                                        disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                        hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                        pressed: StyleDictionaryColor.aliasInteractivePrimaryDefault.color)
        }
        
        public struct Background {
            
            public struct Top {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                            pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color)
            }
            
            public struct Bottom {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color,
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color,
                                                            hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                            pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color)
            }
            
        }
    }
}

// MARK: SearchBar
extension Color {
    public struct SearchBar {
        
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        
        public struct Text {
            public static let `default` = StyleDictionaryColor.specificDataEntryPlaceholderColorDefault.color
            public static let focused = StyleDictionaryColor.specificDataEntryLabelColorFocus.color
            public static let valued = StyleDictionaryColor.specificDataEntryLabelColorValued.color
        }
        
        public struct Button {
            public struct Icon {
                public static let clear = StyleDictionaryColor.globalPrimary100.color
                public static let search = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
            public struct Background {
                public static let search = StyleDictionaryColor.globalPrimary100.color
            }
        }
        
        public struct OptionValue {
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.specificDataEntryPlaceholderColorDefault.color
                public static let pressed = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            }
            
            public struct Background {
                public static let pressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
        }
        
        public struct Border {
            public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
            public static let focused = StyleDictionaryColor.specificDataEntryBorderColorFocus.color
            public static let valued = StyleDictionaryColor.specificDataEntryBorderColorValued.color
            
        }
    }
}

// MARK: Dialog
extension Color {
    public struct Dialog {
        
        public static let title = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        public static let subtitle = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        
        public struct InfoIcon {
            public static let `default` = StyleDictionaryColor.globalSemanticInfo100.color
            public static let alert = StyleDictionaryColor.globalSemanticAlert100.color
            public static let warning = StyleDictionaryColor.globalSemanticWarning100.color
        }
        
        public struct TextField {
            public static let text = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        }
        
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
    }
}

// MARK: Pagination
extension Color {
    public struct Pagination {
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        }
        public struct Button {
            public struct Background {
                public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
                public static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                public static let active = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
                public static let hover = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
                public static let active = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            }
        }
        
        public struct Dots {
            public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
        }
    }
}

// MARK: Card
extension Color {
    public struct Card {
        public struct Generic {
            public struct Text {
                public static let date = StyleDictionaryColor.globalSecondary100.color
            }
        }
        
        public struct Editorial {
            public struct Background {
                public static let `default` = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            }
            
            public struct Text {
                public static let title = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let subtitle = StyleDictionaryColor.globalSecondary100.color
                public static let body = StyleDictionaryColor.globalSecondary100.color
                public static let signature = StyleDictionaryColor.globalSecondary100.color
            }
            
            public struct Icon {
                public static let `default` = StyleDictionaryColor.globalSecondary100.color
            }
            
            public struct Item {
                public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            }
        }
        
        public struct Process {
            public struct Background {
                public static let light = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                public static let dark = StyleDictionaryColor.globalDarkPrimary120.color
            }
            
            public struct Text {
                
                public struct Date {
                    public static let light = StyleDictionaryColor.globalSecondary100.color
                    public static let dark = StyleDictionaryColor.globalLightPrimary40.color
                }
                
                public struct Title {
                    public static let light = StyleDictionaryColor.globalSecondary100.color
                    public static let dark = StyleDictionaryColor.globalLightPrimary40.color
                }
                
                public struct Body {
                    public static let light = StyleDictionaryColor.globalSecondary100.color
                    public static let dark = StyleDictionaryColor.globalLightPrimary40.color
                }
            }
            
            public struct Icon {
                public static let light = StyleDictionaryColor.globalSecondary100.color
                public static let dark = StyleDictionaryColor.globalLightPrimary40.color
            }
            
            public struct Item {
                public static let light = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let dark = StyleDictionaryColor.aliasInteractiveAccentDefault.color
            }
        }
    }
}
