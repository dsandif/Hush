//
//  SeachBar.swift
//  Hush
//
//  Created by Darien Sandifer on 12/16/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searching: Bool
  
    var body: some View {
        ZStack {
          Rectangle()
            .foregroundColor(Color("LightGray"))
          HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
          }
          .textFieldStyle(.squareBorder)
          .foregroundColor(.gray)
        }
        .frame(height: 40)
        .cornerRadius(13)
    }
}


//extension UIApplication {
//     func dismissKeyboard() {
//         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//     }
// }
struct SeachBar_Previews: PreviewProvider {
    static var previews: some View {
      SearchBar(searchText: .constant(""), searching: .constant(true))
    }
}
