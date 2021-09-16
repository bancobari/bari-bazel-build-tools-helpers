# Thanks to @tinder-maxwellelliott
# https://github.com/bazelbuild/rules_apple/issues/851#issuecomment-785296018


load(
    "@build_bazel_rules_apple//apple:apple.bzl",
    "apple_dynamic_framework_import",
    "apple_static_framework_import"
)

def apple_dynamic_xcframework_import(
    name, 
    path, 
    development_prefix, 
    release_prefix, 
    development_selector, 
    release_selector, 
    development_arm_selector,
    development_arm_prefix,
    **kwargs
):

    apple_dynamic_framework_import(
        name = name,
        framework_imports = select({
            development_selector: native.glob([
                 "{path}/{development_prefix}/**".format(path = path, development_prefix = development_prefix),
            ]),
            development_arm_selector: native.glob([
                 "{path}/{development_arm_prefix}/**".format(path = path, development_prefix = development_arm_prefix),
            ]),
            release_selector: native.glob([
                 "{path}/{release_prefix}/**".format(path = path, release_prefix = release_prefix),
            ]),
            "//conditions:default": native.glob([
                 "{path}/{development_prefix}/**".format(path = path, development_prefix = development_prefix),
            ])
        }),
        visibility = ["//visibility:public"],
        **kwargs
    )

def apple_static_xcframework_import(
    name,
    path,
    development_prefix,
    release_prefix,
    development_selector,
    release_selector,
    development_arm_selector,
    development_arm_prefix,
    **kwargs
):

    apple_static_framework_import(
        name = name,
        framework_imports = select({
            development_selector: native.glob([
                 "{path}/{development_prefix}/**".format(path = path, development_prefix = development_prefix),
            ]),
            development_arm_selector: native.glob([
                 "{path}/{development_arm_prefix}/**".format(path = path, development_prefix = development_arm_prefix),
            ]),
            release_selector: native.glob([
                 "{path}/{release_prefix}/**".format(path = path, release_prefix = release_prefix),
            ]),
            "//conditions:default": native.glob([
                 "{path}/{development_prefix}/**".format(path = path, development_prefix = development_prefix),
            ])
        }),
        visibility = ["//visibility:public"],
        **kwargs
    )