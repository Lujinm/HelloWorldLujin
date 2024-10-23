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
    
    // Fetch the current date from the system
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: Date())
    }


    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $title, axis: .vertical)
                    .font(.system(size: 34 , weight: .bold))
                    .frame(width: 358.96, height: 41, alignment: .leading)
                    .padding(.top, 30)
                
                //                    }
                
                Text(currentDate)
//                    .padding(.trailing, 273.0)
                    .font(.system(size: 16, weight: .regular))
                    .frame(width: 87.4, height: 19, alignment: .leading)
                  //  .font(.system(size: 16, weight: .regular))
                    .padding(.trailing, 273.0)
                
                
                //                    Section(header: Text("Journal Entry")) {
                TextField("Type your Journal...", text: $journalEntry, axis: .vertical)
                    .font(.system(size: 20))
                    .frame(width: 380, height: 400, alignment: .topLeading)
                    .padding(.top, 20)
                    .padding(.trailing, 10)
                    .padding(.bottom, 170)
                //                    }
                
                //                    Section(header: Text("Date")) {
                //                        Text(currentDate)
                //                    }
                //                }
            }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel") {
                                showAddJournalSheet = false}}
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") {
                                saveJournalEntry()
                                showAddJournalSheet = false }
                            .bold()
                        }}}}

    // Function to save the journal entry to the database
    func saveJournalEntry() {
        if !title.isEmpty && !journalEntry.isEmpty {
            database.addEntry(title: title, content: journalEntry, date: currentDate)
        }
    }
}

#Preview {
    addingJournalPage(showAddJournalSheet: .constant(true), database: JournalDatabase())
}
