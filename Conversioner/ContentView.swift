//
//  ContentView.swift
//  Conversioner
//
//  Created by Bhavananda Das on 22.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    let units = ["seconds", "minutes", "hours"]
    
    var result: Double {
        if inputUnit == units[0] && outputUnit == units[1] {
        return inputValue / 60
        } else if inputUnit == units[1] && outputUnit == units[2] {
            return inputValue / 60
        } else if inputUnit == units[0] && outputUnit == units[2] {
            return inputValue / 360
        } else if inputUnit == units[2] && outputUnit == units[0] {
            return inputValue * 360
        } else if inputUnit == units[1] && outputUnit == units[0] {
            return inputValue * 60
        } else if inputUnit == units[2] && outputUnit == units[1] {
            return inputValue * 60
        } else {
            return inputValue
            
            
            
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $inputValue, format: .number)
                    
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                Section("Which unit you chose") {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                Section("GRAND RESULT") {
                    Text(result, format: .number)
                }
            }
            .navigationTitle("Conversioner")
        }
    }
}

#Preview {
    ContentView()
}
