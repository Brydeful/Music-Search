//
//  TrackCell.swift
//  Music Search
//
//  Created by Вячеслав on 03.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var imageTrack: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
