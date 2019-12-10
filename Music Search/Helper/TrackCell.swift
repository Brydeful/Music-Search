//
//  TrackCell.swift
//  Music Search
//
//  Created by Вячеслав on 03.12.2019.
//  Copyright © 2019 Вячеслав. All rights reserved.
//

import UIKit
import Alamofire

class TrackCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var imageTrack: UIImageView!
    
    var track:Track?{
        didSet{
            titleLabel.text = track?.trackName
            subtitleLabel.text = track?.artistName
            imageTrack.contentMode = .scaleAspectFit
            imageTrack.layer.cornerRadius = imageTrack.frame.height / 2
            
            DispatchQueue.global(qos: .background).async{
                if let url = URL(string: (self.track?.artworkUrl100)!){
                    AF.request(url, method: .get).response { response in
                        guard let image = UIImage(data:response.data!) else { return }
                        let imageData = image.jpegData(compressionQuality: 1.0)
                        self.imageTrack.image = UIImage(data : imageData!)
                    }
                }
            }
        }
    }

}
