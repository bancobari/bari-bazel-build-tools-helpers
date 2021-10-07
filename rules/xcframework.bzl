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
    simulator_prefix, 
    release_prefix, 
    simulator_selector, 
    release_selector, 
    **kwargs
):

    apple_dynamic_framework_import(
        name = name,
        framework_imports = select({
            simulator_selector: native.glob([
                 "{path}/{simulator_prefix}/**".format(path = path, simulator_prefix = simulator_prefix),
            ]),
            release_selector: native.glob([
                 "{path}/{release_prefix}/**".format(path = path, release_prefix = release_prefix),
            ]),
            "//conditions:default": native.glob([
                 "{path}/{simulator_prefix}/**".format(path = path, simulator_prefix = simulator_prefix),
            ])
        }),
        visibility = ["//visibility:public"],
        **kwargs
    )

def apple_static_xcframework_import(
    name,
    path,
    simulator_prefix, 
    release_prefix, 
    simulator_selector, 
    release_selector, 
    **kwargs
):

    apple_static_framework_import(
        name = name,
        framework_imports = select({
            simulator_selector: native.glob([
                 "{path}/{simulator_prefix}/**".format(path = path, simulator_prefix = simulator_prefix),
            ]),
            release_selector: native.glob([
                 "{path}/{release_prefix}/**".format(path = path, release_prefix = release_prefix),
            ]),
            "//conditions:default": native.glob([
                 "{path}/{simulator_prefix}/**".format(path = path, simulator_prefix = simulator_prefix),
            ])
        }),
        visibility = ["//visibility:public"],
        **kwargs
    )