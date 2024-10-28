//
//  emptyStatePage.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 18/04/1446 AH.
//

import SwiftUI

struct emptyStatePage: View {
    @State var showAddJournalSheet = false
    @ObservedObject var database: JournalDatabase
    
    func bookmark() {
        print("Bookmark action")
    }
    func date() {
        print("Date action")
    }
    func all() {
        print("all action")
    }
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            NavigationStack {
                VStack {
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
                }
                .navigationTitle("Journal")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Button("all Journals", action: all)
                            Button("Bookmark", action: bookmark)
                            Button("Journal Date", action: date)
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(.mygray)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "line.3.horizontal.decrease")
                                    .frame(width: 23, height: 21)
                            }
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        ZStack {
                            Circle()
                                .fill(.mygray)
                                .frame(width: 30, height: 30)
                            Button(action: {
                                showAddJournalSheet.toggle()
                            }) {
                                Image(systemName: "plus")
                                    .frame(width: 23, height: 26)
                            }
                            .sheet(isPresented: $showAddJournalSheet) {
                                addingJournalPage(showAddJournalSheet: $showAddJournalSheet, database: database, editingEntry: .constant(nil))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    emptyStatePage(database: JournalDatabase())
}
