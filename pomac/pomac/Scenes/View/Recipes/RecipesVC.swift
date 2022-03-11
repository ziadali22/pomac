//
//  RecipesVC.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import UIKit

class RecipesVC: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var recipesTableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        
    }
    //MARK: - Configurations
    private func setupTableview(){
        recipesTableView.register(cell: RecipesTableViewCell.self)
        recipesTableView.delegate = self
        recipesTableView.dataSource = self
    }
}
