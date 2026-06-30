//
//  ViewController.swift
//  Recip4U
//
//  Created by Tardes on 30/6/26.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipeList: [RecipeDto] = []
    var filteredRecipeList: [RecipeDto] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Filter recipes..."
        navigationItem.searchController = searchController
        
        searchRecipes(query: "")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = filteredRecipeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe Cell", for: indexPath) as! RecipeViewCell
        cell.configure(with: recipe)
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterRecipes(query: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchRecipes(query: searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //filterRecipes(query: "")
        searchRecipes(query: "")
    }
    
    func filterRecipes(query: String) {
        if !query.isEmpty {
            filteredRecipeList = recipeList.filter { recipe in
                recipe.name.lowercased().contains(query.lowercased())
            }
        } else {
            filteredRecipeList = recipeList
        }
        tableView.reloadData()
    }
    
    func searchRecipes(query: String) {
        Task {
            print("Searching recipes...")
            recipeList = await RecipeApi.searchRecipesByName(query)
            filteredRecipeList = recipeList
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

