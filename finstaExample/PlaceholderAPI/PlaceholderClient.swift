//
//  ApiClient.swift
//  finstaExample
//
//  Created by Colin Walsh on 10/29/20.
//

import Foundation
import Combine

struct PlaceholderClient {
    
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    static func fetchPhotos(starting at: Int, limit: Int) -> AnyPublisher<Array<Photo>, Error>{
        let args = "photos?_start=\(at)&_limit=\(limit)"
        
        let urlString = PlaceholderClient.baseURL + "/" + args
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            .decode(type: Array<Photo>.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
