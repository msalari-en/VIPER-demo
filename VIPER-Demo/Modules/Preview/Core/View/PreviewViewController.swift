//
//  PreviewViewController.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

struct PreviewViewModel {
    var title: String
    var image: UIImage?
}

protocol PreviewView: class {
    func prepare(with viewModel: PreviewViewModel)
}

class PreviewViewController: UIViewController, PreviewView {
    @IBOutlet private weak var frutLabel: UILabel!
    @IBOutlet private weak var frutImageView: UIImageView!
    
    var presenter: PreviewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.present()
    }
    
    func prepare(with viewModel: PreviewViewModel) {
        frutLabel.text = viewModel.title
        frutImageView.image = viewModel.image
    }
}
