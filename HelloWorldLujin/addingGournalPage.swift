//
//  addingGournalPage.swift
//  HelloWorldLujin
//
//  Created by lujin mohammed on 17/04/1446 AH.
//

import SwiftUI

struct addingGournalPage: View {
    @Binding var showAddJournalSheet: Bool

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    addingGournalPage(showAddJournalSheet: .constant(true))
}
