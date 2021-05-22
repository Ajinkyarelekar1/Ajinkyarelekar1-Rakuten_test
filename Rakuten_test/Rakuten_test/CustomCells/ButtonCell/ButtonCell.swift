//
//  ButtonCell.swift
//  TimeApp
//
//  Created by Ashok Yadav on 06/12/20.
//

import UIKit

protocol ButtonCellDelegates {
    func buttonClick()
}

class ButtonCell: BaseTableCell, CustomCellProtocol {
    var cellHeight: CGFloat = 60
    var delegate: ButtonCellDelegates?
    
    @IBOutlet weak var btn: UIButton! {
        didSet {
            btn.roundedCorners()
            btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        }
    }

    @IBAction func buttonClick() {
        delegate?.buttonClick()
    }
    
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
