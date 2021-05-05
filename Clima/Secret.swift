//
//  Secret.swift
//  Clima
//
//  Created by Laila Guzzon Hussein Lailota on 05/05/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

struct Secret: Decodable {
    let weather : String
}


struct SecretValues {
    static func get() -> Secret {
        guard let url = Bundle.main.url(forResource: "Secret", withExtension: "plist") else {
            fatalError("Could't find file 'Secret.plist'in your Bundle.")
        }
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            return try decoder.decode(Secret.self, from: data)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
}
