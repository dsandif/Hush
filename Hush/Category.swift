//
//  Category.swift
//  Hush
//
//  Created by Darien Sandifer on 12/17/22.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    ///categories
    case apple
    case spotify
    case pandora
    case xbox
    case youtubeMusic
    case firefox
    case chrome
    
    var systemNameIcon: String? {
        switch self {
        case .apple:
          return "apple.logo"
        case .pandora:
          return "shippingbox.fill"
        case .spotify:
          return "aqi.medium"
        case .xbox:
          return "xbox.logo"
        case .youtubeMusic:
          return "play.tv.fill"
        case .firefox:
          return "flame.fill"
        case .chrome:
          return "network"
        }
    
    }
    var color: Gradient { // same as "return Color" but individual colors get one item in array
        switch self {
        case .apple:
          return Gradient(colors: [.white])
        case .spotify:
          return Gradient(colors: [.gray,.green,.green.opacity(0.7)])
        case .pandora:
          return Gradient(colors: [.blue,.indigo,.teal])
        case .xbox:
          return Gradient(colors: [.green,.yellow,.green])
        case .youtubeMusic:
          return Gradient(colors: [.red])
        case .firefox:
          return Gradient(colors: [.purple.opacity(0.5),.pink,.orange])
        case .chrome:
          return Gradient(colors: [.blue, .teal, .white])
        }
    }
  
    var backgroundColor: Color{
      switch self {
      case .apple:
        return .gray.opacity(0.3)
      case .spotify:
        return .green.opacity(0.1)
      case .pandora:
        return .indigo.opacity(0.1)
      case .xbox:
        return .white.opacity(0.1)
      case .youtubeMusic:
        return .white.opacity(0.8)
      case .firefox:
        return Color(nsColor: #colorLiteral(red: 0.5, green: 0.02, blue: 0.9, alpha: 0.5)).opacity(0.3)
      case .chrome:
        return .blue.opacity(0.2)
      }
    }
  
    var displayLabel: String{
      switch self {
      case .apple:
        return "Music"
      case .spotify:
        return "Spotify"
      case .pandora:
        return "Pandora"
      case .xbox:
        return "XBOX"
      case .youtubeMusic:
        return "Music"
      case .chrome:
        return "chrome"
      case .firefox:
        return "firefox"
      }
    }
  
  var font: String{
    switch self {
    case .apple:
      return "PT Sans"
    case .spotify:
      return "Gotham Bold"
    case .pandora:
      return "Gotham Bold"
    case .xbox:
      return "Gotham Bold"
    case .youtubeMusic:
      return "gotham Black"
    default:
      return "Gotham Bold"
    }
  }
  
}

extension Category: Identifiable {
    var id: String { rawValue }
}
