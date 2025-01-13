////
//// SirioBottomBar.swift
////
//// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
////
//// SPDX-License-Identifier: BSD-3-Clause
////
//
//
//import SwiftUI
//
////public struct SirioBottomBarItemData: Identifiable {
////    public var id = UUID()
////    public var icon: AwesomeIcon
////    public var text: String?
////    public var action: (() -> Void)?
////}
////
////public struct SirioBottomBar: View {
////    public var text: String?
////    public var data: [SirioBottomBarItemData]
////    @State var isOpenOptions = false
////    
////    public var body: some View {
////            
////            
////            HStack(spacing: 8) {
////                if let text = text {
////                    SirioText(text: text, typography: .label_md_700)
////                        .foregroundStyle(StyleDictionaryColor.aliasTextColorPrimaryLight0.color)
////                }
////                
////                Spacer()
////                
////                if data.count > 2  {
////                    Button(action: {
////                        isOpenOptions.toggle()
////                    }, label: {
////                        SirioIcon(data: .init(icon: .ellipsisH))
////                            .frame(width: 16, height: 16)
////                            .foregroundStyle(StyleDictionaryColor.aliasInteractivePrimary000Default.color)
////                        
////                    })
////                    .frame(width: 50, height: 48)
////                } else {
////                    ForEach(data) { datum in
////                        Button(action: {
////                            let _ = datum.action
////                        }, label: {
////                            SirioIcon(data: .init(icon: datum.icon))
////                                .frame(width: 16, height: 16)
////                                .foregroundStyle(StyleDictionaryColor.aliasInteractivePrimary000Default.color)
////                            
////                        })
////                        .frame(width: 50, height: 48)
////                        
////                    }
////                }
////            }
////            .frame(maxWidth: .infinity)
////            .frame(height: 64)
////            .padding(.horizontal, 16)
////            .background(StyleDictionaryColor.globalPrimary100.color)
////            
//////            optionsView
////            //SirioText(text: "CIAO", typography: .label_lg_700)
////    }
//    
//    private var optionsView: some View {
//        VStack(spacing: Size.SearchBar.Options.spacing) {
//            List {
//                ForEach(data){ value in
//                    
//                    Button(action: {
//                        isOpenOptions = false
//                    }, label: {
//                        // Inside style
//                    })//.buttonStyle(OptionsStyle(text: value))
//                }
//                .listRowInsets(EdgeInsets())
//                .listRowSeparator(.hidden)
//            }
//            .listStyle(PlainListStyle())
//            .frame(width: 150, height: 80)
//        }
//        .overlay(
//            RoundedRectangle(cornerRadius: Size.SearchBar.cornerRadius)
//                .stroke(Color.black, lineWidth: Size.SearchBar.lineWidth)
//        )
//        .background(Color.white)
//        .cornerRadius(Size.SearchBar.cornerRadius)
//    }
//}
//
//#Preview {
//    ContentView2()
////    VStack() {
////        SirioTableDrawer(title: "Titolo",
////                         onTapClose: {},
////                         data: [
////                            SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Sottotitolo", type: .text),
////                            SirioTableDrawerItemData.init(title: "Titolo", subtitle: "00", type: .number),
////                            SirioTableDrawerItemData.init(title: "Titolo", subtitle: "11/03/2023", type: .date),
////                            SirioTableDrawerItemData.init(title: "Titolo", subtitle: "Lorem Ipsum dolor sit amet", type: .link),
////                         ])
////        Spacer()
////        ZStack(alignment: .bottom) {
////            SirioBottomBar(text: "Azioni", data: [.init(icon: .print), .init(icon: .download), .init(icon: .trash)])
////        }
////            
////        
////    }
//    //SirioBottomBar(text: "Azioni", data: [.init(icon: .print), .init(icon: .download), .init(icon: .trash)])
//}
//
//
//struct ContentView2: View {
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            VStack {
//                ScrollView {
//                    // Contenuto scrollabile
//                    ForEach(0..<50) { index in
//                        Text("Item \(index)")
//                            .padding()
//                    }
//                }
//                .padding(.bottom, 64) // Aggiungi un padding inferiore per evitare che il contenuto scrollabile sia nascosto dalla barra fissa
//
//                Spacer() // Spazio flessibile per spingere la barra fissa verso il basso
//            }
//
//            // Barra fissa in basso
//            BottomFixedView()
//                .background(Color.blue)
//                .offset(y: UIScreen.main.bounds.height - 160) // Sposta la barra verso il basso per renderla visibile solo in parte
//        }
//    }
//}
//
//struct BottomFixedView: View {
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Fixed Bottom View")
//                    .foregroundColor(.white)
//                Spacer()
//                Button(action: {
//                    print("Button tapped")
//                }) {
//                    Text("Button")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.red)
//                        .cornerRadius(8)
//                }
//            }
//            .padding()
//            
//            Spacer() // Questo Spacer permette alla vista di occupare tutto lo schermo
//        }
//    }
//}
