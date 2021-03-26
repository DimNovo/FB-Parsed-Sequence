//
//  PointsView.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 24/03/2021.
//

import SwiftUI

struct PointsView: View {
    let element: Element
    var body: some View {
        HStack {
            ForEach(5..<9) {
                Text("\($0 == 5 ? "(" : "")\($0)\($0 == 8 ? ")" : "")")
                Divider()
            }
            Spacer()
            Divider()
            HStack(alignment: .lastTextBaseline, spacing: 3) {
                Text(element.points ?? "")
                Text(element.points == "1" ? " point" : " points")
                    .font(.system(size: 12))
                    .italic()
            }
        }
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(element: .placeholder)
    }
}
