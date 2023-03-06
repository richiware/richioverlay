# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="obs studio output plugin for crop the background area without a green screen like Zoom and Meet virtual backgrounds."
HOMEPAGE="https://github.com/kounoike/obs-virtualbg"
EGIT_REPO_URI="https://github.com/kounoike/obs-virtualbg.git"
EGIT_COMMIT=v${PV}
SRC_URI="
	https://github.com/halide/Halide/releases/download/v14.0.0/Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
	https://github.com/microsoft/onnxruntime/releases/download/v1.12.1/onnxruntime-linux-x64-1.12.1.tgz
	https://github.com/microsoft/onnxruntime/releases/download/v1.12.1/onnxruntime-linux-x64-gpu-1.12.1.tgz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-video/obs-studio
	sci-libs/onnx
"
RDEPEND="${DEPEND}"
BDEPEND=""
PDEPEND="media-video/v4l2loopback"

src_prepare() {
	mkdir deps
	mkdir deps/Halide
	tar zxf ${DISTDIR}/Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz -C deps/Halide --strip-components 1
	mkdir deps/onnxruntime
	tar zxf ${DISTDIR}/onnxruntime-linux-x64-1.12.1.tgz -C deps/onnxruntime --strip-components 1
	mkdir deps/onnxruntime-gpu
	tar zxf ${DISTDIR}/onnxruntime-linux-x64-gpu-1.12.1.tgz -C deps/onnxruntime-gpu --strip-components 1
	cmake_src_prepare
}

src_configure() {
        local mycmakeargs=(
			-DHalide_DIR=deps/Halide/lib/cmake/Halide
			-DHalideHelpers_DIR=deps/Halide/lib/cmake/HalideHelpers
			-DCMAKE_INSTALL_RPATH="/usr/lib64/obs-virtualbg"
        )
        cmake_src_configure
}
