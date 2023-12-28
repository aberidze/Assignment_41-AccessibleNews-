//
//  NewsPageViewModel.swift
//  AccessibleNews
//
//  Created by Macbook Air 13 on 28.12.23.
//

import Foundation

class NewsPageViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var newsData: [News] = []
    
    
    // MARK: - Init
    init() {
        fetchNewsData()
    }
    
    
    // MARK: - Methods
    private func fetchNewsData() {
        
        let urlString = "https://api.spaceflightnewsapi.net/v3/articles"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let data, error == nil else { return }
            
            do {
                let news = try JSONDecoder().decode([News].self, from: data)
                DispatchQueue.main.async {
                    self?.newsData = news
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
