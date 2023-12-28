//
//  NewsPageView.swift
//  AccessibleNews
//
//  Created by Macbook Air 13 on 28.12.23.
//

import SwiftUI

struct NewsPageView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = NewsPageViewModel()
    
    
    // MARK: - body
    var body: some View {
        
        UITableViewRepresentableView(newsData: $viewModel.newsData)
    }
}


// MARK: - Preview
struct NewsPageView_Previews: PreviewProvider {
    static var previews: some View {
        NewsPageView()
    }
}
