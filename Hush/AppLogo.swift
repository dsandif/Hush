//
//  AppLogo.swift
//  Hush
//
//  Created by Darien Sandifer on 12/17/22.
//

import SwiftUI

struct AppLogo: View {
  let category: Category
  
  var body: some View {
    HStack(alignment: .center){
      LinearGradient(gradient: category.color, startPoint: .topLeading, endPoint: .bottomTrailing)
        .mask(
          HStack(alignment: .firstTextBaseline, spacing: 2){
            if category.systemNameIcon != nil{
              Image(systemName: category.systemNameIcon!)
                .font(.headline)
            }
            Text(category.displayLabel).font(.custom(category.font, size: 11))
          }
        )
    }
    .frame(width: 65, height: 20)
    .background(category.backgroundColor)
    
  }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
      VStack{
        ForEach(Category.allCases){ cat in
          AppLogo(category: cat)
        }
      }
    }
}
