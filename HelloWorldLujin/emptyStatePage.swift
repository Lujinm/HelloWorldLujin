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
    @State var editingEntry: JDatabase?
    
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
                        .frame(width: 77.7, height: 110)
                        .padding(.bottom, 29.23)
                    
                    Text("Begin Your Journal")
                        .font(.system(size: 24))
                        .frame(width: 210, height: 29)
                        .foregroundStyle(Color.mypurple2)
                        .bold()
                    
                    Text("Craft your personal diary, tap the plus icon to begin")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .frame(width: 282, height: 53)
                        .foregroundStyle(Color.mywhite)
                }
                .navigationTitle("Journal")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: -4) { // Adjust spacing as needed
                            Menu {
                                Button("All Journals") {
                                    database.showAllEntries()
                                }
                                Button("Bookmark") {
                                    database.filterByBookmark()
                                }
                                Button("Journal Date") {
                                    database.filterByDate()
                                }
                            } label: {
                                Image(systemName: "line.3.horizontal.decrease")
                                    .frame(width: 40, height: 30)
                                    .background(.mygray)
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                editingEntry = nil
                                showAddJournalSheet.toggle()
                            }) {
                                Image(systemName: "plus")
                                    .frame(width: 40, height: 30)
                                    .background(.mygray)
                                    .clipShape(Circle())
                            }
                            .sheet(isPresented: $showAddJournalSheet) {
                                addingJournalPage(
                                    showAddJournalSheet: $showAddJournalSheet,
                                    database: database,
                                    editingEntry: $editingEntry)
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
