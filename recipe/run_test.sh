#!/bin/bash

set -exuo pipefail

cp -r ${RECIPE_DIR}/tutorial .
cd tutorial

source gen-bazel-toolchain
bazel build --logging=6 --subcommands --verbose_failures \
    --platforms=//bazel_toolchain:target_platform \
    --host_platform=//bazel_toolchain:build_platform \
    --extra_toolchains=//bazel_toolchain:cc_cf_toolchain \
    --extra_toolchains=//bazel_toolchain:cc_cf_host_toolchain \
    --crosstool_top=//bazel_toolchain:toolchain --cpu ${TARGET_CPU} //main:hello-world
