//
//  SearchCell.swift
//  Quizzes
//
//  Created by Diego Estrella III on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    lazy var quizLabel: UILabel = {
        let label = UILabel()
        label.text = "QuizzLabel"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.sizeThatFits(CGSize.init(width: 25, height: 25))
        button.setImage(UIImage(named: "add-icon-filled"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 50, bottom: 50, right: 5)
        return button
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
        addSubview(cellButton)
        quizLabel.translatesAutoresizingMaskIntoConstraints = false
        cellButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quizLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            quizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            quizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            cellButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cellButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0)
            ])
    }
}
