//
//  TableController.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 02.12.2020.
//

import UIKit

final class TableNewsController: UIViewController {
    
    //MARK: - Properties
    
    let detailedNewsController = DetailedNewsController()
    private let networkManager = NetworkManager()
    var posts: [Post]?
    var defaultUrl = "https://www.banki.ru/xml/news.rss"
    
    lazy var tableViewNews: UITableView = {
        let table = UITableView()
        table.register(TableNewsCell.self, forCellReuseIdentifier: TableNewsCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 150
        table.refreshControl = myRefreshControl
        return table
    }()
    
    private lazy var myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    private lazy var rightButton: UIBarButtonItem = {
        let rightButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addURL))
        return rightButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubViews()
        addConstraints()
        fetchData(newUrl: defaultUrl)
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationItem.title = "Bank News"
        navigationItem.rightBarButtonItem = rightButton
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
    
    func segueToDetailVC() {
        navigationController?.pushViewController(detailedNewsController, animated: true)
    }
    
    func fetchData(newUrl: String) {
        defaultUrl = newUrl
        networkManager.parseNews(url: defaultUrl) { (posts) in
            //self.savePosts(posts: posts)
            self.posts = posts
            DispatchQueue.main.async {
                self.tableViewNews.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }
    
//    private func savePosts(posts: [Post]) {
//        let container = try! Container()
//        try! container.write { transaction in
//            for post in posts {
//                transaction.add(post)
//            }
//        }
//        container.deleteAllObjects()
//    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        fetchData(newUrl: defaultUrl)
        tableViewNews.reloadData()
        sender.endRefreshing()
    }
    
    @objc private func addURL() {
        let alert = Alert()
        let errorAlert = Alert()
        alert.addUrl(vc: self, errorAlert: errorAlert)
    }
}
