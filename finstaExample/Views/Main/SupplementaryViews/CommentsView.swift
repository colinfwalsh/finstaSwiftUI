//
//  CommentsView.swift
//  finstaExample
//
//  Created by Colin Walsh on 11/4/20.
//

import SwiftUI

struct CommentsView: View {
    @Binding
    var parentState: ViewState
    
    let id: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
                .frame(height: UIScreen.screenHeight)
                .onTapGesture {
                    parentState = .normal
                }
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: UIScreen.screenHeight / 2)
                        .cornerRadius(12.0)
                        .padding(.bottom, 0.0)
                    Text("Showing comments for Photo \(id)")
                }
            }
        }
    }
}
