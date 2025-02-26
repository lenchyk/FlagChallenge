//
//  ContentView.swift
//  FlagChallenge
//
//  Created by Lena Soroka on 17.02.2025.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel: GameViewModel = .init()
    
    var body: some View {
        ZStack {
            starterView
                .opacity(viewModel.currentGameStep == nil ? 1 : 0)
                .transition(.opacity)
            
            if let gameStep = viewModel.currentGameStep {
                gameView(for: gameStep)
                    .transition(.slide)
            }
        }
        .padding()
        .overlay(alignment: .bottom) {
            toastView
                .opacity(viewModel.toast != nil ? 1 : 0)
                .animation(.easeInOut, value: viewModel.toast?.isCorrect)
        }
    }
    
    // MARK: - Starter Views
    private var starterView: some View {
        VStack(spacing: 48) {
            Text(Common.Text.Start.initialText)
                .font(.title2)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            if !viewModel.isInitialGame {
                VStack(alignment: .leading) {
                    Text(Common.Text.Finish.lastGameResults)
                        .bold()
                    Text(Common.Text.Finish.score(viewModel.score))
                }
                .padding()
            }
            
            startButton
        }
        .padding(32)
    }
    
    private var startButton: some View {
        Button {
            withAnimation {
                viewModel.startGame()
            }
        } label: {
            Text(Common.Text.Start.start)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(minHeight: 60)
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(24)
        }
    }
    
    // MARK: - GameView
    private func gameView(for step: GameStep) -> some View {
        VStack(spacing: 24) {
            Text(Common.Text.Game.chooseCountry)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)
            
            Text(step.country.flag)
                .font(.largeTitle)
            
            VStack {
                ForEach(step.options, id: \.self) { country in
                    countryOptionButton(with: country)
                }
            }
        }
    }
    
    private func countryOptionButton(with country: Country) -> some View {
        Button(action: { withAnimation { viewModel.choose(country: country) } }) {
            Text(country.name)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.black)
                .frame(minHeight: 60)
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.4))
                .cornerRadius(24)
        }
    }
    
    // MARK: - ToastView
    private var toastView: some View {
        Text(viewModel.toast?.text ?? "")
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            .frame(minHeight: 60)
            .frame(maxWidth: .infinity)
            .background(viewModel.toast?.color ?? .gray)
            .cornerRadius(24)
            .padding(.horizontal, 24)
            .padding(.bottom, -60)
    }
}

#Preview {
    GameView()
}
