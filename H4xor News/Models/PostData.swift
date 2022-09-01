//
//  PostData.swift
//  H4xor News
//
//  Created by Leonard Groves on 8/31/22.
//

import Foundation

struct Results: Decodable {
    
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    
    // The url needs to be optional becuase somethimes in the data retrieved from hn, the url field is null.
    let url: String?
}
