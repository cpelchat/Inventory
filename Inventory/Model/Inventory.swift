//
//  Inventory.swift
//  Inventory
//
//  Created by Cassidy Pelchat on 11/24/19.
//  Copyright © 2019 Cassidy Pelchat. All rights reserved.
//


import Foundation

struct Inventory: Decodable {
    var status : String
    var products : [Product]
    
    static func load(from filename: String) -> Inventory? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return nil
        }
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(Inventory.self, from: data)
    }
}

struct Product: Decodable {
    var id : Int
    var category : String
    var title : String
    var price : Double
    var stockedQuantity: Int
}
