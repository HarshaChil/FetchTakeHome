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
        guard let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json") else{ return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let error else { return }
            guard let data else { return }
            let items = try? JSONDecoder().decode([Item].self, from: data)
            let validItems = items?.filter { $0.name != nil && !$0.name!.isEmpty } ?? []
            self.items = validItems.sorted{($0.listId, $0.name!) < (($1.listId, $1.name!))}
        }
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
