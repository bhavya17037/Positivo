//
//  NewsDetail.swift
//  Positivo
//
//  Created by Bhavya  Srivastava on 02/09/20.
//  Copyright © 2020 Bhavya Srivastava. All rights reserved.
//

import SwiftUI
import SwURL

struct NewsDetail: View {
    
    var article: Article
    var imageURL:String
    
    init(withURL url:String, article: Article) {
        self.article = article
        self.imageURL = url
    }
    
    var body: some View {
        VStack (spacing: 10) {
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
            
            VStack{
                Text(article.title!)
                    .font(.title)
                    .padding(.top, 50)
                
                Text(article.content!)
                    .font(.headline)
                    .padding()
            }
            
            Button(action: {
                
                let url: NSURL = URL(string: self.article.url!)! as NSURL
                UIApplication.shared.open(url as URL)

            }) {
                Text(verbatim: "Click here for full story")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            
            Spacer()
        }
    }
}

//struct NewsDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsDetail(withURL: "https://picsum.photos/id/237/200/300", article: )
//    }
//}
