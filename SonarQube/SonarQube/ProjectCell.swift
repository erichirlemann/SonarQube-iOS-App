//
//  ProjectCell.swift
//  
//
//  Created by Elena Vilchik on 08/10/15.
//
//

import UIKit

class ProjectCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var qualityGateImage: UIImageView!
    var id : Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
