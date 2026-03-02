import SwiftUI

struct ContentView: View {
    @State private var position: CGFloat = 0
    @State private var isFiring = false
    @State private var fireOpacity = 0.0
    @State private var shipScale: CGFloat = 1.0
    
    @State private var enemies: [CGFloat] = [ -200, 0, 200 ]
    @State private var enemyY: CGFloat = -300
    @State private var bulletY: CGFloat = 0
    @State private var bulletX: CGFloat = 0
    @State private var isBulletActive = false


    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [.black, .purple],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                Text("Destroyer")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                // Fighter ship
                ZStack {
                    // Fire effect
                    Circle()
                        .fill(Color.red)
                        .frame(width: 40, height: 40)
                        .offset(y: 50)
                        .opacity(fireOpacity)
                        .blur(radius: 8)

                    // Ship
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.cyan)
                        .frame(width: 120, height: 60)
                        .overlay(
                            Text("🚀")
                                .font(.largeTitle)
                        )
                        .scaleEffect(shipScale)
                        .offset(x: position)
                        .shadow(color: .cyan.opacity(0.7), radius: 15, x: 0, y: 0)
                        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: position)
                        .animation(.easeInOut(duration: 0.3), value: shipScale)
                }
                .frame(height: 200)

                // Controls
                HStack(spacing: 30) {
                    Button("◀︎ Left") {
                        position -= 40
                    }
                    .buttonStyle(ControlButtonStyle())

                    Button("Fire") {
                        fire()
                    }
                    .buttonStyle(ControlButtonStyle())

                    Button("Right ▶︎") {
                        position += 40
                    }
                    .buttonStyle(ControlButtonStyle())
                }

                Spacer()
            }
            .padding()
        }
    }

    // Fire animation logic
    private func fire() {
        // Pulse the ship
        shipScale = 1.2
        withAnimation(.easeOut(duration: 0.2)) {
            shipScale = 1.0
        }

        // Flash the fire circle
        fireOpacity = 1.0
        withAnimation(.easeOut(duration: 0.3)) {
            fireOpacity = 0.0
        }
    }
}

struct ControlButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3.bold())
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.white.opacity(configuration.isPressed ? 0.4 : 0.2))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}
