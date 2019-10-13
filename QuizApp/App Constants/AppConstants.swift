//
//  AppConstants.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/21/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

struct AppConstants {
    
    enum Courses_Response_Key: String {
        
        case PRIMARY_INDEX = "Primary_Index"
        case CATEGORIE_ID = "Categorie_Id"
        case CATEGORIE = "Categorie"
        case COURSE_ID = "Course_Id"
        case COURSE = "Course"
        case SECTION_ID = "Section_Id"
        case SECTION = "Section"
    }
    
    enum Questions_Response_Key: String {
        
        case PRIMARY_INDEX = "Primary_Index"
        case CATEGORIE_ID = "Categorie_Id"
        case CATEGORIE = "Categorie"
        case COURSE_ID = "Course_Id"
        case COURSE = "Course"
        case SECTION_ID = "Section_Id"
        case SECTION = "Section"
        case DIFFICULTY_ID = "Difficulty_Id"
        case DIFFICULTY = "Difficulty"
        case QUESTION_ID = "Question_Id"
        case QUESTION = "Question"
        case OPTION_1 = "Option_1 "
        case OPTION_2 = "Option_2 "
        case OPTION_3 = "Option_3 "
        case OPTION_4 = "Option_4 "
        case CORRECT_ANSWER = "Correct_Answer"
        case CORRECT_OPTION = "Correct_Option"
        case SHORT_DESCRIPTION = "Short_Description"
        case DETAILED_DESCRIPTION = "Detailed_Description"
        case REFERENCE_LINK = "Reference_Link"
    }
    
    static let CATEGORY_COLOR_LIST = [UIColor.black, UIColor.red, UIColor.blue, UIColor.magenta, UIColor.darkGray, UIColor.orange, UIColor.purple, UIColor.brown]
}
