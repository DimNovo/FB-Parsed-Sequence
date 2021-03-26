//
//  ListView.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 26/03/2021.
//

import SwiftUI

struct ListView: View {
    @ObservedObject
    var vm: ViewModel
    var body: some View {
        List {
            ForEach(vm.elements) { element in
                HStack {
                    Divider()
                    VStack(alignment: .leading) {
                        SequenceView(vm: vm, element: element)
                        if vm.sequenceSumPermission(element.parsedSequenceArray).0 {
                            Divider()
                            PointsView(element: element)
                            Divider()
                            RepeatsView(element: element)
                        }
                    }
                    Spacer()
                    Divider()
                    Text("\(vm.elementIndex(element))")
                        .foregroundColor(.blue)
                        .bold()
                }
                .font(.callout)
                .listRowBackground(
                    vm.elementIndex(element) % 2 != 0 ?
                        Color.secondary.opacity(0.3) :
                        Color.secondary.opacity(0.1)
                )
            }
            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 10))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(vm: ViewModel())
    }
}
