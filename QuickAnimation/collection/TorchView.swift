//
//  TorchView.swift
//  QuickAnimation
//
//  Created by Shreyas Vilaschandra Bhike on 31/07/23.
//

import SwiftUI

struct TorchView: View {
    var body: some View {
        ZStack {
            Image("paper").resizable().edgesIgnoringSafeArea(.all)
            TorchFlameView()
            
            VStack{
                
               
                VStack {
                    HStack {
                        Text("Torch Effect")
                            .font(.system(size: 42))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    HStack {
                        Text(" By The App Wizard | Shreyas Bhike")
                            .font(.system(size: 18))
                            .foregroundColor(.white).opacity(0.8)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                }.padding(10)
                
               
                
                Spacer()
                
            }
        }
    }
}

struct TorchView_Previews: PreviewProvider {
    static var previews: some View {
        TorchView()
    }
}


struct TorchComView: View {
    var body: some View {
        ZStack{
            
           
            
            Circle()
                .foregroundColor(.black)
                .frame(width: 100,height: 100)
                .offset(x: -25,y: -195)
                .opacity(0.3)
            
            WoodenRodTexture()
                .rotationEffect(.degrees(45))
                .offset(x:55,y: -85)
                .opacity(0.5)
            
            ForEach(0..<100) { _ in
                            ParticleView()
                    
                    .offset(x:200,y: 300)
                    }
            

            
            
            
            

            
            
        }
    }
}







struct ParticleView: View {
    @State private var position: CGPoint = CGPoint(x: 0, y: 0)
    @State private var opacity: Double = 0.5

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow.opacity(0.5))
                .frame(width: 30, height: 30)
                .position(position)
            Circle()
                .fill(Color.orange.opacity(0.5))
                .frame(width: 40, height: 40)
                .opacity(opacity)
                .position(position)
                .onAppear {
                    animateParticle()
            }
            
       
        }
    }

    private func animateParticle() {
        let duration = Double.random(in: 0.5...1.5)

        withAnimation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
            opacity = 0.0
            position = CGPoint(x: position.x + CGFloat.random(in: -10...10), y: position.y - CGFloat.random(in: 20...40))
        }
    }
}


struct TorchFlameView: View {
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                LensShape(xOffset: xOffset, yOffset: yOffset)
                    .fill(Color.black).opacity(0.92)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                
               
                    
                TorchComView()
                    .offset(x:xOffset + 100,y: yOffset + 300)
                    

                
              }
                .gesture(DragGesture()
                    .onChanged { value in
                        xOffset = value.translation.width
                        yOffset = value.translation.height
                    }
                    .onEnded { value in
                        // If you need to do something after the drag ends, you can add code here.
                    }
                )
                .contentShape(LensShape(xOffset: xOffset, yOffset: yOffset))
        }.edgesIgnoringSafeArea(.all) // needed for hit-testing
    }
}


struct WoodenRodTexture: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(woodGradient)
            .frame(width: 200, height: 15)
    }
    
    // Define the wood gradient
    var woodGradient: LinearGradient {
        let woodColors: [Color] = [
            Color(red: 101/255, green: 67/255, blue: 33/255),
            Color(red: 119/255, green: 82/255, blue: 47/255),
            Color(red: 101/255, green: 67/255, blue: 33/255)
        ]
        return LinearGradient(gradient: Gradient(colors: woodColors), startPoint: .leading, endPoint: .trailing)
    }
}
