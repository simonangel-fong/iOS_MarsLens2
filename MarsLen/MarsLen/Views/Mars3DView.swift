//
//  testView.swift
//  MarsLen
//
//  Created by Simon Fong on 17/03/2024.
//

import SwiftUI
import SceneKit

struct Mars3DView: View {
    
    @EnvironmentObject var model:AppModel
    
    var body: some View {
        NavigationStack{
                VStack{
                    // title
                    HStack {
                        Text("Mars 3D")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.primaryDark.opacity(0.7))
                            .padding(.leading)
                            .padding(.top)
                        Spacer(minLength: 0)
                    }
                          
                    // scene
                    SceneView(
                        //                    scene: SCNScene(named: "spirit.usdz"),
                        scene: SCNScene(named: "Mars.usdz"),
                        options: [
                            .autoenablesDefaultLighting,
                            .allowsCameraControl
                        ])
                    .background(Color.clear)
                    .frame(width: 300, height: 300)
                    
                    // Description of Mars
                    Text("Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System after Mercury.")
                        .font(.system(size: 23))
                        .padding()
                    
                    Spacer()
                    
                    // btn
                    NavigationLink(
                        destination: MissionListVIew()
                    ) {
                        Text("Mars Mission")
                            .font(.system(size: 18))
                            .foregroundColor(Color.secondaryDark)
                            .frame(width: min(UIScreen.main.bounds.width, 500) * 0.8,
                                   height: 40)
                            .background(Color.secondaryWhite.opacity(0.8))    // btn bg
                            .cornerRadius(17)
                    }
                    .shadow(
                        color: Color.secondaryBrown.opacity(0.8),
                        radius: 5, x: 5, y: 5)
                    .padding(.bottom, 20)
                    
                }
            }
        }
    }


struct Mars3DView_Previews: PreviewProvider{
    static var previews: some View{
        Mars3DView()
            .environmentObject(AppModel())
    }
}
