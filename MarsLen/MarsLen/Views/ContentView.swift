//
//  ContentView.swift
//  MarsLen
//
//  Created by Simon Fong on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
           RoverListView()
//            RoverDetailView()
//            TestView()
        }
        .environmentObject(AppModel())
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
            .environmentObject(AppModel())
    }
}

