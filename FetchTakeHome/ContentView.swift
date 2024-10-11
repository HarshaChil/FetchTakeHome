//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by Harsha Chilakapati on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    let items = Data()
    var body: some View {
        NavigationView {
            List {
                ForEach(items.items) { item in
                    Text(item.id + "," + item.listId + "," + item.name! )
                }
            }
        }
        .navigationTitle("Items List")
    }
}

#Preview {
    ContentView()
}
