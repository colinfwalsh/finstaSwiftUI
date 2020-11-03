//
//  ContentView.swift
//  finstaExample
//
//  Created by Colin Walsh on 10/29/20.
//

import SwiftUI
import Combine



struct ContentView: View {
    @ObservedObject
    var viewModel = ContentViewModel()
    
    
    
    var body: some View {
        
        ZStack {
            
            List {
                ForEach(viewModel.photos, id: \.id) {photo in
                    PhotoView(photo: photo)
                        .onAppear {
                            viewModel.shouldLoadMorePhotos(currentPhoto: photo)
                        }
                }
            }.padding(EdgeInsets(top: 20, leading: 0.0, bottom: 0.0, trailing: 0.0))
            
            if viewModel.isLoading {
                ProgressView()
                    .shadow(color: .accentColor, radius: 4.0, x: 1.0, y: 2.0)
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
