//
//  OnboardingViewController.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 28.01.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentPage: UIViewController
    
    let closeButton = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = PageOneViewController()
        let page2 = PageTwoViewController()
        let page3 = PageThreeViewController()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentPage = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        view.backgroundColor = .systemRed
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        currentPage = pages.first!
    }
    
    private func style() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("??????????????", for: [])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.addSubview(closeButton)
        
        closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentPage = pages[index - 1]
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentPage = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentPage) ?? 0
    }
}

extension OnboardingViewController {
    @objc private func closeTapped(_ sender: UIButton) {
        delegate?.didFinishOnboarding()
    }
}
