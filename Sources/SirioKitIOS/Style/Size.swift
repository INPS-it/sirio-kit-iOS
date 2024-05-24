//
// Size.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

// Size Constants
public struct Size {
    
}

// MARK: Fab
extension Size {
    public struct Fab {
        public static let small: CGFloat = 40
        public static let regular: CGFloat = 56
        
        public struct IconLabel {
            public static let frame: CGFloat = 16
            public static let paddingLeading: CGFloat = 8
            public static let paddingHorizontal: CGFloat = 42
            public static let paddingVertical: CGFloat = 16
            public static let cornerRadius: CGFloat = 27
        }
        
        public struct OnlyIcon {
            public static let frame: CGFloat = 22
            public static let cornerRadius: CGFloat = 50
        }
    }
}

// MARK: Badge
extension Size {
    public struct Badge {
        public static let circleWhite: CGFloat = 8
        public static let circleRed: CGFloat = 6
        public static let border: CGFloat = 1.5
    }
}

// MARK: Tab Bar - Tab Bar Item
extension Size {
    
    public struct TabBar {
        public static let height: CGFloat = 49 // frame
        
        public struct Item {
            
            // Both orientation
            public struct Indicator {
                public static let height: CGFloat = 3
            }
            
            public struct Icon {
                public static let frame: CGFloat = 22
            }
            
            // Landscape
            public struct Landscape {
                public static let width: CGFloat = 100
                public static let height: CGFloat = 49
                
                public struct Icon {
                    public static let paddingTop: CGFloat = 16
                    public static let paddingBottom: CGFloat = 14
                    public static let paddingLeading: CGFloat = 24
                    public static let paddingTrailing: CGFloat = 5
                }
                
                public struct Text {
                    public static let paddingTop: CGFloat = 19
                    public static let paddingBottom: CGFloat = 18
                    public static let paddingTrailing: CGFloat = 11
                }
            }
            
            // Portrait
            public struct Portrait {
                public static let width: CGFloat = 49
                public static let height: CGFloat = 49
                
                public struct Icon {
                    public static let paddingTop: CGFloat = 4
                    public static let paddingHorizontal: CGFloat = 13
                }
                
                public struct Text {
                    public static let paddingTop: CGFloat = 4
                    public static let paddingBottom: CGFloat = 4
                }
            }
        }
    }
}


// MARK: App Navigation
extension Size {
    public struct AppNavigation {
        
        public static let height: CGFloat = 44
        public static let paddingHorizontal: CGFloat = 8
        public static let spacing: CGFloat = 16
        
        public struct Item { // App Navigation Item
            public static let icon: CGFloat = 24
            public static let area: CGFloat = 38
        }
        
        public struct LogoInps { // App Navigation Logo INPS
            public static let maxWidth: CGFloat = 108
            public static let maxHeight: CGFloat = 39
        }
        
        public struct LongTitle { // App Navigation Long/Big Title
            public static let height: CGFloat = 48
            public static let textHeight: CGFloat = 54
        }
        
        public struct BigTitle {
            public static let height: CGFloat = 48
            public static let textHeight: CGFloat = 54
        }
        
        public struct Search { // App Navigation Search
            public static let height: CGFloat = 32
            public static let border: CGFloat = 6
            public static let item: CGFloat = 16
            public static let paddingHorizontal: CGFloat = 16
        }
        
        public struct Badge {
            public static let paddingTop: CGFloat = 3
            public static let paddingTrailing: CGFloat = 1
        }
    }
}

// MARK: Tag
extension Size {
    
    public struct Tag {
        public static let paddingHorizontal: CGFloat = 16
        public static let paddingVertical: CGFloat = 4
        public static let cornerRadius: CGFloat = 100
    }
}

// MARK: Accordion
extension Size {
    public struct Accordion {
        public static let borderWidth: CGFloat = 1
        public static let sectionHeight: CGFloat = 64
        public static let paddingHorizontal: CGFloat = 16
        public static let paddingContent: CGFloat = 16
        
        public struct Icon {
            public static let frame: CGFloat = 16
        }
    }
}

// MARK: Chips
extension Size {
    public struct Chips {
        public static let height: CGFloat = 32
        public static let borderWidth: CGFloat = 2
        public static let paddingVertical: CGFloat = 4
        public static let paddingHorizontal: CGFloat = 16
        public static let paddingLeading: CGFloat = 16
        public static let paddingTrailing: CGFloat = 4
        public static let cornerRadius: CGFloat = 100
        public static let cornerRadiusOverlay: CGFloat = 25
        
        public struct Icon {
            public static let frame: CGFloat = 16
        }
        
        public struct Close {
            public struct Icon {
                public static let frame: CGFloat = 14
                public static let padding: CGFloat = 5
            }
            
            public struct Button {
                public static let frame: CGFloat = 24
                
            }
        }
    }
}

// MARK: RadioButton
extension Size {
    public struct RadioButton {
        public static let spacing: CGFloat = 10
        public static let touchArea: CGFloat = 44
        public static let circleDefault: CGFloat = 24
        public static let circleChecked: CGFloat = 14
        public static let border: CGFloat = 1
        public static let radius: CGFloat = 100
    }
}

// MARK: Checkbox
extension Size {
    public struct Checkbox {
        public static let padding: CGFloat = 0
        public static let touchArea: CGFloat = 44
        public static let frameDefault: CGFloat = 24
        public static let frameChecked: CGFloat = 14
        public static let border: CGFloat = 1
        public static let cornerRadius: CGFloat = 4
    }
}

// MARK: Toggle
extension Size {
    public struct Toggle {
        
        public static let spacing: CGFloat = 12
        public static let horizontalTouchArea: CGFloat = 44
        public static let verticalTouchArea: CGFloat = 44
        public static let cornerRadius: CGFloat = 16
        public static let width: CGFloat = 54
        public static let height: CGFloat = 26
        public static let border: CGFloat = 1
        public static let circle: CGFloat = 18
        public static let circleOffset: CGFloat = 14
    }
}

// MARK: Slider
extension Size {
    public struct Slider {
        public static let horizontalSpacing: CGFloat = 10
        public static let spacingVertical: CGFloat = 6
        
        public struct TextField {
            public static let width: CGFloat = 60
            public static let height: CGFloat = 48
            public static let border: CGFloat = 1
            public static let cornerRadius: CGFloat = 4
        }
    }
}

// MARK: ProgressBar
extension Size {
    public struct ProgressBar {
        public static let height: CGFloat = 9
        public static let gradientHeight: CGFloat = 6
        public static let paddingHorizontal: CGFloat = 2
        public static let offset: CGFloat = 1.5
        public static let padding: CGFloat = 4
    }
}

// MARK: FileUpload
extension Size {
    public struct FileUpload {
        public static let paddingHorizontal: CGFloat = 42
        public static let paddingVertical: CGFloat = 16
        public static let padding: CGFloat = 8
        public static let cornerRadius: CGFloat = 4
        public static let spacing: CGFloat = 8
        
        public struct Icon {
            public static let frame: CGFloat = 16
            //public static let paddingLeading: CGFloat = 8
        }
    }
}

// MARK: Button (SirioButton)
extension Size {
    public struct Button {
        public static let padding: CGFloat = 8
        
        public struct Large {
            public struct Icon {
                public static let frame: CGFloat = 16
                public static let paddingHorizontal: CGFloat = 17
                public static let paddingVertical: CGFloat = 16
            }
            
            public struct TextIcon {
                public static let frame: CGFloat = 16
                public static let paddingHorizontal: CGFloat = 42
                public static let paddingVertical: CGFloat = 16
            }
            
            public struct Text {
                public static let frame: CGFloat = 16
                public static let paddingHorizontal: CGFloat = 42
                public static let paddingVertical: CGFloat = 16
            }
        }
        
        public struct Medium {
            public struct Icon {
                public static let frame: CGFloat = 16
                public static let paddingHorizontal: CGFloat = 13
                public static let paddingVertical: CGFloat = 12
            }
            
            public struct TextIcon {
                public static let frame: CGFloat = 16
                public static let paddingHorizontal: CGFloat = 40
                public static let paddingVertical: CGFloat = 12
            }
            
            public struct Text {
                public static let frame: CGFloat = 16
                public static let paddingHorizontal: CGFloat = 40
                public static let paddingVertical: CGFloat = 12
            }
        }
        
        public struct Small {
            public struct Icon {
                public static let frame: CGFloat = 12
                public static let paddingHorizontal: CGFloat = 10
                public static let paddingVertical: CGFloat = 10
            }
            
            public struct TextIcon {
                public static let frame: CGFloat = 12
                public static let paddingHorizontal: CGFloat = 24
                public static let paddingVertical: CGFloat = 8
            }
            
            public struct Text {
                public static let frame: CGFloat = 12
                public static let paddingHorizontal: CGFloat = 24
                public static let paddingVertical: CGFloat = 8
            }
        }
        
        public struct Border {
            public static let cornerRadius: CGFloat = 4
            public static let width: CGFloat = 2
        }
    }
}

// MARK: Notification Inline & Toast
extension Size {
    public struct Notification {
        
        public struct Inline {
            public static let heigth: CGFloat = 68
            public static let spacingVertical: CGFloat = 4
            public static let paddingVertical: CGFloat = 8
            public static let paddingHorizontal: CGFloat = 16
            
            public struct Icon {
                
                public struct Left {
                    public static let frame: CGFloat = 24
                    public static let containerHeight: CGFloat = 68
                    public static let containerWidth: CGFloat = 68
                }
                
                public struct Right {
                    public static let frame: CGFloat = 14
                }
            }
        }
        
        public struct Toast {
            public static let paddingVertical: CGFloat = 26
            public static let paddingHorizontal: CGFloat = 24
            public static let spacing: CGFloat = 0
            
            
            public struct Rectangle {
                public static let frame: CGFloat = 18
            }
            
            public struct Icon {
                public struct Left {
                    public static let frame: CGFloat = 24
                }
                
                public struct Right {
                    public static let frame: CGFloat = 14
                }
            }
            
            public struct Text {
                public static let paddingTitleTop: CGFloat = 24
                public static let paddingSubtitleTop: CGFloat = 8
                public static let paddingButtonTop: CGFloat = 24
                
            }
        }
    }
}

// MARK: SirioTextField
extension Size {
    public struct SirioTextField {
        public static let spacing: CGFloat = 8
        
        public static let paddingHorizontal: CGFloat = 16
        public static let height: CGFloat = 48
        public static let cornerRadius: CGFloat = 4
        public static let borderWidth: CGFloat = 1
        
        public struct Icon {
            public static let frame1: CGFloat = 14
            public static let frame2: CGFloat = 16
        }
    }
}

// MARK: Tab
extension Size {
    public struct Tab {
        
        public static let spacingVertical: CGFloat = 0
        public static let spacingHorizontal: CGFloat = 8
        public static let spacingHorizontalGroupTop: CGFloat = 2
        public static let spacingHorizontalGroupBottom: CGFloat = 0
        public static let paddingHorizontal: CGFloat = 32
        public static let paddingHorizontalWithIcon: CGFloat = 20
        public static let height: CGFloat = 44
        
        public struct Rectangle {
            public static let height: CGFloat = 4
            public static let cornerRadius: CGFloat = 0
        }
        
        public struct Icon {
            public static let frame: CGFloat = 16
        }
    }
}

// MARK: SearchBar
extension Size {
    public struct SearchBar {
        public static let height: CGFloat = 48
        public static let spacingVertical: CGFloat = 8
        public static let spacingHorizontal: CGFloat = 16
        public static let paddingLeading: CGFloat = 16
        public static let cornerRadius: CGFloat = 4
        public static let lineWidth: CGFloat = 1
        
        public struct Icon {
            public static let frame: CGFloat = 16
        }
        
        public struct ButtonSearch {
            public static let height: CGFloat = 48
            public static let width: CGFloat = 50
        }
        
        public struct Chips {
            public static let padding: CGFloat = 8
        }
        
        public struct Options {
            public static let spacing: CGFloat = 0
            public static let paddingHorizontal: CGFloat = 15
            public static let paddingVertical: CGFloat = 16
            public static let maxHeight: CGFloat = 194
        }
    }
}

// MARK: Dialog
extension Size {
    public struct Dialog {
        public static let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.80 // 80% of the screen
        public static let noSpacing: CGFloat = 0
        public static let spacing: CGFloat = 16
        public static let padding: CGFloat = 24
        public static let cornerRadius: CGFloat = 16
        
        public struct InfoIcon {
            public static let frame: CGFloat = 24
        }
    }
}

// MARK: Pagination
extension Size {
    public struct Pagination {
        public static let spacing: CGFloat = 0
        public static let paddingHorizontal: CGFloat = 8
        public static let height: CGFloat = 74
        
        public struct Button {
            public static let width: CGFloat = 38
            public static let height: CGFloat = 44
            public static let cornerRadius: CGFloat = 4
        }
        
        public struct Dots {
            public static let height: CGFloat = 44
            public static let width: CGFloat = 48
        }
    }
}

// MARK: Card
extension Size {
    public struct Card {
        public struct Editorial {
            public static let spacing: CGFloat = 16
            public static let paddingHorizontal: CGFloat = 16
            public static let paddingBottom: CGFloat = 16
            public static let paddingTop: CGFloat = 24
            public static let spacingItems: CGFloat = 60
            public static let cornerRadius: CGFloat = 4
            public static let imageHeight: CGFloat = 220

            public struct Item {
                public static let width: CGFloat = 16
                public static let height: CGFloat = 16
            }
            
            public struct Icon {
                public static let width: CGFloat = 32
                public static let height: CGFloat = 32
            }
        }
        
        public struct Process {
            public static let spacing: CGFloat = 16
            public static let paddingVertical: CGFloat = 16
            public static let paddingHorizontal: CGFloat = 16
            public static let bodyHeight: CGFloat = 98
            public static let cornerRadius: CGFloat = 4
            
            public struct Item {
                public static let padding: CGFloat = 10
                public static let width: CGFloat = 48
                public static let height: CGFloat = 48
            }
            
            public struct Icon {
                public static let width: CGFloat = 32
                public static let height: CGFloat = 32
            }
        }
    }
}

// MARK: TextArea
extension Size {
    public struct TextArea {
        public static let spacing: CGFloat = 8
        public static let paddingHorizontalPlaceholder: CGFloat = 4
        public static let paddingVerticalPlaceholder: CGFloat = 10
        public static let paddingHorizontal: CGFloat = 12
        public static let paddingVertical: CGFloat = 4
        public static let paddingVerticalTextEditor: CGFloat = 6
        public static let height: CGFloat = 120
        public static let cornerRadius: CGFloat = 4
        public static let lineWidth: CGFloat = 1
        
        public struct Icon {
            public static let frame1: CGFloat = 16
            public static let frame2: CGFloat = 16
        }
    }
}

// MARK: Hero
extension Size {
    public struct Hero {
        public static let paddingTop: CGFloat = 32
        public static let spacing: CGFloat = 0
    }
}

// MARK: Carousel
extension Size {
    public struct Carousel {
        public static let frame: CGFloat = 10
        
        public struct Indicator {
            public static let height: CGFloat = 14
            public static let defaultWidth: CGFloat = 14
            public static let currentIndexWidth: CGFloat = 28
            public static let paddingHorizontal: CGFloat = 100
            public static let spacing: CGFloat = 15
            public static let trailingSpace: CGFloat = 80
        }
    }
}
