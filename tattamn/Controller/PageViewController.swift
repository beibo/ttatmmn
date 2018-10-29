//
//  PageViewController.swift
//  tattamn
//
//  Created by heba sami on 7/1/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
   lazy var orderdViewController:[ UIViewController]={
        return [self.newVc(ViewController:"sbFrist"),self.newVc(ViewController: "sbSecond"),self.newVc(ViewController: "sbThird")]
    }();
    var pageController = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource=self
        self.delegate=self
        configPageViewController()
        
        
        // Do any additional setup after loading the view.
        if let fristViewConteroller = orderdViewController.first{
            setViewControllers([fristViewConteroller],direction: .forward ,animated: true,completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard  let viewControllerIndex = orderdViewController.index(of:viewController)else{
            return nil
        }
        let previousIndex=viewControllerIndex - 1
        guard previousIndex >= 0 else{
            return orderdViewController.last
        }
        
        guard  orderdViewController.count > previousIndex else{
            return nil
        }
        
        return orderdViewController[previousIndex]
        
        }
  
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard  let viewControllerIndex = orderdViewController.index(of:viewController)else{
            return nil
        }
        let nextIndex=viewControllerIndex + 1
        let orderdViewControllerCount = orderdViewController.count
        guard orderdViewControllerCount !=  nextIndex else{
            return orderdViewController.first
        }
       
        guard orderdViewControllerCount > nextIndex else {
           return nil
        }
        
        return orderdViewController[nextIndex]
    }
    func newVc(ViewController:String)->UIViewController{
        return UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier:ViewController)
    }
    
    func configPageViewController(){

        pageController=UIPageControl(frame:CGRect(x:0,y:UIScreen.main.bounds.maxY - 50,width:UIScreen.main.bounds.width,height:50))
        self.pageController.numberOfPages=orderdViewController.count
        self.pageController.currentPage=0
        self.pageController.tintColor=UIColor.black
        self.pageController.currentPageIndicatorTintColor=UIColor.black
        self.pageController.pageIndicatorTintColor=UIColor.white
        self.view.addSubview(pageController)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let  pageContentViewController = pageViewController.viewControllers![0]
        self.pageController.currentPage = orderdViewController.index(of: pageContentViewController)!
        
    }
}
