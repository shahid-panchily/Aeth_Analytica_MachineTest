//
//  Source.swift
//  Aeth_Analytica_MachineTest
//
//  Created by shahid panchily on 31/03/21.
//

import Foundation
struct Source : Decodable {
    var id : String?
    var name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}


