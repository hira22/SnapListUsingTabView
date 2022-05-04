//
//  ContentView.swift
//  SnapListUsingTabView
//
//  Created by hiraoka on 2022/05/03.
//

import SwiftUI

struct ContentView: View {
    private let colors: [[Color]] = [
        [.red, .green, .yellow, .black, .blue],
        [.blue, .red, .green, .yellow, .black],
        [.green, .yellow, .black, .blue, .red],
        [.yellow, .black, .blue, .red, .green],
        [.black, .blue, .red, .green, .yellow],
    ]

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                TabView {
                    ForEach(colors, id: \.self) { colors in
                        TabView {
                            ForEach(colors, id: \.self) { color in
                                color
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        // Re-Rotate content
                        .rotationEffect(.degrees(-90))
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                    }
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

            VStack {
                Spacer()
                Capsule()
                    .fill(.secondary)
                    .frame(height: 60)
                    .padding()
            }
        }
        .navigationTitle("title")
        .toolbar(content: {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    // action
                } label: {
                    Image(systemName: "star")
                }

            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
