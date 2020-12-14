//
//  CorrectView.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 12/12/20.
//

import SwiftUI

struct CorrectView: View {
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 250, height: 300)
            Text("That's music to my ears!")
        }
    }
}

struct CorrectView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectView()
    }
}
