//
//  testView.swift
//  MarsLen
//
//  Created by Simon Fong on 17/03/2024.
//

import SwiftUI
import SceneKit

struct Test3DView: View {
    
    @EnvironmentObject var model:AppModel
    
    var body: some View {
        NavigationStack{
            VStack{
                SceneView(
                    //                scene: SCNScene(named: "spirit_3d.usdz"),
                    scene: SCNScene(named: "Earth.scn"),
                    options: [
                        .autoenablesDefaultLighting,
                        .allowsCameraControl
                    ])
                .frame(
                    width: UIScreen.main.bounds.width,
                    height:UIScreen.main.bounds.height / 2)
              

                
                Spacer(minLength: 0)
                
            }.navigationTitle("Test: ")
                .containerRelativeFrame([.horizontal, .vertical])
                .background(Gradient(
                    colors: [
                        .secondaryBrown
                        , .secondaryRed
                        , .secondaryDark
                    ]).opacity(0.8))
        }
    }
}

//
//struct ScenekitView : UIViewRepresentable {
//    func makeUIView(context: Context) -> SCNView {
//        let scnView = SCNView()
//        scnView.scene = SCNScene(named:"MRO.usdz")
//        scnView.allowsCameraControl = true
//        scnView.autoenablesDefaultLighting = true
//        scnView.defaultCameraController.maximumVerticalAngle = 0.001
//        return scnView
//    }
//
//    func updateUIView(_ scnView: SCNView, context: Context) {
//    }
//}

#Preview {
    Test3DView()
        .environmentObject(AppModel())
}
