import SwiftUI

// Enumeración para controlar las vistas activas.
enum ActiveView {
    case main, sis1, activeCamera, button3, button4
}

struct MenuView: View {
    @State private var activeView: ActiveView = .main
    @State private var yOffset1: CGFloat = 0
    @State private var yOffset2: CGFloat = 0
    @State private var yOffset3: CGFloat = 0
    @State private var yOffset4: CGFloat = 0
    @State private var backButtonOffset: CGFloat = 0
    @State private var logoOffset: CGFloat = 0
    @State private var overallOpacity: Double = 1
    @State private var buttonsOpacity: Double = 1
    @State private var waveAnimationOffset: CGFloat = 0
    @State private var scale1: CGFloat = 1
    @State private var scale2: CGFloat = 1
    @State private var scale3: CGFloat = 1
    @State private var scale4: CGFloat = 1

    var body: some View {
        ZStack {
            if activeView == .main {
                WaveAnimation()
                    .offset(y: waveAnimationOffset)
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 170, alignment: .top)
                    // Inicia la animación del logo solo cuando esté en la vista principal
                    .offset(y: -450 + logoOffset)
                    .animation(activeView == .main ? Animation.easeInOut(duration: 2).repeatForever(autoreverses: true) : nil, value: logoOffset)
            }
            
            switch activeView {
            case .main:
                mainContent.opacity(buttonsOpacity)
            case .sis1, .activeCamera:
                selectedView.overlay(backButton, alignment: .topLeading)
            
            case .button3, .button4:
                selectedView.overlay(backButton2, alignment: .topLeading)
            }
        }
        .onAppear {
            initiateFloatingAnimations()
        }
    }

    var mainContent: some View {
        VStack {
            Image("armar")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .scaleEffect(scale1)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.2)) {
                        scale1 = 1.1
                    }
                    animateAndChangeView(to: .sis1)
                }
                .padding()
                .offset(y: yOffset1)
                // Asegura que la animación de flotación continúe
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: yOffset1)
            
            Image("contaminometro")
                .resizable()
                .scaledToFit()
                .frame(width: 500)
                .scaleEffect(scale2)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.2)) {
                        scale2 = 1.1
                    }
                    animateAndChangeView(to: .activeCamera)
                }
                .padding()
                .offset(y: yOffset2)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: yOffset2)
            
            HStack(spacing: 20) {
                Image("btnContact")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .scaleEffect(scale3)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.2)) {
                            scale3 = 1.1
                        }
                        animateAndChangeView(to: .button3)
                    }
                    .padding([.bottom, .horizontal])
                    .offset(y: yOffset3)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: yOffset3)
                
                Image("btnInfo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .scaleEffect(scale4)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.2)) {
                            scale4 = 1.1
                        }
                        animateAndChangeView(to: .button4)
                    }
                    .padding([.bottom, .horizontal])
                    .offset(y: yOffset4)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: yOffset4)
            }
        }
    }

    var backButton: some View {
        Button(action: {
            waveAnimationOffset = 0
            buttonsOpacity = 1
            logoOffset = 20
            resetButtonScales()
            activeView = .main
            withAnimation(.easeInOut(duration: 0.5)) {
                overallOpacity = 1
            }
            // Reinicia las animaciones al volver al menú principal
            initiateFloatingAnimations()
        }) {
            Image("back")
                .resizable()
                .scaledToFit()
                .frame(width: 44)
                .foregroundColor(.white)
                .padding()
                .offset(y: backButtonOffset)
        }
    }
    
    var backButton2: some View {
        Button(action: {
            waveAnimationOffset = 0
            buttonsOpacity = 1
            logoOffset = 20
            resetButtonScales()
            activeView = .main
            withAnimation(.easeInOut(duration: 0.5)) {
                overallOpacity = 1
            }
            // Reinicia las animaciones al volver al menú principal
            initiateFloatingAnimations()
        }) {
            Image("back2")
                .resizable()
                .scaledToFit()
                .frame(width: 44)
                .foregroundColor(.white)
                .padding()
                .offset(y: backButtonOffset)
        }
    }
    
    private func animateAndChangeView(to view: ActiveView) {
        withAnimation(.easeOut(duration: 2)) {
            waveAnimationOffset = 1100
            buttonsOpacity = 0
            logoOffset = -500
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.activeView = view
            }
        }
    }

    private func resetButtonScales() {
        scale1 = 1
        scale2 = 1
        scale3 = 1
        scale4 = 1
    }

    private func initiateFloatingAnimations() {
        yOffset1 = 10
        yOffset2 = 8
        yOffset3 = 6
        yOffset4 = 12
        logoOffset = 20
        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            backButtonOffset = 10
        }
    }

    var selectedView: some View {
        switch activeView {
        case .sis1:
            return AnyView(SIS1())
        case .activeCamera:
            return AnyView(ActiveCameraView())
        case .button3, .button4:
            return AnyView(VistaInfo())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

