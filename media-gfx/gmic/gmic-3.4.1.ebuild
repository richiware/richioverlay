# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
CMAKE_MAKEFILE_GENERATOR="emake"
CMAKE_BUILD_TYPE=Release

inherit bash-completion-r1 cmake flag-o-matic qmake-utils toolchain-funcs

DESCRIPTION="GREYC's Magic Image Converter"
HOMEPAGE="http://gmic.eu/
	https://github.com/GreycLab/gmic
	https://framagit.org/dtschump/gmic"
GMIC_QT_URI="https://github.com/c-koi/gmic-qt/archive/v.${PV}.tar.gz -> gmic-qt-${PV}.tar.gz"
SRC_URI="https://github.com/GreycLab/gmic/archive/v.${PV}.tar.gz -> ${P}.tar.gz
	https://gmic.eu/gmic_stdlib_community$(ver_rs 1- '').h
	gimp? ( ${GMIC_QT_URI} )
	gui? ( ${GMIC_QT_URI} )
"
GMIC_QT_DIR="gmic-qt-v.${PV}"
S="${WORKDIR}/${PN}-v.${PV}"

LICENSE="CeCILL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion +cli ffmpeg fftw gimp gimp3 graphicsmagick gui jpeg opencv openexr openmp png static-libs tiff X"
REQUIRED_USE="
	|| ( cli gimp gui )
	gimp? ( png fftw X )
	gui? ( png fftw X )
	gimp3? ( gimp )
"

QT_DEPS="
	dev-qt/qtcore:5=
	dev-qt/qtgui:5=
	dev-qt/qtnetwork:5=
	dev-qt/qtwidgets:5=
"
COMMON_DEPEND="
	fftw? ( sci-libs/fftw:3.0=[threads] )
	gimp? (
		>=media-gfx/gimp-2.8.0
		${QT_DEPS}
	)
	gimp3? (
		~media-gfx/gimp-2.99.18
		${QT_DEPS}
	)
	graphicsmagick? ( media-gfx/graphicsmagick:0= )
	gui? ( ${QT_DEPS} )
	jpeg? ( media-libs/libjpeg-turbo:0 )
	~media-libs/cimg-${PV}
	net-misc/curl
	opencv? ( >=media-libs/opencv-2.3.1a-r1:0= )
	openexr? (
		dev-libs/imath:=
		media-libs/openexr:0=
	)
	png? ( media-libs/libpng:0= )
	sys-libs/zlib:0=
	tiff? ( media-libs/tiff:0 )
	X? (
		x11-libs/libX11
		x11-libs/libXext
	)
"
RDEPEND="${COMMON_DEPEND}
	ffmpeg? ( media-video/ffmpeg:0= )
"
DEPEND="${COMMON_DEPEND}
	gimp? ( dev-qt/linguist-tools:5 )
	gui? ( dev-qt/linguist-tools:5 )
	virtual/pkgconfig
"

pkg_pretend() {
	if use openmp; then
		tc-check-openmp
	fi

	if ! test-flag-CXX -std=c++11; then
		die "You need at least GCC 4.7.x or Clang >= 3.3 for C++11-specific compiler flags"
	fi
}

src_prepare() {
	cp -a "${DISTDIR}/gmic_stdlib_community$(ver_rs 1- '').h" src/gmic_stdlib_community.h || die
	cmake_src_prepare
	PATCHES=()

	ln -sr ../${PN}-v.${PV} ../${PN}

	if use gimp || use gui; then
		sed -i \
			-e '/CMAKE_CXX_FLAGS_RELEASE/d' \
			../${GMIC_QT_DIR}/CMakeLists.txt || die "sed failed"
		local S="${WORKDIR}/${GMIC_QT_DIR}"
		cd ../${GMIC_QT_DIR}
		patch -p1 -i "${FILESDIR}/gmic-3.1.6-stripping.patch" || die
		patch -p1 -i "${FILESDIR}/gmic-3.2.0-system-gmic.patch" || die
		if use gimp3; then
			patch -p1 -i "${FILESDIR}/gimp-3-functions.patch"
			pushd "${WORKDIR}"
			patch -p1 -i "${FILESDIR}/gimp-3-setup.patch"
			popd
		fi
		cd -
		cmake_src_prepare
	fi
}

src_configure() {
	# for "lrelease"
	local PATH="${PATH}:$(qt5_get_bindir)"

	local mycmakeargs=(
		-DBUILD_LIB=ON
		-DBUILD_LIB_STATIC=$(usex static-libs ON OFF)
		-DBUILD_CLI=$(usex cli ON OFF)
		-DBUILD_MAN=$(usex cli ON OFF)
		-DBUILD_BASH_COMPLETION=$(usex cli $(usex bash-completion ON OFF) OFF)
		-DENABLE_X=$(usex X ON OFF)
		-DENABLE_FFMPEG=$(usex ffmpeg ON OFF)
		-DENABLE_FFTW=$(usex fftw ON OFF)
		-DENABLE_GRAPHICSMAGICK=$(usex graphicsmagick ON OFF)
		-DENABLE_JPEG=$(usex jpeg ON OFF)
		-DENABLE_OPENCV=$(usex opencv ON OFF)
		-DENABLE_OPENEXR=$(usex openexr ON OFF)
		-DENABLE_OPENMP=$(usex openmp ON OFF)
		-DENABLE_PNG=$(usex png ON OFF)
		-DENABLE_TIFF=$(usex tiff ON OFF)
		-DENABLE_ZLIB=ON
		-DENABLE_DYNAMIC_LINKING=ON
		-DCUSTOM_CFLAGS=ON
		-DUSE_SYSTEM_CIMG=ON
	)

	cmake_src_configure

	# gmic-qt
	local CMAKE_USE_DIR="${WORKDIR}/${GMIC_QT_DIR}"
	append-cppflags -I"${WORKDIR}/gmic/src"
	append-ldflags -L"${WORKDIR}/gmic-v.${PV}_build"
	mycmakeargs=(
		-DENABLE_DYNAMIC_LINKING=ON
		-DENABLE_SYSTEM_GMIC=ON
		-DGMIC_LIB_PATH="${WORKDIR}/gmic-v.${PV}_build"
	)
	local BUILD_DIR
	if use gimp && ! use gimp3; then
		BUILD_DIR=${WORKDIR}/gimp_build
		mycmakeargs+=(-DGMIC_QT_HOST=gimp)
		cmake_src_configure
	fi
	if use gimp && use gimp3; then
		BUILD_DIR=${WORKDIR}/gimp_build
		mycmakeargs+=(-DGMIC_QT_HOST=gimp3)
		cmake_src_configure
	fi
	if use gui; then
		BUILD_DIR=${WORKDIR}/gui_build
		mycmakeargs+=(-DGMIC_QT_HOST=none)
		cmake_src_configure
	fi
}

src_compile() {
	cmake_src_compile

	# gmic-qt
	local S="${WORKDIR}/${GMIC_QT_DIR}"
	local BUILD_DIR
	if use gimp || use gimp3; then
		BUILD_DIR="${WORKDIR}/gimp_build"
		cmake_src_compile
	fi
	if use gui; then
		BUILD_DIR="${WORKDIR}/gui_build"
		cmake_src_compile
	fi
}

src_install() {
	dodoc README

	# - the Gimp plugin dir is also searched by non-Gimp tools, and it's
	#   hardcoded in "gmic_stdlib.gmic"
	# - using the GMIC_SYSTEM_PATH env var to specify another system dir here
	#   might mean that this big file will be automatically downloaded in
	#   "~/.config/gmic/" when the user runs a tool before updating and sourcing
	#   the new environment
	local PLUGIN_DIR
	if use gimp && ! use gimp3; then
		PLUGIN_DIR="/usr/$(get_libdir)/gimp/2.0/plug-ins/gmic_gimp_qt"
	elif use gimp && use gimp3; then
		PLUGIN_DIR="/usr/$(get_libdir)/gimp/2.99/plug-ins/gmic_gimp_qt"
	fi
	mkdir -p "${ED}/${PLUGIN_DIR}" || die
	insinto "${PLUGIN_DIR}" || die
	doins "resources/gmic_cluts.gmz" || die

	cmake_src_install

	# By default, "gmic.cpp" includes "gmic.h" which defines "cimg_plugin" to "gmic.cpp" and then
	# includes "CImg.h" which includes "cimg_plugin" which is "gmic.cpp", of course.
	#
	# Yes, upstream is bad and they should feel bad. Undo this madness so we can build media-gfx/zart
	# using the installed "gmic.h".
	sed -i -e '/^#define cimg.*_plugin/d' "${ED}/usr/include/gmic.h" || die "sed failed"

	use cli && use bash-completion && newbashcomp "${WORKDIR}/${PN}-v.${PV}_build/resources/${PN}_bashcompletion.sh" ${PN}

	# gmic-qt
	if use gimp || use gimp3; then
		exeinto "${PLUGIN_DIR}"
		doexe "${WORKDIR}/gimp_build/gmic_gimp_qt"
	fi
	if use gui; then
		dobin "${WORKDIR}/gui_build/gmic_qt"
	fi
}

pkg_postinst() {
	if use gimp3; then
		ewarn "Currently, gmic_qt does NOT support Wayland."
		ewarn "As a result of this, it is required to launch"
		ewarn "GIMP 2.99 with GDK_BACKEND=x11."
	fi
}
