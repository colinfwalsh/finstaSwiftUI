//
//  ContentViewModel.swift
//  finstaExample
//
//  Created by Colin Walsh on 11/3/20.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published
    var photos: [Photo] = []
    
    @Published
    var isLoading: Bool = false
    
    @Published
    var viewState: ViewState = .normal
    
    private var cancelled: Set<AnyCancellable> = Set()
    
    private var paginationVal = 0
    
    init() {
        fetchPhotos()
    }
    
    func fetchPhotos() {
        isLoading = true
        PlaceholderClient
            .fetchPhotos(starting: paginationVal, limit: 10)
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] photos in
                guard let self = self
                else { return }
                
                self.isLoading = false
                
                guard let check = photos.first,
                      !self.photos.contains(check)
                else { return }
                
                self.photos.append(contentsOf: photos)
                self.paginationVal += 10 }
            .store(in: &cancelled)
    }
    
    func shouldLoadMorePhotos(currentPhoto: Photo?) {
        guard let photo = currentPhoto
        else { return }
        
        let threshold = photos.index(photos.endIndex, offsetBy: -5)
        if photos.firstIndex(where: { $0.id == photo.id }) == threshold {
            fetchPhotos()
        }
    }
}
