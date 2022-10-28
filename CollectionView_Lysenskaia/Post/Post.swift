//
//  Post.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import Foundation

struct Post {
    var author : String
    var description : String
    var image: String
    var likes: Int
    var views: Int
    
    static func postFeed() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "Cathedrals", description: "Saint Isaac's Cathedral or Isaakievskiy Sobor is a large architectural landmark cathedral that currently functions as a museum with occasional church services in Saint Petersburg, Russia. It is dedicated to Saint Isaac of Dalmatia, a patron saint of Peter the Great, who had been born on the feast day of that saint.", image: "IMG_1", likes: 220, views: 540))
        post.append(Post(author: "Museums", description: "The State Hermitage Museum is a museum of art and culture in Saint Petersburg, Russia. It is the largest art museum in the world by gallery space.", image: "IMG_2.jpg", likes: 315, views: 550))
        post.append(Post(author: "Art", description: "Facing the Gulf of Finland, Petergof is known for the sprawling Peterhof Museum Complex, home to the 18th-century Grand Palace, elaborately landscaped gardens, and spectacular fountains with statues.", image: "IMG_3.jpeg", likes: 125, views: 365))
        post.append(Post(author: "Bridges", description: "Palace Bridge, a road- and foot-traffic bascule bridge, spans the Neva River in Saint Petersburg between Palace Square and Vasilievsky Island.", image: "IMG-4", likes: 115, views: 205))

        return post
    }
}
