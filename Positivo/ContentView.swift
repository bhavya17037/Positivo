//
//  ContentView.swift
//  Positivo
//
//  Created by Bhavya  Srivastava on 02/09/20.
//  Copyright © 2020 Bhavya Srivastava. All rights reserved.
//

import SwiftUI

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
            }.navigationBarTitle(Text("News"))
        }.onAppear(perform: loadNews)
    }
}

extension ContentView {
    
    func loadNews() {
        let urlString: String = "http://newsapi.org/v2/everything?q=coronavirus&from=2020-08-12&sortBy=publishedAt&apiKey=608703a6350649a7a283a98bd36fc561"
        
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                if let response_obj = try? JSONDecoder().decode(NewsFeed.self, from: data) {
                    DispatchQueue.main.async {
                        let arts = response_obj.articles
                        for x in arts {
                            if x.urlToImage != nil {
                                self.news.append(x)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(news: [])
    }
}
