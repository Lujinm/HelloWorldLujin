//
//  splashScreen.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 17/04/1446 AH.
//

import SwiftUI

struct splashScreen: View {
    @Binding var isActive:Bool
    var body: some View {
        ZStack{
            LinearGradient(stops: ([
                .init(color: .mypurple, location: 0.28),.init(color: .black, location: 0.95)]),startPoint: .top, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 77.7, height: 101)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.isActive = false
                            }
                        }
                    }
                Text("Journali")
                    .font(.system(size: 42))
                    .frame(width: 174, height: 50)
                    .foregroundStyle(Color.mywhite)
                    .bold()
          
                Text("Your thoughts, Your story")
                    .font(.system(size: 16))
                    .frame(width: 225, height: 21)
                    .foregroundStyle(Color.mywhite)
                   
            }
        }
    }
}

#Preview {
    splashScreen(isActive: .constant(true))
}
