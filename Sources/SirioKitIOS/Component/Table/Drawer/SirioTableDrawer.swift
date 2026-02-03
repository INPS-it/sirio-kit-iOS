import SwiftUI

public struct SirioTableDrawer: View {

    // MARK: - Row model (semplice e sicura per ForEach)
    public struct Row: Identifiable {
        public enum Content {
            case text(header: String, text: String)
            case number(header: String, text: String)
            case tag(header: String, text: String, type: SirioTagType)
            case link(header: String, text: String, onTap: () -> Void)
        }
        public let id = UUID()
        public let content: Content

        public init(content: Content) {
            self.content = content
        }
    }

    // MARK: - API
    let title: String
    let rows: [Row]
    let bottomIcons: [SirioIconData]
    let onTapClose: (() -> Void)?

    // Altezza stimata della bottom bar (dal tuo componente)
    private let bottomBarHeight: CGFloat = Size.Table.Drawer.stickyBarHeight
    private let bottomBarExtraSpacing: CGFloat = Size.p16

    public init(
        title: String,
        rows: [Row],
        bottomIcons: [SirioIconData],
        onTapClose: (() -> Void)? = nil
    ) {
        self.title = title
        self.rows = rows
        self.bottomIcons = bottomIcons
        self.onTapClose = onTapClose
    }

    public var body: some View {
        VStack(spacing: Size.zero) {
            // HEADER
            SirioTableDrawerTitle(title: title, onTapClose: onTapClose)

            ScrollView {
                LazyVStack(spacing: Size.zero) {
                    ForEach(rows) { row in
                        switch row.content {
                        case let .text(header, text):
                            SirioTableDrawerText(header: header, text: text)

                        case let .number(header, text):
                            SirioTableDrawerNumber(header: header, text: text)

                        case let .tag(header, text, type):
                            SirioTableDrawerTag(header: header, text: text, type: type)

                        case let .link(header, text, onTap):
                            SirioTableDrawerLink(
                                header: header,
                                text: text,
                                onTapLinkAction: onTap
                            )
                        }
                    }
                }
                // Spazio di sicurezza così lo scroll non viene coperto dalla bottom bar
                .padding(.bottom, bottomBarHeight + bottomBarExtraSpacing)
            }
            .frame(maxWidth: .infinity)
            
            SirioTableDrawerStickyBottomBar(icons: bottomIcons)
                .ignoresSafeArea(edges: .bottom)
        }
        
        .background(Color.aliasBackgroundColorPrimaryLight0)
        
    }
}

#Preview {
    TestSirioTableDrawer()
}

struct TestSirioTableDrawer: View {
    @State private var showDrawer = true

    var body: some View {
        VStack(spacing: 20) {
            Button("Apri Drawer") {
                showDrawer = true
            }
        }
        .sirioTableDrawer(
            isPresented: $showDrawer,
            title: "Titolo del Drawer",
            rows: [
                .init(content: .text(header: "Header", text: "Lorem ipsum")),
                .init(content: .number(header: "Header", text: "00")),
                .init(content: .tag(header: "Header", text: "Label tag", type: .gray)),
                .init(content: .link(header: "Header", text: "Apri link", onTap: {
                    print("Link tappato")
                }))
            ],
            bottomIcons: [
                .init(icon: .addressCard, action: {}),
                .init(icon: .download, action: {}),
                .init(icon: .trash, action: {})
            ],
            onTapClose: {
                print("Chiudi Drawer")
            }
        )
    }
}

// MARK: - Extension per presentare il Drawer
public extension View {
    func sirioTableDrawer(
        isPresented: Binding<Bool>,
        title: String,
        rows: [SirioTableDrawer.Row],
        bottomIcons: [SirioIconData],
        onTapClose: (() -> Void)? = nil
    ) -> some View {
        ZStack {
            self
            
            if isPresented.wrappedValue {
                SirioTableDrawer(
                    title: title,
                    rows: rows,
                    bottomIcons: bottomIcons,
                    onTapClose: {
                        withAnimation {
                            isPresented.wrappedValue = false
                        }
                        onTapClose?()
                    }
                )
                .transition(.move(edge: .trailing)) // 👉 entra da destra
                .zIndex(1)
            }
        }
        .animation(.easeInOut, value: isPresented.wrappedValue)
    }
}
