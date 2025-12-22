//
//  BindingTextField.swift
//  WeSplitApp
//
//  Created by Vaibhav Shringarpure on 22/12/2025.
//

import SwiftUI

struct BindingTextField: View {
    
    @State private var name = ""
    
    var body: some View {
        TextField("Enter Your Name", text: $name)
        Text("Hello, world! \(name)")
    }
}
