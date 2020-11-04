//
//  PlaceholderModels.swift
//  finstaExample
//
//  Created by Colin Walsh on 11/3/20.
//

import Foundation

struct Photo: Decodable, Hashable {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}
