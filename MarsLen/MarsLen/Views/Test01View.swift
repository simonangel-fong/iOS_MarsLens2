//
//  Test01View.swift
//  MarsLen
//
//  Created by Simon Fong on 18/03/2024.
//

import SwiftUI

struct Test01View: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<20) { index in
                    Text("Item \(index)")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitle("ScrollView Example")
    }
}

#Preview {
    Test01View()
}
