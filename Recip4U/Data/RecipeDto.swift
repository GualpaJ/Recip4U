//
//  RecipeDto.swift
//  Recip4U
//
//  Created by Tardes on 30/6/26.
//

struct RecipeDto: Codable {
    let id: Int
    let name: String
    let image: String
    let ingredients: [String]
    let instructions: [String]
    let difficulty: String
    let type: String
    let servings: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, ingredients, instructions, difficulty, servings
        case type = "cuisine"
    }
}

struct RecipeListDto: Codable {
    let recipes: [RecipeDto]
}
