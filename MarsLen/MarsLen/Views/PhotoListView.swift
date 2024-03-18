//
//  PhotoListView.swift
//  MarsLen
//
//  Created by Simon Fong on 18/03/2024.
//

import SwiftUI

struct PhotoListView: View {
    
    @EnvironmentObject var model: AppModel
    
    let samplePhoto = [
        (1,"sample01", "sample01"),
        (2, "sample02", "sample02"),
        (3, "sample03", "sample03"),
        (4, "sample01", "sample01"),
        (5, "sample02", "sample02"),
        (6, "sample03", "sample03"),
    ]
    
    let cameraList = [
        "Front Hazard Avoidance Camera",
        "Rear Hazard Avoidance Camera",
        "Navigation Camera"
    ]
    
    @State var camIndex = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    Text("Camera: \(cameraList[camIndex])")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.primaryDark.opacity(0.7))
                        .padding(.leading)
                    Spacer(minLength: 0)
                }
                
                
                // tab view
                HStack(spacing:0){
                    Text("FHAZ")
                        .foregroundColor(self.camIndex == 0 ? .white : .primaryWhite.opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal,35)
                        .background(Color.secondaryRed.opacity(self.camIndex == 0 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture{
                            withAnimation(.default){
                                self.camIndex = 0
                            }
                        }
                    
                    Spacer(minLength: 0)
                    
                    Text("RHAZ")
                        .foregroundColor(self.camIndex == 1 ? .white : .primaryWhite.opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal,35)
                        .background(Color.secondaryRed.opacity(self.camIndex == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture{
                            withAnimation(.default){
                                self.camIndex = 1
                            }
                        }
                    
                    Spacer(minLength: 0)
                    
                    Text("NAV")
                        .foregroundColor(self.camIndex == 2 ? .white : .primaryWhite.opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal,35)
                        .background(Color.secondaryRed.opacity(self.camIndex == 2 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture{
                            withAnimation(.default){
                                self.camIndex = 2
                            }
                        }
                }
                .background(Color.black.opacity(0.15))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top, 5)
                
                
                VStack {
                    ZStack{
                        ForEach(0..<model.rover_list.count, id: \.self){index in
                            Image("\(model.rover_list[index].name)")
                                .frame(width:300, height:200)
                                .cornerRadius(25)
                                .opacity(
                                    camIndex == index ? 1.0 : 0.5)
                                .scaleEffect(
                                    camIndex == index ? 1.2 : 0.8)
                                .offset(
                                    x: CGFloat(index - camIndex) * 300 + dragOffset,
                                    y : 0)
                                .shadow(color: Color.black.opacity(0.3), radius: 15, x: 5, y: 10)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onEnded({value in
                                let threshold: CGFloat = 50
                                if value.translation.width > threshold{
                                    withAnimation{
                                        camIndex = max(0, camIndex - 1)
                                    }
                                }else if value.translation.width < -threshold {
                                    withAnimation{
                                        camIndex = min(model.rover_list.count - 1, camIndex + 1)
                                        
                                    }
                                }
                            })
                    )
                }
                .padding(.vertical,30)
                
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(samplePhoto, id: \.0) { itm in
                            HStack {
                                Image(itm.1)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame( height: 100)
                                    .padding(5)
                                
                                Text(itm.1)
                                    .font(.system(size:20))
                                    .foregroundColor(Color.secondaryWhite.opacity(0.8))
                                    .padding(.bottom,40)
                                Spacer() // Add Spacer to fill the remaining space
                            }
                            .background(
                                Color.secondaryWhite.opacity(0.1))
                            .cornerRadius(20)
                            .shadow(color: Color.primaryDark.opacity(0.4), radius: 15, x: 10, y: 10)
                            
                        }.padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Mission \(model.rover_list[model.currentIndex].name)")
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

struct PhotoListView_PreviewView:PreviewProvider {
    
    static var previews: some View{
        
        PhotoListView()
            .environmentObject(AppModel())
    }
}
