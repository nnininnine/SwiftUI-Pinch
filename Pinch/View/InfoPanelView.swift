//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Nuttapon Buaban on 11/7/2565 BE.
//

import SwiftUI

struct InfoPanelView: View {
  // MARK: Properties

  var scale: CGFloat
  var offset: CGSize

  // MARK: Body

  var body: some View {
    HStack {
      // MARK: Hotspot

      Image(systemName: "circle.circle")
        .symbolRenderingMode(.hierarchical)
        .resizable()
        .frame(width: 30, height: 30)

      Spacer()

      HStack(spacing: 2) {
        Image(systemName: "arrow.up.left.and.arrow.down.right")
        Text("\(scale)")

        Spacer()

        Image(systemName: "arrow.left.and.right")
        Text("\(offset.width)")

        Spacer()

        Image(systemName: "arrow.up.and.down")
        Text("\(offset.height)")

        Spacer()
      }
      .font(.footnote)
      .padding(8)
      .background(.ultraThinMaterial)
      .cornerRadius(8)
      .frame(maxWidth: 420)

      Spacer()

      // MARK: Info panel
    }
  }
}

struct InfoPanelView_Previews: PreviewProvider {
  static var previews: some View {
    InfoPanelView(scale: 1, offset: .zero)
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
