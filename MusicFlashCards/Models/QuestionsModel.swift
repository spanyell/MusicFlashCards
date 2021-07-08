//
//  QuestionsModel.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 7/7/21.
//

import Foundation
import Unrealm

struct QuestionsModel: Realmable
{
    var id = UUID().uuidString
    var questions = Constants.EMPTY_STRING
    var imageFileName = Constants.EMPTY_STRING
    var musicToneFileName = Constants.EMPTY_STRING
    var allAnswers = Constants.EMPTY_STRING
    var rightAnswer = Constants.EMPTY_STRING
    
    static func primaryKey() -> String?
    {
        return "id"
    }
}

extension Unrealm.Results
{
    //  Converts the <Results> returned from a Realm database query to a standard array
    func toArray<T>(type: T.Type) -> [T]
    {
        return compactMap { $0 as? T }
    }
}

extension QuestionsModel
{
    static func all(in realm: Realm = try! Realm()) -> [QuestionsModel]
    {
        return realm.objects(QuestionsModel.self).toArray(type: QuestionsModel.self)
    }
    
    static func retrieveQuestions(in realm: Realm = try! Realm()) -> [QuestionsModel]
    {
        return realm.objects(QuestionsModel.self).toArray(type: QuestionsModel.self)
    }
    
    @discardableResult
    static func add(dataItems: [QuestionsModel], in realm: Realm = try! Realm()) -> Bool
    {
        for dataItem in dataItems
        {
            try! realm.write
            {
                realm.add(dataItem, update: .all)
            }
        }
        return true
    }
}
