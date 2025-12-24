//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Vaibhav Shringarpure on 22/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    /** Similar to @State but specifically designed to handle input focus in our UI */
    @FocusState private var amountIsFocused: Bool

    /** Some predefind percentage values for the Tip */
    let tipPercentages = [10, 15, 20, 25, 0]
    
    /** Computed Property for totalPerPerson */
    var totalPerPerson: Double {
        // Calculate the total per person here
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var grandTotal: Double {
        //Calculate Grand Total
        let tipSel = Double(tipPercentage)
        let tipVal = checkAmount / 100 * tipSel
        return checkAmount + tipVal
    }

    var body: some View {
        NavigationStack {
            Form {
                /** Amount + Number of People */
                Section {
                    LabeledContent("Amount:") {
                        TextField(
                            "Amount",
                            value: $checkAmount,
                            format: .currency(
                                code: Locale.current.currency?.identifier ?? "USD"
                            )
                        )
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .focused($amountIsFocused)
                    }

                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                /** Tip Calculator - with Navigation */
                Section("How much tip do you want to leave? - Navigation ") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                /** Tip Calculator - with Segmented View */
//                Section("Some Title") {
//                    Picker("Tip Percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                    
//                }
                
                /** Tip Calculator */
//                Section("How much tip do you want to leave?") {
//                    Picker("Tip Percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentage, id: \.self) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                    /** This is the style where you have small pills like shape buttons next to reach other which can be tapped */
//                    .pickerStyle(.segmented)
//                    
//                }
//                
                /** Total Amount */
                Section("Amount per person") {
                    Text(
                        totalPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                }
                
                /** Total Amount for Check */
                Section("Total Amount") {
                    Text(
                        grandTotal,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


