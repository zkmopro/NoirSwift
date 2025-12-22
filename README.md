# Noir Swift

## Build the package

1. Use `mopro-cli` and choose `noir`

```sh
mopro init
```

choose `noir`

```sh
mopro build
```

choose `ios` and all architectures.

2. Zip the `MoproiOSBindings/MoproBindings.xcframework`

```sh
cd MoproiOSBindings
zip -r NoirBindings.xcframework.zip MoproBindings.xcframework
```

3. Compute the checksum

```sh
swift package compute-checksum NoirBindings.xcframework.zip
```

4. Upload the `NoirBindings.xcframework.zip` to some URL

5. Update `Sources/mopro.swift` file with `MoproiOSBindings/mopro.swift`

## Test the package

```sh
xcodebuild test \
  -scheme NoirSwift \
  -destination 'platform=iOS Simulator,name=iPhone 17 Pro,OS=latest'
```
