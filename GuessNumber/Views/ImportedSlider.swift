//
//  ImportedSlider.swift
//  GuessNumber
//
//  Created by Вячеслав Кремнев on 04.05.2022.
//

import SwiftUI

struct ImportedSlider: UIViewRepresentable {
    
    @Binding var value: Double
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.maximumTrackTintColor = .blue
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changedValue),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(value)
    }
    func makeCoordinator() -> (Coordinator) {
        Coordinator(value: $value)
    }
}

extension ImportedSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changedValue(sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct ImportedSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImportedSlider(value: .constant(0.50), alpha: Int(0.2), color: .orange)
    }
}
