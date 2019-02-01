//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Diego Estrella III on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    private var quiz = [QuizzQuestion]() {
        didSet {
            DispatchQueue.main.async {
                self.searchCollectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
        uploadData()
    }
    
    private func uploadData() {
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        
        QuizzAPIClient.getQuizz { (appError, question) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let question = question {
                self.quiz = question
            }
        }
    }
    
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quiz.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {return UICollectionViewCell()}
        let questionToSet = quiz[indexPath.row]
        cell.quizLabel.text = questionToSet.quizTitle
        cell.layer.borderWidth = 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 300, height: 250)
    }
    
    
}
