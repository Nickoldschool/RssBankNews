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
    
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    weak var delegateNews: PassData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubViews()
        addConstraints()
        fetchData()
    }
    
    private func configure() {
        delegateNews = detailedNewsController
        view.backgroundColor = .white
        navigationItem.title = "Bank News"
        tableViewNews.register(TableNewsCell.self, forCellReuseIdentifier: TableNewsCell.identifier)
        tableViewNews.delegate = self
        tableViewNews.dataSource = self
        tableViewNews.translatesAutoresizingMaskIntoConstraints = false
        tableViewNews.refreshControl = myRefreshControl
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
    
    @objc private func refresh(sender: UIRefreshControl) {
        fetchData()
        tableViewNews.reloadData()
        sender.endRefreshing()
    }
    
}

