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
    @StateObject var database = JournalDatabase()
    func bookmark() {
        print("Bookmark action")
    }
    func date() {
        print("Date action")
    }
//    func deletEntry (_ entry: JDatabase ){
//        if let index = JDatabase.firstIndex(where: {$0.id == entry.id}) {
//            JDatabase.remove(at: index)
//        }
//    }
    var body: some View {
        NavigationStack {

        ZStack {
            Color(.black)
                .ignoresSafeArea()
                //VStack {
                    List {
                      //  VStack(spacing: 16) {
                            ForEach(database.entries) { entry in
                                VStack(alignment: .leading/*, spacing: 8*/) {
                                    HStack {
                                        Text(entry.title)
                                            .font(.system(size: 22))
                                            .bold()
                                            .foregroundColor(Color.mypurple2)
                                        Spacer()
                                    }
                                    
                                    Text(entry.date)
                                        .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 3.0)
                                    
                                    Text(entry.content)
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                }
                            
                                .padding()
                                .background(Color.mygray2)
                                .cornerRadius(10)
                                .swipeActions (edge: .trailing){
                                    Button("lunn") {
                                                print("Awesome!")
                                            }
                                            .tint(.green)
                                        }
                            }.onDelete { Ind in
                                print(Ind.description)
                            }
                       // }
                        .padding()
                    } .listStyle(.plain)
                    
               // }
                .navigationTitle("Journal")
                .searchable(text: $searchText)
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
                                .frame(width: 23, height: 21)}}}
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
                                addingJournalPage(showAddJournalSheet: $showAddJournalSheet, database: database)}}}
                }
            }
//            Image(systemName: "mic.fill")
//                .foregroundColor(.gray)
//                .padding(.bottom, 555.0)
//                .padding(.leading, 330)
//                .frame(width: 23, height: 26)
        }
    }}
#Preview {
    mainPage()
}
