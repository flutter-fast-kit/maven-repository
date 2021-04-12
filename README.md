# maven-repository

maven/gradle 公共仓库

## 如何使用

需要在 `android/build.gradle` 文件里加入仓库

```gradle
allprojects {
    repositories {
        maven {
            url 'https://cdn.jsdelivr.net/gh/flutter-fast-kit/maven-repository'
        }
    }
}
```

然后在 `android/app/build.gradle` 引用

```gradle
dependencies {
    implementation 'com.netease.nis:captcha:3.0.2'
}
```

## 仓库列表

- com.netease.nis:captcha
- com.turui.android.cameraview