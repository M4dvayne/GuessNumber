//
//  ButtonView.swift
//  GuessNumber
//
//  Created by Вячеслав Кремнев on 04.05.2022.
//

import SwiftUI

struct ButtonView: View {
    @Binding var showAlert: Bool
    @Binding var thumbSliderValue: Int
    @Binding var targetValue: Int
    @Binding var currentValue: Int
    
    var body: some View {
        VStack {
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert("You've got \(computeScore()) score", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
            .padding()
            Button(action:{ restart()}, label: {Text("Начать заново")
            }
            )
        }
        .offset(y: 60)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    func restart() {
        targetValue = Int.random(in: 0...100)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(showAlert: .constant(false), thumbSliderValue: .constant(50), targetValue: .constant(50), currentValue: .constant(50))
    }
}
