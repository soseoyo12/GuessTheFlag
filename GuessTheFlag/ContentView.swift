//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by SeongYongSong on 9/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var result = ""
    @State private var resultMessage = ""
    
    @State private var chance = 8
    
    @State private var showingFinalScore = false



    
    @State private var currentScore = 0
    
    var body: some View {
    
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)

                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                        
                    }
                    
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                            
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                
                HStack {
                    Spacer()
                    
                    Text("Score: \(currentScore)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Text("Chance: \(chance)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    
                    Spacer()
                }
                

                
                Spacer()
            }
            .padding()


        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("\(resultMessage)")
            // Text("\(result) \n Your score is \(currentScore)")
        }
        
        .alert("Game is done", isPresented: $showingFinalScore) {
            Button("Restart", action: endGame)
        } message: {
            Text("Your result score is \(currentScore)")
        }
        
    }
    
    
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            result = "Correct"
            currentScore += 1
            resultMessage = "Your score is \(currentScore)"
            chance -= 1
            
            if chance == 0 {
                showingFinalScore = true
            }
            
            

        } else {
            scoreTitle = "Wrong"
            result = "\(countries[number])"
            resultMessage = "That flag is \(result)! \n Your score is \(currentScore)"
            chance -= 1
            
            if chance == 0 {
                showingFinalScore = true
            }
        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func endGame() {
            chance = 8
        currentScore = 0
        }
    }







#Preview {
    ContentView()
}

