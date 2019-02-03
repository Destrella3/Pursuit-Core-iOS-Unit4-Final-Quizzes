//
//  ViewController.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {
    
    @IBOutlet weak var quizzCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizzCollectionView.dataSource = self
        quizzCollectionView.delegate = self
        quizzCollectionView.register(QuizCell.self, forCellWithReuseIdentifier: "QuizCell")
    }
    
}

extension QuizzesViewController: UICollectionViewDataSource   {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizzCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCell else {return UICollectionViewCell()}
        cell.backgroundColor = .white
        cell.layer.borderWidth = 2
        
        return cell
    }
    
}

extension QuizzesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 175, height: 350)
    }

}
