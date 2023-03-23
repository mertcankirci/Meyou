//
//  Network.swift
//  Meyou
//
//  Created by Mertcan Kırcı on 8.01.2023.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    @Published var locations: [Question] = []
    
    
    init() {
        readFile()
    }
    
    func readFile() {
        if let url = Bundle.main.url(forResource: "locations", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode([Question].self, from: data) {

                self.locations = jsonData
                
                
            }
        }
    }
}


