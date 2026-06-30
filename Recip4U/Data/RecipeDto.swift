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
}

struct RecipeListDto: Codable {
    let recipes: [RecipeDto]
}
