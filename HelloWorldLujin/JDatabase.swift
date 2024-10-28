//
//  JDatabase.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 18/04/1446 AH.
//
import SwiftUI

// A simple model for a Journal Entry
struct JDatabase: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
    var date: String
}
// Database to store journal entries
class JournalDatabase: ObservableObject {
    @Published var entries: [JDatabase] = []
    // Save and Load functionality
    init() {
        loadEntries()
    }

    func addEntry(title: String, content: String, date: String) {
        let newEntry = JDatabase(title: title, content: content, date: date)
        entries.append(newEntry)
        saveEntries()
    }
    
    func saveEntries() {
        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: "journalEntries")
        }
    }
    
    func loadEntries() {
        if let savedEntries = UserDefaults.standard.data(forKey: "journalEntries"),
           let decodedEntries = try? JSONDecoder().decode([JDatabase].self, from: savedEntries) {
            entries = decodedEntries
        }
    }
}
