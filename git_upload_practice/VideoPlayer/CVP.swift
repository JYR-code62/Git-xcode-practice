//
//  CVP.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 06/09/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit
import AVFoundation

class CVP: UIViewController {
    
    //MARK: Variables
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var isVideoPlaying = false
    var isFullScreen = false
    
   var constraints = [NSLayoutConstraint]()
   var portraitConstraints = [NSLayoutConstraint]()
   var landscapeConstraints = [NSLayoutConstraint]()
    
    
    //@IBOutlet weak var videoView: UIView!
    
    //MARK: Control Elements
    
    let videoView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(white: 0, alpha: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0)
        return view
    }()
    

    
    let playPauseButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "pause.fill")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        button.addTarget(self, action: #selector(handlePlayPause), for: .touchUpInside)
        
        return button
    }()
    
    let forwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "forward.fill")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        button.addTarget(self, action: #selector(handleForward), for: .touchUpInside)
        
        return button
    }()
    
    let backwardButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "backward.fill")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        button.addTarget(self, action: #selector(handleBackward), for: .touchUpInside)
        
        return button
    }()
    
    
    let videoLengthLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00.00"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.isHidden = true
        return label
    }()
    
    let currentTimeLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00.00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.isHidden = true
        return label
    }()
    
    let videoSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .white
        slider.thumbTintColor = .red
        slider.isHidden = true
        
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    
    let fullScreenButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "viewfinder")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        button.addTarget(self, action: #selector(handleFullScreenButton), for: .touchUpInside)
        return button
    }()
    
    let moreOptionsButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "m.square.fill")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        button.addTarget(self, action: #selector(handleMoreOptionsButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: Handle control actions
    
    @objc func handleSliderChange(){
        
        if let duration = player.currentItem?.duration{
            let totalSeconds = CMTimeGetSeconds(duration)
            
            let value = Float64(videoSlider.value) * totalSeconds
            
            let seekTime = CMTime(value: Int64(value), timescale: 1)
            
            player.seek(to: seekTime)
        }
        
    }

    @objc func handlePlayPause(){
        
        if isVideoPlaying{
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else{
            player.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
        isVideoPlaying = !isVideoPlaying
    }
    
    
    @objc func handleForward(){
        
        guard let duration = player.currentItem?.duration else {return}
        let currentTime = CMTimeGetSeconds(player.currentTime())
        let newTime = currentTime + 10
       
        if newTime < (CMTimeGetSeconds(duration) - 10){
            let time: CMTime = CMTimeMake(value: Int64(newTime), timescale: 1)
            player.seek(to: time)
        }
    }
    
    @objc func handleBackward(){
        let currentTime = CMTimeGetSeconds(player.currentTime())
        var newTime = currentTime - 10
        
        if newTime < 0{
            newTime = 0
        }
        let time: CMTime = CMTimeMake(value: Int64(newTime), timescale:1)
        player.seek(to: time)
    }
    
    @objc func handleFullScreenButton(){
        //print("changing to .. landscape right")
        
        if isFullScreen{
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        fullScreenButton.setImage(UIImage(systemName: "arrow.down.right.and.arrow.up.left"), for: .normal)
            
            
        }
        else{
            
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            fullScreenButton.setImage(UIImage(systemName: "viewfinder"), for: .normal)
        }
        
        isFullScreen = !isFullScreen
    }
    
    @objc func handleMoreOptionsButton(){
        print("more options")
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "Quality", style: .default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Playback speed", style: .default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Captions", style: .default, handler: nil))

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(actionSheet, animated: true, completion: nil)
   }
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(videoView)
        
        let url = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4"
        
        player = AVPlayer(url: URL(string: url)!)
        
        player.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        
        playerLayer = AVPlayerLayer(player: player)
        
        
        playerLayer.videoGravity = .resize
        
        videoView.layer.addSublayer(playerLayer)
        player.play()
        
        //controlsContainerView.frame = videoView.frame
        
        controlsContainerView.addSubview(playPauseButton)
        
        videoView.addSubview(controlsContainerView)
        
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesturefired(_:)))
        gestureRecognizer.numberOfTapsRequired = 1 // Single Tap
        gestureRecognizer.numberOfTouchesRequired = 1
        
        controlsContainerView.addGestureRecognizer(gestureRecognizer)
        controlsContainerView.isUserInteractionEnabled = true
        
        
        
        controlsContainerView.addSubview(videoLengthLabel)
        controlsContainerView.addSubview(currentTimeLabel)
        controlsContainerView.addSubview(videoSlider)
        controlsContainerView.addSubview(fullScreenButton)
        controlsContainerView.addSubview(moreOptionsButton)
        controlsContainerView.addSubview(forwardButton)
        controlsContainerView.addSubview(backwardButton)
      
        
        addConstraints()
        trackPlayerProgress()
        
    }
    
    
    //MARK: Handle Tap Gestures
    
    @objc func tapGesturefired(_ gesture: UITapGestureRecognizer){
        print("Tap Gesture 1 fired")
        controlsContainerView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        playPauseButton.isHidden = false
        isVideoPlaying = true
        isFullScreen = true
        videoLengthLabel.isHidden = false
        videoSlider.isHidden = false
        currentTimeLabel.isHidden = false
        
        fullScreenButton.isHidden = false
        moreOptionsButton.isHidden = false
        forwardButton.isHidden = false
        backwardButton.isHidden = false
        
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tapGesturefired2(_:)))
        gestureRecognizer2.numberOfTapsRequired = 1 // Single Tap
        gestureRecognizer2.numberOfTouchesRequired = 1
        
        controlsContainerView.addGestureRecognizer(gestureRecognizer2)
        controlsContainerView.isUserInteractionEnabled = true
        
        
    }
    
    @objc func tapGesturefired2(_ gesture: UITapGestureRecognizer){
        print("Tap Gesture 2 fired")
        controlsContainerView.backgroundColor = UIColor(white: 0, alpha: 0)
        playPauseButton.isHidden = true
        isVideoPlaying = true
    
        
        videoLengthLabel.isHidden = true
        videoSlider.isHidden = true
        currentTimeLabel.isHidden = true
        fullScreenButton.isHidden = true
        moreOptionsButton.isHidden = true
        forwardButton.isHidden = true
        backwardButton.isHidden = true
        controlsContainerView.removeGestureRecognizer(controlsContainerView.gestureRecognizers![1])
        
        
    }
    
    //MARK: Player Progress
    
    // track player progress
    func trackPlayerProgress(){
        let interval = CMTime(value: 1, timescale: 2)
        player.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: { (progressTime) in
            
            let seconds = CMTimeGetSeconds(progressTime)
            let secondsString = String(format: "%02d", Int(seconds) % 60)
            let minutesString = String(format: "%02d", Int(seconds / 60))
            
            self.currentTimeLabel.text = "\(minutesString):\(secondsString)"
            
            //move the slider thumb
            
            if let duration = self.player.currentItem?.duration{
                let durationSeconds = CMTimeGetSeconds(duration)
                
                self.videoSlider.value = Float(seconds / durationSeconds)
            }

            
        })
    }
   
    //MARK: ViewDidLayoutSubviews
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoView.bounds
        controlsContainerView.frame = videoView.bounds
        
        
    }
    
    //MARK: Adding Constraints
    
    
    func addConstraints(){
        
        
        //portrait constraints
       
        portraitConstraints.append(videoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        portraitConstraints.append(videoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        portraitConstraints.append(videoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        portraitConstraints.append(videoView.heightAnchor.constraint(equalToConstant: 250))
            
        
        //landscape constraints
             
        landscapeConstraints.append(videoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        landscapeConstraints.append(videoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        landscapeConstraints.append(videoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        landscapeConstraints.append(videoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        constraints.append(playPauseButton.centerXAnchor.constraint(equalTo: controlsContainerView.centerXAnchor))
        constraints.append(playPauseButton.centerYAnchor.constraint(equalTo: controlsContainerView.centerYAnchor))
        constraints.append(playPauseButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(playPauseButton.heightAnchor.constraint(equalToConstant: 50))
        
        constraints.append(forwardButton.leftAnchor.constraint(equalTo: playPauseButton.rightAnchor, constant: 5))
        constraints.append(forwardButton.centerYAnchor.constraint(equalTo: controlsContainerView.centerYAnchor))
        constraints.append(forwardButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(forwardButton.heightAnchor.constraint(equalToConstant: 50))
        
        constraints.append(backwardButton.rightAnchor.constraint(equalTo: playPauseButton.leftAnchor, constant: -5))
        constraints.append(backwardButton.centerYAnchor.constraint(equalTo: controlsContainerView.centerYAnchor))
        constraints.append(backwardButton.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(backwardButton.heightAnchor.constraint(equalToConstant: 50))
        
        constraints.append(fullScreenButton.rightAnchor.constraint(equalTo: controlsContainerView.rightAnchor,constant: -2))
        constraints.append(fullScreenButton.bottomAnchor.constraint(equalTo: controlsContainerView.bottomAnchor,constant: -2))
        constraints.append(fullScreenButton.widthAnchor.constraint(equalToConstant: 20))
        constraints.append(fullScreenButton.heightAnchor.constraint(equalToConstant: 24))
        
        constraints.append(videoLengthLabel.rightAnchor.constraint(equalTo: fullScreenButton.leftAnchor, constant: -8))
        constraints.append(videoLengthLabel.bottomAnchor.constraint(equalTo: controlsContainerView.bottomAnchor,constant: -2))
        constraints.append(videoLengthLabel.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(videoLengthLabel.heightAnchor.constraint(equalToConstant: 24))
        
        constraints.append(currentTimeLabel.leftAnchor.constraint(equalTo: controlsContainerView.leftAnchor,constant: 8))
        constraints.append(currentTimeLabel.bottomAnchor.constraint(equalTo: controlsContainerView.bottomAnchor,constant: -2))
        constraints.append(currentTimeLabel.widthAnchor.constraint(equalToConstant: 50))
        constraints.append(currentTimeLabel.heightAnchor.constraint(equalToConstant: 24))
        
        constraints.append(videoSlider.rightAnchor.constraint(equalTo: videoLengthLabel.leftAnchor))
        constraints.append(videoSlider.bottomAnchor.constraint(equalTo: controlsContainerView.bottomAnchor))
        constraints.append(videoSlider.leftAnchor.constraint(equalTo: currentTimeLabel.rightAnchor))
        constraints.append(videoSlider.heightAnchor.constraint(equalToConstant: 24))
        
        
        
        
        
        constraints.append(moreOptionsButton.rightAnchor.constraint(equalTo: controlsContainerView.rightAnchor))
        constraints.append(moreOptionsButton.topAnchor.constraint(equalTo: controlsContainerView.topAnchor,constant: 3))
        constraints.append(moreOptionsButton.widthAnchor.constraint(equalToConstant: 40))
        constraints.append(moreOptionsButton.heightAnchor.constraint(equalToConstant: 24))
        
        //print(constraints)
        
         NSLayoutConstraint.activate(portraitConstraints)
         NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: Video duration
  
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "duration", let duration = player.currentItem?.duration.seconds, duration > 0.0{
            self.videoLengthLabel.text = getTimeString(from: player.currentItem!.duration)
        }
    }
    
    
    func getTimeString(from time: CMTime) -> String{
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds/3600)
        let minutes = Int(totalSeconds) / 60
        let seconds = Int(totalSeconds) % 60
        
        if hours > 0{
            return String(format: "%i:%02i:%02i", arguments: [hours, minutes, seconds])
        }
        else{
            return String(format: "%02i:%02i", arguments: [minutes, seconds])
        }
    }
    
    //MARK: Handle device orientation
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        switch UIDevice.current.orientation {
        case .portrait :
            print("portrait view")
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
            break
       
        case .landscapeLeft :
            print("landscapeLeft view")
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
            
            break
        case .landscapeRight :
            print("landscapeRight view")
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
            
            break
            
        case .portraitUpsideDown :
            print("portraitUpsideDown view")
            break
        
        case .faceUp:
            break
        case .faceDown:
            break
        case .unknown :
            break
        
        }
    }
    
    
    
    
}
