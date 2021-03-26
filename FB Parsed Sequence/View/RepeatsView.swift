//
//  RepeatsView.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 24/03/2021.
//

import SwiftUI

struct RepeatsView: View {
    let element: Element
    var body: some View {
        HStack {
            ForEach(element.repeats ?? [], id: \.self) { array in
                ForEach(array.dict.keys.sorted(), id: \.self) { key in
                    VStack(alignment: .center) {
                        Text("\(key)")
                        Divider()
                        HStack(alignment: .lastTextBaseline) {
                            Text("\(array.dict[key] ?? "")")
                            Text(array.dict[key] == "1" ? "time" : "times")
                                .font(.caption)
                                .italic()
                        }
                    }
                    key != 4 ? Divider() : nil
                }
            }
        }
    }
}

struct RepeatsView_Previews: PreviewProvider {
    static var previews: some View {
        RepeatsView(element: .placeholder)
    }
}
