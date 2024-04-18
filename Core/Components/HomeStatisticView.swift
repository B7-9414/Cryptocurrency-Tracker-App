//
//  StatisticTriangleView.swift
//  CryptoTrackerApp
//
//  Created by Bassam on 4/17/24.
//

import SwiftUI

struct HomeStatisticView: View {
    @Binding var showPortfolio: Bool
    @EnvironmentObject var vm: HomeViewModel

    var body: some View {
        HStack {
            ForEach(vm.stats) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}
