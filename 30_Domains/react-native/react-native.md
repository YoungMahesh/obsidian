Environment:
```bash
node -v
# v24.19.0
pnpm --version
# 11.18.0
```

```bash
# start template
# pnpm dlx create-expo-app@latest <project-name>
pnpm dlx create-expo-app@latest rn-todo 
# if prompted for selection, select version: For learning with Expo Go (SDK 54)
cd rn-todo
pnpm install
pnpm expo start
pnpm expo start --tunnel # if on remote server
# scan QR code from expo-app on android, now you will see UI on android, whenever you make changes
#   they will be reflected on mobile-app 

# build app locally 
# 1. confirm android-sdk is installed
# 2. pnpm expo run:android --variant release
```

Install Android SDK
```bash
# A. Install java
java -version
sudo apt update
sudo apt install openjdk-17-jdk

# 2. Download Android-sdk
# Install android command line tools
# download zip file for linux from: https://developer.android.com/studio#command-line-tools-only
mkdir -p "$HOME/Android/Sdk/cmdline-tools"
unzip commandlinetools-linux-*_latest.zip
# arrange files like this: 
# ~/Android/Sdk/
#	└── cmdline-tools/
#	    └── latest/
#	        ├── bin/
#	        ├── lib/
#	        ├── NOTICE.txt
#	        └── source.properties

# 3. Make android-sdk available to rest of the system 
# append following to ~/.bashrc
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

# test if paths are ready:
source ~/.bashrc
echo $ANDROID_HOME
sdkmanager --version
sdkmanager --list
```


| React        | React-native equivalent |
| ------------ | ----------------------- |
| div          | View                    |
| span         | Text                    |
| onClick      | onPress                 |
| Vite/Webpack | Metro                   |



Example page:
```ts
import { Text, View } from 'react-native';
export default function HomeScreen() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ color: 'red', fontSize: 30 }}>
        Hello React Native
      </Text>
    </View>
  );
}
```

Additional concepts compared to react:
- file-based Stack navigation - use `back` on smarphone (`import { BackHandler } from 'react-native';`) to move to previous screen
- Platform API from react-native to know underneath system: `if (Platform.OS === 'android') {// Android-specific code}`
- Status bar: Android has a system status bar, React Native/Expo lets you control aspects of it. `<StatusBar style="dark" />`

### Terminology

Metro is the JavaScript bundler used by React Native.