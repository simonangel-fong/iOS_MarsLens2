//
//  RoverDetailView.swift
//  MarsLen
//
//  Created by Simon Fong on 16/03/2024.
//

import SwiftUI

struct RoverDetailView: View {
    
    @EnvironmentObject var model: AppModel

    var body: some View {
        
        NavigationStack{
            VStack{

                Image("\(model.rover_list[model.currentIndex].name)_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 380)
                    .cornerRadius(25)
                    .padding()
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 5, y: 10)
                
                
                GridView(data: model.rover_list[model.currentIndex].metaData)
                    .opacity(0.9)
                
                Spacer()
                
                NavigationLink(
                    destination: PhotoListView()
                ) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("View Images")
                            .font(.system(size: 18))
                            
                    }
                    .foregroundColor(Color.primaryDark)    // font color
                    .frame(width: 250, height: 30)
                    .background(Color.secondaryWhite.opacity(0.5))    // btn bg
                    .cornerRadius(17)
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 5, y: 10)
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Gradient(
                colors: [
                    .secondaryBrown
                    , .secondaryRed
                    , .secondaryDark
                ]).opacity(0.7))
            .navigationTitle("Mission \(model.rover_list[model.currentIndex].name)")
            }
        }
    }


struct RoverDetailView_PreviewView:PreviewProvider {

    static var previews: some View{

        RoverDetailView()
            .environmentObject(AppModel())
    }
}
