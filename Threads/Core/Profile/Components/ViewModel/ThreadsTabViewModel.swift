//
//  ThreadsTabViewModel.swift
//  Threads
//
//  Created by Olya B on 28.09.2023.
//

import SwiftUI

ForEach(viewModel.threads) { thread in
    ThreadCell(thread: thread)
}
