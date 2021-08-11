//
//  UIElements.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 05/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit

class UIElements: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    let lbl = UILabel()
    let btn = UIButton()
    let txt = UITextField()
    let datepicker = UIDatePicker()
    let textview = UITextView()
    let imgView = UIImageView()
    let pickerView = UIPickerView()
    let uiswtch = UISwitch()
    let progressView = UIProgressView(progressViewStyle: .bar)
    
    
    var arr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
     
        // MARK: Label
        
        lbl.frame = CGRect(x: 100, y: 40, width: 250, height: 50)
        lbl.text = "Label Set Programmatically in Xcode"
        lbl.font = .italicSystemFont(ofSize: 20)
        lbl.backgroundColor = .blue
        lbl.textColor = .systemGray6
        lbl.shadowColor = .black
        lbl.numberOfLines = 2
        lbl.isHighlighted = false
        lbl.highlightedTextColor = .black
        view.addSubview(lbl)
        
        //MARK: Button
        
        btn.frame = CGRect(x: 100, y: 100, width: 250, height: 50)
        btn.setTitle("Button Set Programmatically", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Clicked", for: .highlighted)
        btn.setTitleColor(.green, for: .highlighted)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(btnpressed), for: .touchUpInside)
        view.addSubview(btn)
        
        //MARK: TextField
        
        txt.frame = CGRect(x: 100, y: 170, width: 250, height: 50)
        txt.placeholder = " TextField"
        txt.layer.borderWidth = 0.5
        txt.backgroundColor = .white
        txt.clearButtonMode = .whileEditing
        txt.autocapitalizationType = .words
        //txt.becomeFirstResponder()
        txt.delegate = self
        view.addSubview(txt)
       
        //MARK: DatePicker
        
        let dateFormatter = DateFormatter()
        datepicker.frame = CGRect(x: 100, y: 240, width: 250, height: 100)
        dateFormatter.dateFormat = "dd/MM/YYYY"
        datepicker.datePickerMode = .date
        view.addSubview(datepicker)
        
        //MARK: Switch
        
        uiswtch.frame = CGRect(x: 200, y: 360, width: 100, height: 100)
        uiswtch.setOn(true, animated: true)
        view.addSubview(uiswtch)
        if uiswtch.isOn{
            print("On")
            
        }
        else{
            print("Off")
            
        }
        
        //MARK: Segmented Control
        
        let segments = ["One","Two","Three"]
        let segment = UISegmentedControl(items: segments)
        segment.frame = CGRect(x: 100, y: 400, width: 250, height: 50)
        segment.backgroundColor = .systemGray5
        segment.selectedSegmentTintColor = .white
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(self.segmentChanged(_:)), for: .valueChanged)
        view.addSubview(segment)
        
        //MARK: TextView
        
        textview.frame = CGRect(x: 100, y: 460, width: 250, height: 100)
        textview.backgroundColor = UIColor.lightGray
        textview.textAlignment = .justified
        textview.font = UIFont(name: "Verdana", size: 20)
        textview.textColor = UIColor.white
        view.addSubview(textview)
        
        //MARK: PickerView
        
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.frame = CGRect(x: 150, y: 560, width: 100, height: 100)
        //pickerView.center = view.center
        view.addSubview(pickerView)
        for i in 0..<5{
            arr.insert("item "+(i+1).description, at: i)
              }
        
        
        //MARK: ProgressView
        
        
        progressView.frame = CGRect(x: 100, y: 565, width: 250, height: 100)
        //progressView.setProgress(0.3, animated: true)
        progressView.trackTintColor = UIColor.lightGray
        progressView.tintColor = UIColor.blue
        view.addSubview(progressView)
        
        //MARK: ImageView
        
        imgView.frame = CGRect(x: 100, y: 700, width: 250, height: 100)
        imgView.image = UIImage(systemName: "house")
        //imgView.contentMode = .scaleAspectFit
        view.addSubview(imgView)
        
        
        
        
      
        
        

    }
    
  func textFieldShouldReturn(_ txt: UITextField) -> Bool {
             txt.resignFirstResponder()
             return true
         }
    @objc func segmentChanged(_ sender:UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            view.backgroundColor = .systemPurple
        case 1:
            view.backgroundColor = .systemTeal
        case 2:
            view.backgroundColor = .systemPink
        default:
            view.backgroundColor = .systemBlue
        }
        

    }
    
    
    func textView(_ textview: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textview.text == "\n" {
            textview.resignFirstResponder()
            return false
            }
    return true
        }
    
    @objc func btnpressed(){
        var progress: Float = 0.0
        self.progressView.progress = progress
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (timer) in
            progress += 0.01
            self.progressView.progress = progress
            if self.progressView.progress == 1{
                self.progressView.progress = 0.0
            }
        })
    }
 

}



extension UIElements : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
      
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
      
}

extension UIElements : UIPickerViewDelegate{
      
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
}

