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
    let networkManager = NetworkManager()
    let tableCell = TableNewsCell()
    var tableIndex: IndexPath?
    var posts: [Post]?
    var defaultUrl = "https://www.banki.ru/xml/news.rss"
    
    lazy var tableViewNews: UITableView = {
        let table = UITableView()
        table.register(TableNewsCell.self, forCellReuseIdentifier: TableNewsCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.refreshControl = myRefreshControl
        return table
    }()
    
    lazy var myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    lazy var rightButton: UIBarButtonItem = {
        let rightButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addURL))
        return rightButton
    }()
    
    //MARK: - Delegate
    
    weak var delegateNews: PassData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubViews()
        addConstraints()
        fetchData(newUrl: defaultUrl)
    }
    
    private func configure() {
        delegateNews = detailedNewsController
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
            self.posts = posts
            DispatchQueue.main.async {
                self.tableViewNews.reloadSections(IndexSet(integer: 0), with: .left)
            }
        }
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        fetchData(newUrl: defaultUrl)
        tableViewNews.reloadData()
        sender.endRefreshing()
    }
    
    @objc private func addURL() {
        let alert = UIAlertController(title: "Do you want to add new source?", message: "Paste new URL", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (newTextField) in
            newTextField.placeholder = "Enter URL of source"
        }
        let saveAction = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let txt = alert.textFields?.first?.text else { return }
            self.defaultUrl = txt
            self.fetchData(newUrl: self.defaultUrl)
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

