//
//  MissionInfoView.swift
//  MarsLen
//
//  Created by Simon Fong on 21/03/2024.
//

import SwiftUI

struct MissionInfoView: View {
    
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        NavigationStack{
            VStack {
                // title
                HStack {
                    Text("Mission Information")
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
                    Text("NASA's Spirit rover—and it's twin Opportunity—studied the history of climate and water at sites on Mars where conditions may once have been favorable to life.\n- Spirit uncovered strong evidence that Mars was once much wetter than it is now.\n- Described as a 'wonderful workhorse'—Spirit operated for 6 years, 2 months, and 19 days, more than 25 times its original intended lifetime.\n- The rover traveled 4.8 miles (7.73 kilometers) across the Martian plains.\n- On May 25, 2011, NASA ended efforts to contact the marooned rover and declared its mission complete. The rover had been silent since March 2010.")
                        .font(.system(size:20))
                        .padding(20)
                }
            }
        }
    }
}

struct MissionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MissionInfoView()
            .environmentObject(AppModel())
    }
}
