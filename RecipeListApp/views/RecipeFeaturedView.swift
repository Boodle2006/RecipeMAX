//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by James Goldston on 7/18/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:recipeModel
    @State var isDetailViewShowing = false
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes").bold().padding(.leading, 10).font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    
                    //only show featured recipes
                    ForEach(0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured {
                            
                            Button(action: {
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image).resizable().clipped()
                                        Text(model.recipes[index].name).padding([.all], 5)
                                    }
                                }
                            })
                            .sheet(isPresented: $isDetailViewShowing) {
                                
                                recipeDetailView(recipe: model.recipes[index])
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .cornerRadius(15).frame(width: geo.size.width - 40, height: geo.size.height - 100).shadow(color: .black, radius: 10, x: -5, y: 6)
                            
                            
                        }
                        // featured card
                        
                        
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            VStack(alignment: .leading) {
                
                Text("Preperation time ").font(.headline)
                Text("1 hour")
                Text("Highlights").font(.headline)
                
            }.padding(.leading, 10).padding(.bottom, 30)
        }
        
        
        
    }
    
    
    
}


struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        recipeTabView()
    }
}
