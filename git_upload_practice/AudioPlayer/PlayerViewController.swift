//
//  PlayerViewController.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 07/09/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player: AVAudioPlayer?
    
    //User interface elements
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    let playPauseButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if holder.subviews.count == 0{
            configure()
        }
    }
    

    func configure(){
        // set up player
        
        let song = songs[position]
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do{
            
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else{
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            player.play()
            
        }
        catch{
            print("error occured")
        }
        
        
        //set up user interface elements
        
        //album cover
        
        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holder.frame.size.width - 20,
                                      height: holder.frame.size.width - 20)
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
     
        
        //Labels : song, album, artist
        
        songNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10,
                                      width: holder.frame.size.width - 20,
                                      height: 70)
        
        albumNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 70,
                                      width: holder.frame.size.width - 20,
                                      height: 70)
        
        artistNameLabel.frame = CGRect(x: 10,
                                       y: albumImageView.frame.size.height + 10 + 140,
                                       width: holder.frame.size.width - 20,
                                       height: 70)
        
        songNameLabel.text = song.trackName
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName
        
        
         holder.addSubview(songNameLabel)
         holder.addSubview(albumNameLabel)
         holder.addSubview(artistNameLabel)
        
        
        //Player controls
        
        let nextButton = UIButton()
        let backButton = UIButton()
        
        //Frame
        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 70
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size)/2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        backButton.frame = CGRect(x: 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        // Add actions
        
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        //styling
        
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        
        playPauseButton.tintColor = .black
        backButton.tintColor = .black
        nextButton.tintColor = .black
        
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        
        
        //slider
        
        let slider = UISlider(frame: CGRect(x: 20,
                                            y: holder.frame.size.height-60,
                                            width: holder.frame.size.width - 40,
                                            height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
        
    }
    
    @objc func didTapPlayPause(){
        
        if player?.isPlaying == true {
            //pause
            self.player?.pause()
            //show play button
            self.playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            
            //shrink image
            
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView.frame = CGRect(x: 30,
                                                   y: 30,
                                                   width: self.holder.frame.size.width-60,
                                                   height: self.holder.frame.size.width-60)
            })
            
        }
        else{
            //play
            player?.play()
            self.playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            //increase image size
            
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView.frame = CGRect(x: 10,
                                                   y: 10,
                                                   width: self.holder.frame.size.width-20,
                                                   height: self.holder.frame.size.width-50)
            })
            
        }
        
    }
    
    @objc func didTapBack(){
        if position > 0 {
            position = position - 1
            player?.stop()
            
            for subview in holder.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapNext(){
        
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            
            for subview in holder.subviews{
                subview.removeFromSuperview()
            }
            configure()
        }
        
    }
    
    
    @objc func didSlideSlider(_ slider: UISlider){
        let value = slider.value
        player?.volume = value
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if let player = player{
            player.stop()
        }
    }
}

