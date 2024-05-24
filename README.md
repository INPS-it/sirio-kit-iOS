# sirio-kit-iOS

sirio-kit-iOS is a library containing the iOS implementation of the Sirio design system used for INPS mobile apps UI.

## Requirements

- iOS 15.0+ 
- Xcode 14+
- Swift 4+

## Usage
1. Add the following to your Package.swift:
```swift
.package(url: "https://github.com/INPS-it/sirio-kit-iOS", .upToNextMajor(from: "8.0.0"))
```
2. Declare `import SirioKitIOS` to use the components where you want to use them.

3. Register the font provided by the library in the app scene (This example can be found in the demo project).

```swift
@main
struct iOS_ExampleApp: App {
    
    init() {
        // Register fonts from library
        Fonts.registerFonts()
        // Svg Coder
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
```
4. Use components as in the example app.

## License

sirio-kit-iOS is released under the BSD 3-Clause License [See LICENSE](https://github.com/INPS-it/sirio-kit-iOS/blob/main/LICENSE) for details.
