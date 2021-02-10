import UIKit

extension UITableView {
    func registerNib(tableCell: TableViewCells) {
        self.register(UINib(nibName: tableCell.rawValue, bundle: nil), forCellReuseIdentifier: tableCell.rawValue)
    }
}
