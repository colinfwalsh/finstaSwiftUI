//
//  PhotoView.swift
//  finstaExample
//
//  Created by Colin Walsh on 11/3/20.
//

import struct Kingfisher.KFImage
import SwiftUI
import Combine

struct PhotoView: View {

    @ObservedObject
    var viewModel: PhotoViewModel
    
    @Binding
    var parentState: ViewState
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 10.0) {
            
            Text("Photo \(viewModel.photo.id ?? -1)")
                .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0))
                .font(.headline)
            
            KFImage(URL(string: viewModel.photo.url ?? ""))
                .cancelOnDisappear(true)
                .resizable()
                .frame(height: 600)
            
            HStack(spacing: 20.0) {
                Button {
                    viewModel.didTapHeartButton()
                } label: {
                    Image(systemName: viewModel.heartTapped ? "heart.fill" : "heart")
                        .font(.system(size: 30))
                        .foregroundColor(viewModel.heartTapped ? .red : .gray)
                }
                
                Button {
                    withAnimation {
                        self.parentState = .presentComments(photoId: self.viewModel.photo.id ?? -1)
                    }
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
                
                Button {
                    withAnimation {
                        self.parentState = .presentSend(photoId: self.viewModel.photo.id ?? -1)
                    }
                } label: {
                    Image(systemName: "paperplane")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
            }.padding(5)
            
            HStack {
                Text(viewModel.photo.title ?? "")
            }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            
            Divider()
        }
    }
}
