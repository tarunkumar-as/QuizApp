//
//  CoursesModel.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/21/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

class CoursesModel {
    
    func getCoursesList() -> [[String : Any]] {
        if let jsonResponse = FileManager.readJSONFromFile(fileName: "Main_Page", type: "json") as? [[String : Any]] {
            return jsonResponse
        }
        return []
    }
    
    func getMainCategoriesList() -> [String] {
        let couresesList = getCoursesList()
        let reducedList = couresesList.reduce([String](), { (array, dict) in
            if !(array).contains(dict[AppConstants.Courses_Response_Key.CATEGORIE.rawValue]! as! String) {
                return array + [dict[AppConstants.Courses_Response_Key.CATEGORIE.rawValue]! as! String]
            }
            return array
            
        })
        return reducedList
    }
}
