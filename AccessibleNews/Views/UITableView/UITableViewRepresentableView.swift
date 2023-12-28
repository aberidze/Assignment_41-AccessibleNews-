//
//  UITableViewRepresentableView.swift
//  AccessibleNews
//
//  Created by Macbook Air 13 on 28.12.23.
//

import SwiftUI

struct UITableViewRepresentableView: UIViewRepresentable {
    
    // MARK: - Properties
    @Binding var newsData: [News]
    
    
    // MARK: - Methods
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        //
    }
    
    
    // MARK: - Coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(newsData: $newsData)
    }
    
    internal class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        
        @Binding var newsData: [News]
        
        init(newsData: Binding<[News]>) {
            self._newsData = newsData
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            newsData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            if let newsCell = cell as? NewsTableViewCell {
                newsCell.configure(with: newsData[indexPath.row])
            }
            
            return cell
        }
    }
}
