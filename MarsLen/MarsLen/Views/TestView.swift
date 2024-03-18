//
//  TestView.swift
//  MarsLen
//
//  Created by Simon Fong on 17/03/2024.
//

import SwiftUI

struct TestView: View {
    
    @State var index = 0
    
    
    var body: some View {
        
        VStack{
            HStack{
                Text("Stat")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primaryRed)
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            // tab view
            HStack(spacing:0){
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : .primaryBrown.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal,35)
                    .background(Color.primaryBrown.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture{
                        withAnimation(.default){
                            self.index = 0
                        }
                    }
                
                Spacer(minLength: 0)
                
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white : .primaryBrown.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal,35)
                    .background(Color.primaryBrown.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture{
                        withAnimation(.default){
                            self.index = 1
                        }
                    }
                
                Spacer(minLength: 0)
                
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white : .primaryBrown.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal,35)
                    .background(Color.primaryBrown.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture{
                        withAnimation(.default){
                            self.index = 2
                        }
                    }
                
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            
            
//            // Tab View
//            TabView(selection:self.$index){
//                GridView(data: curosity_metadata)
//                    .tag(0)
//                
//                GridView(data: curosity_metadata)
//                    .tag(1)
//                
//                VStack{
//                    Text("Monthly Data")
//                }
//                .tag(2)
//                
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
        }
        .padding(.top)
    }
}

struct TestView_Previews:PreviewProvider{
    static var previews: some View{
        TestView()
    }
}
