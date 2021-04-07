//
//  HomeTableViewCell.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07.04.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var homeLabel: UILabel!
    @IBOutlet private weak var emojiImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .white
    }
    
    func prepare(with viewModel: HomeViewModel) {
        homeLabel?.text = viewModel.title
        emojiImageView.image = viewModel.smallImage
    }
}
