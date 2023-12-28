//
//  NewsModel.swift
//  AccessibleNews
//
//  Created by Macbook Air 13 on 28.12.23.
//

import Foundation

struct News: Decodable {
    let id: Int
    let title: String
    let imageUrl: String
    let summary: String
    let publishedAt: String
}
