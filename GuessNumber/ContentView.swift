//
//  ContentView.swift
//  GuessNumber
//
//  Created by Вячеслав Кремнев on 04.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер как можно ближе к: \(targetValue)")
                .padding()
            .font(.system(size: 12))
            HStack{
                Text("0")
                ImportedSlider(value: $currentValue, alpha: computeScore(), color: .orange)
                Text("100")
            }
            Button("Проверь меня!") {
            showAlert = true
            }
            .alert("You've got \(computeScore()) score", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
            .padding()
            
            Button("Начать заново") {
                reloadView()
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func reloadView() {
        targetValue = Int.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
