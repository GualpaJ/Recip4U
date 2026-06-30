//
//  RecipeViewCell.swift
//  Recip4U
//
//  Created by Tardes on 30/6/26.
//

import UIKit

class RecipeViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with recipe: RecipeDto) {
        self.nameLabel.text = recipe.name
        self.recipeImageView.image = nil
        self.recipeImageView.loadFrom(url: recipe.image)
    }
}
