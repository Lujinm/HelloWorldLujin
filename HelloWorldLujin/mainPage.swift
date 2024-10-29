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
        database.filteredEntries = database.entries
        database.saveEntries()
    }

    func bookmark(entry: JDatabase) {
        if let index = database.entries.firstIndex(where: { $0.id == entry.id }) {
            database.entries[index].isBookmarked.toggle()
            database.saveEntries()
            database.filteredEntries = database.entries
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                List {
                    ForEach(database.filteredEntries) { entry in
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
                                    database.filteredEntries = database.entries
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
                .onChange(of: searchText) {
                    if searchText.isEmpty {
                        database.filteredEntries = database.entries
                    } else {
                        database.filteredEntries = database.entries.filter { entry in
                            entry.title.lowercased().contains(searchText.lowercased()) ||
                            entry.content.lowercased().contains(searchText.lowercased())
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing:-4){
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
    mainPage()
}
