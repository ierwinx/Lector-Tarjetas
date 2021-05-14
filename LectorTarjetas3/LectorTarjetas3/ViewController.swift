import UIKit
#if canImport(CreditCardScanner)
import CreditCardScanner
#endif

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func iniciar(_ sender: Any) {
        if #available(iOS 13, *) {
            let creditCardScannerViewController = CreditCardScannerViewController(delegate: self)
            present(creditCardScannerViewController, animated: true)
        }
    }
    
}

@available(iOS 13, *)
extension ViewController: CreditCardScannerViewControllerDelegate {
    
    func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didErrorWith error: CreditCardScannerError) {
        viewController.dismiss(animated: true)
    }
    
    func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didFinishWith card: CreditCard) {
        print("\(card)")
    }
    

}
