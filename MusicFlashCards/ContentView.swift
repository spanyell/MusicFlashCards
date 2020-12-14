//
//  ContentView.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    @State var correctAnswer = false
    @State var incorrectAnswer = false
    
    
    var body: some View {
        VStack {
            Text("Music Flash Cards")
                .font(.headline)
            ForEach(sectionData) { item in
                FlashCard(section: item)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonAnswer: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom)
            .frame(width: 200, height: 50)
            .cornerRadius(100)
            .shadow(radius: 1)
    }
}

struct CorrectAnswer: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .frame(width: 250, height: 300)
                }
            Text("That's music to my ears!")
        }
    }


struct IncorrectAnswer: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .frame(width: 250, height: 300)
            Text("Nope.")
        }
        
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var question: String
    var image: Image
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var answer5: String
    var correctAnswer: String
}

let sectionData = [
    Section(title: "Question 1", question: "What is this note?", image: Image("trebleC4"), answer1: "F", answer2: "E flat", answer3: "G", answer4: "Middle C", answer5: "A sharp", correctAnswer: "Middle C")
]

struct FlashCard: View {
    var section: Section
    var body: some View {
        ZStack {
            VStack {
                Text(section.title)
                Text(section.question)
                section.image
                
                
                ZStack {
                    ButtonAnswer()
                    Text(section.answer1)
                }
                ZStack {
                    ButtonAnswer()
                    Text(section.answer2)
                }
                ZStack {
                    ButtonAnswer()
                    Text(section.answer3)
                }
                ZStack {
                    ButtonAnswer()
                    Text(section.answer4)
                }
                ZStack {
                    ButtonAnswer()
                    Text(section.answer5)
                }
            }
//            CorrectAnswer()
//                .offset(y: correctAnswer ? 0 : 600)
//                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
//
//            IncorrectAnswer()
//                .offset(y: incorrectAnswer ? 0 : -600)
//                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
        }
    }
}
}
