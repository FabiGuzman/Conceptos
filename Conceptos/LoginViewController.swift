import Foundation
import UIKit

public protocol LoginViewProtocol {}

public class LoginViewController: UIViewController, LoginViewProtocol {
    public weak var presenter: LoginPresenterProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}


