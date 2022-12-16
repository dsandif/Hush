//
//  ConnectionHeader.swift
//  Hush
//
//  Created by Darien Sandifer on 12/16/22.
//

import SwiftUI

struct ConnectionHeader: View {
    let status = "connected"
    let name = "2 x Apple Homepods \n1 x Echo dot \n2 x Echo"
    let subsystem = "stereo group"
  
    var body: some View {
      HStack{
        VStack(alignment: .leading) {
          HStack(alignment: .center, spacing: 3) {
            Circle()
              .frame(width: 5, height: 5)
              .padding(.trailing,5)
            Text(status.uppercased()).bold().font(.caption2)
            Spacer()
          }
          .foregroundColor(.green)
          
          Text(subsystem.uppercased()).bold().font(.caption2)
          Text(name).bold().font(.caption2).foregroundColor(.gray)
        }
        Image(systemName: "homepod.and.homepodmini.fill")
          .font(.largeTitle)
      }
    }
}

struct ConnectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionHeader()
    }
}
