//
//  ViewController.swift
//  DestinityTracks
//
//  Created by Juan Morillo on 28/7/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
  var audioPlayer : AVAudioPlayer?
  
  let tracksArray = ["Track1","Track2","Track3","Track4",
                     "Track5","Track6","Track7","Track8"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func buttonPlayTrackPressed(_ sender: UIButton) {
    playTrack(trackFileName: tracksArray[sender.tag - 1])
  }
  
  @IBAction func buttonStopPlayingPressed(_ sender: UIButton) {
    audioPlayer?.stop()
  }
  
  @IBAction func sliderVolumeTracks(_ sender: UISlider) {
    if (audioPlayer != nil) {
      audioPlayer?.volume = sender.value
    }
  }
  
  func playTrack(trackFileName :String){
    let trackURL = Bundle.main.url(forResource: trackFileName, withExtension: "mp3")!
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: trackURL)
      guard let audioPlayer = audioPlayer else { return }
      audioPlayer.prepareToPlay()
      audioPlayer.numberOfLoops = 1
      audioPlayer.play()
    } catch let error as NSError {
      print(error.description)
    }
  }
}

