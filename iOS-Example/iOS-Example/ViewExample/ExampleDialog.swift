//
// ExampleDialog.swift
//
// SPDX-FileCopyrightText: 2022 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct ExampleDialog: View {
    var body: some View {
        List {
            // 1
            NavigationLink(destination: {
                Dialog1()
                    .navigationTitle("Dialog 1")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dialog 1", typography: .label_md_400)
            })
            
            // 2
            NavigationLink(destination: {
                Dialog2()
                    .navigationTitle("Dialog 2")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dialog 2", typography: .label_md_400)
            })
            
            // 3
            NavigationLink(destination: {
                Dialog3()
                    .navigationTitle("Dialog 3")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dialog 3", typography: .label_md_400)
            })
            
            // 4
            NavigationLink(destination: {
                Dialog4()
                    .navigationTitle("Dialog 4")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dialog 4", typography: .label_md_400)
            })
            
            // 5
            NavigationLink(destination: {
                Dialog5()
                    .navigationTitle("Dialog 5")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dialog 5", typography: .label_md_400)
            })
            
            // Warning
            NavigationLink(destination: {
                DialogAlert()
                    .navigationTitle("Dialog Alert")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dialog Alert", typography: .label_md_400)
            })
            
            // Error
            NavigationLink(destination: {
                DialogWarning()
                    .navigationTitle("Dialog Warning")
                    .background(Color.colorBackground)
            }, label: {
                SirioText(text: "Dialog Warning", typography: .label_md_400)
            })
        }
        .background(Color.colorBackground)
        .navigationTitle("Dialog")
        .listStyle(GroupedListStyle())
    }
}

struct ExampleDialog_Previews: PreviewProvider {
    static var previews: some View {
        ExampleDialog()
    }
}


struct Dialog1: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
        }
        .dialog(isPresented: $isPresented,
                type: .default,
                title: "Titolo finestra di dialogo",
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
                 type: .default,
                 title: "Titolo finestra di dialogo",
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
                 type: .default,
                 title: "Titolo finestra di dialogo",
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
                 type: .default,
                 title: "Titolo finestra di dialogo",
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
                 type: .default,
                 title: "Titolo finestra di dialogo",
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
                 title: "Titolo finestra di dialogo",
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
                 title: "Titolo finestra di dialogo",
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
