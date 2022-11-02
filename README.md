# Sirio-kit-iOS

Sirio-kit-iOS is a library containing the iOS implementation of Sirio design system to be used for INPS mobile apps UI.

## Requirements

- iOS 15.0+ 
- Xcode 14+
- Swift 4+


## Usage
1. Add the following to your Package.swift:
```swift
.package(url: "https://github.com/INPS-it/sirio-kit-iOS", .upToNextMajor(from: "4.0.0"))
```
2. Declare `import SirioKitIOS` to use the components where you want use it.

3. Register the font provided by the library in the app scene. (This example can be found in the demo project.)

```swift
@main
struct iOS_ExampleApp: App {
    
    init() {
        // Register fonts from library
        Fonts.registerFonts()
    }
}
```
4. Use components as in the example app.

## License

SirioKitIOS is released under the BSD 3-Clause License [See LICENSE](https://github.com/INPS-it/SirioKitIOS/blob/main/LICENSE) for details.
