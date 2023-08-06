//
//  RotateText.swift
//  QuickAnimation
//
//  Created by Shreyas Vilaschandra Bhike on 02/08/23.
//

import SwiftUI

struct RotateText: View {
    var body: some View {
        TextFlipView()
    }
}

struct RotateText_Previews: PreviewProvider {
    static var previews: some View {
        RotateText()
    }
}


struct TextFlipView: View {
    @State private var rotationAngle: Double = 0



     var body: some View {
         ZStack {
             Color.black.edgesIgnoringSafeArea(.all)
             VStack {
                 Spacer()
                 ZStack {
                     ZStack{
                         
                         ForEach(0..<20) { index in
                             TextHolderView()
                                 .offset(x: -100)
                                 .rotation3DEffect(Angle(degrees: rotationAngle + Double(index) * 10.0), axis: (x: 0.0, y: 1.0, z: 0.0))
                                 .opacity(1.0 - Double(index) * 0.09)
                         }
                        
                        
                         
                         
                     }
                            
                                                    
            
                         
                   
                    

                 }
                 .onAppear {
                     withAnimation(Animation.linear(duration: 6.0).repeatForever(autoreverses: false)) {
                         
                         rotationAngle = 360.0
                         
                     }
                 }
                 Spacer()
             }
         }
     }


}

struct TextHolderView: View {
    var body: some View {
        ZStack {
           Text("Hello")
                .foregroundColor(.white)
                .font(.system(size: 120))
                .fontWeight(.regular)
                .rotationEffect(.degrees(90))
                .opacity(1)
                
        }
        
    }
}

