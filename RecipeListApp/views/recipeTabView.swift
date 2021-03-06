//
//  recipeTavView.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/16/21.
//

import SwiftUI

struct recipeTabView: View {
    
    
    
    var body: some View {
        
        TabView {
            RecipeFeaturedView()
                .tabItem {
                VStack{
                
                    Image(systemName: "star.fill")
                    Text("Featured")
                
            }
        }
            RecipeListView()
                .tabItem {
                
                VStack{
                Image(systemName: "list.bullet")
                    Text("Recipes")
            }
            
            }

        }
        .environmentObject(recipeModel())
        
    }
}

struct recipeTavView_Previews: PreviewProvider {
    static var previews: some View {
        recipeTabView()
    }
}
