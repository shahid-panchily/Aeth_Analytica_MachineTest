//
//  ApiModel.swift
//  Aeth_Analytica_MachineTest
//
//  Created by shahid panchily on 31/03/21.
//

import Foundation

protocol modelDelegate {
    func atricleFetched(_ atricles: [Articles])
}

class ApiModel {
    
    var delegate: modelDelegate?
    
    func getData() {
        let url = URL(string: "http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=aa67d8d98c8e4ad1b4f16dbd5f3be348")
        
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            // parsing the Data
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.articles != nil {
                   
                    DispatchQueue.main.async {
                        self.delegate?.atricleFetched(response.articles!)
                    }
                }
            }
            catch {
                
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
}



