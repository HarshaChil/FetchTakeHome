//
//  FetchTakeHomeApp.swift
//  FetchTakeHome
//
//  Created by Harsha Chilakapati on 10/10/24.
//

import SwiftUI

/// Struct to represent single unit of data from api
struct Item : Codable, Identifiable{
    let id: Int
    let listId: Int
    let name: String?
}

/// Class that represents full list of data received from api call
class Data : ObservableObject{
    
    /// List of items received from api call, updated every time data is fetched
    @Published var items: [Item] = []
    
    /// Performs api call to update/init the list of items/data
    func fetchData() {
        var validItems : [Item] = []
        guard let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json") else{ return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, response, error in
            guard error == nil else { return }
            guard data != nil else { return }
            let items = try? JSONDecoder().decode([Item].self, from: data!)
            validItems = items?.filter { $0.name != nil && !$0.name!.isEmpty } ?? []
            validItems = validItems.sorted{($0.listId, $0.name!) < (($1.listId, $1.name!))}
            DispatchQueue.main.async {
                self.items = validItems
            }
        }.resume()
    }
}

/// Displays main view of app
@main
struct FetchTakeHomeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
