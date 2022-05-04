//
//  ContentView.swift
//  SnapListUsingTabView
//
//  Created by hiraoka on 2022/05/03.
//

import SwiftUI

struct ContentView: View {
    private let colors: [[Color]] = [
        [.blue, .red, .green, .yellow, .black],
        [.red, .green, .yellow, .black, .blue],
        [.green, .yellow, .black, .blue, .red],
        [.yellow, .black, .blue, .red, .green],
        [.black, .blue, .red, .green, .yellow],
        [.blue, .red, .green, .yellow, .black]
    ]

    var body: some View {
        Group {
            GeometryReader { proxy in
                TabView {
                    ForEach(colors, id: \.self) { colors in
                        TabView {
                            ForEach(colors, id: \.self) { color in
                                color
                            }
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    // Re-Rotate content
                    .rotationEffect(.degrees(-90))
                    .frame(
                        width: proxy.size.width,
                        height: proxy.size.height
                    )
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(
                    // Height & width swap
                    width: proxy.size.height,
                    height: proxy.size.width
                )
                // Rotate TabView
                .rotationEffect(.degrees(90), anchor: .topLeading)
                // Offset back into screens bounds
                .offset(x: proxy.size.width)
            }
        }
        .statusBar(hidden: true)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
