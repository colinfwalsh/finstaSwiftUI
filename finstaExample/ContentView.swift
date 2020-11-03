//
//  ContentView.swift
//  finstaExample
//
//  Created by Colin Walsh on 10/29/20.
//

import struct Kingfisher.KFImage
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published
    var photos: [Photo] = []
    
    @Published
    var isLoading: Bool = false
    
    var cancelled: Set<AnyCancellable> = Set()
    
    init() {
        self.fetchPhotos()
    }
    
    func fetchPhotos() {
        isLoading = true
        PlaceholderClient
            .fetchPhotos(starting: 0, limit: 5)
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { photos in
                self.isLoading = false
                self.photos = photos
            }
            .store(in: &cancelled)
    }
}

struct ContentView: View {
    @ObservedObject
    var viewModel = ContentViewModel()
    
    @State
    var heartTapped = false
    
    var body: some View {
        
        if viewModel.isLoading {
            Text("Loading Data")
        } else {
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.photos.indices) {
                        let photo = viewModel.photos[$0]
                        
                        VStack(alignment: .leading,
                               spacing: 10.0) {
                            
                            Text("Photo \(photo.id ?? -1)").padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0))

                            KFImage(URL(string: photo.url ?? ""))
                                .cancelOnDisappear(true)
                                .resizable()
                                .frame(height: 600)
                            
                            HStack(spacing: 20.0) {
                                Button {
                                    heartTapped = !heartTapped
                                } label: {
                                    Image(systemName: heartTapped ? "heart.fill" : "heart")
                                        .font(.system(size: 25))
                                        .foregroundColor(heartTapped ? .red : .gray)
                                }
                                
                                Button {
                                    print("Tapped!")
                                } label: {
                                    Image(systemName: "bubble.left")
                                        .font(.system(size: 25))
                                        .foregroundColor(.gray)
                                }
                                
                                Button {
                                    print("Tapped!")
                                } label: {
                                    Image(systemName: "paperplane")
                                        .font(.system(size: 25))
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
            }.padding(EdgeInsets(top: 20, leading: 0.0, bottom: 0.0, trailing: 0.0))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
