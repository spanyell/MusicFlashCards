//
//  QuestionsView.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 7/7/21.
//

import AVKit
import SwiftUI
import Unrealm

struct QuestionsView: View {
    @StateObject var questionsViewModel = QuestionsViewModel()
    
    var body: some View {
        Text("Hello World")
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
    }
}
