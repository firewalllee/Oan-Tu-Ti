//
//  LoginViewController.swift
//  LoginView
//
//  Created by Phuc on 11/1/16.
//  Copyright © 2016 Phuc. All rights reserved.
//

import UIKit
import Swinject

//Global variables
//var User_mail:String = String()

class LoginViewController: UIViewController {

    //MARK: - Mapped items
    @IBOutlet weak var wrapView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var wrapViewVerticalContraint: NSLayoutConstraint!
    @IBOutlet weak var bottomContainerContraint: NSLayoutConstraint!
    
    
    //MARK: - Declarations
    private var spaceTopFree:CGFloat!
    private let indicator:UIActivityIndicatorView = UIActivityIndicatorView()
    private var sum: CGFloat!
    
    //MARK: - Define
    private let textFieldHeight: CGFloat = 30
    private let defaultBottomUIViewContraight:CGFloat = 0
    private let limitationDistanceKeyboardAndTextfield:CGFloat = 20
    private let resolver = ApplicationAssembler.sharedInstance.resolver
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        //MARK: - Call Listener when application start
        
        ListenRoomEvent.Instance.ListenRoomsList()
        
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientSignUpRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientUpdateProfileRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ServerSendMatchResult)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientSubmitSelectionRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.PlayerLeaveRoom)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientLeaveRoomRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientUpdateRoomInfoRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientReadyRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientsStartPlayingRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientCreateRoomRs)?.listenEvent()
        resolver.resolve(ListenEvent.self, name: Commands.Instance.ClientJoinRoomRs)?.listenEvent()
        
//        ListenRegisterEvent.listenEvent()
//        ListenProfileEvent.listenEvent()
//        ListenCreateRoomEvent.listenEvent()
//        ListenWaitingRoomEvent.listenEvent()
//        ListenPlayingEvent.listenEvent()
//        ListenMatchResultEvent.listenEvent()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.showKeyboard(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.hideKeyboard(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        //Listen login event from server - First screen, don't need to manager by other class :))
        SocketIOManager.Instance.socket.on(Commands.Instance.ClientLoginRs) { (data, ack) in
            if let response: Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
                if let isSuccess: Bool = response[Contants.Instance.isSuccess] as? Bool {
                    
                    //-------CheckLogin----------------------------
                    if isSuccess {
                        
                        //---------------------------------------------
                        if let jsonUser:Dictionary<String, Any> = response[Contants.Instance.user] as? Dictionary<String, Any> {
                            MyProfile.Instance = MyProfile(jsonUser)
                        }
                        
                        //-------Get user infor-----------------------
                        MyProfile.Instance.UserEmail = self.txtEmail.text!
                        
                        //-------Textfield reset-----------------------
                        self.txtEmail.text = Contants.Instance.null
                        self.txtPassword.text = Contants.Instance.null
                        
                        //-------Dismiss loading alert-----------------
                        self.dismiss(animated: true, completion: { 
                            self.performSegue(withIdentifier: Contants.Instance.segueMenu, sender: nil)
                        })

                    }
                    else {
                        
                        //-------Dismiss loading alert-----------------
                        self.dismiss(animated: true) {
                            
                            //-------Reset textfield password--------------
                            self.txtPassword.text = Contants.Instance.null
                            
                            //-------Show message from server alert--------
                            if let message: String = response[Contants.Instance.message] as? String {
                                self.showNotification(title: "Notice!", message: message)
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.ViewsProperties()
        self.wrapView.scaleAnimation()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.spaceTopFree = self.getTopFreeHeight(wrapView)
    }
    
    //MARK: - setup properties of view
    func ViewsProperties() {
        
        self.btnSignUp.lightBorder(with: 8)
    }
    
    //Return button press
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            txtPassword.becomeFirstResponder()
        }
        else if textField.tag == 1 {
            textField.resignFirstResponder()
            self.btnLogin(UIButton())
        }
        
        return true
    }

    
    @IBAction func txt_EditingBegin(_ sender: Any) {
        let txt: UITextField = sender as! UITextField
        sum = wrapView.frame.origin.y + txt.frame.origin.y + textFieldHeight
    }
    
    func showKeyboard(_ notification: Notification) {
        let keyboard: NSValue = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue
        let heightKeyboard: CGFloat = keyboard.cgRectValue.height
        
        let distance = containerView.frame.height - (sum + heightKeyboard)
        print(distance)
        if distance < limitationDistanceKeyboardAndTextfield {
            bottomContainerContraint.constant = abs(distance) + 30
            let point: CGPoint = CGPoint(x: 0, y: bottomContainerContraint.constant)
            scrollView.setContentOffset(point, animated: true)
        }
        
    }
    
    func hideKeyboard(_ notification: Notification) {
        bottomContainerContraint.constant = defaultBottomUIViewContraight
    }
    
    //MARK: - Login tasks
    @IBAction func btnLogin(_ sender: UIButton) {
        
        let email: String = self.txtEmail.text!
        let pass: String = self.txtPassword.text!
        
        if email != Contants.Instance.null && pass != Contants.Instance.null {
            //Waiting indicator
            self.waitingIndicator(with: indicator)
            let jsonData: Dictionary<String, Any> = [Contants.Instance.email: email, Contants.Instance.pass: pass]
            SocketIOManager.Instance.socketEmit(Commands.Instance.ClientLogin, jsonData)
            
        }
        else {
            self.showNotification(title: "Notice", message: "Please fill out information!")
        }
    }
    
    //MARK: - Delegate fill textfield email when back from register screen
    func userEmail(_ userEmail: String) {
        self.txtEmail.text = userEmail
    }
    
    //MARK: - Register tasks
    @IBAction func btnRegister(_ sender: AnyObject) {
        self.performSegue(withIdentifier: Contants.Instance.segueRegister, sender: nil)
    }
    
}

//MARK: - Prepare for segue
extension LoginViewController:ProtocolUserEmail {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Contants.Instance.segueRegister {
            //Remove !, avoid crash app
            if let destinationVC:RegisterViewController = segue.destination as? RegisterViewController {
                destinationVC.delegate = self
            }
        }
    }

}


