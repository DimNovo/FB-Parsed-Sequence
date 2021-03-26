//
//  Elements+Extension.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 24/03/2021.
//

import Combine
import Foundation

typealias Elements = [Element]
typealias ElementsPublisher = AnyPublisher<Elements, Error>

extension ElementsPublisher {
    static func fetchAll(
        _ url: URL,
        _ session: URLSession = .shared
    ) -> Self {
        session
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Elements.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
