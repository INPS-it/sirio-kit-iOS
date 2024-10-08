import SwiftUI

// A struct that defines the style for Options component (Search bar suggestions)
struct OptionsStyle: ButtonStyle {
    var text: String

    func makeBody(configuration: Self.Configuration) -> some View {
        VStack(spacing: 0) {
            HStack {
                SirioText(text: text, typography: .label_md_400)
                    .foregroundColor(getTextColor(configuration: configuration))
                    .lineLimit(2)
                Spacer()
            }
            .padding(.horizontal, Size.SearchBar.Options.paddingHorizontal)
            .padding(.vertical, Size.SearchBar.Options.paddingVertical)
            .background(getBackgroundColor(configuration: configuration))
            
            Divider()
                .background(StyleDictionaryColor.specificDataEntryBorderColorDefault.color)
        }
    }

    private func getTextColor(configuration: Self.Configuration) -> Color {
        if configuration.isPressed {
            return Color.SearchBar.OptionValue.Text.pressed
        }
        return Color.SearchBar.OptionValue.Text.default
    }

    private func getBackgroundColor(configuration: Self.Configuration) -> Color {
        if configuration.isPressed {
            return Color.SearchBar.OptionValue.Background.pressed
        }
        return Color.SearchBar.OptionValue.Background.default
    }
}
