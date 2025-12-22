//
//  StudentForEachView.swift
//  WeSplitApp
//
//  Created by Vaibhav Shringarpure on 22/12/2025.
//

import SwiftUI

struct StudentForEachView: View {
    let students = ["Harry", "Herimone", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Form {
            Picker("Select your student", selection: $selectedStudent) {
               ForEach(students, id: \.self) {
                    Text($0)
                }
            }
        }
    }
        
}
