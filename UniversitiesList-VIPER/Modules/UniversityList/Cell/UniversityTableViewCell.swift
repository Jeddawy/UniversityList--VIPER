//
//  UniversityTableViewCell.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {
    static let ID = "UniversityTableViewCell"
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var universityStateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func bind(model: UniversityResponse){
        self.universityNameLabel.text = model.name
        self.universityStateLabel.text = model.state
    }
    
}

