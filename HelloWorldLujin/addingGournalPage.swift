//
//  addingGournalPage.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 17/04/1446 AH.
//
import SwiftUI

struct addingJournalPage: View {
    @Binding var showAddJournalSheet: Bool
    @State private var title: String = ""
    @State private var journalEntry: String = ""
    @ObservedObject var database: JournalDatabase
    @Binding var editingEntry: JDatabase?
    func saveJournalEntry() {
        if let entry = editingEntry {
            database.updateEntry(entry: entry, title: title, content: journalEntry)
        } else if !title.isEmpty && !journalEntry.isEmpty {
            database.addEntry(title: title, content: journalEntry, date: currentDate)
        }
    }

    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: Date())
    }

    var body: some View {
        ZStack {
            Color(.grayBack)
                .ignoresSafeArea()
            NavigationStack {
                ScrollView {
                    VStack {
                        TextField("Title", text: $title, axis: .vertical)
                            .font(.system(size: 34, weight: .bold))
                            .frame(width: 358.96, height: 41, alignment: .leading)
                            .padding(.top, 30)

                        Text(currentDate)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Color.mylightGray)
                            .frame(width: 87.4, height: 19, alignment: .leading)
                            .padding(.trailing, 273.0)

                        TextField("Type your Journal...", text: $journalEntry, axis: .vertical)
                            .font(.system(size: 20))
                            .frame(width: 380, height: 400, alignment: .topLeading)
                            .padding(.top, 20)
                            .padding(.trailing, 10)
                            .padding(.bottom, 170)
                            .padding(.leading, 28)

                        Spacer()
                    }
                    .onAppear {
                        if let entry = editingEntry {
                            title = entry.title
                            journalEntry = entry.content
                        }
                    }
                    .padding(.bottom, 100)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel") {
                                showAddJournalSheet = false
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") {
                                saveJournalEntry()
                                showAddJournalSheet = false
                            }
                            .bold()
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    addingJournalPage(showAddJournalSheet: .constant(true), database: JournalDatabase(), editingEntry: .constant(nil))
}
