//
//  RoverListView.swift
//  MarsLen
//
//  Created by Simon Fong on 16/03/2024.
//

import SwiftUI

struct RoverListView: View {
    
    @EnvironmentObject var model: AppModel
    
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
//    private let images: [String] = ["Curiosity","Spirit","Opportunity"]
    
    var body: some View {
        NavigationStack{
            HStack{
                VStack {
                    ZStack{
                        ForEach(0..<model.rover_list.count, id: \.self){index in
                            Image("\(model.rover_list[index].name)")
                                .frame(width:300, height:500)
                                .cornerRadius(25)
                                .opacity(
                                    currentIndex == index ? 1.0 : 0.5)
                                .scaleEffect(
                                    currentIndex == index ? 1.2 : 0.8)
                                .offset(
                                    x: CGFloat(index - currentIndex) * 300 + dragOffset,
                                    y : 0)
                                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 10)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onEnded({value in
                                let threshold: CGFloat = 50
                                if value.translation.width > threshold{
                                    withAnimation{
                                        currentIndex = max(0, currentIndex - 1)
                                        model.currentIndex = self.currentIndex
                                    }
                                }else if value.translation.width < -threshold {
                                    withAnimation{
                                        currentIndex = min(model.rover_list.count - 1, currentIndex + 1)
                                        model.currentIndex = self.currentIndex
                                    }
                                }
                            })
                    )
                }
                .toolbar{
                    ToolbarItem(placement: .bottomBar){
                        HStack{
                            Button{
                                withAnimation{
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } label: {
                                Image(systemName: "arrow.left")
                                    .font(.title)
                                    .foregroundColor(Color.primaryDark)
                            }
                            
                            Spacer()
                            
                            NavigationLink(
                                destination: RoverDetailView()
//                                destination: TestView()
                            ) {
                                Text("Select Rover")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.primaryDark)    // font color
                                    .frame(width: 180, height: 30)
                                    .background(Color.secondaryWhite.opacity(0.5))    // btn bg
                                    .cornerRadius(17)
                            }
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 10)
    
                            Spacer()
                            
                            // right arrow
                            Button{
                                withAnimation{
                                    currentIndex = min(model.rover_list.count - 1,
                                                       currentIndex + 1 )
                                }
                            } label: {
                                Image(systemName: "arrow.right")
                                    .font(.title)
                                    .foregroundColor(Color.primaryDark)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Mission \(model.rover_list[currentIndex].name)")
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

struct RoverListView_Previews: PreviewProvider{
    static var previews: some View{
        RoverListView()
            .environmentObject(AppModel())
    }
}
