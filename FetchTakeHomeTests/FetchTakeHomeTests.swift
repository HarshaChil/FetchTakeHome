//
//  FetchTakeHomeTests.swift
//  FetchTakeHomeTests
//
//  Created by Harsha Chilakapati on 10/10/24.
//

import Testing
@testable import FetchTakeHome
import unistd

/// Test if api call is performed correctly and if asynchronous things work correctly
struct FetchTakeHomeTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let data = Data()
        data.fetchData()
        sleep(15)
        print(data.items)
    }

}
