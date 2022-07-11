//
//  ControlButtonView.swift
//  Pinch
//
//  Created by Nuttapon Buaban on 11/7/2565 BE.
//

import SwiftUI

struct ControlButtonView: View {
  var action: () -> Void
  var imageName: String

  var body: some View {
    Button {
      action()
    } label: {
      Image(systemName: imageName)
        .symbolRenderingMode(.hierarchical)
        .font(.system(size: 36))
    }
  }
}

struct ControlButtonView_Previews: PreviewProvider {
  static var previews: some View {
    ControlButtonView(action: {}, imageName: "minus.magnifyingglass")
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
