//
//  DataInfo.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 7/2/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import Foundation
class DataInfo { // [2]
    var title: String = ""
    var subtitle: String = ""
    var value: String = ""
    init(title: String, subtitle: String ,value:String = "") {
        self.title = title
        self.subtitle = subtitle
        self.value = value
    }
}