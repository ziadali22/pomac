//
//  RecipesViewController.swift
//  pomac
//
//  Created by ziad on 12/03/2022.
//

import UIKit

class RecipesViewController: UIViewController {
    
    // MARK: - Properties
    var presenter : RecipesPresenter!
    @IBOutlet weak var recipesTable: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RecipesPresenter(view: self)
        presenter.viewDidload()
        
        setupTableView()
    }
    // MARK: - Configurations
    private func setupTableView() {
        recipesTable.register(cell: RecipesTableViewCell.self)
        recipesTable.delegate = self
        recipesTable.dataSource = self
    }
    
    
    
}
extension RecipesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getRecipesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipesTableViewCell = tableView.dequeueCell()
        presenter.configureCell(cell: cell, index: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, -10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.0
        UIView.animate(withDuration: 0.75){
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTaptheCell(self: self, index: indexPath.item)
    }
}

extension RecipesViewController: RecipesView{
    func showIndicator() {
        self.view.showLoader()
    }
    
    func hideIndicator() {
        self.view.dismissLoader()
    }
    
    func fetchDataSuccess() {
        recipesTable.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
}
