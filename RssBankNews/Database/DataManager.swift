//
//  DataManager.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 31.01.2021.
//

import Foundation
import RealmSwift

protocol DataManagerProtocol {

    func saveToDataBase(post: Post)

    func fetchFromDataBase() -> [Post]

    func deleteAllObjects()
}

final class DataManager {

    private lazy var realm: Realm = {
        let realm = try! Realm()
        return realm
    }()

    func saveToDataBase(post: Post) {

        let postModel = PostModel()
        
        postModel.title = post.title
        postModel.textDescription = post.description
        postModel.pubDate = post.pubDate
        postModel.isRead = post.isRead
        
        try! realm.write {
            realm.add(postModel)
        }
    }

    func fetchFromDataBase() -> [Post] {

        let models = realm.objects(PostModel.self)
        var result: [Post] = []
        
        for model in models {
            let post = Post(title: model.title,
                            description: model.textDescription,
                            pubDate: model.pubDate,
                            isRead: model.isRead)
            result.append(post)
        }
        return result
    }

    func deleteAllObjects() {
        
        try! realm.write {
            realm.deleteAll()
        }
    }
}



// MARK: - Implement the WriteTransaction

//final class WriteTransaction {
//
//    private let realm: Realm
//
//    init(realm: Realm) {
//        self.realm = realm
//    }
//
//    func add<T: Persistable>(_ value: T) {
//        realm.add(value.managedObject())
//    }
//}

// MARK: - Implement the Container

//final class Container {
//
//    private let realm: Realm
//
//    convenience init() throws {
//        try self.init(realm: Realm())
//    }
//
//    init(realm: Realm) {
//        self.realm = realm
//    }
//
//    func write(_ block: (WriteTransaction) throws -> Void)
//    throws {
//        let transaction = WriteTransaction(realm: realm)
//        try realm.write {
//            try block(transaction)
//        }
//    }
//
//    func deleteAllObjects()  {
//        try! realm.write {
//            deleteAllObjects()
//        }
//    }
//}

