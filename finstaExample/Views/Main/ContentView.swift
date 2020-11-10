//
//  ContentView.swift
//  finstaExample
//
//  Created by Colin Walsh on 10/29/20.
//

import SwiftUI
import Combine


enum ViewState {
    case normal
    case presentComments(photoId: Int)
    case presentSend(photoId: Int)
}

struct ContentView: View {
    @StateObject
    var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.photos, id: \.id) {photo in
                            PhotoView(viewModel: PhotoViewModel(photo: photo),
                                      parentState: $viewModel.viewState)
                                .onAppear {
                                    viewModel.shouldLoadMorePhotos(currentPhoto: photo)
                                }
                        }
                    }
                }.padding(.top, 20)
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                switch viewModel.viewState {
                case .normal:
                    Spacer()
                case .presentComments(let id):
                    CommentsView(parentState: $viewModel.viewState, id: id)
                case .presentSend(let id):
                    SendView(parentState: $viewModel.viewState, id: id)
                }
            }.navigationBarTitle(Text("FinstaGram 📸"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
