//
// ExampleFoundationToken.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleFoundationToken: View {
    
    var body: some View {
        List {
            NavigationLink(destination: {
                ExampleFoundationColor()
                .navigationTitle("Color")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Color", typography: .label_md_400)
            })
            
            NavigationLink(destination: {
                ExampleFoundationTypography()
                .navigationTitle("Typography")
                .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Typography", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Foundation")
        .listStyle(GroupedListStyle())
    }
}

#Preview {
    ExampleFoundationToken()
}

struct ExampleFoundationTypography: View {
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            SirioSearchBar(label: "", helperText: nil, placeholder: "Cerca una typography", searchText: $searchText, queries: .constant([]), onTapSearch: {}, onQueryAdded: { _ in })
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
            SirioSearchBar(label: "", helperText: nil, placeholder: "Cerca un colore", searchText: $searchText, queries: .constant([]), onTapSearch: {}, onQueryAdded: { _ in })
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
