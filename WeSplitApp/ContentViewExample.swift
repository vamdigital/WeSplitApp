//
//  ContentView.swift
//  WeSplitApp
//
//  Created by Vaibhav Shringarpure on 22/12/2025.
//

import SwiftUI

struct ContentViewExample: View {
    var body: some View {
        NavigationStack {
            Form {
                Text("Some Text Sections ")
                Section {
                    Text("Hello World!")
                    Text("Hello World!")
                }
                Section {
                    Text("Hello World!")
                    Text("Hello World!")
                }
                Section {
                    Text("Just an image example")
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .foregroundStyle(Color.brown)
                }
                Section {
                    Text("@State example")
                    ButtonView()
                }
                
                Section {
                    Text("BindingText Field Example")
                    BindingTextField()
                }
            }
            
            Section {
                Text("Creating views in a loop")
                StudentForEachView()
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentViewExample()
}


