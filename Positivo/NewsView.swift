//
//  NewsView.swift
//  Positivo
//
//  Created by Bhavya  Srivastava on 02/09/20.
//  Copyright © 2020 Bhavya Srivastava. All rights reserved.
//

import SwiftUI
import SwURL

struct NewsView: View {
    
    var article: Article
    var imageURL:String
    
    init(withURL url:String, article: Article) {
        self.article = article
        self.imageURL = url
    }
    
    var body: some View {
        VStack {
            RemoteImageView(
                url: URL(string: self.imageURL)!,
                placeholderImage: Image.init("placeholder_avatar"),
                transition: .custom(transition: .opacity, animation: .easeOut(duration: 0.5))
            ).imageProcessing({ image in
                return image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
            })
            
            Text(article.title!)
                .font(.headline)
        }
    }
}

//struct NewsView_Previews: PreviewProvider {
//    var src = ESourceModel(id: "CACSA", name: "")
//    static var previews: some View {
//        NewsView(article: Article(from: "Bhavya Srivastava becomes the CEO of Amazon" as! Decoder))
//    }
//}
