//
//  TitleTextFieldCellCell.swift
//  TimeApp
//
//  Created by Ashok Yadav on 06/12/20.
//

import UIKit

class UserCell: BaseTableCell, CustomCellProtocol {
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblCreatedOn: UILabel!
    
    var cellHeight: CGFloat = 80

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addEdgeInset()
    }
}
