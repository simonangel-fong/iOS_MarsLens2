//
//  GridView.swift
//  MarsLen
//
//  Created by Simon Fong on 17/03/2024.
//

import SwiftUI

struct GridView: View {
    
    var data : [MetaData]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30){
            ForEach(data, id: \.id){md in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text(md.key)
                            .foregroundColor(Color.secondaryWhite)
                        
                        Text(md.value)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 0)
                        
                        HStack{
                            Spacer(minLength: 0)
                            Text("")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.primaryRed.opacity(0.7))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 3, y: 7)
                    
                    /// top Image
                    Image(systemName:md.logo)
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.white.opacity(0.20))
                        .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

struct GridView_PreviewView:PreviewProvider {
    static var previews: some View{
        GridView(data: AppModel().rover_list[0].metaData)
    }
}
