//
//  TouchBlockIntrinsicPanelLayout.swift
//  ExBottomSheet
//
//  Created by 김종권 on 2023/02/02.
//

import FloatingPanel

final class TouchBlockIntrinsicPanelLayout: FloatingPanelBottomLayout {
    override var initialState: FloatingPanelState { .full }
    override var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelIntrinsicLayoutAnchor(fractionalOffset: 0, referenceGuide: .safeArea)
        ]
    }

    override func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        0.5
    }
}
