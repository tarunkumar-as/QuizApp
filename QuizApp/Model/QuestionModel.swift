//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Tarun Kumar on 10/12/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

class QuestionsModel {
    
    func getQuestionsList() -> [[String : Any]] {
        if let jsonResponse = FileManager.readJSONFromFile(fileName: "QuestionDictionary", type: "json") as? [[String : Any]] {
            return jsonResponse
        }
        return []
    }
}
