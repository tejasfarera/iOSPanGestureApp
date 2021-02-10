import UIKit

class ImageTableViewCell: UITableViewCell {

    //MARK: - DataSource for ImageTableViewCell cell
    struct DataSourceForCell {
        let imageStringURL: String
        let title: String
    }

    //MARK: - IBOutlets

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    //MARK: - Helper methods

    func display(dataSource: DataSourceForCell) {
        self.titleLabel.text = dataSource.title
        self.iconImageView.imageFromURL(urlString: dataSource.imageStringURL, shouldMakeImageRound: true)
    }
}
