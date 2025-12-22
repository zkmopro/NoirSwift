import Foundation
import XCTest

@testable import NoirSwift

class NoirSwiftTests: XCTestCase {
  func testNoirSwift() async throws {
    let noirCircuitPath = Bundle.module.path(forResource: "noir_multiplier2", ofType: "json")!
    let noirSrsPath = Bundle.module.path(forResource: "noir_multiplier2", ofType: "srs")!
    let onChain = true
    let lowMemoryMode = false
    let inputs = ["3", "5"]

    let vk = try getNoirVerificationKey(
      circuitPath: noirCircuitPath, srsPath: noirSrsPath, onChain: onChain,
      lowMemoryMode: lowMemoryMode)
    let proofData = try generateNoirProof(
      circuitPath: noirCircuitPath,
      srsPath: noirSrsPath,
      inputs: inputs,
      onChain: onChain,
      vk: vk,
      lowMemoryMode: lowMemoryMode
    )
    let isValid = try verifyNoirProof(
      circuitPath: noirCircuitPath,
      proof: proofData,
      onChain: onChain,
      vk: vk,
      lowMemoryMode: lowMemoryMode
    )
    XCTAssertTrue(isValid)
  }
}
