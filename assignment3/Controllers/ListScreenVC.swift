import UIKit

class ListScreenVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var imageTableView: UITableView!

    // MARK: - Variables

    var responseData: Welcome? {
        didSet {
            DispatchQueue.main.async { self.imageTableView.reloadData() }
        }
    }

    var numberOfItems: Int = 0

    // MARK: - Controller life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageTableView.delegate = self
        self.imageTableView.dataSource = self
        self.imageTableView.registerNib(tableCell: TableViewCells.imageTableViewCell)
        self.imageTableView.tableFooterView = UIView()
        self.fetchData()
    }

    func fetchData () {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        self.view.showLoader(activityIndicator: activityIndicator)
        NetworkManager.getListOfData(numberOfItems: numberOfItems.description) { [weak self] (responseData, error) in
            DispatchQueue.main.async {
                self?.view.hideLoader(activityIndicator: activityIndicator)
            }
            if error != nil {
                print(error?.localizedDescription ?? GeneralConstants.unableToFetchData)
                return
            }
            self?.responseData = responseData
        }
    }
}

extension ListScreenVC: UITableViewDelegate, UITableViewDataSource {

    // MARK: - TableView Delegate methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData?.body.response.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.imageTableViewCell.rawValue)
            as? ImageTableViewCell else { return ImageTableViewCell() }

        cell.display(dataSource: ImageTableViewCell.DataSourceForCell(
            imageStringURL: (responseData?.body.response[indexPath.row].imageIcon)!,
            title: (responseData?.body.response[indexPath.row].title)!
        ))

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GeneralConstants.cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let imageURL = responseData?.body.response[indexPath.row].image else { return }
        self.presentImageScreen(imageURL: imageURL)
    }
}
