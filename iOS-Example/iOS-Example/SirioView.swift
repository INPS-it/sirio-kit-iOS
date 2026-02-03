//
// SirioView.swift
//
// SPDX-FileCopyrightText: 2026 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI
import SirioKitIOS

struct SirioView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            SirioListItems(items: items)
                .navigationTitle("INPS Sirio Kit")
                .navigationDestination(for: Destination.self) { destination in
                    destinationView(for: destination)
                }
        }
    }
}

extension SirioView {
    // Enum che rappresenta le varie destinazioni
    enum Destination: Hashable {
        case foundation,
             accordion, appNavigation, avviso,
             buttons,
             card, carousel, checkBox, chips,
             dialog, dropdownMenu,
             fab, fileUpload, filtri,
             hero,
             listItem, loader,
             menuSpalla,
             notification,
             pagination, popover, progressBar,
             radioButton,
             search, segmentedControls, slider, stepProgressBar,
             tab, tabBar, table, tag, textArea, textField, toggle
    }
        
        @ViewBuilder
    func destinationView(for destination: Destination) -> some View {
        switch destination {
        case .foundation:
            ExampleFoundationToken(path: $path)
        case .accordion:
            ExampleAccordion(path: $path)
        case .appNavigation:
            ExampleAppNavigation(path: $path)
        case .avviso:
            ExampleAvviso()
        case .buttons:
            ExampleButtons(path: $path)
        case .card:
            ExampleCard(path: $path)
        case .carousel:
            ExampleCarousel()
        case .checkBox:
            ExampleCheckBox()
        case .chips:
            ExampleChips()
        case .dialog:
            ExampleDialog(path: $path)
        case .dropdownMenu:
            ExampleDropdownMenu(path: $path)
        case .fab:
            ExampleFab()
        case .fileUpload:
            ExampleFileUpload()
        case .filtri:
            ExampleFiltri(path: $path)
        case .hero:
            ExampleHero()
        case .listItem:
            ExampleListItem(path: $path)
        case .loader:
            ExampleLoader()
        case .menuSpalla:
            ExampleMenuSpalla(path: $path)
        case .notification:
            ExampleNotification(path: $path)
        case .pagination:
            ExamplePagination()
        case .popover:
            ExamplePopover(path: $path)
        case .progressBar:
            ExampleProgressBar()
        case .radioButton:
            ExampleRadioButton()
        case .search:
            ExampleSearch(path: $path)
        case .segmentedControls:
            ExampleSegmentedControls(path: $path)
        case .slider:
            ExampleSlider()
        case .stepProgressBar:
            ExampleStepProgressBar()
        case .tab:
            ExampleTab(path: $path)
        case .tabBar:
            ExampleTabBar()
        case .table:
            ExampleTable(path: $path)
        case .tag:
            ExampleTag()
        case .textArea:
            ExampleTextArea()
        case .textField:
            ExampleTextField()
        case .toggle:
            ExampleToggle()
        }
    }

    
    // Lista dei modelli per SirioListItems
    var items: [SirioListItemModel] {
        [
            .default(title: "Foundation", action: { path.append(Destination.foundation) }),
            .default(title: "Accordion",action: { path.append(Destination.accordion) }),
            .default(title: "App Navigation", action: { path.append(Destination.appNavigation) }),
            .default(title: "Avviso", action: { path.append(Destination.avviso) }),
            .default(title: "Buttons", action: { path.append(Destination.buttons) }),
            .default(title: "Card", action: { path.append(Destination.card) }),
            .default(title: "Carousel", action: { path.append(Destination.carousel) }),
            .default(title: "CheckBox", action: { path.append(Destination.checkBox) }),
            .default(title: "Chips", action: { path.append(Destination.chips) }),
            .default(title: "Dialog",   action: { path.append(Destination.dialog) }),
            .default(title: "Dropdown Menu", action: { path.append(Destination.dropdownMenu) }),
            .default(title: "Fab", action: { path.append(Destination.fab) }),
            .default(title: "File Upload", action: { path.append(Destination.fileUpload) }),
            .default(title: "Filtri", action: { path.append(Destination.filtri) }),
            .default(title: "Hero", action: { path.append(Destination.hero) }),
            .default(title: "List Item", action: { path.append(Destination.listItem) }),
            .default(title: "Loader", action: { path.append(Destination.loader) }),
            .default(title: "Menu Spalla", action: { path.append(Destination.menuSpalla) }),
            .default(title: "Notifiche", action: { path.append(Destination.notification) }),
            .default(title: "Pagination", action: { path.append(Destination.pagination) }),
            .default(title: "Popover", action: { path.append(Destination.popover) }),
            .default(title: "ProgressBar", action: { path.append(Destination.progressBar) }),
            .default(title: "Radio Button", action: { path.append(Destination.radioButton) }),
            .default(title: "Search", action: { path.append(Destination.search) }),
            .default(title: "Segmented Controls", action: { path.append(Destination.segmentedControls) }),
            .default(title: "Slider", action: { path.append(Destination.slider) }),
            .default(title: "Step Progress Bar", action: { path.append(Destination.stepProgressBar) }),
            .default(title: "Tab", action: { path.append(Destination.tab) }),
            .default(title: "Tab Bar", action: { path.append(Destination.tabBar) }),
            .default(title: "Table", action: { path.append(Destination.table) }),
            .default(title: "Tag", action: { path.append(Destination.tag) }),
            .default(title: "TextArea", action: { path.append(Destination.textArea) }),
            .default(title: "TextField", action: { path.append(Destination.textField) }),
            .default(title: "Toggle", action: { path.append(Destination.toggle) })
        ]
    }
}

#Preview {
    SirioView()
}
