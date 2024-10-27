//
//  mainPage.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 18/04/1446 AH.
//

import SwiftUI

struct mainPage: View {
    @State var showAddJournalSheet = false
    @StateObject var database = JournalDatabase()
    func bookmark() {
        print("Bookmark action")
    }
    func date() {
        print("Date action")
    }
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(database.entries) { entry in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(entry.title)
                                            .font(.system(size: 22))
                                            .bold()
                                            .foregroundColor(Color.mypurple2)
                                        Spacer()
                                        // Swipe actions to edit and delete
//                                        Button(action: {
//                                            // Action to edit
//                                        }) {
//                                            Image(systemName: "square.and.pencil")
//                                                .foregroundColor(.blue)
//                                        }
//                                        Button(action: {
//                                            // Action to delete
//                                           // deleteEntry(entry)
//                                        }) {
//                                            Image(systemName: "trash")
//                                                .foregroundColor(.red)
//                                        }
                                    }
                                    
                                    Text(entry.date)
                                        .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 3.0)
                                    
                                    Text(entry.content)
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    
//                                    Text(entry.date)
//                                        .font(.system(size: 16))
//                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.mygray)
                                .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    
                }
                .navigationTitle("Journal")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
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
                            .sheet(isPresented:
                                    $showAddJournalSheet) {
                                addingJournalPage(showAddJournalSheet: $showAddJournalSheet, database: database)
                            }
                        }
                    }
                }
            }
            // Function to delete an entry
//            func deleteEntry(_ entry: JDatabase) {
//                if let index = database.entries.firstIndex(where: { $0.id == entry.id }) {
//                    database.entries.remove(at: index)
//                    database.saveEntries()
//                }
//            }
        }
    }}
#Preview {
    mainPage()
}
