//
//  CoursesModel.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/21/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

class CoursesModel {
    
    func getCoursesList() -> [[String : Any]] {
        if let jsonResponse = FileManager.readJSONFromFile(fileName: "Questions", type: "json") as? [[String : Any]] {
            return jsonResponse
        }
        return []
    }
}
