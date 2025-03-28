//
// SirioStepControls.swift
//
// SPDX-FileCopyrightText: 2025 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

struct SirioStepControls: View {
    var back: SirioStepControlData
    var next: SirioStepControlData
    var others: [SirioStepControlData]
    @State private var isExpanded: Bool = false
    
    init(back: SirioStepControlData,
         next: SirioStepControlData,
         others: [SirioStepControlData]) {
        self.back = back
        self.next = next
        self.others = others
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                if !others.isEmpty {
                    SirioButton(hierarchy: .tertiaryLight, size: .large, text: nil, iconData: .init(icon: .ellipsisV), action: {
                        withAnimation {
                            self.isExpanded.toggle()
                        }
                    })
                }
                
                SirioButton(hierarchy: .secondary,
                            size: .large,
                            text: back.text,
                            iconData: nil,
                            isDisabled: .constant(back.isDisabled ?? false),
                            isFullSize: true,
                            action: {
                    back.action()
                })
                
                Spacer()
                
                SirioButton(hierarchy: .primary,
                            size: .large,
                            text: next.text,
                            iconData: nil,
                            isDisabled: .constant(next.isDisabled ?? false),
                            isFullSize: true,
                            action: {
                    next.action()
                })
            }
        }
        .padding(.horizontal)
        .overlay(alignment: .bottomLeading, content: {
            ZStack {
                if isExpanded {
                    optionsView
                        .offset(y: Size.SirioStepProgressBar.StepControls.verticalOffset) // Sposta l'overlay verso l'alto
                        .animation(.easeInOut, value: isExpanded)
                }
            }
            .padding(.horizontal)
        })

    }
    
    private var optionsView: some View {
        let maxItems = 4
        let height = Size.SirioStepProgressBar.StepControls.heightItemMenu * CGFloat(min(others.count, maxItems))
        return VStack(spacing: Size.zero) {
            List {
                ForEach(others){ data in
                    
                    Button(action: {
                        let _ = data.action()
                        self.isExpanded = false // Chiude l'overlay dopo l'azione
                    }, label: {
                        // Inside style
                    }).buttonStyle(OptionsStyle(text: data.text))
                }
                .listRowInsets(EdgeInsets())
                
            }
            .listStyle(PlainListStyle())
            .frame(width: Size.SirioStepProgressBar.StepControls.widthMenu,
                   height: height)
        }
        .overlay(
            RoundedRectangle(cornerRadius: Size.SearchBar.cornerRadius)
                .stroke(Color.StepProgressBar.StepControls.optionBorder, lineWidth: Size.SearchBar.lineWidth)
        )
        .background(Color.StepProgressBar.StepControls.optionBackground)
        .cornerRadius(Size.SearchBar.cornerRadius)
    }
}

#Preview {
    VStack {
        ScrollView{
            Text("Preview 1")
            Text("Preview 2")
            Text("Preview 3")
        }
        Spacer()
        
        SirioStepControls(
            back: .back,
            next: .next,
            others: [.salvaBozza, .annulla]
        )
    }
    .padding(.bottom)
}

