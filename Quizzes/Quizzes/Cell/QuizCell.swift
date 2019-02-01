//
//  QuizCell.swift
//  Quizzes
//
//  Created by Diego Estrella III on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCell: UICollectionViewCell {

    lazy var quizLabel: UILabel = {
       let label = UILabel()
       label.text = "QuizzLabel"
       label.font = UIFont.systemFont(ofSize: 18)
       label.backgroundColor = .gray
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(quizLabel)
        quizLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
            ])
    }
    
}


