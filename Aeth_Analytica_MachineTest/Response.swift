//
//  Response.swift
//  Aeth_Analytica_MachineTest
//
//  Created by shahid panchily on 31/03/21.
//

import Foundation

struct Response: Decodable {

    var articles: [Articles]?
    enum Codingkeys: String, CodingKey {

        case articles = "articles"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        self.articles = try container.decode([Articles].self, forKey: .articles)
    }

}

