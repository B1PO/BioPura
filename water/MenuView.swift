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
    @State private var logoOffset: CGFloat = 0 // Agregado para el desplazamiento del logo


    var body: some View {
        
        ZStack {
            // Muestra el fondo si estamos en la vista principal.
            if activeView == .main {
                WaveAnimation()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 170, alignment: .top)
                    .offset(y: -450 + logoOffset) // Modificado para incluir el desplazamiento del logo
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: logoOffset)
            }
            
            // Contenido condicional basado en la vista activa.
            switch activeView {
            case .main:
                mainContent
            case .sis1:
                SIS1()
                    .overlay(backButton, alignment: .topLeading)
            case .activeCamera:
                ActiveCameraView()
                    .overlay(backButton, alignment: .topLeading)
            case .button3:
                VistaInfo()
                    .overlay(backButton2, alignment: .topLeading)

            case .button4:
                VistaInfo()
                    .overlay(backButton2, alignment: .topLeading)

            }
        }
        .onAppear {
            yOffset1 = 10
            yOffset2 = 8
            yOffset3 = 6
            yOffset4 = 12
            logoOffset = 20
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                backButtonOffset = 10
            }
        }
    }
    
    var mainContent: some View {
        VStack {
            Image("armar")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .onTapGesture {
                    activeView = .sis1
                }
                .padding()
                .offset(y: yOffset1)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: yOffset1)
            
            Image("contaminometro")
                .resizable()
                .scaledToFit()
                .frame(width: 500)
                .onTapGesture {
                    activeView = .activeCamera
                }
                .padding()
                .offset(y: yOffset2)
                .animation(Animation.easeInOut(duration: 1.7).repeatForever(autoreverses: true), value: yOffset2)
            
            HStack(spacing: 20) {
                Image("btnContact")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .onTapGesture {
                        activeView = .button3
                    }
                    .padding([.bottom, .horizontal])
                    .offset(y: yOffset3)
                    .animation(Animation.easeInOut(duration: 1.3).repeatForever(autoreverses: true), value: yOffset3)
                
                Image("btnInfo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .onTapGesture {
                        activeView = .button4
                    }
                    .padding([.bottom, .horizontal])
                    .offset(y: yOffset4)
                    .animation(Animation.easeInOut(duration: 1.9).repeatForever(autoreverses: true), value: yOffset4)
            }
        }
    }
    
    var backButton: some View {
        Button(action: {
            activeView = .main
        }) {
            Image("back")
                .resizable()
                .scaledToFit()
                .frame(width: 44)
                .foregroundColor(.white)
                .padding()
                .offset(y: backButtonOffset)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: backButtonOffset)
        }
        .onAppear {
            backButtonOffset = 30
        }
    }
    
    var backButton2: some View {
        Button(action: {
            activeView = .main
        }) {
            Image("back2")
                .resizable()
                .scaledToFit()
                .frame(width: 44)
                .foregroundColor(.white)
                .padding()
                .offset(y: backButtonOffset)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: backButtonOffset)
        }
        .onAppear {
            backButtonOffset = 30
        }
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

