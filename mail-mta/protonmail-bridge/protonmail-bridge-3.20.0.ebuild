# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop go-module systemd xdg-utils

MY_PN="proton-bridge"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Serves Proton Mail to IMAP/SMTP clients"
HOMEPAGE="https://proton.me/mail/bridge https://github.com/ProtonMail/proton-bridge/"

if [[ ${PV} == *9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/ProtonMail/${MY_PN}.git"
else
    SRC_URI="https://github.com/ProtonMail/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="~amd64"
fi

LICENSE="Apache-2.0 BSD BSD-2 GPL-3+ ISC LGPL-3+ MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gui"

PROPERTIES="test_network"
RESTRICT="test network-sandbox"

RDEPEND="app-crypt/libsecret
    gui? (
        >=dev-libs/protobuf-21.12:=
        >=dev-libs/sentry-native-0.6.5-r1
        dev-qt/qtbase:6=[gui,icu,widgets]
        dev-qt/qtdeclarative:6=[widgets]
        dev-qt/qtsvg:6=
        media-libs/mesa
        net-libs/grpc:=
    )
"
DEPEND="${RDEPEND}"

PATCHES=(
    "${FILESDIR}"/${PN}-3.14.0-gui_gentoo.patch
)

S="${WORKDIR}"/${MY_P}

src_unpack() {
    if [[ "${PV}" == *9999* ]]; then
        git-r3_src_unpack
        go-module_live_vendor
    else
        default
        cd "${S}" || die
        ego mod vendor
    fi
}

src_prepare() {
    xdg_environment_reset
    default
    if use gui; then
        local PATCHES=()
        BUILD_DIR="${WORKDIR}"/gui_build \
            CMAKE_USE_DIR="${S}"/internal/frontend/bridge-gui/bridge-gui \
            cmake_src_prepare
    fi
}

src_configure() {
    if use gui; then
        local mycmakeargs=(
            -DBRIDGE_APP_FULL_NAME="Proton Mail Bridge"
            -DBRIDGE_APP_VERSION="${PV}+git"
            -DBRIDGE_REPO_ROOT="${S}"
            -DBRIDGE_TAG="NOTAG"
            -DBRIDGE_VENDOR="Gentoo Linux"
            -DCMAKE_DISABLE_PRECOMPILE_HEADERS=OFF
        )
        BUILD_DIR="${WORKDIR}"/gui_build \
            CMAKE_USE_DIR="${S}"/internal/frontend/bridge-gui/bridge-gui \
            cmake_src_configure
    fi
}

src_compile() {
    emake build-nogui

    if use gui; then
        BUILD_DIR="${WORKDIR}"/gui_build \
            CMAKE_USE_DIR="${S}"/internal/frontend/bridge-gui/bridge-gui \
            cmake_src_compile
    fi
}

src_test() {
    emake test
}

src_install() {
    exeinto /usr/bin
    newexe bridge ${PN}

    if use gui; then
        BUILD_DIR="${WORKDIR}"/gui_build \
            CMAKE_USE_DIR="${S}"/internal/frontend/bridge-gui/bridge-gui \
            cmake_src_install
        mv "${ED}"/usr/bin/bridge-gui "${ED}"/usr/bin/${PN}-gui || die
        newicon "${S}"/dist/bridge.svg ${PN}.svg
        make_desktop_entry ${PN}-gui "Proton Mail Bridge" ${PN}.svg "Email;Network"
    fi

    systemd_newuserunit "${FILESDIR}"/${PN}.service-r1 ${PN}.service

    einstalldocs
}

pkg_postinst() {
    if [[ -n "${REPLACING_VERSIONS}" ]]; then
        local oldver
        for oldver in ${REPLACING_VERSIONS}; do
            if ver_test "${oldver}" -lt 3.2.0; then
                ewarn "Please note that since version 3.2.0, ${PN} by default shares usage statistics with upstream."
                ewarn "For details, please see"
                ewarn
                ewarn "	https://proton.me/support/share-usage-statistics"
                ewarn
                ewarn "This behaviour can be disabled through ${PN}-gui, under Advanced Settings."
                ewarn
                break
            fi
        done
    fi
}
