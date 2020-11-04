//
//  SendView.swift
//  finstaExample
//
//  Created by Colin Walsh on 11/4/20.
//

import SwiftUI

struct SendView: View {
    @Binding
    var parentState: ViewState
    
    let id: Int

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
                .frame(height: UIScreen.screenHeight / 1.5)
                .onTapGesture {
                    parentState = .normal
                }
            ZStack {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(height: UIScreen.screenHeight / 2)
                Text("Showing send view for Photo \(id)")
            }
        }
    }
}
