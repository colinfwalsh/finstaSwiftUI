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
    var photo: Photo
    
    @State
    var heartTapped = false
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 10.0) {
            
            Text("Photo \(photo.id ?? -1)")
                .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0))
                .font(.headline)
            
            KFImage(URL(string: photo.url ?? ""))
                .cancelOnDisappear(true)
                .resizable()
                .frame(height: 600)
            
            HStack(spacing: 20.0) {
                Button {
                    heartTapped = !heartTapped
                } label: {
                    Image(systemName: heartTapped ? "heart.fill" : "heart")
                        .font(.system(size: 30))
                        .foregroundColor(heartTapped ? .red : .gray)
                }
                
                Button {
                    print("Tapped!")
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
                
                Button {
                    print("Tapped!")
                } label: {
                    Image(systemName: "paperplane")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
            }.padding(5)
            
            HStack {
                Text(photo.title ?? "")
            }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            
            Divider()
        }
    }
}
