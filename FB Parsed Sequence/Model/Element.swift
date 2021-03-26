//
//  Element.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 24/03/2021.
//

import Foundation

struct Element: Identifiable, Codable {
    let id, sequence: String
    var points: String?
    var repeats: [Repeat]?
}

struct Repeat: Codable, Hashable {
    let dict: [Int: String]
}

extension Element {
    var parsedSequenceArray: Array<String> { sequence.components(separatedBy: ",") }
}

extension Element {
    static let placeholder =
        Self.init(
            id: "33F4D37C-0A3B-44B2-83BA-82DEB064568F",
            sequence: "5,1,0,1,2,0,1,4,2,0,2,1,3,4,4,5",
            points: "2",
            repeats:
                [
                    .init(dict: [0: "3"]),
                    .init(dict: [1: "4"]),
                    .init(dict: [2: "3"]),
                    .init(dict: [3: "1"]),
                    .init(dict: [4: "3"])
                ]
        )
}
