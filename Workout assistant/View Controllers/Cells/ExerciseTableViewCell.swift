//
//  ExerciseTableViewCell.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var deleteImageView: UIImageView!
    
    override func didMoveToSuperview() {
        deleteImageView.image = UIImage(named: "delete")?.withRenderingMode(.alwaysTemplate)
        deleteImageView.tintColor = UIColor(red: 255.0/255.0, green: 150.0/255.0, blue: 0.0/255.0, alpha: 1)
    }

}
