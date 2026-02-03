//
// ExampleFoundationToken.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleFoundationToken: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Foundation")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleFoundationToken {
    
    enum Destination: Hashable {
        case color
        case typography
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Color", action: {
                path.append(Destination.color)
            }),
            .default(title: "Typography", action: {
                path.append(Destination.typography)
            })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .color:
            ExampleFoundationColor()
        case .typography:
            ExampleFoundationTypography()
        }
    }
}

#Preview {
    ExampleFoundationToken(path: .constant(NavigationPath()))
}

struct ExampleFoundationTypography: View {
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            SirioSearchBarOld(label: "", placeholder: "Cerca una typography", searchText: $searchText, queries: .constant([]), onTapSearch: {}, onQueryAdded: { _ in })
                .padding(.horizontal)
                .padding(.bottom)
            
            ScrollView {
                ForEach(
                    Typography.mapOfFoundationTypography.keys
                        .sorted()
                        .filter { key in
                            searchText.isEmpty || key.lowercased().contains(searchText.lowercased())
                        },
                    id: \.self
                ) { key in
                    if let typography = Typography.mapOfFoundationTypography[key] {
                        HStack {
                            VStack(alignment: .leading) {
                                SirioText(text: key, typography: .label_md_400)
                                SirioText(text: "Progettare per il Cittadino da oggi è più semplice", typography: typography)
                            }
                            .padding()
                            Spacer()
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("Typography")
        .listStyle(GroupedListStyle())
    }
}

struct ExampleFoundationColor: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            SirioSearchBarOld(label: "", placeholder: "Cerca un colore", searchText: $searchText, queries: .constant([]), onTapSearch: {}, onQueryAdded: { _ in })
                .padding(.horizontal)
                .padding(.bottom)
            
            ScrollView {
                ForEach(
                    Color.mapOfFoundationColor.keys
                        .sorted()
                        .filter { key in
                            searchText.isEmpty || key.lowercased().contains(searchText.lowercased())
                        },
                    id: \.self
                ) { key in
                    if let colorValue = Color.mapOfFoundationColor[key] {
                        HStack {
                            VStack(alignment: .leading) {
                                SirioText(text: key, typography: .label_md_400)
                                
                                VStack {
                                    if let color = colorValue as? Color {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(color)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 90)
                                    } else if let colors = colorValue as? [Color] {
                                        let gradient = Gradient(colors: colors)
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 90)
                                    }
                                }
                            }
                            .padding()
                            Spacer()
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
        }
        .background(Color.colorBackground)
        .navigationTitle("Color")
        .listStyle(GroupedListStyle())
    }
}
