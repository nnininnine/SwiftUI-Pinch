//
//  ContentView.swift
//  Pinch
//
//  Created by Nuttapon Buaban on 11/7/2565 BE.
//

import SwiftUI

struct ContentView: View {
  // MARK: Properties

  @State private var isAnimating: Bool = false
  @State private var imageScale: CGFloat = 1
  @State private var imageOffset: CGSize = .zero

  // MARK: Methods

  func resetImageState() {
    return withAnimation(.spring()) {
      imageScale = 1
      imageOffset = .zero
    }
  }

  // MARK: Body

  var body: some View {
    NavigationView {
      ZStack {
        // MARK: Page Image

        Color.clear

        Image("magazine-front-cover")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .cornerRadius(10)
          .padding()
          .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
          .opacity(isAnimating ? 1 : 0)
          .animation(.linear(duration: 1), value: isAnimating)
          .offset(x: imageOffset.width, y: imageOffset.height)
          .scaleEffect(imageScale)

          // MARK: Double tap gesture

          .onTapGesture(count: 2, perform: {
            if imageScale == 1 {
              withAnimation(.spring()) {
                imageScale = 5
              }
            } else {
              resetImageState()
            }
          })

          // MARK: Drag gesture

          .gesture(
            DragGesture()
              .onChanged { value in
                withAnimation(.linear(duration: 0.5)) {
                  imageOffset = value.translation
                }
              }
              .onEnded { _ in
                if imageScale <= 1 {
                  resetImageState()
                }
              }
          )
      } //: ZStack
      .navigationTitle("Pinch & Zoom")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear(perform: {
        isAnimating = true
      })
      .overlay(InfoPanelView(scale: imageScale, offset: imageOffset).padding(), alignment: .top)
    } //: NavigationView
    .navigationViewStyle(.stack)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
