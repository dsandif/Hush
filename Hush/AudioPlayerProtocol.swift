//
//  AudioPlayerProtocol.swift
//  Hush
//
//  Created by Darien Sandifer on 12/16/22.
//

import Foundation

/**
 Represents an instance of an integration/application
 */
protocol StatusBarApplication: AppEventDelegate {
  var currentTrack: AudioTrack {get set}  // The current playing track.
  var soundVolume: Int {get set} // The sound output volume (0 = minimum, 100 = maximum)
  var playerState: PlayerState {get}  // Is player stopped, paused, or playing?
  var playerPosition: CGFloat {get set}  // The player’s position within the currently playing track in seconds.
  var repeatingEnabled: Bool {get set} // Is repeating enabled in the current playback context?
  var repeating: Bool {get set} // Is repeating on or off?
  var shufflingEnabled: Bool {get set} // Is shuffling enabled in the current playback context?
  var shuffling: Bool {get set} // Is shuffling on or off?
  var properties: [String: Any] {get set} // dictionary with extra properties from json
  
  func nextTrack() -> Bool  // Skip to the next track.
  func previousTrack() -> Bool // Skip to the previous track.
  func playpause() -> Bool  // Toggle play/pause.
  func pause()  // Pause playback.
  func play()  // Resume playback.
  func playTrack(for track: AudioTrack)  // Start playback of a track in the given context.
}

protocol AppEventDelegate {
  init()  // Initialize app - should be required
  func registerApp()  // setup background events
  func appLaunched()  // Observer
  func appTerminated()  // Observer
  func authenticateUser() // Handle user auth
  func systemPermissions()  // Handle getting permission for apple events
}

enum PlayerState {
  case stopped
  case paused
  case playing
}

protocol AudioPlayer {
  var id: String {get}
  var isPlaying: Bool {get set}
  var isPaused: Bool {get set}
  var isRunning: Bool {get set}
  
  func play() -> Bool
  func pause() -> Bool
}

final class AudioTrack {
  var id: String = ""  // The ID of the item.
  var artist: String = ""  // The artist of the track.
  var album: String = ""  // The album of the track.
  var discNumber: Int = 0  // The disc number of the track.
  var duration: Int = 0  // The length of the track in seconds.
  var playedCount: Int = 0  // The number of times this track has been played 💙.
  var trackNumber: Int = 0  // The index of the track in its album.
  var starred: Bool = false  // Is the track starred?
  var popularity: Int = 0  // How popular is this track? 0-100
  var name: String = "track name"  // The name of the track.
  var artwork: String = ""  // The track's album cover url.
  var albumArtist: String = ""  // That album artist of the track.
  var spotifyUrl: String = ""  // The URL of the track.
}

//final class Spotify{}
final class AppleItunes{}



