//
// Size.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import UIKit

// Size Constants
public struct Size {
    public static let zero: CGFloat = 0
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
            public static let paddingVertical: CGFloat = 12
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
        public static let paddingTop: CGFloat = 3 // For TabBar
        public static let paddingTrailing: CGFloat = 1 // For TabBar
    }
}

// MARK: Tab Bar - Tab Bar Item
extension Size {
    
    public struct TabBar {
        public static let height: CGFloat = 56
        
        public struct Item {
            
            public static let icon: CGFloat = 20 // Both orientation
            public static let indicator: CGFloat = 3 // Both orientation
            public static let linePaddingBottom: CGFloat = 10 // Both orientation
            public static let paddingHorizontal: CGFloat = 9 // Both orientation

            // Landscape
            public struct Landscape {
                public static let spacing: CGFloat = 7
                public static let height: CGFloat = 33
            }
            
            // Portrait
            public struct Portrait {
                public static let spacing: CGFloat = 2
                public static let height: CGFloat = 39
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
    }
}

// MARK: New App Navigation
extension Size {
    public struct NewAppNavigation {
        
        public static let height: CGFloat = 56
        public static let paddingHorizontal: CGFloat = 16
        public static let spacing: CGFloat = 16
        
        public struct Item { // App Navigation Item
            public static let icon: CGFloat = 24
            public static let circle: CGFloat = 40
            public static let area: CGFloat = 56
        }
        
        public struct LogoInps { // App Navigation Logo INPS
            public static let maxWidth: CGFloat = 108
            public static let maxHeight: CGFloat = 39
        }
        
        public struct Search { // App Navigation Search
            public static let height: CGFloat = 32
            public static let border: CGFloat = 6
            public static let item: CGFloat = 16
            public static let paddingHorizontal: CGFloat = 16
        }
        
        public struct Function {
            public static let height: CGFloat = 56
        }
    }
}

// MARK: SirioTag
extension Size {
    
    public struct Tag {
        public static let paddingHorizontal: CGFloat = 16
        public static let height: CGFloat = 22
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
        public static let padding: CGFloat = 10
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
            public static let frame: CGFloat = 48
            
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
            public static let frame: CGFloat = 40
            
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
            public static let frame: CGFloat = 32
            
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
            public static let paddingTop: CGFloat = 24
            public static let paddingBottom: CGFloat = 20
            public static let paddingHorizontal: CGFloat = 24
            
            
            public struct Rectangle {
                public static let width: CGFloat = 62
            }
            
            public struct Icon {
                public static let paddingTop: CGFloat = 20
                
                public struct Left {
                    public static let frame: CGFloat = 24
                }
                
                public struct Right {
                    public static let frame: CGFloat = 16
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
        
        public static let spacingHorizontal: CGFloat = 8
        public static let spacingHorizontalGroupTop: CGFloat = 2
        public static let paddingHorizontal: CGFloat = 32
        public static let paddingHorizontalWithIcon: CGFloat = 20
        public static let height: CGFloat = 44
        
        public struct Rectangle {
            public static let height: CGFloat = 4
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
        public static let icon: CGFloat = 16
    }
}

// MARK: Hero
extension Size {
    public struct Hero {
        public static let paddingTop: CGFloat = 32
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

// MARK: Avviso
extension Size {
    struct Avviso {
        static let vSpacing: CGFloat = 4
        static let hSpacing: CGFloat = 12
        static let icon: CGFloat = 24
        static let padding: CGFloat = 16
        static let paddingLeading: CGFloat = 36
        static let cornerRadius: CGFloat = 4
    }
}

// MARK: TitleBar
extension Size {
    struct TitleBar {
        static let height: CGFloat = 48
        static let paddingVertical: CGFloat = 16
        static let paddingHorizontal: CGFloat = 9
        static let cornerRadius: CGFloat = 4
        
        struct Icon {
            static let frame: CGFloat = 16
        }
    }
}

// MARK: Table - Header
extension Size {
    struct Table {
        
        struct Header {
            
            struct Height {
                static let xsmall: CGFloat = 36
                static let small: CGFloat = 40
                static let medium: CGFloat = 60
                static let large: CGFloat = 80
            }
            
            struct Padding {
                static let xsmall: CGFloat = 8
                static let small: CGFloat = 8
                static let medium: CGFloat = 12
                static let large: CGFloat = 16
            }
            
            struct SideBar {
                static let small: CGFloat = 1
                static let large: CGFloat = 4
            }
            
            struct Icon {
                static let frame: CGFloat = 20
                
                struct Padding {
                    static let small: CGFloat = 6
                    static let large: CGFloat = 10
                }
            }
            
            struct Text {
                struct Padding {
                    static let large: CGFloat = 16
                }
            }
        }
        
        struct Cell {
            struct Height {
                static let xsmall: CGFloat = 36
                static let small: CGFloat = 40
                static let medium: CGFloat = 60
                static let large: CGFloat = 80
            }
            
            struct Icons {
                static let spacing: CGFloat = 8
                static let frame: CGFloat = 16
                static let paddingVertical: CGFloat = 6
                static let paddingHorizontal: CGFloat = 5
            }
            
            struct Avatar {
                static let frame: CGFloat = 24
                static let spacing: CGFloat = 8
            }
            
            struct Padding {
                static let xsmall: CGFloat = 8
                static let small: CGFloat = 8
                static let medium: CGFloat = 12
                static let large: CGFloat = 16
            }
            
            
            static let scrollWidth: CGFloat = 4
            static let line: CGFloat = 1
        }
        
        struct Drawer {
            static let paddingBottom: CGFloat = 24
            
            struct Header {
                static let frame: CGFloat = 16
                static let paddingHorizontal: CGFloat = 16
                
            }
            
            struct Item {
                static let padding: CGFloat = 16
                static let spacing: CGFloat = 16
                static let lineFrame: CGFloat = 1
            }
            
            struct BottomBar {
                
                static let spacing: CGFloat = 8
                static let height: CGFloat = 64
                static let paddingHorizontal: CGFloat = 16
                static let paddingBottom: CGFloat = 64
                
                struct Button {
                    static let width: CGFloat = 50
                    static let height: CGFloat = 48
                    static let iconFrame: CGFloat = 16
                }
                
                struct Options {
                    static let width: CGFloat = 145
                    static let height: CGFloat = 226
                }
            }
        }
        
        struct Expanded {
            
            static let spacing: CGFloat = 24
            static let iconFrame: CGFloat = 16
            static let buttonFrame: CGFloat = 28
            static let paddingHorizontal: CGFloat = 10
            static let paddingVertical: CGFloat = 16
            static let paddingBottom: CGFloat = 10
            static let lineWidth: CGFloat = 1
            
        }
    }
}

// MARK: Menu Spalla
extension Size {
    struct MenuSpalla {
        struct Drawer {
            
            struct Item {
                static let spacingHorizontal: CGFloat = 4
                static let iconFrame: CGFloat = 24
                static let paddingHorizontal: CGFloat = 24
                static let paddingVertical: CGFloat = 12
            }
            
            struct ItemInfo {
                static let spacingHorizontal: CGFloat = 24
                static let iconFrame: CGFloat = 24
                static let paddingHorizontal: CGFloat = 24
                static let paddingVertical: CGFloat = 18
            }
        }
        
        struct Item {
            static let frameLineHorizontal: CGFloat = 1
            static let frameLineVertical: CGFloat = 4
            static let paddingTrailing: CGFloat = 16
            static let iconFrame: CGFloat = 16
            static let height: CGFloat = 49
            static let paddingLeadingFirstLevel: CGFloat = 12
            static let paddingLeadingSecondLevel: CGFloat = 20
            static let paddingLeadingThirdLevel: CGFloat = 28
            
        }
        
        struct TitleSection {
            static let paddingTop: CGFloat = 4
            static let paddingBottom: CGFloat = 11
            static let paddingHorizontal: CGFloat = 16
            static let heightLine: CGFloat = 4
        }
    }
}

// MARK: Filtri
extension Size {
    public struct Filtri {
        public static let padding: CGFloat = 16
        public static let paddingVertical: CGFloat = 24
        public static let paddingVerticalChips: CGFloat = 8
        public static let spacing: CGFloat = 16
        public static let infoIcon: CGFloat = 16
        public static let icon: CGFloat = 20
        
        struct TitleBar {
            static let height: CGFloat = 48
            static let paddingVertical: CGFloat = 16
            static let paddingHorizontal: CGFloat = 9
            static let cornerRadius: CGFloat = 4
            
            struct Icon {
                static let frame: CGFloat = 16
            }
        }
    }
}

// MARK: Step Progress Bar
extension Size {
    public struct StepProgressBar {
        
        struct StepControls {
            static let iconFrame: CGFloat = 16
            static let height: CGFloat = 56
        }
        
        struct StepSelection {
            static let height: CGFloat = 56
        }
    }
}

// MARK: Step Progress Bar
extension Size {
    public struct SirioStepProgressBar {
        static let spacingHorizontal: CGFloat = 16
        static let paddingHorizontal: CGFloat = 16
        static let paddingBottom: CGFloat = 24
        static let paddingTop: CGFloat = 24
        
        struct StepBar {
            static let height: CGFloat = (60/2)-(32/2)
            static let width: CGFloat = 2
        }
        
        struct StepPoint {
            static let frame: CGFloat = 32
            static let icon: CGFloat = 16
        }
        
        struct Step {
            static let height: CGFloat = 60
        }
        
        struct StepControls {
            static let widthMenu: CGFloat = 145
            static let verticalOffset: CGFloat = -60
            static let heightItemMenu: CGFloat = 56
        }
        
        struct StepSelection {
            static let iconFrame: CGFloat = 16
            static let paddingTrailing: CGFloat = 10
            static let paddingHorizontal: CGFloat = 16
            static let height: CGFloat = 48
        }
    }
}

// NEW
extension Size {
    public struct SirioButton {
        public static let padding: CGFloat = 8
        public static let cornerRadius: CGFloat = 4
        public static let borderWidth: CGFloat = 2
        
        struct Large {
            static let height: CGFloat = 46
            static let paddingHorizontal: CGFloat = 24
            static let paddingVertical: CGFloat = 12
            static let icon: CGFloat = 16
            static let minWidth: CGFloat = 120
            
            struct OnlyIcon {
                static let paddingHorizontal: CGFloat = 15
                static let paddingVertical: CGFloat = 15
            }
            
        }
        
        struct Medium {
            static let height: CGFloat = 38
            static let paddingHorizontal: CGFloat = 16
            static let paddingVertical: CGFloat = 8
            static let icon: CGFloat = 16
            static let minWidth: CGFloat = 95
            
            struct OnlyIcon {
                static let paddingHorizontal: CGFloat = 11
                static let paddingVertical: CGFloat = 11
            }
        }
        
        struct Small {
            static let height: CGFloat = 28
            static let paddingHorizontal: CGFloat = 12
            static let paddingVertical: CGFloat = 4
            static let icon: CGFloat = 16
            static let minWidth: CGFloat = 70
            static let minWidthWithIcon: CGFloat = 74
            
            struct OnlyIcon {
                static let paddingHorizontal: CGFloat = 6
                static let paddingVertical: CGFloat = 6
            }
        }
    }
}

extension Size {
    public struct SirioSegmentedControls {
        static let paddingHorizontal: CGFloat = 2
        static let height: CGFloat = 42
        static let cornerRadius: CGFloat = 6
        static let lineWidth: CGFloat = 1
        
        public struct SirioButtonControls {
            static let paddingHorizontal: CGFloat = 8
            static let height: CGFloat = 38
            static let cornerRadius: CGFloat = 4
            static let iconFrame: CGFloat = 16
        }
        
        
        
        public struct Divider {
            static let width: CGFloat = 1
            static let height: CGFloat = 12
            static let cornerRadius: CGFloat = 0.5
        }
    }
}

extension Size {
    public struct Notifica {
        static let iconFrame: CGFloat = 24
        static let iconCloseFrame: CGFloat = 16
        static let paddingTop: CGFloat = 16
        static let paddingBottom: CGFloat = 4
        static let paddingHorizontal: CGFloat = 24

        public struct Page {
            static let paddingVertical: CGFloat = 12
            static let coloredHeight: CGFloat = 48
            static let height: CGFloat = 185
            static let cornerRadius: CGFloat = 16
        }
        
        public struct Inline {
            static let rectangleWidth: CGFloat = 6
            static let height: CGFloat = 159
            static let cornerRadius: CGFloat = 6
            static let lineWidth: CGFloat = 2
            static let paddingBottom: CGFloat = 8
        }
    }
}

extension Size {
    public struct NewChips {
        static let spacing: CGFloat = 8
        static let icon: CGFloat = 16
        static let paddingVertical: CGFloat = 4
        static let paddingLeading: CGFloat = 16
        static let paddingTrailing: CGFloat = 4
        static let height: CGFloat = 32
        static let cornerRadius: CGFloat = 100
        static let iconClose: CGFloat = 14
        static let paddingClose: CGFloat = 5
        static let borderWidth: CGFloat = 2
        static let lineLimit: Int = 1

        public struct Selection {
            static let spacing: CGFloat = 8
            static let icon: CGFloat = 16
            static let lineLimit: Int = 1
            static let height: CGFloat = 32
            static let paddingVertical: CGFloat = 4
            static let paddingHorizontal: CGFloat = 16
            static let cornerRadius: CGFloat = 100
            static let lineWidth: CGFloat = 2
        }
    }
}
