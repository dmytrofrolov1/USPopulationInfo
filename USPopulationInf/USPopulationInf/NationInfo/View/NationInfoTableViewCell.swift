//
//  NationInfoTableViewCell.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import UIKit

class NationInfoTableViewCell: UITableViewCell {
    
    private enum Const {
        static let verticalOffset: CGFloat = 20
        static let horizontalOffset: CGFloat = 20
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: NationInfoViewModel) {
        nationLabel.text = "Nation: \(model.nation)"
        yearLabel.text = "Year: \(model.year)"
        populationLabel.text = "Population: \(model.population)"
    }
    
    private func setup() {
        setupSubviews()
        setupLayout()
    }
    
    private lazy var nationLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var yearLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var populationLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    private func setupSubviews() {
        contentView.addSubview(nationLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(populationLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.verticalOffset),
            
            nationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Const.horizontalOffset),
            
            yearLabel.topAnchor.constraint(equalTo: nationLabel.bottomAnchor, constant: Const.verticalOffset),
            yearLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.verticalOffset),
            yearLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Const.horizontalOffset),
            
            populationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Const.horizontalOffset),
            populationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.verticalOffset),
            populationLabel.leftAnchor.constraint(greaterThanOrEqualTo:yearLabel.rightAnchor, constant: 10)
        ])
    }
}
