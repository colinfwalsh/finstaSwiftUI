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

class ContentViewState: ObservableObject {
    @Published
    var viewState: ViewState = .normal
}

struct ContentView: View {
    @ObservedObject
    var viewModel = ContentViewModel()
    
    @EnvironmentObject
    var contentViewState: ContentViewState
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.photos, id: \.id) {photo in
                        PhotoView(viewModel: PhotoViewModel(photo: photo))
                            .onAppear {
                                viewModel.shouldLoadMorePhotos(currentPhoto: photo)
                            }
                    }
                }
            }.padding(EdgeInsets(top: 20, leading: 0.0, bottom: 0.0, trailing: 0.0))
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            switch contentViewState.viewState {
            case .normal:
                Spacer()
            case .presentComments(let id):
                CommentsView(id: id)
            case .presentSend(let id):
                SendView(id: id)
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
