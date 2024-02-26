//
// ExampleAppNavigation.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS


struct ExampleAppNavigation: View {
    var body: some View {
        List {
            // LOGO
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAppNavigationLogoView()
                }
                .navigationTitle("Logo")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Logo", typography: .label_md_400)
                
            })
            
            // STANDARD TITLE
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAppNavigationStandardTitleView()
                }
                .navigationTitle("Standard Title")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Standard Title", typography: .label_md_400)
            })
            
            // LONG TITLE
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAppNavigationLongTitleView()
                }
                .navigationTitle("Long Title")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Long Title", typography: .label_md_400)
            })
            
            // BIG TITLE
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAppNavigationBigTitleView()
                }
                .navigationTitle("Big Title")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Big Title", typography: .label_md_400)
            })
            
            // SELECTION
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAppNavigationSelectionView()
                }
                .navigationTitle("Selection")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Selection", typography: .label_md_400)
            })
            
            // SEARCH
            NavigationLink(destination: {
                VSchemeSwitcher {
                    ExampleAppNavigationSearchView()
                }
                .navigationTitle("Search")
                .background(Color.colorBackground)
                .onTapGesture {
                    self.hideKeyboard()
                }
            }, label: {
                SirioText(text: "Search", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("App Navigation")
        .listStyle(GroupedListStyle())
    }
}

struct ExampleAppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAppNavigation()
    }
}

struct ExampleAppNavigationStandardTitleView: View {
    var body: some View {
        VStack(spacing: 4){
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: nil,
                                       rightItems: [.previewUser, .previewBell])
            
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: .previewBack,
                                       rightItems: [.previewUser, .previewBell])
            
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: nil,
                                       rightItems: [.previewUserLogged, .previewBell])
            
            
            AppNavigationStandardTitle(title: "Titolo pagina",
                                       leftItem: .previewBack,
                                       rightItems: [.previewUserLogged, .previewBell])
            
        }
    }
}


struct ExampleAppNavigationLongTitleView: View {
    var body: some View {
        VStack(spacing: 4){
            
            AppNavigationLongTitle(title: "Titolo pagina molto lungo \nsu due righe",
                                   leftItem: nil,
                                   rightItems: [.previewUser, .previewBell])
            
            
            AppNavigationLongTitle(title: "Titolo pagina molto lungo \nsu due righe",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUser, .previewBell])
            
            
            AppNavigationLongTitle(title: "Titolo pagina molto lungo \nsu due righe",
                                   leftItem: nil,
                                   rightItems: [.previewUserLogged, .previewBell])
            
            
            AppNavigationLongTitle(title: "Titolo pagina molto lungo \nsu due righe",
                                   leftItem: .previewBack,
                                   rightItems: [.previewUserLogged, .previewBell])
            
        }
    }
}


struct ExampleAppNavigationBigTitleView: View {
    var body: some View {
        VStack(spacing: 4){
            
            AppNavigationBigTitle(title: "Titolo Grande",
                                  leftItem: nil,
                                  rightItems: [.previewUser, .previewBell])
            
            
            AppNavigationBigTitle(title: "Titolo Grande",
                                  leftItem: .previewBack,
                                  rightItems: [.previewUser, .previewBell])
            
            
            AppNavigationBigTitle(title: "Titolo Grande",
                                  leftItem: nil,
                                  rightItems: [.previewUserLogged, .previewBell])
            
            AppNavigationBigTitle(title: "Titolo Grande",
                                  leftItem: .previewBack,
                                  rightItems: [.previewUserLogged, .previewBell])
        }
    }
}

struct ExampleAppNavigationSelectionView: View {
    var body: some View {
        VStack(spacing: 4){
            AppNavigationSelectionBarView(title: "Titolo pagina",
                                          leftItem: .previewBack,
                                          rightItems: [.previewDownload, .previewTrash])
            
            AppNavigationSelectionBarView(title: "1 Elemento Selezionato",
                                          leftItem: .previewBack,
                                          rightItems: [.previewDownload, .previewTrash])
            
        }
    }
}

struct ExampleAppNavigationSearchView: View {
    @StateObject var searchEnv: SearchEnvironment = SearchEnvironment()
    
    var body: some View {
        VStack(spacing: 4){
            AppNavigationSearchBarView(title: "Titolo pagina",
                                       placeholder: "Ricerca...",
                                       leftItem: nil,
                                       rightItems: [.previewUser, .previewBell])
            .environmentObject(searchEnv)
        }
    }
}


struct ExampleAppNavigationLogoView: View {
    var body: some View {
        VStack(spacing: 4){
            AppNavigationLogoBarView(leftItem: nil,
                                     rightItems: [.previewUser, .previewBell])
            
            AppNavigationLogoBarView(leftItem: nil,
                                     rightItems: [.previewUserLogged, .previewBell])
        }
    }
}

