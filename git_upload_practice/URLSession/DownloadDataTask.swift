//
//  DownloadDataTask.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 20/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: Download image and display it in the imageview.
//Also, show the progress bar.
// Used downloadTask.

import UIKit

class DownloadDataTask: UIViewController {

    @IBOutlet weak var downloadImageView: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var progressLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0, animated: true)
        

        
    }
    
    
    

    @IBAction func downloadBtnClicked(_ sender: Any) {
        
        progressLbl.isHidden = false
        downloadImageView.image = nil
    
        
        guard let url = URL(string: "https://images.unsplash.com/photo-1507146426996-ef05306b995a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHVwcHklMjBkb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80") else{
            print("This is an invalid url")
            return
        }
        
        
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        let task = session.downloadTask(with: url)
        task.resume()
        
    }
    
   
    
  

}

extension DownloadDataTask: URLSessionDownloadDelegate{
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else{
            print("The data could not be loaded")
            return
        }
        
        let image = UIImage(data: data)
        downloadImageView.image = image
        progressLbl.isHidden = true
    }
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        //print(totalBytesWritten)
        let progress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        progressBar.progress = progress
        progressLbl.text = "\(progress * 100)%"
        print("\(progress * 100) %")
        
        
    }
    
}


//https://images.unsplash.com/photo-1507146426996-ef05306b995a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHVwcHklMjBkb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80
