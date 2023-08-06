//
//  ThreadsInvite.swift
//  QuickAnimation
//
//  Created by Shreyas Vilaschandra Bhike on 02/08/23.
//

import SwiftUI

struct ThreadsInvite: View {
    var body: some View {
        CardFlipView()
    }
}

struct ThreadsInvite_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsInvite()
    }
}


struct CardFlipView: View {
    @State private var rotationAngle: Double = 0



     var body: some View {
         ZStack {
             Color.black.edgesIgnoringSafeArea(.all)
             VStack {
                 Spacer()
                 ZStack {
                     FrontView()
                         .rotation3DEffect(Angle(degrees: rotationAngle), axis: (x: 0.0, y: 1.0, z: 0.0))
                         
                     BackView()
                         .rotation3DEffect(Angle(degrees: rotationAngle - 180), axis: (x: 0.0, y: 1.0, z: 0.0))
                         .opacity(0.5)

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

struct FrontView: View {
    var body: some View {
        ZStack {
            Image("front").resizable()
        }.frame(width: 350,height: 500)
        .cornerRadius(10)
    }
}

struct BackView: View {
    var body: some View {
        ZStack {
            Image("back").resizable()
        }.frame(width: 350,height: 500)
        .cornerRadius(10)
    }
}
