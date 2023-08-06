//
//  MagnifyGlassView.swift
//  QuickAnimation
//
//  Created by Shreyas Vilaschandra Bhike on 29/07/23.
//

import SwiftUI

struct MagnifyGlassView: View {
    var body: some View {
        ZStack {
            Image("paper").resizable().edgesIgnoringSafeArea(.all)
            MagnifyGlass()
            
            VStack{
                
               
                VStack {
                    HStack {
                        Text("Magnifying Glass")
                            .font(.system(size: 42))
                            .foregroundColor(.white)
                            .fontWeight(.light)
                        
                        Spacer()
                    }
                    HStack {
                        Text("By The App Wizard | Shreyas Bhike")
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

struct MagnifyGlassView_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyGlassView()
    }
}

extension Path {
    var reversed: Path {
        let reversedCGPath = UIBezierPath(cgPath: cgPath)
            .reversing()
            .cgPath
        return Path(reversedCGPath)
    }
}

struct LensShape: Shape {
    var xOffset: CGFloat = 0
    var yOffset: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)
        let hole = Circle().path(in: CGRect(x: rect.midX + xOffset - 50, y: rect.midY + yOffset - 50, width: 200, height: 200)).reversed
        path.addPath(hole)
        return path
    }
}

struct MagnifyGlass: View {
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                LensShape(xOffset: xOffset, yOffset: yOffset)
                    .fill(Color.black).opacity(0.92)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 300,height: 300)
                    .foregroundColor(.white).opacity(0.1)
                    .offset(x: xOffset+75, y: yOffset+80)
                
                Text("SHREYAS BHIKE")
                    .foregroundColor(.white).opacity(0.2)
                    .fontWeight(.light)
                    .rotationEffect(.degrees(45))
                    .offset(x: xOffset+170, y: yOffset+175)
             

                
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



