//
// Color+Extension.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
                public static let `default` = StyleDictionaryColor.globalPrimary000.color
                public static let selected = Color.aliasInteractivePrimaryDefault
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
                public static let dark = StyleDictionaryColor.globalDarkPrimary120.color
            }
        }
        
        public struct Text {
            public struct Default {
                public static let light = StyleDictionaryColor.globalPrimary000.color
                public static let dark = StyleDictionaryColor.globalDarkPrimary120.color
            }
        }
        
        public struct Background {
            public struct Default {
                public static let light = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let dark = StyleDictionaryColor.aliasAppInteractivePrimary000Default.color
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

// MARK: NEW APP NAVIGATION
extension Color {
    
    public struct NewAppNavigation {
        
        public struct Default { // App Navigation Default
            public struct Background {
                public static let light = Color.aliasBackgroundColorPrimaryLight0
                public static let dark = Color.aliasBackgroundColorPrimaryDark120
            }
            
            public struct Text {
                public static let light = Color.aliasTextColorPrimaryDark110
                public static let dark = Color.aliasTextColorPrimaryLight50
            }
            
            public struct Item {
                
                public struct Icon {
                    public static let light = Color.aliasInteractiveSecondaryDefault
                    public static let dark = Color.aliasInteractivePrimary000Default
                }
                
                public struct Background {
                    public static let light = Color.aliasOverlay15Secondary100
                    public static let dark = Color.aliasOverlay25Primary000
                }
                
                public struct Profile { // Item Profile
                    
                    public struct Background {
                        public static let light = Color.globalLightPrimary50
                        public static let dark = Color.globalDarkPrimary115
                    }
                    
                    public struct Text {
                        public static let light = Color.aliasInteractivePrimaryDefault
                        public static let dark = Color.aliasInteractivePrimary000Default
                    }
                }
            }
        }
        
        public struct Selection { // App Navigation Selection
            public struct Background {
                public static let light = Color.aliasBackgroundColorPrimaryDark120
                public static let dark = Color.aliasAppInteractivePrimary000Default
            }
            
            public struct Text {
                public static let light = Color.aliasTextColorPrimaryLight50
                public static let dark = Color.aliasTextColorPrimaryDark110
            }
            
            public struct Item {
                public struct Icon {
                    public static let light = Color.aliasAppInteractivePrimary000Default
                    public static let dark = Color.aliasInteractivePrimaryDefault
                }
            }
        }
        
        public struct Search { // App Navigation Search
            public static let background = Color.aliasBackgroundColorPrimaryLight0
            
            public static let border = Color.aliasBackgroundColorPrimaryLight40
            
            public static let text = Color.aliasAppInteractiveSecondaryDefault
            
            public struct Item {
                public static let icon = Color.aliasAppInteractiveSecondaryDefault
            }
        }
        
        public struct LogoInps {
            public static let light = Color.globalPrimary100
            public static let dark = Color.globalPrimary000
        }
        
        public struct Function {
            public struct Text {
                public static let light = Color.aliasTextColorPrimaryDark110
                public static let dark = Color.aliasTextColorPrimaryLight50
            }
            
            public struct Background {
                public static let light = Color.aliasBackgroundColorPrimaryLight0
                public static let dark = Color.aliasBackgroundColorPrimaryDark120
            }
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
        
        public struct Icon {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
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

// MARK: RadioButton
extension Color {
    
    public struct RadioButton {
        
        public struct Circle {
            public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
            public static let checked = StyleDictionaryColor.specificDataEntryBorderColorValued.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Text {
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
            public static let checked = StyleDictionaryColor.specificDataEntryLabelColorValued.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
        }
        
        public struct Border {
            public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
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
            public static let checked = StyleDictionaryColor.specificDataEntryLabelColorValued.color
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
        }
        
        public struct Icon {
            public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
        }
        
        public struct Border {
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
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
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            public struct Border {
                public static let `default` = StyleDictionaryColor.specificDataEntryBorderColorDefault.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
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
                public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            }
            
            public struct Border {
                public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            }
            
            public struct Text {
                public static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
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
                                                            disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
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
            public static let disabled = Color.aliasTextColorDisabled
            public static let warning = Color.specificDataEntryLabelColorWarning
            public static let alert = Color.specificDataEntryLabelColorAlert
            public static let success = Color.specificDataEntryLabelColorSuccess
            public static let `default` = Color.specificDataEntryLabelColorDefault
            public static let placeholder = Color.specificDataEntryPlaceholderColorDefault
        }
        
        public struct Background {
            public static let `default` = Color.aliasBackgroundColorPrimaryLight0
            public static let disabled = Color.aliasBackgroundColorDisabled
        }
        
        public struct Border {
            public static let disabled = Color.aliasBackgroundColorDisabled
            public static let warning = Color.specificDataEntryBorderColorWarning
            public static let alert = Color.specificDataEntryBorderColorAlert
            public static let success = Color.specificDataEntryBorderColorSuccess
            public static let `default` = Color.specificDataEntryBorderColorDefault
        }
        
        public struct InfoIcon {
            public static let disabled = Color.aliasTextColorDisabled
            public static let `default` = Color.globalSemanticInfo100
            public static let warning = Color.specificDataEntryBorderColorWarning
            public static let alert = Color.globalSemanticAlert100
            public static let success = Color.specificDataEntryBorderColorSuccess
        }
        
        public struct Icon {
            public static let disabled = Color.aliasTextColorDisabled
            public static let warning = Color.specificDataEntryBorderColorWarning
            public static let alert = Color.globalSemanticAlert100
            public static let success = Color.specificDataEntryBorderColorSuccess
            public static let `default` = Color.aliasInteractiveSecondaryDefault
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

// MARK: SirioTextArea
extension Color {
    public struct SirioTextArea {
        
        public struct Text {
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            public static let error = StyleDictionaryColor.specificDataEntryLabelColorAlert.color
            public static let success = StyleDictionaryColor.specificDataEntryLabelColorSuccess.color
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorValued.color
            public static let placeholder = StyleDictionaryColor.specificDataEntryPlaceholderColorDefault.color
        }
        
        public struct Background {
            public static let `default` = Color.clear
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
        }
        
        public struct Border {
            public static let disabled = StyleDictionaryColor.aliasBackgroundColorDisabled.color
            public static let error = StyleDictionaryColor.specificDataEntryBorderColorAlert.color
            public static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
        }
        
        public struct InfoIcon {
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            public static let `default` = StyleDictionaryColor.globalSemanticInfo100.color
            public static let error = StyleDictionaryColor.globalSemanticAlert100.color
            public static let success = StyleDictionaryColor.specificDataEntryBorderColorSuccess.color
        }
        
        public struct Icon {
            public static let disabled = StyleDictionaryColor.aliasTextColorDisabled.color
            public static let error = StyleDictionaryColor.globalSemanticAlert100.color
            public static let success = StyleDictionaryColor.globalSemanticSuccess100.color
            public static let `default` = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
        }
    }
}

// MARK: Hero
extension Color {
    public struct Hero {
        public static let title = StyleDictionaryColor.globalDarkPrimary115.color
        public static let subtitle = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        public static let text = StyleDictionaryColor.aliasTextColorSecondaryDark100.color
        public static let background = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
        public static let divider = StyleDictionaryColor.aliasTextColorPrimaryLight50.color
    }
}

// MARK: Carousel
extension Color {
    public struct Carousel {
        public struct Dot {
            public static let selected = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let unselected = StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
        }
        
        public struct Background {
            public static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            public static let medium = StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color
        }
    }
}

// MARK: Avviso
extension Color {
    
    public struct Avviso {
        public static let icon =  SirioFoundationColor.globalSemanticInfo100.color
        public static let title =  SirioFoundationColor.aliasTextColorSecondaryDark100.color
        public static let text =  SirioFoundationColor.aliasTextColorSecondaryDark100.color
        public static let link =  SirioFoundationColor.aliasInteractivePrimaryDefault.color
        public static let background =  SirioFoundationColor.globalLightPrimary40.color
    }
}


// MARK: TitleBar
extension Color {
    
    public struct TitleBar {
        
        public struct Text {
            public static let dark =  StyleDictionaryColor.globalPrimary000.color
            public static let light =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
        }
        
        public struct Icon {
            public static let dark =  StyleDictionaryColor.aliasInteractivePrimary000Default.color
            public static let light =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
        }
        
        public struct Background {
            public static let dark =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let light =  StyleDictionaryColor.globalLightPrimary40.color
        }
    }
}

// MARK: Table - Header
extension Color {
    
    public struct Table {
        public struct Header {
            public struct Icon {
                public static let dark =  StyleDictionaryColor.globalAccent100.color
                public static let light =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            }
            
            public struct Title {
                public static let dark =  StyleDictionaryColor.globalLightPrimary40.color
                public static let light =  StyleDictionaryColor.aliasInteractiveSecondaryDefault.color
            }
            
            public struct Background {
                public static let dark =  StyleDictionaryColor.aliasBackgroundColorPrimaryDark115.color
                public static let light =  StyleDictionaryColor.globalLightPrimary40.color
            }
            
            public static let border =  StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color
            public static let scroll =  StyleDictionaryColor.aliasInteractiveAccentDefault.color

        }
        
        public struct Cell {
            public static let text =  StyleDictionaryColor.aliasTextColorSecondaryDark100.color
            public static let link =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let icon =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let background =  StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            public static let border =  StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color
            public static let scroll =  StyleDictionaryColor.aliasInteractiveAccentDefault.color
        }
        
        public struct Drawer {
            
            public struct Header {
                public static let icon = StyleDictionaryColor.aliasTextColorPrimary100.color
                public static let title =  StyleDictionaryColor.aliasTextColorPrimary100.color
            }
            
            public struct Item {
                public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
                public static let link =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                public static let line =  StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color
            }
            
        }
        
        public struct BottomBar {             
            public static let text = StyleDictionaryColor.aliasTextColorPrimaryLight0.color
            public static let icon = StyleDictionaryColor.aliasInteractivePrimary000Default.color
            public static let background = StyleDictionaryColor.globalPrimary100.color

        }
    }
}

// MARK: Menu Spalla
extension Color {
    public struct MenuSpalla {
        public struct Drawer {
            public struct Item {
                public struct Background {
                    static let `default` = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
                    static let hover = StyleDictionaryColor.aliasInteractivePrimaryHover.color
                    static let pressed = StyleDictionaryColor.aliasInteractivePrimaryPressed.color
                }
                public static let text =  StyleDictionaryColor.aliasTextColorPrimaryLight0.color
                public static let icon =  StyleDictionaryColor.aliasInteractivePrimary000Default.color

            }
            public struct ItemInfo {
                public static let text =  StyleDictionaryColor.aliasTextColorPrimaryDark110.color
                public static let icon =  StyleDictionaryColor.aliasTextColorPrimaryDark110.color
                public static let background =  StyleDictionaryColor.aliasTextColorPrimaryLight50.color

            }
        }
        public struct Item {
            
            public struct PrimoLivello {
                public struct Text {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                                disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                                pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                }
                
                public struct Background {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color,
                                                                pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color)
                }
                
                public struct VLine {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                                pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                }
                
                public struct HLine {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight60.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight60.color,
                                                                pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight60.color)
                }
                
                public struct Icon {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                                disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                                pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                }
            }
            
            public struct SecondoLivello {
                public struct Text {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                                disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                                pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                }
                
                public struct Background {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                                pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color)
                }
                
                public struct VLine {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                                pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                }
                
                public struct HLine {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight60.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight60.color,
                                                                pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color)
                }
                
                public struct Icon {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                                disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                                pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                }
            }
            
            public struct TerzoLivello {
                public static let state: ColorState = .init(default: StyleDictionaryColor.aliasInteractiveSecondaryDefault.color,
                                                            disabled: StyleDictionaryColor.aliasTextColorDisabled.color,
                                                            hover: StyleDictionaryColor.aliasInteractivePrimaryHover.color,
                                                            pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                
                public struct Background {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                                pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color)
                }
                
                public struct VLine {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight40.color,
                                                                pressed: StyleDictionaryColor.aliasInteractivePrimaryPressed.color)
                }
                
                public struct HLine {
                    public static let state: ColorState = .init(default: StyleDictionaryColor.aliasBackgroundColorPrimaryLight60.color,
                                                                disabled: StyleDictionaryColor.aliasBackgroundColorDisabled.color,
                                                                hover: StyleDictionaryColor.aliasBackgroundColorPrimaryLight60.color,
                                                                pressed: StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color)
                }
            }
        }
        
        public struct TitleSection {
            public static let text = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let line = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
        }
    }
}

// MARK: SIRIO FILTRI
extension Color {
    public struct Filtri {
        public struct Background {
            public static let `default` = StyleDictionaryColor.aliasBackgroundColorPrimaryLight0.color
            public static let light = StyleDictionaryColor.aliasBackgroundColorPrimaryLight50.color
        }
        
        public struct Text {
            public static let `default` = StyleDictionaryColor.specificDataEntryLabelColorDefault.color
        }
        
        public struct Icon {
            public static let `default` = StyleDictionaryColor.globalSemanticInfo100.color
        }
        
        
        public struct Header {
            public static let icon = StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            public static let text = StyleDictionaryColor.globalDarkPrimary115.color
        }
        
        public struct TitleBar {
            
            public struct Text {
                public static let dark =  StyleDictionaryColor.globalPrimary000.color
            }
            
            public struct Icon {
                public static let dark =  StyleDictionaryColor.aliasInteractivePrimary000Default.color
            }
            
            public struct Background {
                public static let dark =  StyleDictionaryColor.aliasInteractivePrimaryDefault.color
            }
        }
    }
}

// MARK: Step Progress Bar
extension Color {
    public struct StepProgressBar {
        public static let background =  Color.globalLightPrimary40

        struct Step {
            public static let interactive =  Color.specificDataEntryLabelColorDefault
            public static let `default` =  Color.specificDataEntryLabelColorDefault
            public static let done =  Color.aliasInteractivePrimaryDefault
            public static let background =  Color.aliasBackgroundColorPrimaryLight40
            public static let bar =  Color.aliasBackgroundColorDisabled
            
        }
        
        struct StepControls {
            public static let optionBackground =  Color.aliasBackgroundColorPrimaryLight0
            public static let optionBorder =  Color.specificDataEntryBorderColorDefault
        }
        
        struct StepPoint {
            struct Circle {
                public static let todo =  Color.aliasInteractivePrimaryDefault
                public static let done =  Color.aliasInteractiveSuccessDefault
                public static let error =  Color.aliasInteractiveAlertDefault
                public static let warning =  Color.aliasInteractiveWarningDefault
                public static let inactive =  Color.aliasBackgroundColorDisabled

            }
           
            
            struct TextIcon {
                public static let todo =  Color.aliasAppInteractivePrimary000Default
                public static let done =  Color.globalLightPrimary40
                public static let error =  Color.globalLightPrimary40
                public static let warning =  Color.globalLightPrimary40
                public static let inactive =  Color.aliasTextColorDisabled
            }
        }
        
        struct StepSelection {
            public static let text1 =  Color.globalSecondary100
            public static let text2 =  Color.aliasInteractivePrimaryDefault
            public static let icon =  Color.aliasInteractivePrimaryDefault
            public static let background =  Color.aliasBackgroundColorPrimaryLight40

        }
    }
}

// MARK: Segmented Controls
extension Color {
    public struct SegmentedControls {
        
        static let background: Color = Color.aliasBackgroundColorPrimaryLight40
        static let border: Color = Color.globalMidPrimary70
        static let backgroundDivider: Color = Color.aliasBackgroundColorSecondaryLight50

        
        struct Button {
            struct Icon {
                static let `default`: Color = Color.aliasTextColorDisabled
                static let selected: Color = Color.aliasAppInteractivePrimary000Default
            }
            
            struct Text {
                static let `default`: Color = Color.aliasTextColorDisabled
                static let selected: Color = Color.aliasAppInteractivePrimary000Default
            }
            
            struct Background {
                static let `default`: Color = Color.aliasBackgroundColorPrimaryLight40
                static let selected: Color = Color.aliasInteractivePrimaryDefault
            }
        }
    }
}

// MARK: SirioTag
extension Color {
    public struct Tag {
        public struct Background {
            public static let gray =  Color.aliasInteractiveSecondaryDefault
            public static let blue =  Color.aliasInteractivePrimaryDefault
            public static let red =  Color.aliasInteractiveAlertDefault
            public static let orange =  Color.globalSemanticWarning80
            public static let green =  Color.globalSemanticSuccess100
            public static let white =  Color.aliasBackgroundColorPrimaryLight0
        }
        
        public struct Text {
            public static let `default` =  Color.aliasTextColorPrimaryLight0
            public static let secondary =  Color.aliasInteractiveSecondaryDefault
            public static let dark =  Color.aliasTextColorSecondaryDark130
        }
    }
}

// MARK: NewChips
extension Color {
    public struct NewChips {
        public struct Background {
            public static let `default` = Color.aliasInteractiveSecondaryDefault
            public static let pressed = Color.aliasInteractiveSecondaryPressed
            public static let disabled = Color.aliasBackgroundColorDisabled
        }
        
        public struct Text {
            public static let `default` = Color.aliasTextColorPrimaryLight0
            public static let pressed = Color.aliasTextColorPrimaryLight0
            public static let disabled = Color.aliasTextColorDisabled
        }
        
        public struct Icon {
            public static let `default` = Color.aliasTextColorPrimaryLight0
            public static let pressed = Color.aliasTextColorPrimaryLight0
            public static let disabled = Color.aliasTextColorDisabled
        }
        
        public struct Close {
            public struct Icon {
                public static let `default` = Color.aliasTextColorPrimaryLight0
                public static let pressed = Color.aliasTextColorPrimaryLight0
                public static let disabled = Color.aliasInteractiveSecondaryPressed
            }
            public struct Background {
                public static let `default` = Color.aliasInteractivePrimaryDefault
                public static let pressed = Color.aliasInteractivePrimaryPressed
                public static let disabled = Color.clear
            }
            public struct Border {
                public static let `default` = Color.globalMidPrimary70
                public static let pressed = Color.globalMidPrimary70
                public static let disabled = Color.clear
            }
        }
        
        
        public struct Selection {
            public struct Icon {
                public static let `default` = Color.aliasBackgroundColorPrimaryLight0
                public static let pressed = Color.aliasBackgroundColorPrimaryLight0
                public static let disabled = Color.aliasTextColorDisabled
            }
            
            public struct Text {
                struct Selected {
                    public static let `default` = Color.aliasTextColorPrimaryLight0
                    public static let pressed = Color.aliasTextColorPrimaryLight0
                    public static let disabled = Color.aliasTextColorDisabled
                }
                
                struct Unselected {
                    public static let `default` = Color.aliasInteractivePrimaryDefault
                    public static let pressed = Color.aliasInteractivePrimaryPressed
                    public static let disabled = Color.aliasTextColorDisabled
                }
            }
            
            public struct Background {
                struct Selected {
                    public static let `default` = Color.aliasInteractivePrimaryDefault
                    public static let pressed = Color.aliasInteractivePrimaryPressed
                    public static let disabled = Color.aliasBackgroundColorDisabled
                }
                
                struct Unselected {
                    public static let `default` = Color.clear
                }
            }
            
            public struct Border {
                public static let `default` = Color.aliasInteractivePrimaryDefault
                public static let pressed = Color.aliasInteractivePrimaryPressed
                public static let disabled = Color.aliasTextColorDisabled
            }
        }
    }
}

