//
//  CalendarViewController.swift
//  FBook
//
//  Created by Qsunnx on 01.12.2020.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate {
    
    
    private let datesCollectionView: UICollectionView!
    private let daysStackView: UIStackView!
    private let dateCellID = "dateCell"
    private let dates : [Int] = Array(1...31)
    private let columns = 7
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        datesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        datesCollectionView.isPagingEnabled = true
        daysStackView = UIStackView()
        
        super.init(coder: coder)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datesCollectionView.dataSource = self
        datesCollectionView.delegate = self
        
        daysStackView.axis = .horizontal
  
        daysStackView.distribution = .equalSpacing
        daysStackView.backgroundColor = .blue
        daysStackView.distribution = .fillEqually
        
        let label1 = UILabel()
        label1.text = "П"
        label1.backgroundColor = .green
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textAlignment = .center
        
        let label2 = UILabel()
        label2.text = "В"
        label2.backgroundColor = .green
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.textAlignment = .center
        
        let label3 = UILabel()
        label3.text = "С"
        label3.backgroundColor = .green
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.textAlignment = .center
        
        let label4 = UILabel()
        label4.text = "Ч"
        label4.backgroundColor = .green
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.textAlignment = .center
        
        let label5 = UILabel()
        label5.text = "П"
        label5.backgroundColor = .green
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.textAlignment = .center
        
        let label6 = UILabel()
        label6.text = "С"
        label6.backgroundColor = .green
        label6.translatesAutoresizingMaskIntoConstraints = false
        label6.textAlignment = .center
        
        let label7 = UILabel()
        label7.text = "В"
        label7.backgroundColor = .green
        label7.translatesAutoresizingMaskIntoConstraints = false
        label7.textAlignment = .center
        
        daysStackView.addArrangedSubview(label1)
        daysStackView.addArrangedSubview(label2)
        daysStackView.addArrangedSubview(label3)
        daysStackView.addArrangedSubview(label4)
        daysStackView.addArrangedSubview(label5)
        daysStackView.addArrangedSubview(label6)
        daysStackView.addArrangedSubview(label7)
        
        
        daysStackView.translatesAutoresizingMaskIntoConstraints = false
        datesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        datesCollectionView.register(DateCollectionViewCell.self, forCellWithReuseIdentifier: dateCellID)
        
        
        view.addSubview(daysStackView)
        view.addSubview(datesCollectionView)
        
        NSLayoutConstraint.activate([
                                        daysStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
                                        daysStackView.leadingAnchor.constraint(
                                          equalTo: view.readableContentGuide.leadingAnchor),
                                        daysStackView.trailingAnchor.constraint(
                                          equalTo: view.readableContentGuide.trailingAnchor),
                                        daysStackView.heightAnchor.constraint(equalToConstant: 20)
                                    ]
                                    
        )
        
        NSLayoutConstraint.activate([
            datesCollectionView.topAnchor.constraint(equalTo: daysStackView.bottomAnchor, constant: 20),
            datesCollectionView.leadingAnchor.constraint(
              equalTo: view.readableContentGuide.leadingAnchor),
            datesCollectionView.trailingAnchor.constraint(
              equalTo: view.readableContentGuide.trailingAnchor),
            datesCollectionView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension CalendarViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dateCellID, for: indexPath) as? DateCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = .green
        cell.dateLabel.text = dates[indexPath.row].description
        cell.dateLabel.textColor = .red
        cell.dateLabel.textAlignment = .center
        
        return cell
    }
}

extension CalendarViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width   = collectionView.frame.width / 7
        let height  = collectionView.frame.height
        
        return CGSize(width: width, height: height)

    }
}
