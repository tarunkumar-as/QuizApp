//
//  GlobalUtils.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/7/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

public func localizedString(_ localizedString: String) -> String {
    return NSLocalizedString(localizedString, comment: "")
}

class FileManager {
    
    static func readJSONFromFile(fileName: String, type: String) -> Any? {
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: type) {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
                
            } catch {
                print("Unable to read file")
            }
        }
        return json
    }
}
