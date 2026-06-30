//
//  ViewController.swift
//  Recip4U
//
//  Created by Tardes on 30/6/26.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            let recipeList = await RecipeApi.getRecipeList()
            
            DispatchQueue.main.async {
                print(recipeList)
            }
        }
    }
}

