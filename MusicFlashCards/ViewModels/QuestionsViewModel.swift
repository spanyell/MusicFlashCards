//
//  QuestionsViewModel.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 7/7/21.
//

import Foundation
import SwiftUI

class QuestionsViewModel: ObservableObject
{
    @Published var questionsModelList = [QuestionsModel]()
    var allAnswersDictionary = [String :[String]]()
    
    init()
    {
        retrieveQuestionsModel()
        populateAllAnswersDictionary()
    }
    
    func retrieveQuestionsModel()
    {
        self.questionsModelList = QuestionsModel.all()
    }
    
    func populateAllAnswersDictionary()
    {
        for questionsModel in questionsModelList
        {
            let allAnswersString = questionsModel.allAnswers
            let realmID = questionsModel.id
            let allAnswersList = allAnswersString.components(separatedBy: "*")
            allAnswersDictionary[realmID] = allAnswersList
        }
    }
}
