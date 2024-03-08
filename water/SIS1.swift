import SwiftUI

struct DraggableImage: Identifiable {
    var id = UUID()
    var imageName: String
    var popupImageName: String // Nombre de la imagen para el popup
    var startingPosition: CGPoint
    var currentPosition: CGPoint
    var isPlaced: Bool
    var isShowingPopup: Bool = false // Control de visibilidad del popup
    var unplacedSize: CGFloat
    var placedSize: CGFloat
}

    
struct SIS1: View {
    @State private var showFinalPopup = false

        //startingPosition es donde reaparecen y current donde sale la primera
    @State private var images: [DraggableImage] = [
        DraggableImage(imageName: "Tinaco", popupImageName: "popup-tinaco", startingPosition: CGPoint(x: 275, y: 950), currentPosition: CGPoint(x: 275, y: 950), isPlaced: false, unplacedSize: 70, placedSize: 120),
        DraggableImage(imageName: "Tubo2",popupImageName: "popup-pvc", startingPosition: CGPoint(x: 100, y: 950), currentPosition: CGPoint(x: 100, y: 950), isPlaced: false, unplacedSize: 90, placedSize: 75),
        DraggableImage(imageName: "Tubo1",popupImageName: "popup-tubo1", startingPosition: CGPoint(x: 425, y: 950), currentPosition: CGPoint(x: 425, y: 950), isPlaced: false, unplacedSize: 70, placedSize: 65),
        DraggableImage(imageName: "Tubo3",popupImageName: "popup-pvc", startingPosition: CGPoint(x: 575, y: 950), currentPosition: CGPoint(x: 575, y: 950), isPlaced: false, unplacedSize: 20, placedSize: 20),
        DraggableImage(imageName: "Tubo4",popupImageName: "popup-pvc", startingPosition: CGPoint(x: 700, y: 950), currentPosition: CGPoint(x: 700, y: 950), isPlaced: false, unplacedSize: 70, placedSize: 47),
       
        DraggableImage(imageName: "llave",popupImageName: "popup-llave", startingPosition: CGPoint(x: 500, y: 1070), currentPosition: CGPoint(x: 500, y: 1070), isPlaced: false, unplacedSize: 70, placedSize: 50),
        DraggableImage(imageName: "planta",popupImageName: "popup-planta", startingPosition: CGPoint(x: 350, y: 1070), currentPosition: CGPoint(x: 350, y: 1070), isPlaced: false, unplacedSize: 70, placedSize: 130),
        DraggableImage(imageName: "Tanque",popupImageName: "popup-tanque", startingPosition: CGPoint(x: 200, y: 1050), currentPosition: CGPoint(x: 200, y: 1050), isPlaced: false, unplacedSize: 70, placedSize: 120),
        DraggableImage(imageName: "waterpump",popupImageName: "popup-bomba", startingPosition: CGPoint(x: 650, y: 1070), currentPosition: CGPoint(x: 650, y: 1070), isPlaced: false, unplacedSize: 70, placedSize: 80),
    ]
    
    let additionalTargetPositionForTuboH2 = CGPoint(x: 385, y: 750)
    let additionalTargetPositionForTuboH3 = CGPoint(x: 460, y: 750)
    let additionalTargetPositionForTuboH1 = CGPoint(x: 310, y: 750)
    
    let additionalTargetPositionForPlanta2 = CGPoint(x: 359, y: 393)
    let additionalTargetPositionForPlanta3 = CGPoint(x: 197, y: 393)

    let additionalTargetPositionForLLave2 = CGPoint(x: 441, y: 403)
    let additionalTargetPositionForLLave3 = CGPoint(x: 606, y: 403)
    
    let additionalTargetPositionForTuboV2 = CGPoint(x: 106, y: 627)
    let additionalTargetPositionForTuboV3 = CGPoint(x: 720, y: 460)
    let additionalTargetPositionForTuboV4 = CGPoint(x: 720, y: 540)
    





    
    var body: some View {
        ZStack {
            Color(red: 91/255, green: 163/255, blue: 242/255).ignoresSafeArea()
            Text("ARMA TU SISTEMA")
                .foregroundColor(.white)
                .font(.custom("Montserrat-Bold", size: 47))
                .offset(y: -450)
            
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Color.white
                    .frame(width: 750, height: 650, alignment: .center)
                    .cornerRadius(50)
                
                Spacer()
                
                ZStack {
                    Color.white
                        .frame(width: 750, height: 280, alignment: .center)
                        .cornerRadius(50)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x:-310, y:-50)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x:-140, y:-50)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(y:-50)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: 150,y:-50)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: 280,y:-50)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: 230,y:70)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: 90,y:70)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: -60,y:70)
                    
                    Image("goti")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: -210,y:70)
                }
                
                

                
            }
            
            
            // Static target images
            Image("Tubo1").resizable().scaledToFit().frame(width: 65).position(x: 530, y: 710).opacity(0.2)
            
            Image("Tubo2").resizable().scaledToFit().frame(width: 75).position(additionalTargetPositionForTuboH1).opacity(0.2)
            Image("Tubo2").resizable().scaledToFit().frame(width: 75).position(x: 235, y: 750).opacity(0.2)
            Image("Tubo2").resizable().scaledToFit().frame(width: 75).position(additionalTargetPositionForTuboH2).opacity(0.2)
            Image("Tubo2").resizable().scaledToFit().frame(width: 75).position(additionalTargetPositionForTuboH3).opacity(0.2)
            
            
            Image("Tubo3").resizable().scaledToFit().frame(width: 19).position(x: 106, y: 477).opacity(0.2)
            Image("Tubo3").resizable().scaledToFit().frame(width: 19).position(additionalTargetPositionForTuboV2).opacity(0.2)
            Image("Tubo3").resizable().scaledToFit().frame(width: 19).position(additionalTargetPositionForTuboV3).opacity(0.2)
            Image("Tubo3").resizable().scaledToFit().frame(width: 19).position(additionalTargetPositionForTuboV4).opacity(0.2)
            
            
            Image("Tubo4").resizable().scaledToFit().frame(width: 45).position(x: 120, y: 420).opacity(0.2)
            
            
            Image("llave").resizable().scaledToFit().frame(width: 50).position(x: 277, y: 403).opacity(0.2)
            
            Image("llave").resizable().scaledToFit().frame(width: 50).position(additionalTargetPositionForLLave2).opacity(0.2)
            Image("llave").resizable().scaledToFit().frame(width: 50).position(additionalTargetPositionForLLave3).opacity(0.2)
            
            
            ForEach($images) { $image in
                Image(image.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: image.isPlaced ? image.placedSize : image.unplacedSize)
                    .position(image.currentPosition)
                    .gesture(
                        image.isPlaced ? nil :
                        DragGesture()
                            .onChanged { value in
                                image.currentPosition = value.location
                            }
                        .onEnded { value in
                            let potentialTargets = self.potentialTargetPositions(for: image.imageName)
                            if let targetPosition = potentialTargets.first(where: { value.location.distance(to: $0) < 50 }) {
                                if !image.isPlaced {
                                    let newImage = DraggableImage(
                                        imageName: image.imageName,
                                        popupImageName: image.popupImageName,
                                        startingPosition: image.startingPosition,
                                        currentPosition: image.startingPosition,
                                        isPlaced: false,
                                        unplacedSize: image.unplacedSize,
                                        placedSize: image.placedSize
                                    )
                                    images.append(newImage)
                                }
                                image.currentPosition = targetPosition
                                image.isPlaced = true
                                image.isShowingPopup = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                    image.isShowingPopup = false
                                }

                                if image.imageName == "Tinaco" {
                                    checkAllImagesPlaced() // Solo verificar cuando el Tinaco se coloca
                                }
                            }
                        }

                    )
            }

            // Mostrar el popup en una posición fija
            
            
            Image("planta").resizable().scaledToFit().frame(width: 132).position(x: 523, y: 393).opacity(0.2)
            
            Image("planta").resizable().scaledToFit().frame(width: 132).position(additionalTargetPositionForPlanta2).opacity(0.2)
            Image("planta").resizable().scaledToFit().frame(width: 132).position(additionalTargetPositionForPlanta3).opacity(0.2)
            Image("Tanque").resizable().scaledToFit().frame(width: 120).position(x: 138, y: 681).opacity(0.2)
            Image("waterpump").resizable().scaledToFit().frame(width: 80).position(x: 114, y: 551).opacity(0.2)
            Image("Tinaco").resizable().scaledToFit().frame(width: 120).position(x: 688, y: 340).opacity(0.2)
            
            
            Image("casa")
                .resizable()
            .scaledToFit()
            .frame(width: 270)
            .offset(x:237, y:60)
            
            if images.contains(where: { $0.isShowingPopup }) {
                let popupImageName = images.first(where: { $0.isShowingPopup })?.popupImageName ?? ""
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: 700, height: 200)
                    .shadow(radius: 20)
                    .overlay(
                        Image(popupImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 700)
                    )
                    // Define una posición fija para el popup aquí. Ajusta según el diseño de tu app.
                    // Por ejemplo: En el centro y parte superior de la pantalla.
                    .position(x: UIScreen.main.bounds.width / 2, y: 150)
                    .transition(.scale)
            }
            
            
            if showFinalPopup {
                Color.black.opacity(0.7)
                    .ignoresSafeArea() // Asegura que el fondo cubra toda la pantalla, incluyendo las áreas seguras
                
                // Popup FinalPopup con la imagen
                Image("FinalPopup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 450)
                    .shadow(radius: 20)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            }
                    }
    }
    
    func potentialTargetPositions(for imageName: String) -> [CGPoint] {
        var positions: [CGPoint] = [targetPositions[imageName]!]
        if imageName == "llave" {
            positions.append(additionalTargetPositionForLLave2)
            positions.append(additionalTargetPositionForLLave3)
        }

        if imageName == "Tubo2" {
            positions.append(additionalTargetPositionForTuboH2)
            positions.append(additionalTargetPositionForTuboH3)
            positions.append(additionalTargetPositionForTuboH1)
        }
        if imageName == "Tubo3" {
            positions.append(additionalTargetPositionForTuboV2)
            positions.append(additionalTargetPositionForTuboV3)
            positions.append(additionalTargetPositionForTuboV4)

        }
        if imageName == "planta" {
            positions.append(additionalTargetPositionForPlanta2)
            positions.append(additionalTargetPositionForPlanta3)
        }
        return positions
        
    }
    func checkAllImagesPlaced() {
        if let tinaco = images.first(where: { $0.imageName == "Tinaco" }) {
            if tinaco.isPlaced {
                showFinalPopup = true
            }
        }
    }


    
    var targetPositions: [String: CGPoint] {
        [
            "Tubo2": CGPoint(x: 235, y: 750),
            "Tubo1": CGPoint(x: 530, y: 710),
            "Tinaco": CGPoint(x: 690, y: 340),
            "Tubo3": CGPoint(x: 106, y: 477),
            "Tubo4": CGPoint(x: 120, y: 420),
            "planta": CGPoint(x: 523, y: 393),
            "llave": CGPoint(x: 277, y: 403),
            "Tanque": CGPoint(x: 138, y: 681),
            "waterpump": CGPoint(x: 114, y: 551)



        ]
    }
}

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        sqrt((x - point.x) * (x - point.x) + (y - point.y) * (y - point.y))
    }
}

struct SIS1_Previews: PreviewProvider {
    static var previews: some View {
        SIS1()
    }
}

