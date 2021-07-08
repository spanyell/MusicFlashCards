//  DatabaseManager.swift
//  Adventure
//
//  Created by Larry Burris on 2/17/21.
//
import Foundation
import Unrealm

class DatabaseManager
{
    let realm = try! Realm()
    
    func loadCSVFileData()
    {
        //  Only load the file if it hasn't been loaded already
        if !QuestionsModel.all(in: realm).isEmpty
        {
            return
        }
        
        var questionsModelList = [QuestionsModel]()
        
        guard let filepath = Bundle.main.path(forResource: Constants.CSV_FILE_NAME, ofType: Constants.CSV_FILE_TYPE) else { return }

        var data = Constants.EMPTY_STRING

        do
        {
            //  Load the data using the file path as one long string
            data = try! String(contentsOfFile: filepath)

            //  Populate a rows array
            let rows = data.components(separatedBy: "\n")

            //  Create columns for each row
            for row in rows
            {
                let columns = row.components(separatedBy: ",")
                
                print("Column count is \(columns.count) for row \(row)")

                //  Ensure that we have 5 columns of data
                if columns.count == 5
                {
                    //  Get the data from the colunms and populate the field values
                    let questions = columns[0]
                    let imageFileName = columns[1]
                    let musicToneFileName = columns[2]
                    let allAnswers = columns[3].replacingOccurrences(of: "*", with: ",")
                    let rightAnswer = columns[4]
                    
//                    //  Create a new QuestionsModel object with the field values
                    let questionsModel = QuestionsModel(id: UUID().uuidString, questions: questions, imageFileName: imageFileName, musicToneFileName: musicToneFileName, allAnswers: allAnswers, rightAnswer: rightAnswer)
                    
                    //  Add the row to the questionsList
                    questionsModelList.append(questionsModel)
                    
                    //  Add the rows into the table from the array using the class method called add().
                    QuestionsModel.add(dataItems: questionsModelList, in: realm)
                    
                    //  Retrieve the saved rows and populate the data into a new QuestionsModel array
                    let savedQuestionsModelItemList = QuestionsModel.all(in: realm)
                    
                    print("----------------------------------------------")
                    
                    //  Spin through the array and print the chapters and paragraphs
                    for savedQuestionsModelItem in savedQuestionsModelItemList
                    {
                        print("\nPrimary Key: " + savedQuestionsModelItem.id)
                    }
                    
                    print("----------------------------------------------")
                    
                    print("\n\n")
                    
                    //  Print the database file URL
                    print(Realm.Configuration.defaultConfiguration.fileURL!)
                }
            }
            
            print("Number of records in questionsModelList in loadCSVFileData is: \(questionsModelList.count)")
        }
    }
}

