fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios build

```sh
[bundle exec] fastlane ios build
```

🚀 Build IDnow Verify

### ios set_build_number

```sh
[bundle exec] fastlane ios set_build_number
```

🚀 Update app build number regarding current date

### ios distribute_testflight

```sh
[bundle exec] fastlane ios distribute_testflight
```

🚀 Deploy the Client app to Testflight for QA test

### ios build_ipa

```sh
[bundle exec] fastlane ios build_ipa
```

🚀 Build a ClientApp archive localy

### ios deploy_external

```sh
[bundle exec] fastlane ios deploy_external
```

🚀 Deploy the sdk on Github for client

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
