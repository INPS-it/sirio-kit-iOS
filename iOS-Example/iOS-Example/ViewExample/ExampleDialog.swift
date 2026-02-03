//
// ExampleDialog.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

import SwiftUI
import SirioKitIOS

struct ExampleDialog: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        SirioListItems(items: items)
            .navigationTitle("Dialog")
            .scrollContentBackground(.hidden)
            .background(Color.colorBackground)
            .navigationDestination(for: Destination.self) { destination in
                destinationView(for: destination)
            }
    }
}

extension ExampleDialog {
    
    enum Destination: Hashable {
        case dialog1
        case dialog2
        case dialog3
        case dialog4
        case dialog5
        case dialogAlert
        case dialogWarning
    }
    
    var items: [SirioListItemModel] {
        [
            .default(title: "Dialog 1", action: { path.append(Destination.dialog1) }),
            .default(title: "Dialog 2", action: { path.append(Destination.dialog2) }),
            .default(title: "Dialog 3", action: { path.append(Destination.dialog3) }),
            .default(title: "Dialog 4", action: { path.append(Destination.dialog4) }),
            .default(title: "Dialog 5", action: { path.append(Destination.dialog5) }),
            .default(title: "Dialog Alert", action: { path.append(Destination.dialogAlert) }),
            .default(title: "Dialog Warning", action: { path.append(Destination.dialogWarning) })
        ]
    }
    
    @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .dialog1:
            Dialog1()
                .navigationTitle("Dialog 1")
                .background(Color.colorBackground)
        case .dialog2:
            Dialog2()
                .navigationTitle("Dialog 2")
                .background(Color.colorBackground)
        case .dialog3:
            Dialog3()
                .navigationTitle("Dialog 3")
                .background(Color.colorBackground)
        case .dialog4:
            Dialog4()
                .navigationTitle("Dialog 4")
                .background(Color.colorBackground)
        case .dialog5:
            Dialog5()
                .navigationTitle("Dialog 5")
                .background(Color.colorBackground)
        case .dialogAlert:
            DialogAlert()
                .navigationTitle("Dialog Alert")
                .background(Color.colorBackground)
        case .dialogWarning:
            DialogWarning()
                .navigationTitle("Dialog Warning")
                .background(Color.colorBackground)
        }
    }
}

#Preview {
    ExampleDialog(path: .constant(NavigationPath()))
}

struct Dialog1: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }
        .dialog(isPresented: $isPresented,
                type: .info,
                title: "Titolo",
                subtitle: .loremIpsum,
                textfield1: .init(type: .info, label: "Label", placeholder: "Placeholder", text: ""),
                textfield2: .init(type: .info, label: "Label", placeholder: "Placeholder", text: ""),
                textFirstButton: "Text",
                actionFirstButton: nil,
                textSecondButton: "Text",
                actionSecondButton: nil,
                onTapInfoAction: nil,
                onTapCloseAction: {
            self.isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.mode.wrappedValue.dismiss()
            })
        },
                isVisibleInfoIcon: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isPresented = true
            })
        }
    }
}




struct Dialog2: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }.dialog(isPresented: $isPresented,
                 type: .info,
                 title: "Titolo",
                 subtitle: .loremIpsum,
                 textfield1: .init(type: .info, label: "Label", placeholder: "Placeholder", text: ""),
                 textfield2: .init(),
                 textFirstButton: "Text",
                 actionFirstButton: nil,
                 textSecondButton: "Text",
                 actionSecondButton: nil,
                 onTapInfoAction: nil,
                 onTapCloseAction: {
            self.isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.mode.wrappedValue.dismiss()
            })
        },
                 isVisibleInfoIcon: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isPresented = true
            })
        }
    }
    
}

struct Dialog3: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }.dialog(isPresented: $isPresented,
                 type: .info,
                 title: "Titolo",
                 subtitle: .loremIpsum,
                 textfield1: .init(),
                 textfield2: .init(),
                 textFirstButton: "Text",
                 actionFirstButton: nil,
                 textSecondButton: "Text",
                 actionSecondButton: nil,
                 onTapInfoAction: nil,
                 onTapCloseAction: {
            self.isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.mode.wrappedValue.dismiss()
            })
        },
                 isVisibleInfoIcon: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isPresented = true
            })
        }
        
    }
}


struct Dialog4: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }.dialog(isPresented: $isPresented,
                 type: .info,
                 title: "Titolo",
                 subtitle: nil,
                 textfield1: .init(),
                 textfield2: .init(),
                 textFirstButton: "Text",
                 actionFirstButton: nil,
                 textSecondButton: "Text",
                 actionSecondButton: nil,
                 onTapInfoAction: nil,
                 onTapCloseAction: {
            self.isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.mode.wrappedValue.dismiss()
            })
        },
                 isVisibleInfoIcon: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isPresented = true
            })
        }
        
    }
}

struct Dialog5: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }.dialog(isPresented: $isPresented,
                 type: .info,
                 title: "Titolo",
                 subtitle: .loremIpsum,
                 textfield1: .init(),
                 textfield2: .init(),
                 textFirstButton: nil,
                 actionFirstButton: nil,
                 textSecondButton: nil,
                 actionSecondButton: nil,
                 onTapInfoAction: nil,
                 onTapCloseAction: {
            self.isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.mode.wrappedValue.dismiss()
            })
        },
                 isVisibleInfoIcon: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isPresented = true
            })
        }
        
    }
}

struct DialogAlert: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }.dialog(isPresented: $isPresented,
                 type: .alert,
                 title: "Titolo",
                 subtitle: .loremIpsum,
                 textfield1: .init(),
                 textfield2: .init(),
                 textFirstButton: "Text",
                 actionFirstButton: nil,
                 textSecondButton: "Text",
                 actionSecondButton: nil,
                 onTapInfoAction: nil,
                 onTapCloseAction: {
            self.isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.mode.wrappedValue.dismiss()
            })
        },
                 isVisibleInfoIcon: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isPresented = true
            })
        }
        
    }
}

struct DialogWarning: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }.dialog(isPresented: $isPresented,
                 type: .warning,
                 title: "Titolo",
                 subtitle: .loremIpsum,
                 textfield1: .init(),
                 textfield2: .init(),
                 textFirstButton: "Text",
                 actionFirstButton: nil,
                 textSecondButton: "Text",
                 actionSecondButton: nil,
                 onTapInfoAction: nil,
                 onTapCloseAction: {
            self.isPresented = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.mode.wrappedValue.dismiss()
            })
        },
                 isVisibleInfoIcon: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isPresented = true
            })
        }
        
    }
}
