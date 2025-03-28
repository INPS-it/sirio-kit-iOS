//
// ExampleAppNavigation.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
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
                    ExampleAppNavigationView()
                }
                .navigationTitle("Standard")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Standard", typography: .label_md_400)
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

#Preview {
    ExampleAppNavigation()
}

struct ExampleAppNavigationView: View {
    var body: some View {
        VStack(spacing: 4){
            NewSirioAppNavigationBarView(title: "Titolo pagina",
                                       leftItem: nil,
                                         rightItems: [.previewUserLogged, .previewBell])
            
            NewSirioAppNavigationBarView(title: "Titolo pagina",
                                       leftItem: .previewBack,
                                       rightItems: [.previewUser, .previewBell])
            
            NewSirioAppNavigationBarView(title: "Titolo pagina molto molto lungo su due righe con sospensione del t...",
                                       leftItem: nil,
                                       rightItems: [.previewUserLogged, .previewBell])
            
            NewSirioAppNavigationBarView(title: "Titolo pagina molto molto lungo su due righe con sospensione del t...",
                                       leftItem: .previewBack,
                                       rightItems: [.previewUserLogged, .previewBell])
            
        }
    }
}

struct ExampleAppNavigationSelectionView: View {
    var body: some View {
        VStack(spacing: 4){
            SirioAppNavigationSelectionBarView(title: "Titolo pagina",
                                          leftItem: .previewBack,
                                          rightItems: [.previewDownload, .previewTrash])
            
            SirioAppNavigationSelectionBarView(title: "1 Elemento Selezionato",
                                          leftItem: .previewBack,
                                          rightItems: [.previewDownload, .previewTrash])
            
        }
    }
}

struct ExampleAppNavigationSearchView: View {
    @StateObject var searchEnv: SirioSearchEnvironment = SirioSearchEnvironment()
    
    var body: some View {
        VStack(spacing: 4){
            SirioAppNavigationSearchBarView(title: "Titolo pagina",
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
            SirioAppNavigationLogoBarView(leftItem: nil,
                                     rightItems: [.previewUser, .previewBell])
            
            SirioAppNavigationLogoBarView(leftItem: nil,
                                     rightItems: [.previewUserLogged, .previewBell])
        }
    }
}

