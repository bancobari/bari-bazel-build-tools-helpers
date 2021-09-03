load("@build_bazel_rules_ios//rules:hmap.bzl", "headermap")
load("@rules_cc//cc:defs.bzl", "objc_library")

def objc_importer(
        name,
        deps = [],
        hdrs = [],
        copts = [],
        module_name = None,
        **kwargs):
    headermap(
        name = name + ".public_hmap",
        namespace = module_name or name,
        hdrs = hdrs,
        direct_hdr_providers = deps,
    )

    for dep in deps:
        if ".public_hmap" in dep:
            copts = copts + ["-I$(execpath {})".format(dep)]

    copts = copts + [
        "-I$(execpath {})".format(name + ".public_hmap"),
        "-I.",
    ]

    deps = deps + [
        name + ".public_hmap",
    ]

    objc_library(
        name = name,
        deps = deps,
        hdrs = hdrs,
        copts = copts,
        module_name = module_name,
        **kwargs
    )
