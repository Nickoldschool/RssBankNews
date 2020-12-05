//
//  TableNewsController+.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

extension TableNewsController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentPost = posts?[indexPath.row] else { return  }
        switch indexPath.row {
        case 0...indexPath.row:
            delegateNews?.loadNews(post: currentPost)
            //delegateState?.change(post: currentPost, state: "Просмотрено")
            tableViewNews.cellForRow(at: indexPath)?.accessoryType = .checkmark
            tableViewNews.reloadData()
            navigationController?.pushViewController(detailedNewsController, animated: true)
        default:
            print("Something went wrong")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension TableNewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let posts = posts else { return 0 }
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewNews.dequeueReusableCell(withIdentifier: TableNewsCell.identifier, for: indexPath) as? TableNewsCell else { return UITableViewCell() }
        guard let item = posts?[indexPath.row] else { return UITableViewCell()}
        cell.update(post: item)
        //cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}
