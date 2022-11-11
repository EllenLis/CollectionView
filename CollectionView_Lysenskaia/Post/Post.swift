//
//  Post.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import Foundation

struct Post: Equatable {
    var author : String
    var description : String
    var image: String
    var id: String
    var likes: Int
    var views: Int
}

var dataSource: [Post] = []
