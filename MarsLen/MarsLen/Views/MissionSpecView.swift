//
//  Test01View.swift
//  MarsLen
//
//  Created by Simon Fong on 18/03/2024.
//

import SwiftUI

struct MissionSpecView: View {
    
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        NavigationStack{
            VStack {
                // title
                HStack {
                    Text("Mission \(model.rover_list[model.currentIndex].name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primaryDark.opacity(0.7))
                        .padding(.leading)
                        .padding(.top)
                    Spacer(minLength: 0)
                }
                
                // image
                Image("Spirit_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width * 0.95)
                    .cornerRadius(20)
                
                // spec list
                List {
                    Section(header: Text("Objective(s)")) {
                        Text("Mars Surface Exploration")
                    }
                    
                    Section(header: Text("Spacecraft")) {
                        Text("Mars Exploration Rover 2 (MER2)")
                    }
                    
                    Section(header: Text("Launch Date and Time")) {
                        Text("June 10, 2003 / 10:58:47 PDT")
                    }
                    
                    Section(header: Text("Launch Site")) {
                        Text("Cape Canaveral, Florida / SLC-17A")
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

struct MissionSpecView_Previews: PreviewProvider {
    static var previews: some View {
        MissionSpecView()
            .environmentObject(AppModel())
    }
}
