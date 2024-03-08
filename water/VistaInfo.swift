import SwiftUI

struct VistaInfo: View {
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .background(Color.white)
                        .offset(x:0,y:0)
                }
                
                VStack {
                        Text("Salva el agua")
                            .fontWeight(.bold)
                            .font(Font.custom("Montserrat-Bold", size: 27))
                            .padding()
                            .foregroundStyle(Color(red:67/255, green:178/255 , blue:98/255))
                            Text("Los diferentes tipos de contaminación estan agotando el suministro de agua potable en todo el mundo. Este problema se ha vuelto aun más preocupante en México, donde afecta a distintos grupos de personas vulnerables.")
                                .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                                .font(Font.custom("Montserrat-Regular", size: 20))
                                .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                                .padding()
                                .offset(x:5,y:-20)
                }.offset(y:0)
                VStack{
                    Rectangle()
                        .fill(Color(red:67/255, green:178/255 , blue:98/255))
                    Spacer()
                    Rectangle()
                        .fill(Color(red:91/255, green:163/255 , blue: 242/255))
                        .offset(y:100)
                }
                
                VStack{
                            Image("Grises")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .background(Color.white)
                                .scaleEffect(x:-1)
                                .clipShape(RoundedRectangle(cornerRadius: 60))
                        
                                Text("¿Qué son las aguas grises?")
                                    .font(Font.custom("Montserrat-Bold", size: 27))
                                    .foregroundStyle(Color(red:67/255, green:178/255 , blue:98/255))
                    VStack {
                        HStack{
                            Text("Son aguas jabonosas que provienen de lavabos, fregaderos,\n regaderas y lavadoras.")
                                            .font(Font.custom("Montserrat-Regular", size: 20))
                                        .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        }.offset(x:-25,y:20)
                        
                        HStack{
                            Text("Cuando los nutrientes ahí contenidos van a dar a un cauce de agua,\n generan contaminación que daña la vida acuática.")
                                .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        }.offset(x:15,y:40)
                        
                        HStack{
                            Text("Si no reciben un tratamiento previo a su descarga o reutilización,\ntiene efectos nocivos a la salud y el medio ambiente.")
                                .font(Font.custom("Montserrat-Regular", size: 20))
                            .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))

                        }.offset(x:0,y:60)
                      
                    }
    
                }.offset(x:0, y:140)
                
                VStack{
                    VStack{
                        Text("Materiales")
                            .font(Font.custom("Montserrat-Bold", size: 27))
                            .foregroundStyle(Color(red:67/255, green:178/255 , blue:98/255))
                        Text("Existen distintos tipos de materiales que pueden ayudar\n             a la filtración y descontaminación del agua")
                            .font(Font.custom("Montserrat-Regular", size: 24))
                            .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        HStack{
                            VStack {
                                Image("Grava")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                
                                Text("Grava")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Montserrat-Bold", size: 27))
                                
                                Text("Proporciona un sustrato solido\npara el crecimineto bacteriano\ny facilita el flujo del agua")
                                    .font(Font.custom("Monserrat-Regular", size: 22))
                                    .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                                
                                
                            }.offset(x:0)
                            
                            VStack {
                                Image("Arena")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                
                                
                                Text("Arena")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Montserrat-Bold", size: 27))
                                
                                Text("Similar a la grava, ayuda a filtrar\npartículas solidas de agua")
                                    .font(Font.custom("Monserrat-Regular", size: 22))
                                    .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                            }.offset(x:25, y:-10)
                            
                        }.offset(y:30)
                    }
                    
                    
                    VStack{
                        HStack{
                            VStack {
                                Image("Fibras")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 280)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                
                                
                                Text("Fibras sintética")
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Montserrat-Bold", size: 27))
                                
                                Text("Se usan fibras sintéticas especiales\npara generar una superficie \npara la colonizacion bacteriana ")
                                    .font(Font.custom("Monserrat-Regular", size: 22))
                                    .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                                
                                
                                
                            }.offset(x:10)
                            
                            VStack {
                                Image("Carbon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300)
                                    .background(Color.white)
                                    .offset(y:0)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .offset(y:-20)
                                
                                
                                Text("Carbón activado")
                                    .offset(y:-10)
                                    .foregroundColor(Color.black)
                                    .font(Font.custom("Montserrat-Bold", size: 27))
                                
                                Text("Ayuda a absorber compuestos órganicos,productos químicos y \nolores del agua")
                                    .font(Font.custom("Monserrat-Regular", size: 22))
                                    .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                                    .offset(x:20)
                                
                            }.offset(x:10,y:20)
                            
                        }.offset(y:50)
                    }
                }.offset(x:0,y:440)
                
                
                VStack{
                        VStack {
                                Text("¿Comó funcionan los filtros?")
                                    .font(Font.custom("Montserrat-Bold", size: 27))
                                .foregroundStyle(Color(red:67/255, green:178/255 , blue:98/255))
                                Image("Biofiltro")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 700)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                            }.offset(x:0)
                    
                    VStack{
                        HStack {
                            Circle()
                                .fill(Color(red:91/255, green:163/255 , blue: 242/255))
                                .frame(width: 12,height: 12)
                            .offset(x:3)
                            Text("Se aprovecha microorganismos del suelo que degradan \nla materia orgánica y que las plantas necesitan \nnutrientes y agua para su desarrollo.")
                                .font(Font.custom("Montserrat-Regular", size: 20))
                                .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        }.offset(x:-80)
                        
                        HStack{
                            Circle()
                                .fill(Color(red:91/255, green:163/255 , blue: 242/255))
                                .frame(width: 12,height: 12)
                            Text("Las aguas grises se reciben en una trampa de grasas.La trampa \ntiene dos funciones: retener las grasas y acumular los sólidos.")
                                .font(Font.custom("Montserrat-Regular", size: 20))
                                .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        }.offset(x:-40)
                        
                        HStack{
                            Circle()
                                .offset(x:3)
                                .fill(Color(red:91/255, green:163/255 , blue: 242/255))
                                .frame(width: 12,height: 12)
                            Text("El agua sale de la trampa y se dirige a una jardinera.")
                                .font(Font.custom("Montserrat-Regular", size: 20))
                                .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        }.offset(x:-105)
                        
                        HStack{
                            Circle()
                                .offset(x:3)
                                .fill(Color(red:91/255, green:163/255 , blue: 242/255))
                                .frame(width: 12,height: 12)
                            Text("En la sección central esta una mezlca de arena y \ntierra donde están las plantas.")
                                .font(Font.custom("Montserrat-Regular", size: 20))
                                .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        }.offset(x:-119)
                      
                        HStack{
                            Circle()
                                .offset(x:3)
                                .fill(Color(red:91/255, green:163/255 , blue: 242/255))
                                .frame(width: 12,height: 12)
                            Text("Aquí se atrapan los sólidos y el agua fluye lentamente.\nEntre más tiempo este en el filtro, mayor será su tratamiento.")
                                .font(Font.custom("Montserrat-Regular", size: 20))
                                .foregroundStyle(Color(red:85/255, green:85/255 , blue:85/255))
                        }.offset(x:-60)
                        
                    }.offset(x:55, y:40)
                    
                }.offset(y:760)
                
                VStack{
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 500, height: 800)
                }
            }
        }
        .background(Color.white)
    }
}

#Preview {
    ContentView()
}
#Preview {
    VistaInfo()
}
