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

  // MARK: Body

  var body: some View {
    NavigationView {
      ZStack {
        // MARK: Page Image

        Image("magazine-front-cover")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .cornerRadius(10)
          .padding()
          .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
          .opacity(isAnimating ? 1 : 0)
          .scaleEffect(imageScale)
          .onTapGesture(count: 2, perform: {
            if imageScale == 1 {
              withAnimation(.spring()) {
                imageScale = 5
              }
            } else {
              withAnimation(.spring()) {
                imageScale = 1
              }
            }
          })
      } //: ZStack
      .navigationTitle("Pinch & Zoom")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear(perform: {
        withAnimation(.linear(duration: 1)) {
          isAnimating = true
        }
      })
    } //: NavigationView
    .navigationViewStyle(.stack)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
