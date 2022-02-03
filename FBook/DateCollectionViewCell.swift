//
//  DateCollectionViewCell.swift
//  FBook
//
//  Created by Qsunnx on 01.12.2020.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
      }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(dateLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
                                        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                                        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
}
