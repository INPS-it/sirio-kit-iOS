import SwiftUI

struct SirioLoader: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    
    @State private var isAnimating = false
    
    let size: CGFloat
    let animationDuration: Double
    let lineWidth: CGFloat
    let arcFraction: CGFloat

    init(
        size: CGFloat = Size.Loader.size,
        animationDuration: Double = 1.2,
        lineWidth: CGFloat = Size.Loader.lineWidth,
        arcFraction: CGFloat = 280 / 360
    ) {
        self.size = size
        self.animationDuration = animationDuration
        self.arcFraction = arcFraction
        self.lineWidth = lineWidth
    }
    
    var indicatorColor: Color {
        Color.globalPrimary100
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: arcFraction)
            .stroke(
                AngularGradient(
                    gradient: Gradient(colors: [
                        .clear,
                        indicatorColor.opacity(0.05),
                        indicatorColor.opacity(0.25),
                        indicatorColor.opacity(0.7),
                        indicatorColor,
                        .clear
                    ]),
                    center: .center
                ),
                style: StrokeStyle(
                    lineWidth: lineWidth,
                    lineCap: .round
                )
            )
            .frame(width: size, height: size)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(
                reduceMotion
                    ? .none
                    : .linear(duration: animationDuration).repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear { isAnimating = true }
            .onDisappear { isAnimating = false }
    }
}

extension View {
    public func withSirioLoader(
        isLoading: Binding<Bool>,
        size: CGFloat = 64,
        showsDimBackground: Bool = true
    ) -> some View {
        ZStack {
            self
                .opacity(isLoading.wrappedValue ? 0.05 : 1)
                .disabled(isLoading.wrappedValue)
            
            if isLoading.wrappedValue {
                ZStack {
                    if showsDimBackground {
                        Color.white.opacity(0.05)
                            .ignoresSafeArea()
                    }
                    
                    SirioLoader(size: size)
                }
                .transition(.opacity)
            }
        }
    }
}

#Preview {
    TestSirioLoader()
}

struct TestSirioLoader: View {
    @State var isLoading = false
    
    var body: some View {
        ScrollView {
            Button(action: {
                isLoading.toggle()
                
            }, label: {
                Text("PRESS")
            })
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
            Text("ciao")
        }
        .withSirioLoader(isLoading: $isLoading)
    }
}
