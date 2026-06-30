//
//  ViewController.swift
//  Recip4U
//
//  Created by Tardes on 30/6/26.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipeList: [RecipeDto] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        Task {
            recipeList = await RecipeApi.getRecipeList()
            
            DispatchQueue.main.async {
                self.tableView.reloadData()            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe Cell", for: indexPath) as! RecipeViewCell
        cell.configure(with: recipe)
        return cell
    }
}

