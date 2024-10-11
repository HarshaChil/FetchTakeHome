//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by Harsha Chilakapati on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var items = Data()
    var body: some View {
        NavigationView {
            List {
                ForEach(items.items) { item in
                    Text("List Id: \(item.listId), Name: \(item.name!), Id: \(item.id)")
                }
            }
        }
        .navigationTitle("Items List")
        .onAppear{
            items.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
