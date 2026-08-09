
Metro is the JavaScript bundler used by React Native (Webpack in react).
Gradle is the build system that turns your Android project's source code and resources into an APK or AAB.
Hermes is javascript engine (V8 in Chrome-browser).
- Javascript → Hermes compiler → Hermes bytecode
- For a React Native Android app using Hermes, the Hermes engine is packaged as part of the APK (typically as a native .so library at `app.apk/lib/arm64-v8a/libhermes.so`)
Android SDK is set of Android APIs/tools needed to build the Android application
D8 converts JVM bytecode into DEX. DEX is bytecode designed for Android's runtime.
- Java/Kotlin → Java/Kotlin compiler → JVM Bytecode (`.class` files) -> D8 → `.dex`




```mermaid
flowchart TD
    A["React Native source<br/>.ts / .tsx"] --> B["TypeScript / Babel transform"]
    B --> C["JavaScript"]

    C --> D["Metro Bundler"]
    D --> E["JavaScript Bundle"]

    E --> F["Hermes Compiler"]
    F --> G["Hermes Bytecode"]

    H["React Native / Expo native code<br/>Java / Kotlin"] --> I["Java / Kotlin Compiler"]
    I --> J["JVM Bytecode"]
    J --> K["D8"]
    K --> L["DEX Bytecode<br/>.dex"]

    M["Native code<br/>C / C++"] --> N["C/C++ Compiler"]
    N --> O["Native Machine Code<br/>.so"]

    P["Android resources<br/>Manifest, images, etc."] --> Q["Android Resource Tools"]
    Q --> R["Processed Resources"]

    G --> S["Gradle / Android Build"]
    L --> S
    O --> S
    R --> S

    S --> T["APK Packaging"]
    T --> U["APK"]
    U --> V["APK Signing"]
    V --> W["app-release.apk"]
```



```mermaid
flowchart LR
    A["Your .ts/.tsx"] --> B["JavaScript"] --> C["Metro"] --> D["JS Bundle"] --> E["Hermes"] --> F["Hermes Bytecode"]

    G["Java / Kotlin"] --> H["Compiler"] --> I["JVM Bytecode"] --> J["D8"] --> K["DEX"]

    L["C / C++"] --> M["Compiler"] --> N["ARM Machine Code<br/>.so"]

    F --> O["APK"]
    K --> O
    N --> O
```