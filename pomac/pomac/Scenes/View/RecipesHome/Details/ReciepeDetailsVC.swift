//
//  ReciepeDetailsVC.swift
//  pomac
//
//  Created by ziad on 12/03/2022.
//

import UIKit

class ReciepeDetailsVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var fatsText: UILabel!
    @IBOutlet weak var carbsText: UILabel!
    @IBOutlet weak var proteinsText: UILabel!
    @IBOutlet weak var levelText: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var favButton: UIButton!
    
    //MARK: - Properties
    let presenter : RecipesDetailsPresenter!
    init(with presenter: RecipesDetailsPresenter){
        self.presenter = presenter
        super.init(nibName: "ReciepeDetailsVC", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.updateSelection { (bool) in
            switch bool{
            case true:
                favButton.setImage(UIImage(named: "Fav"), for: .normal)
            case false:
                favButton.setImage(UIImage(named: "un-Fav"), for: .normal)
            }
        }
    }

    @IBAction func addToFavoriteAction(_ sender: Any) {
        presenter.addToFav { (bool) in
            switch bool{
            case true:
                favButton.setImage(UIImage(named: "Fav"), for: .normal)
            case false:
                favButton.setImage(UIImage(named: "un-Fav"), for: .normal)
            }
        }
    }
    
    //MARK: - Configurations
    private func configureUI(){
        mainImage.kf.setImage(with: URL(string: presenter.recipesData.image ?? ""), options: [.transition(.fade(0.8))])
        nameText.text = presenter.recipesData.name
        fatsText.text = presenter.recipesData.fats
        carbsText.text = presenter.recipesData.carbos
        proteinsText.text = presenter.recipesData.proteins
        levelText.text = String(presenter.recipesData.difficulty ?? 0)
        guard let ingredients = presenter.recipesData.ingredients else {return}
                let text = ingredients.joined(separator: "\n\n")
                ingredientsTextView.text = text
    }
}
