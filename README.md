
<h1 align="center">ChipView</h1>


<br/>
<p align="center">
<a href="https://twitter.com/intent/tweet?text=ChipGroup%20is%20is%20a%20simple%20and%20highly%20customizable%20chip%20group%20for%20iOS,%20in%20SwiftUI.%20https://github.com/Open-Bytes/SwiftUIChipGroup"><img src="https://img.shields.io/twitter/url/http/shields.io.svg?style=social" height="25"/></a>


**ChipGroup** is a simple and highly customizable chip group for iOS, in SwiftUI.

![swift v5.3](https://img.shields.io/badge/swift-v5.3-orange.svg)
![iOS 13](https://img.shields.io/badge/iOS-13.0+-865EFC.svg)
![macOS](https://img.shields.io/badge/macOS-10.15+-179AC8.svg)
![tvOS](https://img.shields.io/badge/tvOS-13.0+-41465B.svg)
![License](https://img.shields.io/badge/License-Apache-blue.svg)

---

# Table of contents

- [Preview](#preview)
- [Installation](#installation)
- [Demo](#demo)
- [License](#license)

---

## Installation

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/Open-Bytes/ChipGroup`.


### Swift Package Manager Projects

You can add `
ChipGroup` as a package dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
      .package(url: "https://github.com/Open-Bytes/ChipGroup", .upToNextMajor(from: "0.1.0"))
    ]
    //...
)
```

From there, refer to `ChipGroup` in target dependencies:

```swift
targets: [
    .target(
        name: "YourLibrary",
        dependencies: [
          "ChipGroup"
        ]
        //...
    ),
   // ...
]
```

Then simply `import ChipGroup` wherever you’d like to use the library.

---

## Demo

[ChipGroup](https://github.com/Open-Bytes/SwiftUIChipGroup/blob/master/Example/ContentView.swift)  
is an example app demonstrates how you can use the library.

---

## :clap: Contribution

- PRs are welcome, let's make this library better. :raised_hands:

- Please :star: if you like the idea!

## License

**Apache License**, Version 2.0

<details>
    <summary>
        click to reveal License
    </summary>

```txt
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

</details>
