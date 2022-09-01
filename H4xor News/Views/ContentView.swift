//
//  ContentView.swift
//  H4xor News
//
//  Created by Leonard Groves on 8/31/22.
//

import SwiftUI

struct ContentView: View {
    
    // @ObservedObject: Sets up this property as a listener of any of the updates from the NetworkManager()
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            // We use the NetworkManager() .posts property to update our list.
            List(networkManager.posts) { post in
                
                // NavigationLink: Creates a button on the right-hand side of each cell in the table and will trigger a presentation to the detail view when it's pressed.
                
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4xor News")
        }
        .navigationViewStyle(.stack)
        // In every ContentView there is a method called .onAppear, which is similiar to onViewDidLoad in the UIKit world. If we call onAppear with the perform: property, then we can pass a function in there, that will be performed when the body when the body: view appears on the screen.
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Identifiable is a protocol that allows our list to be able to recognize the order of the post objects based on the id property.
// For a structure to be identifiable it must have a property called id, that is a String.

//struct Post: Identifiable {
//    let id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]
