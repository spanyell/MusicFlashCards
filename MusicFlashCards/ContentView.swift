//
//  ContentView.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Music Flash Cards")
                .font(.system(size: 28, weight: .bold))
                Spacer ()
                
            
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
    var correctAnswer: Double
}

let sectionData = [
    Section(title: "Question 1", question: "What is this note?", image: Image("trebleC4"), answer1: "F", answer2: "E flat", answer3: "G", answer4: "Middle C", answer5: "A", correctAnswer: 3)
//    Section(title: "Question 2", question: "What is this note?", image: Image("trebleC4"), answer1: "F", answer2: "G flat", answer3: "A", answer4: "Middle C", answer5: "B", correctAnswer: 3),
//    Section(title: "Question 3", question: "What is this note?", image: Image("trebleD5"), answer1: "D", answer2: "F", answer3: "F sharp", answer4: "Middle C", answer5: "B", correctAnswer: 0)
]

struct FlashCard: View {
    @State var correctAnswer = false
    @State var incorrectAnswer = false
    var section: Section
    var body: some View {
        ZStack {
            VStack {
                Text(section.title)
                
                Spacer()
                
                Text(section.question)
                section.image
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                    .cornerRadius(5)
                
                Spacer()
                
                ZStack {
                    ButtonAnswer()
                        .onTapGesture {
                            if section.correctAnswer == 0 {
                                correctAnswer = true
                            } else {
                                incorrectAnswer = true
                            }
                        }
                    Text(section.answer1)
                }
                ZStack {
                    ButtonAnswer()
                        .onTapGesture {
                            if section.correctAnswer == 1 {
                                correctAnswer = true
                            } else {
                                incorrectAnswer = true
                            }
                        }
                    Text(section.answer2)
                }
                ZStack {
                    ButtonAnswer()
                        .onTapGesture {
                            if section.correctAnswer == 2 {
                                correctAnswer = true
                            } else {
                                incorrectAnswer = true
                            }
                        }
                    Text(section.answer3)
                }
                ZStack {
                    ButtonAnswer()
                        .onTapGesture {
                            if section.correctAnswer == 3 {
                                correctAnswer = true
                            } else {
                                incorrectAnswer = true
                            }
                        }
                    Text(section.answer4)
                }
                ZStack {
                    ButtonAnswer()
                        .onTapGesture {
                            if section.correctAnswer == 4 {
                                correctAnswer = true
                            } else {
                                incorrectAnswer = true
                            }
                        }
                    Text(section.answer5)
                }
            }
            CorrectAnswer()
                .offset(y: correctAnswer ? 0 : -600)
                .animation(.spring(response: 0.7, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    correctAnswer.toggle()
                }
            
            IncorrectAnswer()
                .offset(y: incorrectAnswer ? 0 : 1000)
                .animation(.spring(response: 0.7, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    incorrectAnswer.toggle()
                }
        }
    }
}
}
