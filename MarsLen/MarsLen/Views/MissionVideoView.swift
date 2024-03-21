//
//  MissionVideoView.swift
//  MarsLen
//
//  Created by Simon Fong on 21/03/2024.
//

import SwiftUI
import AVKit

struct MissionVideoView: View {
    
    @EnvironmentObject var model: AppModel
    
    
    var body: some View {
        NavigationStack{
            VStack {
                // title
                HStack {
                    Text("Mission Video")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primaryDark.opacity(0.7))
                        .padding(.leading)
                        .padding(.top)
                    Spacer(minLength: 0)
                }
                .padding(.bottom,20)
                
                VideoPlayer(player: AVPlayer(url:  URL(string: "https://youtu.be/1Ll-VHYxWXU")!))
                    .frame(height: 200)

                Spacer()
            }
        }
    }
}


struct MissionVideoView_Previews: PreviewProvider {
    static var previews: some View {
        MissionVideoView()
            .environmentObject(AppModel())
    }
}

