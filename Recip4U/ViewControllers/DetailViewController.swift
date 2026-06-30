//
//  DetailViewController.swift
//  Recip4U
//
//  Created by Tardes on 30/6/26.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var recipe: RecipeDto!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = recipe.name
        
        Task {
            recipe = await RecipeApi.getRecipeById(recipe.id)
            
            DispatchQueue.main.async {
                self.loadData()
            }
        }
    }
    
    func loadData() {
        recipeImageView.loadFrom(url: recipe.image)
        nameLabel.text = recipe.name
        typeLabel.text = recipe.type
        difficultyLabel.text = recipe.difficulty
        difficultyLabel.textColor = switch recipe.difficulty {
        case "Easy": .systemGreen
        case "Medium": .systemYellow
        case "Hard": .systemRed
        default: .label
        }
        ingredientsLabel.text = recipe.ingredients.map({ it in " - \(it)"}).joined(separator: "\n")
        instructionsLabel.text = recipe.instructions.map({ it in " - \(it)"}).joined(separator: "\n")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
