//
// SirioView.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct SirioView: View {
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    
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
                        ExampleNotification()
                    }, label: {
                        SirioText(text: "Notification", typography: .label_md_400)
                    })
                }
                
                Group {
                    
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
                        ExampleSlider()
                    }, label: {
                        SirioText(text: "Slider", typography: .label_md_400)
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
                        ExampleTag()
                    }, label: {
                        SirioText(text: "Tag", typography: .label_md_400)
                    })
                    
                    NavigationLink(destination: {
                        ExampleTextField()
                    }, label: {
                        SirioText(text: "TextField", typography: .label_md_400)
                    })
                                        
                    NavigationLink(destination: {
                        ExampleToggle()
                    }, label: {
                        SirioText(text: "Toggle", typography: .label_md_400)
                    })
                }
            }
            .navigationTitle("INPS Sirio Kit")
            .listStyle(GroupedListStyle())
        }
    }
}

struct SirioView_Previews: PreviewProvider {
    static var previews: some View {
        SirioView()
    }
}
