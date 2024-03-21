//
//  ImageRow.swift
//  MarsLen
//
//  Created by Simon Fong on 21/03/2024.
//

import SwiftUI

struct ImageRow<Destination: View>: View {
    var imageName: String
    var date: String
    var sol:Int
    var mission:String
    var destView: Destination
    
    var body: some View {
        NavigationLink(destination: destView) {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding()
                
                VStack(alignment: .leading){
                    Text(date)
                        .font(.headline)
                        
                    Text("SOL \(sol)")
                        .font(.headline)
                    Text("Mission \(mission)")
                        .font(.headline)
                }
                .foregroundColor(Color.primaryDark)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ImageRow(imageName: "sample01", date: "2010-01-01", sol: 543, mission: "Spirit",destView: PhotoView())
}
