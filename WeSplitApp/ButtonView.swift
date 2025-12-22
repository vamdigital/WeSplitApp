//
//  ButtonView.swift
//  WeSplitApp
//
//  Created by Vaibhav Shringarpure on 22/12/2025.
//

import SwiftUI

struct ButtonView: View {
    @State var tapCount:Int = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
        
    }
}
