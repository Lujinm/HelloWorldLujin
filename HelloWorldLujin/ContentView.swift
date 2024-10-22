//
//  ContentView.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 17/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = true
    var body: some View {
        NavigationStack {
                if isActive{
                    splashScreen(isActive: $isActive)}
                
            else{
                VStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.blue)
                        .frame(width: 380, height: 180)
                    Text("lujin")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
