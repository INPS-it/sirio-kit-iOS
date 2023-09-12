//
// Size.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

// Size Constants
public struct Size {
    
}

// MARK: Fab
extension Size {
    struct Fab {
        static let small: CGFloat = 40
        static let regular: CGFloat = 56
        
        struct IconLabel {
            static let frame: CGFloat = 16
            static let paddingLeading: CGFloat = 8
            static let paddingHorizontal: CGFloat = 42
            static let paddingVertical: CGFloat = 16
            static let cornerRadius: CGFloat = 27
        }
        
        struct OnlyIcon {
            static let frame: CGFloat = 22
            static let cornerRadius: CGFloat = 50
        }
    }
}

// MARK: Badge
extension Size {
    struct Badge {
        static let circleWhite: CGFloat = 8
        static let circleRed: CGFloat = 6
        static let border: CGFloat = 1.5
    }
}

// MARK: Tab Bar - Tab Bar Item
extension Size {
    
    struct TabBar {
        static let height: CGFloat = 49 // frame
        
        struct Item {
            
            // Both orientation
            struct Indicator {
                static let height: CGFloat = 3
            }
            
            struct Icon {
                static let frame: CGFloat = 22
            }
            
            // Landscape
            struct Landscape {
                static let width: CGFloat = 100
                static let height: CGFloat = 49
                
                struct Icon {
                    static let paddingTop: CGFloat = 16
                    static let paddingBottom: CGFloat = 14
                    static let paddingLeading: CGFloat = 24
                    static let paddingTrailing: CGFloat = 5
                }
                
                struct Text {
                    static let paddingTop: CGFloat = 19
                    static let paddingBottom: CGFloat = 18
                    static let paddingTrailing: CGFloat = 11
                }
            }
            
            // Portrait
            struct Portrait {
                static let width: CGFloat = 49
                static let height: CGFloat = 49
                
                struct Icon {
                    static let paddingTop: CGFloat = 4
                    static let paddingHorizontal: CGFloat = 13
                }
                
                struct Text {
                    static let paddingTop: CGFloat = 4
                    static let paddingBottom: CGFloat = 4
                }
            }
        }
    }
}


// MARK: App Navigation
extension Size {
    struct AppNavigation {
        
        static let height: CGFloat = 44
        static let paddingHorizontal: CGFloat = 8
        static let spacing: CGFloat = 16
        
        struct Item { // App Navigation Item
            static let icon: CGFloat = 24
            static let area: CGFloat = 38
        }
        
        struct LogoInps { // App Navigation Logo INPS
            static let maxWidth: CGFloat = 38
            static let maxHeight: CGFloat = 30
        }
        
        struct LogoInps125 { // App Navigation Logo INPS 125
            static let maxWidth: CGFloat = 90
            static let maxHeight: CGFloat = 32
        }
        
        struct LongTitle { // App Navigation Long/Big Title
            static let height: CGFloat = 48
            static let textHeight: CGFloat = 54
        }
        
        struct BigTitle {
            static let height: CGFloat = 48
            static let textHeight: CGFloat = 54
        }
        
        struct Search { // App Navigation Search
            static let height: CGFloat = 32
            static let border: CGFloat = 6
            static let item: CGFloat = 16
            static let paddingHorizontal: CGFloat = 16
        }
        
        struct Badge {
            static let paddingTop: CGFloat = 3
            static let paddingTrailing: CGFloat = 1
        }
    }
}

// MARK: Tag
extension Size {
    
    struct Tag {
        static let paddingHorizontal: CGFloat = 16
        static let paddingVertical: CGFloat = 4
        static let cornerRadius: CGFloat = 100
    }
}

// MARK: Accordion
extension Size {
    struct Accordion {
        static let borderWidth: CGFloat = 1
        static let sectionHeight: CGFloat = 64
        static let paddingHorizontal: CGFloat = 16
        static let paddingContent: CGFloat = 16
        
        struct Icon {
            static let frame: CGFloat = 16
        }
    }
}

// MARK: Chips
extension Size {
    struct Chips {
        static let height: CGFloat = 32
        static let borderWidth: CGFloat = 2
        static let paddingVertical: CGFloat = 4
        static let paddingHorizontal: CGFloat = 16
        static let paddingLeading: CGFloat = 16
        static let paddingTrailing: CGFloat = 4
        static let cornerRadius: CGFloat = 100
        static let cornerRadiusOverlay: CGFloat = 25
        
        struct Icon {
            static let frame: CGFloat = 16
        }
        
        struct Close {
            struct Icon {
                static let frame: CGFloat = 14
                static let padding: CGFloat = 5
            }
            
            struct Button {
                static let frame: CGFloat = 24
                
            }
        }
    }
}

// MARK: RadioButton
extension Size {
    struct RadioButton {
        static let padding: CGFloat = 0
        static let touchArea: CGFloat = 44
        static let circleDefault: CGFloat = 24
        static let circleChecked: CGFloat = 14
        static let border: CGFloat = 1
    }
}

// MARK: Checkbox
extension Size {
    struct Checkbox {
        static let padding: CGFloat = 0
        static let touchArea: CGFloat = 44
        static let frameDefault: CGFloat = 24
        static let frameChecked: CGFloat = 14
        static let border: CGFloat = 1
        static let cornerRadius: CGFloat = 4
    }
}

// MARK: Toggle
extension Size {
    struct Toggle {
        
        static let spacing: CGFloat = 12
        static let horizontalTouchArea: CGFloat = 44
        static let verticalTouchArea: CGFloat = 44
        static let cornerRadius: CGFloat = 16
        static let width: CGFloat = 54
        static let height: CGFloat = 26
        static let border: CGFloat = 1
        static let circle: CGFloat = 18
        static let circleOffset: CGFloat = 14
    }
}

// MARK: Slider
extension Size {
    struct Slider {
        static let horizontalSpacing: CGFloat = 10
        static let spacingVertical: CGFloat = 6
        
        struct TextField {
            static let width: CGFloat = 60
            static let height: CGFloat = 48
            static let border: CGFloat = 1
            static let cornerRadius: CGFloat = 4
        }
    }
}

// MARK: ProgressBar
extension Size {
    struct ProgressBar {
        static let height: CGFloat = 9
        static let gradientHeight: CGFloat = 6
        static let paddingHorizontal: CGFloat = 2
        static let offset: CGFloat = 1.5
        static let padding: CGFloat = 4
    }
}

// MARK: FileUpload
extension Size {
    struct FileUpload {
        static let paddingHorizontal: CGFloat = 42
        static let paddingVertical: CGFloat = 16
        static let padding: CGFloat = 8
        static let cornerRadius: CGFloat = 4
        static let spacing: CGFloat = 8
        
        struct Icon {
            static let frame: CGFloat = 16
            //static let paddingLeading: CGFloat = 8
        }
    }
}

// MARK: Button (SirioButton)
extension Size {
    struct Button {
        static let padding: CGFloat = 8
        
        struct Large {
            struct Icon {
                static let frame: CGFloat = 16
                static let paddingHorizontal: CGFloat = 17
                static let paddingVertical: CGFloat = 16
            }
            
            struct TextIcon {
                static let frame: CGFloat = 16
                static let paddingHorizontal: CGFloat = 42
                static let paddingVertical: CGFloat = 16
            }
            
            struct Text {
                static let frame: CGFloat = 16
                static let paddingHorizontal: CGFloat = 42
                static let paddingVertical: CGFloat = 16
            }
        }
        
        struct Medium {
            struct Icon {
                static let frame: CGFloat = 16
                static let paddingHorizontal: CGFloat = 13
                static let paddingVertical: CGFloat = 12
            }
            
            struct TextIcon {
                static let frame: CGFloat = 16
                static let paddingHorizontal: CGFloat = 40
                static let paddingVertical: CGFloat = 12
            }
            
            struct Text {
                static let frame: CGFloat = 16
                static let paddingHorizontal: CGFloat = 40
                static let paddingVertical: CGFloat = 12
            }
        }
        
        struct Small {
            struct Icon {
                static let frame: CGFloat = 12
                static let paddingHorizontal: CGFloat = 10
                static let paddingVertical: CGFloat = 10
            }
            
            struct TextIcon {
                static let frame: CGFloat = 12
                static let paddingHorizontal: CGFloat = 24
                static let paddingVertical: CGFloat = 8
            }
            
            struct Text {
                static let frame: CGFloat = 12
                static let paddingHorizontal: CGFloat = 24
                static let paddingVertical: CGFloat = 8
            }
        }
        
        struct Border {
            static let cornerRadius: CGFloat = 4
            static let width: CGFloat = 2
        }
    }
}

// MARK: Notification Inline & Toast
extension Size {
    struct Notification {
        
        struct Inline {
            static let heigth: CGFloat = 68
            static let spacingVertical: CGFloat = 4
            static let paddingVertical: CGFloat = 8
            static let paddingHorizontal: CGFloat = 16
            
            struct Icon {
                
                struct Left {
                    static let frame: CGFloat = 24
                    static let containerHeight: CGFloat = 68
                    static let containerWidth: CGFloat = 68
                }
                
                struct Right {
                    static let frame: CGFloat = 14
                }
            }
        }
        
        struct Toast {
            static let paddingVertical: CGFloat = 26
            static let paddingHorizontal: CGFloat = 24
            static let spacing: CGFloat = 0
            
            
            struct Rectangle {
                static let frame: CGFloat = 18
            }
            
            struct Icon {
                struct Left {
                    static let frame: CGFloat = 24
                }
                
                struct Right {
                    static let frame: CGFloat = 14
                }
            }
            
            struct Text {
                static let paddingTitleTop: CGFloat = 24
                static let paddingSubtitleTop: CGFloat = 8
                static let paddingButtonTop: CGFloat = 24
                
            }
        }
    }
}

// MARK: SirioTextField
extension Size {
    struct SirioTextField {
        static let spacing: CGFloat = 8
        
        static let paddingHorizontal: CGFloat = 16
        static let height: CGFloat = 48
        static let cornerRadius: CGFloat = 4
        static let borderWidth: CGFloat = 1
        
        struct Icon {
            static let frame1: CGFloat = 14
            static let frame2: CGFloat = 16
        }
    }
}

// MARK: Tab
extension Size {
    struct Tab {
        
        static let spacingVertical: CGFloat = 0
        static let spacingHorizontal: CGFloat = 8
        static let spacingHorizontalGroupTop: CGFloat = 2
        static let spacingHorizontalGroupBottom: CGFloat = 0
        static let paddingHorizontal: CGFloat = 32
        static let paddingHorizontalWithIcon: CGFloat = 20
        static let height: CGFloat = 44
        
        struct Rectangle {
            static let height: CGFloat = 4
            static let cornerRadius: CGFloat = 0
        }
        
        struct Icon {
            static let frame: CGFloat = 16
        }
    }
}

// MARK: SearchBar
extension Size {
    struct SearchBar {
        static let height: CGFloat = 48
        static let spacingVertical: CGFloat = 8
        static let spacingHorizontal: CGFloat = 16
        static let paddingLeading: CGFloat = 16
        static let cornerRadius: CGFloat = 4
        static let lineWidth: CGFloat = 1
        
        struct Icon {
            static let frame: CGFloat = 16
        }
        
        struct ButtonSearch {
            static let height: CGFloat = 48
            static let width: CGFloat = 50
        }
        
        struct Chips {
            static let padding: CGFloat = 8
        }
        
        struct Options {
            static let spacing: CGFloat = 0
            static let paddingHorizontal: CGFloat = 15
            static let paddingVertical: CGFloat = 16
            static let maxHeight: CGFloat = 194
        }
    }
}

// MARK: Dialog
extension Size {
    struct Dialog {
        static let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.80 // 80% of the screen
        static let noSpacing: CGFloat = 0
        static let spacing: CGFloat = 16
        static let padding: CGFloat = 24
        static let cornerRadius: CGFloat = 16
        
        struct InfoIcon {
            static let frame: CGFloat = 24
        }
    }
}

// MARK: Pagination
extension Size {
    struct Pagination {
        static let spacing: CGFloat = 0
        static let paddingHorizontal: CGFloat = 8
        static let height: CGFloat = 74
        
        struct Button {
            static let width: CGFloat = 38
            static let height: CGFloat = 44
            static let cornerRadius: CGFloat = 4
        }
        
        struct Dots {
            static let height: CGFloat = 44
            static let width: CGFloat = 48
        }
    }
}

// MARK: Card
extension Size {
    struct Card {
        struct Editorial {
            static let spacing: CGFloat = 16
            static let paddingHorizontal: CGFloat = 16
            static let paddingBottom: CGFloat = 16
            static let paddingTop: CGFloat = 24
            static let spacingItems: CGFloat = 60
            static let cornerRadius: CGFloat = 4
            static let imageHeight: CGFloat = 220

            struct Item {
                static let width: CGFloat = 16
                static let height: CGFloat = 16
            }
            
            struct Icon {
                static let width: CGFloat = 32
                static let height: CGFloat = 32
            }
        }
        
        struct Process {
            static let spacing: CGFloat = 16
            static let paddingVertical: CGFloat = 16
            static let paddingHorizontal: CGFloat = 16
            static let titleHeight: CGFloat = 74
            static let bodyHeight: CGFloat = 98
            static let cornerRadius: CGFloat = 4
            
            struct Item {
                static let width: CGFloat = 16
                static let height: CGFloat = 16
            }
            
            struct Icon {
                static let width: CGFloat = 32
                static let height: CGFloat = 32
            }
        }
    }
}
