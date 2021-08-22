//
//  PostModel.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 31.01.2021.
//

import Foundation
import RealmSwift

protocol Persistable {
    associatedtype ManagedObject: Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

@objcMembers
class PostModel: Object {
    dynamic var title: String = ""
    dynamic var textDescription: String = ""
    dynamic var pubDate: String = ""
    dynamic var isRead: Bool = false
}
