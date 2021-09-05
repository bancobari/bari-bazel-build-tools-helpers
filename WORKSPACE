load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.31.3",
)

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "d0e5f888b2ccce42c92e6d4686b5507b4230462627f965f9d39862e11ae9fb35",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/0.18.0/rules_swift.0.18.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

git_repository(
    name = "build_bazel_apple_support",
    remote = "https://github.com/bazelbuild/apple_support.git",
    tag = "0.11.0",
)

git_repository(
    name = "bazel_skylib",
    remote = "https://github.com/bazelbuild/bazel-skylib.git",
    tag = "1.0.3",
)

git_repository(
    name = "build_bazel_rules_ios",
    branch = "master",
    remote = "https://github.com/bazel-ios/rules_ios.git",
)

load(
    "@build_bazel_rules_ios//rules:repositories.bzl",
    "rules_ios_dependencies",
)

rules_ios_dependencies()
