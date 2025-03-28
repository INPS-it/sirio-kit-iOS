//
// SirioView.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct SirioView: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: {
                    ExampleFoundationToken()
                }, label: {
                    SirioText(text: "Foundation", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleAccordion()
                }, label: {
                    SirioText(text: "Accordion", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleAppNavigation()
                }, label: {
                    SirioText(text: "App Navigation", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleAvviso()
                }, label: {
                    SirioText(text: "Avviso", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleButtons()
                }, label: {
                    SirioText(text: "Buttons", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleCard()
                }, label: {
                    SirioText(text: "Card", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleCarousel()
                }, label: {
                    SirioText(text: "Carousel", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleCheckBox()
                }, label: {
                    SirioText(text: "CheckBox", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleChips()
                }, label: {
                    SirioText(text: "Chips", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleDialog()
                }, label: {
                    SirioText(text: "Dialog", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleFab()
                }, label: {
                    SirioText(text: "Fab", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleFileUpload()
                }, label: {
                    SirioText(text: "File Upload", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleFiltri()
                }, label: {
                    SirioText(text: "Filtri", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleHero()
                }, label: {
                    SirioText(text: "Hero", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleMenuSpalla()
                }, label: {
                    SirioText(text: "Menu Spalla", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleNotification()
                }, label: {
                    SirioText(text: "Notifiche", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExamplePagination()
                }, label: {
                    SirioText(text: "Pagination", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleProgressBar()
                }, label: {
                    SirioText(text: "ProgressBar", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleRadioButton()
                }, label: {
                    SirioText(text: "Radio Button", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleSearchBar()
                }, label: {
                    SirioText(text: "SearchBar", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleSegmentedControls()
                }, label: {
                    SirioText(text: "Segmented Controls", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleSlider()
                }, label: {
                    SirioText(text: "Slider", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleStepProgressBar()
                }, label: {
                    SirioText(text: "Step Progress Bar", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleTab()
                }, label: {
                    SirioText(text: "Tab", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleTabBar()
                }, label: {
                    SirioText(text: "Tab Bar", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleTable()
                }, label: {
                    SirioText(text: "Table", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleTag()
                }, label: {
                    SirioText(text: "Tag", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleTextArea()
                }, label: {
                    SirioText(text: "TextArea", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleTextField()
                }, label: {
                    SirioText(text: "TextField", typography: .label_md_400)
                })
                NavigationLink(destination: {
                    ExampleTitleBar()
                }, label: {
                    SirioText(text: "TitleBar", typography: .label_md_400)
                })
                
                NavigationLink(destination: {
                    ExampleToggle()
                }, label: {
                    SirioText(text: "Toggle", typography: .label_md_400)
                })
            }
            .navigationTitle("INPS Sirio Kit")
            .listStyle(GroupedListStyle())
        }
    }
}

#Preview {
    SirioView()
}
