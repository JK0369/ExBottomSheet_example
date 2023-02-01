//
//  TouchPassIntrinsicPanelLayout.swift
//  ExBottomSheet
//
//  Created by 김종권 on 2023/02/02.
//

import FloatingPanel

final class TouchPassIntrinsicPanelLayout: FloatingPanelBottomLayout {
    override var initialState: FloatingPanelState { .tip }
    override var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
        return [
            .tip: FloatingPanelIntrinsicLayoutAnchor(fractionalOffset: 0, referenceGuide: .safeArea)
        ]
    }
}
