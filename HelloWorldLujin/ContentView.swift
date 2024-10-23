//
//  ContentView.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 17/04/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = true
    @StateObject var database = JournalDatabase()
    var body: some View {
        NavigationStack {
            if isActive {
                splashScreen(isActive: $isActive)
            } else {
                if database.entries.isEmpty {
                    emptyStatePage(database: database)
                } else {
                    mainPage(database: database)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

