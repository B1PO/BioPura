import SwiftUI
import AVFoundation

struct ActiveCameraView: View {
    @State private var showMonitorDetails = false
    @State private var showSecondPopup = false // Estado para el segundo popup
    @State private var showButton = false
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ZStack {
            SwiftUIAVCaptureVideoPreviewView(onMonitorDetected: { detected in
                if detected {
                    self.showButton = true
                    self.playSound()
                } else {
                    self.showButton = false
                }
            })
            .ignoresSafeArea()

            if showButton {
                Button(action: {
                    self.showMonitorDetails.toggle()
                }) {
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: 20)
                        .frame(width: 130, height: 130)
                        .overlay(Image( "Logo").resizable().scaledToFit().frame(width: 100).foregroundColor(.white))
                }
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                .transition(.scale)
            }

            if showMonitorDetails {
                Image("popajax")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 450)
                    .overlay(
                        VStack {
                            // Botón para cerrar el primer popup
                            Circle()
                                .fill(Color.red)
                                .frame(width: 50, height: 50)
                                .overlay(Image("x")
                                    .resizable().scaledToFit().frame(width: 20))
                                .onTapGesture {
                                    self.showMonitorDetails = false
                                    self.showSecondPopup = false
                                }
                                .offset(x:165,y:-145)
                            
                            // Botón para abrir el segundo popup
                            Circle()
                                .fill(Color.white)
                                .shadow(radius: 3)
                                .frame(width: 50, height: 50)
                                .overlay(Image("Logo").resizable().scaledToFit().frame(width: 30).foregroundColor(.white))
                                .onTapGesture {
                                    self.showSecondPopup = true
                                    

                                }
                            .offset(y:195)                        }
                    )
                    .transition(.scale)
                    .animation(.default, value: showMonitorDetails)
            }
            
            // Segundo popup
            if showSecondPopup {
                Image("popeco")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 720)
                    .shadow(radius: 3)
                    .offset(y: 415)
                    .overlay(
                        Circle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .overlay(Image("v")
                                .resizable().scaledToFit().frame(width: 20))
                            .onTapGesture {
                                self.showSecondPopup = false
                            }
                            .offset(y:224))
                    .transition(.scale)
                    .animation(.default, value: showSecondPopup)
            }
        }
    }

    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "barcode", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("No se pudo cargar el archivo de sonido")
        }
    }
}

struct SwiftUIAVCaptureVideoPreviewView: UIViewRepresentable {
    var onMonitorDetected: (Bool) -> Void

    func makeUIView(context: Context) -> UIAVCaptureVideoPreviewView {
        let view = UIAVCaptureVideoPreviewView()
        view.onMonitorDetected = onMonitorDetected
        view.setModel()
        view.setupSession()
        view.setupPreview()
        return view
    }

    func updateUIView(_ uiView: UIAVCaptureVideoPreviewView, context: Context) {
    }
}

struct ActiveCameraView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveCameraView()
    }
}

