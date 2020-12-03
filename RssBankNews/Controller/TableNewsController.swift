//
//  TableController.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

final class TableNewsController: UIViewController {
    
    //MARK: - Properties
    
    let tableViewNews = UITableView()
    let detailedNewsController = DetailedNewsController()
    var posts: [Post]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubViews()
        addConstraints()
        fetchData()
    }
    
    private func configure() {
        
        view.backgroundColor = .white
        navigationItem.title = "Bank News"
        tableViewNews.register(TableNewsCell.self, forCellReuseIdentifier: TableNewsCell.identifier)
        tableViewNews.delegate = self
        tableViewNews.dataSource = self
        tableViewNews.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubViews() {
        
        view.addSubview(tableViewNews)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            tableViewNews.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewNews.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewNews.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewNews.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func fetchData() {
        let networkManager = NetworkManager()
        networkManager.parseNews(url: "https://www.banki.ru/xml/news.rss") { (posts) in
            self.posts = posts
            OperationQueue.main.addOperation {
                self.tableViewNews.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }
    
}

