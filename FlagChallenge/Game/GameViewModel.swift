//
//  GameViewModel.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 17.02.2025.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var currentGameStep: GameStep?
    @Published var toast: Toast?
    
    var isInitialGame: Bool = true
    var score: Int = 0
    
    private var gameSteps: [GameStep] = []
    private var stepCount: Int = 0
    private let flagGameService: FlagGaming
    
    init() { 
        flagGameService = FlagGameService()
    }
    
    func startGame() {
        gameSteps.removeAll()
        score = 0
        gameSteps = flagGameService.startNewGame()
        currentGameStep = gameSteps.first
    }
    
    func choose(country: Country) {
        if country == currentGameStep?.country {
            score += 1
        }
            
        toast = .init(isCorrect: country == currentGameStep?.country)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.toast = nil
            self.nextStepIfNeeded()
        }
    }
    
    private func nextStepIfNeeded() {
        if stepCount != gameSteps.count - 1 {
            stepCount += 1
            currentGameStep = gameSteps[stepCount]
        } else {
            currentGameStep = nil
            stepCount = 0
            isInitialGame = false
        }
    }
}

