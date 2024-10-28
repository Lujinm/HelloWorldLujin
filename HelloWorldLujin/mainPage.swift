//
//  mainPage.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 18/04/1446 AH.
//

import SwiftUI

struct mainPage: View {
    @State private var searchText = ""
    @State var showAddJournalSheet = false
    @State var editingEntry: JDatabase?
    @StateObject var database = JournalDatabase()
    
    func deleteEntry(at offsets: IndexSet) {
        database.entries.remove(atOffsets: offsets)
        database.saveEntries()
    }

    func bookmark(entry: JDatabase) {
        if let index = database.entries.firstIndex(where: { $0.id == entry.id }) {
            database.entries[index].isBookmarked.toggle()
            database.saveEntries()
        }
    }
    
    func bookmark() {
        print("bookmark action")
    }
    
    func date() {
        print("Date action")
    }
    
    func all() {
        print("all action")
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                List {
                    ForEach(database.entries) { entry in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(entry.title)
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(Color.mypurple2)
                                Spacer()
                                Button(action: {
                                    bookmark(entry: entry)
                                }) {
                                    Image(systemName: entry.isBookmarked ? "bookmark.fill" : "bookmark")
                                        .frame(width: 25, height: 29)
                                        .foregroundColor(.mypurple2)
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                            
                            Text(entry.date)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.gray)
                                .padding(.bottom, 7)
                            
                            Text(entry.content)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 10)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                if let index = database.entries.firstIndex(where: { $0.id == entry.id }) {
                                    database.entries.remove(at: index)
                                    database.saveEntries()
                                }
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button(action: {
                                editingEntry = entry
                                showAddJournalSheet.toggle()
                            }) {
                                Image(systemName: "pencil")
                            }
                            .tint(.mypurple2)
                        }
                    }
                    .onDelete(perform: deleteEntry)
                }
                .listRowSpacing(15)
                .navigationTitle("Journal")
                .searchable(text: $searchText)
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
                                editingEntry = nil
                                showAddJournalSheet.toggle()
                            }) {
                                Image(systemName: "plus")
                                    .frame(width: 23, height: 26)
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
    mainPage()
}
