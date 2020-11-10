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
    
    var exampleComments = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ultrices lacus. Ut nec tortor.",
                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ultrices lacus. Ut nec tortor.",
                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ultrices lacus. Ut nec tortor.",
                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ultrices lacus. Ut nec tortor.",
                           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ac ultrices lacus. Ut nec tortor."]
    
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
                    
                    VStack {
                        ForEach(exampleComments, id: \.self) {text in
                            HStack {
                                Text("username")
                                    .bold() + Text(" ") + Text(text)
                            }
                        }
                    }
                    .frame(height: UIScreen.screenHeight / 2)
                    .padding()
                }
            }
        }
    }
}
