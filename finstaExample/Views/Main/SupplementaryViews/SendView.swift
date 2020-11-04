//
//  SendView.swift
//  finstaExample
//
//  Created by Colin Walsh on 11/4/20.
//

import SwiftUI

struct SendView: View {
    @EnvironmentObject
    var contentState: ContentViewState
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
                .frame(height: UIScreen.screenHeight / 1.5)
                .onTapGesture {
                    contentState.viewState = .normal
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

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView(id: 0)
    }
}
