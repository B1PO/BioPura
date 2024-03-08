import SwiftUI

struct WaveAnimation: View {
    
    @State private var percent = 77.0
    @State private var percent2 = 82.0
    @State private var waveOffset = Angle(degrees: 0)
    
    // Variables para controlar el movimiento de flotación de los círculos
    @State private var floatOffsetBig = CGFloat(0)
    @State private var floatOffsetMedium = CGFloat(0)
    @State private var floatOffsetSmall = CGFloat(0)
    
    var body: some View {
        ZStack {
            Wave(offSet: Angle(degrees: waveOffset.degrees), percent: percent2)
                .fill(Color(red: 91/255, green: 163/255, blue: 242/255))
                .ignoresSafeArea(.all)
            
            Wave(offSet: Angle(degrees: waveOffset.degrees), percent: percent)
                .fill(Color(red: 141/255, green: 189/255, blue: 247/255))
                .ignoresSafeArea(.all)
                .scaleEffect(x: -1)
            
            ZStack{
                //Big
                Image("bub-big")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .offset(x:-230, y: 330 + floatOffsetSmall)
                    .opacity(0.3)
                    .scaleEffect(x:-1)
                

                
                Image("bub-big")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .offset(x:-290, y: 380 + floatOffsetBig)
                    .opacity(0.3)


                //Medium
                Image("bub-med")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .offset(x:20, y: 390 + floatOffsetSmall)
                    .opacity(0.3)

                
                Image("bub-med")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .offset(x:-315, y: 90 + floatOffsetMedium)
                    .opacity(0.3)


                //Short
                Image("bub-small")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .offset(x: -290, y: -180 + floatOffsetSmall)
                    .opacity(0.8)

                
                Image("bub-small")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .offset(x: 320, y: -50 + floatOffsetBig)
                    .opacity(0.8)

                
                Image("bub-small")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .offset(x: 290, y: 210 + floatOffsetSmall)
                    .opacity(0.8)

                
                Image("bub-small")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .offset(x: -100, y: 230 + floatOffsetBig)
                    .opacity(0.8)

                
                Image("bub-small")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .offset(x: 230, y: 480 + floatOffsetSmall)
                    .opacity(0.8)

            }
        }
        .onAppear {
            // Animaciones de flotación
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                floatOffsetBig = 35
            }
            withAnimation(Animation.easeInOut(duration: 1.8).repeatForever(autoreverses: true)) {
                floatOffsetMedium = -20
            }
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                floatOffsetSmall = 15
            }
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                waveOffset = Angle(degrees: 360)
            }
        }
    }
}

struct Wave: Shape {
    var offSet: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offSet.degrees }
        set { offSet = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let lowestWave = 0.02
        let highestWave = 1.00
        
        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / 100)
        let waveHeight = 0.015 * rect.height
        let yOffSet = CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offSet
        let endAngle = offSet + Angle(degrees: 360 + 10)
        
        p.move(to: CGPoint(x: 0, y: yOffSet + waveHeight * CGFloat(sin(offSet.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yOffSet + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

struct WaveAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WaveAnimation()
    }
}

