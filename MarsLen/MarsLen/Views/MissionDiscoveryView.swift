//
//  MissionDiscoveryView.swift
//  MarsLen
//
//  Created by Simon Fong on 21/03/2024.
//

import SwiftUI

struct MissionDiscoveryView: View {
    
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        NavigationStack{
            VStack {
                // title
                HStack {
                    Text("Science Discovery")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primaryDark.opacity(0.7))
                        .padding(.leading)
                        .padding(.top)
                    Spacer(minLength: 0)
                }
                .padding(.bottom,20)
                
                // image
                Image("Spirit_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width * 0.95)
                    .cornerRadius(25)
                
                ScrollView {
                    // title
                    Text("Soaked in Salty Waters Long Ago")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(10)
                    
                    // discorvery
                    Text("By landing in a crater, Opportunity scored a 'hole in one' by finding small, spherical deposits of the mineral hematite, which typically forms in water. These iconic mineral features were nicknamed the 'blueberries.' Water is key to life as we know it. Yet, acidic water soaked this area in Mars' ancient past, making conditions harder for life to thrive.")
                        .font(.system(size:20))
                        .padding(.horizontal, 30)
                }
                .padding(.top, 20)
            }
        }
    }
}


struct MissionDiscoveryView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDiscoveryView()
            .environmentObject(AppModel())
    }
}
