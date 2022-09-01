//
//  NetworkManager.swift
//  H4xor News
//
//  Created by Leonard Groves on 8/31/22.
//

import Foundation

// ObservableOject lets the calss that inherits it, broadcast one or many of its properties to any interested party.

class NetworkManager: ObservableObject {
    
    // @Published: A property wrapper that allows other classes or structs to subscribe to it and get notified whenever the contents change.
    @Published var posts = [Post]()
    
    func fetchData() {
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // At the point where we use @Published, we have to make sure we use the main thread since other classes are listening for updates from it.
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
