//
//  DynamicGradientBorderButton.swift
//  MarsLen
//
//  Created by Simon Fong on 16/03/2024.
//

import SwiftUI

struct DynamicGradientBorderButton: View {
    
    @State var textLabel:String
    @State var rotation:CGFloat = 0.0
    
    var body: some View {
        ZStack{
//            Color.primaryDark
            // content
            RoundedRectangle(cornerRadius: 10, style:.continuous)
                .frame(width: 100,height: 30)
                .foregroundColor(Color.secondaryWhite)
//                .shadow(
//                    color:.black.opacity(0.5),
//                    radius: 10,
//                    x:0,
//                    y:0
//                )
            
            // border
            RoundedRectangle(cornerRadius: 10,style: .continuous)
                .frame(width: 25, height:150)
                .foregroundStyle(LinearGradient(
                    gradient: Gradient(
                        colors:
                            [
                                Color.purple.opacity(0.4),
                                Color.purple,
                                Color.secondaryBrown,
                                Color.secondaryBrown.opacity(0.4)
                            ]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                .rotationEffect(.degrees(rotation))
                .mask{
                    RoundedRectangle(cornerRadius: 20, style:.continuous)
                        .stroke(lineWidth: 4)
                        .frame(width: 100, height:30)
                }
            Text(textLabel)
//                .bold()
//                .font(.title3)
                .foregroundColor(Color.primaryDark)
        }
//        .ignoresSafeArea()
        .onAppear{
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)){
                rotation = 360
            }
        }
    }
}

#Preview {
    DynamicGradientBorderButton(textLabel: "Select me")
}
