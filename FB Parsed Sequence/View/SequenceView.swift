//
//  SequenceView.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 24/03/2021.
//

import SwiftUI

struct SequenceView: View {
    @ObservedObject
    var vm: ViewModel
    let element: Element
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("∑")
                    .baselineOffset(5)
                Text("\(vm.sequenceSumPermission(element.parsedSequenceArray).1)")
                    .bold()
                    .foregroundColor(
                        vm.sequenceSumPermission(element.parsedSequenceArray).0 ? .green : .red)
            }
            HStack {
                ForEach(element.parsedSequenceArray, id: \.self) {
                    Text($0)
                        .foregroundColor(Int($0) != nil ? nil : .red)
                }
            }
        }
    }
}

struct SequenceView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceView(vm: ViewModel(), element: .placeholder)
    }
}
