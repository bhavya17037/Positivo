//
//  ContentView.swift
//  Positivo
//
//  Created by Bhavya  Srivastava on 02/09/20.
//  Copyright © 2020 Bhavya Srivastava. All rights reserved.
//

import SwiftUI
import NaturalLanguage

struct ContentView: View {
    
    init(news: [Article]) {
        UITableView.appearance().separatorStyle = .none
        self.news = news
    }
    
    @State var news = [Article]()
    
    var body: some View {
        
            NavigationView {
                List {
                    ForEach(news, id: \.title) { article in
                        NavigationLink(destination: NewsDetail(withURL: article.urlToImage!, article: article)) {
                            NewsView(withURL: article.urlToImage!, article: article)
                        }
                    }
                }.navigationBarTitle(Text("News").foregroundColor(.black))
            }.onAppear(perform: loadNews)
        
    }
}

extension ContentView {
    
    func loadNews() {
        let urlString: String = "https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=608703a6350649a7a283a98bd36fc561"
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                if let response_obj = try? JSONDecoder().decode(NewsFeed.self, from: data) {
                    DispatchQueue.main.async {
                        let arts = response_obj.articles
                        for x in arts {
                            if x.urlToImage != nil && x.content != nil && x.title != nil && x.articleDescription != nil {
                                if self.checkSentimentScore(text: x.articleDescription!){
                                    self.news.append(x)
                                }
                            }else {
                                print("NIL FOUND")
                            }
                        }
                        print(self.news.count)
                    }
                }
            }
            
        }
        task.resume()
    }
    
    func checkSentimentScore(text: String) -> Bool {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        let (sentiment, _) = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore)
        let score = Double(sentiment?.rawValue ?? "0") ?? 0
        
        print(text)
        print(score)
        
        if(score > -0.5) {
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(news: [])
    }
}
