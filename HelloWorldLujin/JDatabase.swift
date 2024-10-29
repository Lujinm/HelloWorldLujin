//
//  JDatabase.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 18/04/1446 AH.
//
import SwiftUI

struct JDatabase: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
    var date: String
    var isBookmarked: Bool = false
}

class JournalDatabase: ObservableObject {
    @Published var entries: [JDatabase] = []
    @Published var filteredEntries: [JDatabase] = []
    
    init() {
        loadEntries()
        filteredEntries = entries
    }

    func addEntry(title: String, content: String, date: String) {
        let newEntry = JDatabase(title: title, content: content, date: date)
        entries.append(newEntry)
        saveEntries()
        filteredEntries = entries
    }
    
    func updateEntry(entry: JDatabase, title: String, content: String) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].title = title
            entries[index].content = content
            saveEntries()
            filteredEntries = entries
        }
    }

    func filterByBookmark() {
        filteredEntries = entries.filter { $0.isBookmarked }
    }

    func filterByDate() {
        filteredEntries = entries.sorted { $0.date > $1.date }
    }

    func showAllEntries() {
        filteredEntries = entries
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
            filteredEntries = entries
        }
    }
}
