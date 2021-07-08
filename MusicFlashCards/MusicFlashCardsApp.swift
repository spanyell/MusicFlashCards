//
//  MusicFlashCardsApp.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 11/28/20.
//

import SwiftUI
import Unrealm

@main
struct MusicFlashCardsApp: App {
    var body: some Scene {
        WindowGroup {
            QuestionsView()
        }
    }
}

//  This is the old AppDelegate file that was removed in the latest version of Swift.  I'm adding it back so that we can register the Realm objects
//  in the didFinishLaunchingWithOptions method and to call the database code for testing.
//class AppDelegate: NSObject, UIApplicationDelegate
//{
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
//    {
//        //  Register the database table objects
//        Realm.registerRealmables(QuestionsModel.self)
//        UserDefaults.standard.setValue(<#Any?#>, forKey: <#String#>)
//        UserDefaults.standard.set(1, forKey: "paragraph")
//
//        DatabaseManager().loadCSVFileData()
//
//        QuestionsViewModel().retrieveQuestionsModel()
//
//        return true
//    }
//}
//
//func getNextPrimaryKey() -> Int
//{
//    let realm = try! Realm()
//
//    //  Retrieve the saved row and return the id + 1
//    if let savedQuestionsModelItem = realm.objects(QuestionsModel.self).sorted(byKeyPath: "id", ascending: true).last
//    {
//        //  Print the primary key
//        print("\n\nPrimary key in getNextPrimaryKey is:" + savedQuestionsModelItem.id + "\n\n")
//
//        return Int(savedQuestionsModelItem.id) ?? 0
//    }
//
//    return 0
//}
