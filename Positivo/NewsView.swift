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
        
        ZStack {
            
            Color(red: 163.00/256, green: 210.00/256, blue: 202.00/256)
            .edgesIgnoringSafeArea(.all)
        
        
            VStack {
                RemoteImageView(
                    url: URL(string: self.imageURL)!,
                    placeholderImage: Image.init("placeholder_avatar"),
                    transition: .custom(transition: .opacity, animation: .easeOut(duration: 0.5))
                ).imageProcessing({ image in
                    return image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 200)
                        .padding(.init(top: 30, leading: 0, bottom: 10, trailing: 0))
                })
                
                Text(article.title!)
                    .font(.headline)
                    .padding(10)
            }
        }.cornerRadius(25)
    }
}

//struct NewsView_Previews: PreviewProvider {
//    var src = ESourceModel(id: "CACSA", name: "")
//    static var previews: some View {
//        NewsView(article: Article(from: "Bhavya Srivastava becomes the CEO of Amazon" as! Decoder))
//    }
//}
