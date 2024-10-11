//
//  FetchTakeHomeApp.swift
//  FetchTakeHome
//
//  Created by Harsha Chilakapati on 10/10/24.
//

import SwiftUI

struct Item : Codable{
    let id: Int
    let listId: Int
    let name: String?
}

struct Data {
    var items: [Item] = []
    mutating func getData() {
        var validItems : [Item] = []
        guard let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json") else{ return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let error else { return }
            guard let data else { return }
            let items = try? JSONDecoder().decode([Item].self, from: data)
            validItems = items?.filter { $0.name != nil && !$0.name!.isEmpty } ?? []
        }
        self.items = validItems
        task.resume()
    }
}

@main
struct FetchTakeHomeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
