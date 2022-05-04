//
//  RotationEffectSampleView.swift
//  SnapListUsingTabView
//
//  Created by hiraoka on 2022/05/04.
//

import SwiftUI

struct RotationEffectSampleView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 50, height: 100)

            Rectangle()
                .fill(Color.blue.opacity(0.8))
                .frame(width: 50, height: 100)
                .rotationEffect(.degrees(90), anchor: .leading)

            Rectangle()
                .fill(Color.purple.opacity(0.8))
                .frame(width: 50, height: 100)
                .rotationEffect(.degrees(90), anchor: .top)


            Rectangle()
                .fill(Color.red.opacity(0.8))
                .frame(width: 50, height: 100)
                .rotationEffect(.degrees(90), anchor: .topLeading)

            Rectangle()
                .fill(Color.green.opacity(0.8))
                .frame(width: 50, height: 100)
                .rotationEffect(.degrees(90), anchor: .topLeading)
                .offset(x: 50)

        }
    }
}

struct RotationEffectSampleView_Previews: PreviewProvider {
    static var previews: some View {
        RotationEffectSampleView()
    }
}
