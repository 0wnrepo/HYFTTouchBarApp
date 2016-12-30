//
//  HYFTWindowController.swift
//  HYFT
//
//  Created by Zac on 29/12/16.
//  Copyright © 2016 zeta. All rights reserved.
//

import Cocoa

class HYFTWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    }

    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        guard let viewController = contentViewController as? ViewController else {
            return nil
        }
        return viewController.makeTouchBar()
    }

}
