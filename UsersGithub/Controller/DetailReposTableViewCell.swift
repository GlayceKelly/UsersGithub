//
//  DetailReposTableViewCell.swift
//  UsersGithub
//
//  Created by Glayce on 31/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class DetailReposTableViewCell: UITableViewCell {
    //Controles da view
    @IBOutlet weak var lbNameApp: UILabel!
    @IBOutlet weak var lbLanguage: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
