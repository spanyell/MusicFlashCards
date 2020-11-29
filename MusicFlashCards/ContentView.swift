//
//  ContentView.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 11/28/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("This is a middle C.")
        Image("trebleC4")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
