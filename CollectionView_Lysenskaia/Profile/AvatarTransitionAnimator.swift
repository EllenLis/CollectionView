//
//  AvatarTransitionAnimator.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 04.11.2022.
//

import UIKit

class AvatarTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let presentationImageView: UIImageView

    let isPresenting: Bool

    init(presentationImageView: UIImageView, isPresenting: Bool) {
        self.presentationImageView = presentationImageView
        self.isPresenting = isPresenting
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        if isPresenting {
            present(using: transitionContext)
        } else {
            dismiss(using: transitionContext)
        }
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5.0
    }

    func present(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView

        guard let presentedViewController = transitionContext.viewController(forKey: .to),
              let presentedView = transitionContext.view(forKey: .to) else {

            transitionContext.completeTransition(false)
            return
        }

        let finalFrame = transitionContext.finalFrame(for: presentedViewController)
        let startImageFrame = presentationImageView.convert(presentationImageView.bounds, to: containerView)
        let startImageCenter = CGPoint(x: startImageFrame.midX, y: startImageFrame.midY)

        let circleView = createCircleView(for: presentedView)

        containerView.addSubview(circleView)
        containerView.addSubview(presentedView)

        presentedView.center = startImageCenter

        presentedView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)

        circleView.center = presentedView.center
        circleView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.transform = CGAffineTransform(scaleX: 1, y: 1)
            presentedView.frame = finalFrame

            circleView.transform = CGAffineTransform(scaleX: 1, y: 1)
            circleView.frame = presentedView.frame

        }) { (finished) in
            circleView.removeFromSuperview()
            transitionContext.completeTransition(finished)
        }
    }

    func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView

        guard let dismissedView = transitionContext.view(forKey: .from),
              let presentedView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }

        let startImageFrame = presentationImageView.convert(presentationImageView.bounds, to: containerView)
        let startImageCenter = CGPoint(x: startImageFrame.midX, y: startImageFrame.midY)

        containerView.insertSubview(presentedView, belowSubview: dismissedView)

        let circleView = createCircleView(for: dismissedView)
        circleView.center = presentedView.center
        containerView.insertSubview(circleView, belowSubview: dismissedView)


        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissedView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
            circleView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)

            dismissedView.center = startImageCenter
            circleView.center = dismissedView.center

        }) { (finished) in
            circleView.removeFromSuperview()
            transitionContext.completeTransition(finished)
        }
    }

    func createCircleView(for view: UIView) -> UIView {
        let d = view.bounds.width

        let circleView = UIView(frame: CGRect(x: 0, y: 0, width: d, height: d))
        circleView.layer.cornerRadius = d / 2
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = view.backgroundColor
        circleView.isUserInteractionEnabled = false
        return circleView
    }
}

