//
//  RecipesTableViewCell.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import UIKit

class RecipesTableViewCell: UITableViewCell, RecipesCellView {
    // MARK: - Properties
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var caloriesText: UILabel!
    @IBOutlet weak var headLineText: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurationUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    // MARK: - Configurations
    private func configurationUI(){
        [nameText,caloriesText,headLineText].forEach { item in
            item?.font = DesignSystem.TypoGraphy.title.font
        }
    }
    
    func displayName(name: String){
        nameText.text = name
    }
    func displayCalories(calories: String){
        caloriesText.text = calories
    }
    func displayHeadLine(headLine: String){
        headLineText.text = headLine
    }
}
