//
//  UniversityCell.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import UIKit

class UniversityCell: UITableViewCell {

    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblUniversityState: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
