//
//  NormalCollectionView.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 11/08/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

//NOTE: CollectionView - uses cells from a nib file.
// See MyCollectionViewCell.swift for cell definition.
// See HeaderCollectionReusableView.swift for header & footer definition.
// MyCollectionViewCell.xib is the associated xib.


import UIKit

class NormalCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    
    
    var collectionview: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: view.frame.size.width/2.2, height: view.frame.size.width/2.2)
        
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionview?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionview?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
        collectionview?.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.backgroundColor = .white
        
        view.addSubview(collectionview!)

       
        
    }
    override func viewDidLayoutSubviews(){
               super.viewDidLayoutSubviews()
               collectionview?.frame = view.bounds
           }
    
    //DataSource method
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 6
      }
      
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview?.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        return cell!
      }

    //Header & Footer
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String ,at indexPath: IndexPath) -> UICollectionReusableView{
    
        if kind == UICollectionView.elementKindSectionFooter{
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                               withReuseIdentifier: FooterCollectionReusableView.identifier,
                                                                               for: indexPath) as! FooterCollectionReusableView
                  footer.configure()
              return footer
            
        }
        
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                         withReuseIdentifier: HeaderCollectionReusableView.identifier,
                                                                         for: indexPath) as! HeaderCollectionReusableView
            header.configure()
        return header
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
            return CGSize(width: view.frame.size.width, height: 200)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
            return CGSize(width: view.frame.size.width, height: 200)
        }
    
    //Delegate method
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionview?.deselectItem(at: indexPath, animated: true)
        print("Selected section \(indexPath.section) and selected item \(indexPath.row)")
    }

}
