//
//  PhotoViewModel.swift
//  finstaExample
//
//  Created by Colin Walsh on 11/4/20.
//

import Foundation
import Combine

class PhotoViewModel: ObservableObject {
    var photo: Photo
    
    @Published
    var heartTapped = false
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    func didTapHeartButton() {
        heartTapped = !heartTapped
    }
    
    func didTapCommentButton() {
        
    }
    
    func didTapSendButton() {
        
    }
}
