//
//  imagetest.swift
//  Positivo
//
//  Created by Bhavya  Srivastava on 03/09/20.
//  Copyright © 2020 Bhavya Srivastava. All rights reserved.
//

import SwiftUI
import URLImage
import SwURL

struct imagetest: View {
    var body: some View {
//        URLImage(URL(string: "https://picsum.photos/id/237/200/300")!)
        RemoteImageView(
            url: URL(string: "https://picsum.photos/id/237/200/300")!,
            placeholderImage: Image.init("placeholder_avatar"),
            transition: .custom(transition: .opacity, animation: .easeOut(duration: 0.5))
        ).imageProcessing({ image in
            return image
                .resizable()
                .frame(width: 200, height: 200)
        })
    }
}

struct imagetest_Previews: PreviewProvider {
    static var previews: some View {
        imagetest()
    }
}
