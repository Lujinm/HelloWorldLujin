//
//  emptyStatePage.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 18/04/1446 AH.
//

import SwiftUI

struct emptyStatePage: View {
    @State var showAddJournalSheet = true 
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
        NavigationStack{
            VStack {
                //                Text("Journal")
                //                    .font(.system(size: 34))
                //                    .frame(width: 116, height: 40)
                //                    .foregroundStyle(Color.mywhite)
                //                    .bold()
                //                    .padding(.leading, 33.0)
                //                    .padding(.trailing, 244.0)
                //                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 77.7, height: 101)
                    .padding(.bottom, 29.23)
                Text("Begin Your Journal")
                    .font(.system(size: 24))
                    .frame(width: 210, height: 29)
                    .foregroundStyle(Color.mypurple2)
                    .bold()
                    .padding(.bottom, 16.0)
                Text("Craft your personal diary, tap the plus icon to begin")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .frame(width: 282, height: 53)
                    .foregroundStyle(Color.mywhite)
//                Spacer()
                
            }
            .navigationTitle("Journal")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddJournalSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                                            })
                    Button(action: {
                        showAddJournalSheet.toggle()
                    }, label: {
                        Image(systemName: " line.3.horizontal.decrease")
                                            })
                }}
                   }
        } }
}
#Preview {
    emptyStatePage()
}
