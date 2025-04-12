//
//  ToDoCell.swift
//  Project ToDoList
//
//  Created by Sasha Cummings on 4/1/25.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    
    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompletButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func completButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
}
