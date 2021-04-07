//
//  HomeViewController.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

struct HomeViewModel {
    var title: String {
        return fruit.name
    }
    var smallImage: UIImage? {
        return fruit.emoji.toEmoji(height: 18)
    }
    
    let fruit: Fruit
    
    init(with fruit: Fruit) {
        self.fruit = fruit
    }
}

protocol HomeView: class {
    func prepare(with viewModels: [HomeViewModel])
}

class HomeViewController: UIViewController, HomeView {
    private struct Constants {
        static let CellID = String(describing: HomeTableViewCell.self)
        static let title = "Home"
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: HomePresenter!
    
    private var viewModels: [HomeViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
        presenter.present()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            self.navigationController?.navigationBar.sizeToFit()
        }
    }
    
    func prepare(with viewModels: [HomeViewModel]) {
        self.viewModels = viewModels
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.reloadData()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: Constants.CellID, bundle: .main), forCellReuseIdentifier: Constants.CellID)
        tableView.tableFooterView = UIView()
    }
    
    private func setupViews() {
        title = Constants.title
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellID,
                                                       for: indexPath)
        guard let homeCell = cell as? HomeTableViewCell else { return cell }
        let viewModel = viewModels[indexPath.row]
        homeCell.prepare(with: viewModel)
        return homeCell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(viewModel: viewModels[indexPath.row])
    }
}
