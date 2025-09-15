//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by SeongYongSong on 9/11/25.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack{
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                
                ForEach(0..<3) { number in
                    Button {
                        
                    } label: {
                        Image(countries[correctAnswer])
                    }
                }
            }
        }

        }
    }

#Preview {
    ContentView()
}

