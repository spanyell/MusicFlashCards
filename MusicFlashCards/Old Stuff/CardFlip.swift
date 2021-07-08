//
//  CardFlip.swift
//  MusicFlashCards
//
//  Created by Dan Beers on 12/16/20.
//

import SwiftUI

struct CardFlip: View {
    var body: some View {
        SimpleFlipper()
    }
}
struct SimpleFlipper : View {
      @State var flipped = true
      var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
            VStack{
                
                  Spacer()

                  ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30).foregroundColor(.white)
                            .border(Color.black, width: 3)
                            .cornerRadius(10)
                        Text("Hooray for Hockey!")
                            .offset(y: -50)
                        Image("CovidBurn").resizable()
                            .frame(width: 150, height: 150)
                            .offset(y: 80)
                    }
                    .flipRotate(flipDegrees).opacity(flipped ? 0 : 1)
                    .placedOnCard()
                    
                    Image("cardBack").resizable().placedOnCard().flipRotate(-180 + flipDegrees).opacity(flipped ? 1 : 0)
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        
                        
                  }
                  .animation(.easeInOut(duration: 0.5))
                  .onTapGesture { flipped.toggle() }
                  Spacer()
            }
      }
}

extension View {

      func flipRotate(_ degrees : Double) -> some View {
        rotation3DEffect(Angle(degrees: degrees), axis: (x: 1, y: 0, z: 0.0))
      }

      func placedOnCard() -> some View {
            padding(5).frame(width: 250, height: 350, alignment: .center)
      }
}

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip()
    }
}
