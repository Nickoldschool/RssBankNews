//
//  Post.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 03.12.2020.
//

struct Post {
    var title: String
    var description: String
    var pubDate: String
    var isRead: Bool
}

extension Post: Persistable {
    init(managedObject: PostModel) {
        title = managedObject.title
        description = managedObject.textDescription
        pubDate = managedObject.pubDate
        isRead = managedObject.isRead
    }
    
    func managedObject() -> PostModel {
        let post = PostModel()
        post.title = title
        post.textDescription = description
        post.pubDate = pubDate
        post.isRead = isRead
        return post
    }
}
