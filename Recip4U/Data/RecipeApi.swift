//
//  RecipeApi.swift
//  Recip4U
//
//  Created by Tardes on 30/6/26.
//

import Foundation

class RecipeApi {
    
    static let BASE_URL = "https://dummyjson.com/recipes"
    
    static func getRecipeList() async -> [RecipeDto] {
        guard let url = URL(string: BASE_URL) else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return try JSONDecoder().decode(RecipeListDto.self, from: data).recipes
        } catch {
            print("Invalid data")
            return []
        }
    }
    
    static func getRecipeById(_ id: Int) async -> RecipeDto? {
        guard let url = URL(string: "\(BASE_URL)/\(id)") else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return try JSONDecoder().decode(RecipeDto.self, from: data)
        } catch {
            print("Invalid data")
            return nil
        }
    }
}
