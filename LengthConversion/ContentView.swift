//
//  ContentView.swift
//  LengthConversion
//
//  Created by Zoltan Vegh on 05/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var selectedInputUnit: String = "meters"
    @State private var selectedOutputUnit: String = "meters"
    
    private let units: [String] = ["meters", "kilometers", "feet", "yard", "miles"]
    
    // conversion dictionary
    let toMeters: [String: Double] = [
        "meters": 1,
        "kilometers": 1000,
        "feet": 0.3048,
        "yards": 0.9144,
        "miles": 1609.34
    ]

    let fromMeters: [String: Double] = [
        "meters": 1,
        "kilometers": 0.001,
        "feet": 3.28084,
        "yards": 1.09361,
        "miles": 0.000621371
    ]
    
    var outputValue: Double {
            // Convert input to meters (base unit)
            let meters = inputValue * (toMeters[selectedInputUnit] ?? 1)
            
            // Convert from meters to target unit
            let result = meters * (fromMeters[selectedOutputUnit] ?? 1)
        
            return result
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Amount to convert") {
                    TextField("Input Amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Input Unit") {
                    Picker("Unit", selection: $selectedInputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output Unit") {
                    Picker("Unit", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                Section("Output Value") {
                    Text(String(format: "%.2f", outputValue))
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

#Preview {
    ContentView()
}
