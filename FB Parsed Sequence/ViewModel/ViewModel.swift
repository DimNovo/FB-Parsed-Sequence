//
//  ViewModel.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 24/03/2021.
//

import Combine
import Foundation

final class ViewModel: ObservableObject {
    
    @Published
    var flag = false
    @Published
    var elements: Elements = []
    
    private var points: [String] = []
    private var repeats: [[Repeat]] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        ElementsPublisher
            .fetchAll(Constant.gitDataUrl)
            .handleEvents(receiveOutput: { [self] in
                points = $0.map { sequencePointsHelper($0)}
                repeats = $0.map { sequenceRepeatHelper($0)}
            })
            .sink { [self] completion in
                switch completion {
                case .finished:
                    flag.toggle()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [self] in
                elementsHelper($0)
            }
            .store(in: &cancellableSet)
        
    }
    
    func elementIndex(_ element: Element) -> Int {
        elements
            .firstIndex(
                where: { $0.id == element.id }) ?? 0
    }
    
    func sequenceSumPermission(_ parsedArray: Array<String>) -> (Bool, Int) {
        let sum = parsedArray.reduce(0, { $0 + (Int($1) ?? 0)})
        return (sum == 35, sum)
    }
    
    private func sequencePointsHelper(_ element: Element) -> String {
        element
            .parsedSequenceArray
            .filter { (5...8).contains(Int($0) ?? 0)}
            .count
            .description
    }
    
    private func sequenceRepeatHelper(_ element: Element) -> [Repeat] {
        var temp: [Repeat] = []
        (0..<5).forEach { number in
            temp
                .append(
                    .init(
                        dict:
                            [
                                number:
                                    element
                                    .parsedSequenceArray
                                    .filter { number == Int($0)}
                                    .count
                                    .description
                            ]
                    )
                )
        }
        return temp
    }
    
    private func elementsHelper(_ pubElements: Elements) {
        (0..<pubElements.count)
            .forEach {
                elements
                    .append(
                        .init(
                            id: pubElements.map(\.id)[$0],
                            sequence: pubElements.map(\.sequence)[$0],
                            points: points[$0],
                            repeats: repeats[$0]
                        )
                    )
            }
    }
}
