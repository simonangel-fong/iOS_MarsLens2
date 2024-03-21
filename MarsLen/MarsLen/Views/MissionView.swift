//
//  MissionSpecView.swift
//  MarsLen
//
//  Created by Simon Fong on 21/03/2024.
//

import SwiftUI

struct MissionView: View {
    
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        NavigationStack{
            VStack {
                // title
                HStack {
                    Text("Mission")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primaryDark.opacity(0.7))
                        .padding(.leading)
                        .padding(.top)
                    Spacer(minLength: 0)
                }
                .padding(.bottom,20)
                
                // image
                Image("Spirit_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width * 0.95)
                    .cornerRadius(25)
                
                // 
                List{
                    NavigationRow(
                        title: "Mission Information",
                        destView: MissionInfoView())
                    NavigationRow(
                        title: "Specification",
                        destView: MissionSpecView())
                    NavigationRow(
                        title: "Science Discovery",
                        destView: MissionDiscoveryView())
                    NavigationRow(
                        title: "Video",
                        destView: MissionVideoView())
                    NavigationRow(
                        title: "Gallery",
                        destView: MissionGalleryView())
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView()
            .environmentObject(AppModel())
    }
}

