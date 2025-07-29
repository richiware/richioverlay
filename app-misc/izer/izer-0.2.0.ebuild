# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
EGO_PN=github.com/NightWolf007/${PN}

inherit go-module

DESCRIPTION="Command-line tool for adding icons to filenames"
HOMEPAGE="https://github.com/NightWolf007/izer"

EGIT_COMMIT="v${PV}"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE=""

RESTRICT+="strip"

BDEPEND=">=dev-lang/go-1.22"

src_unpack() {
    default
    tar xJf "${FILESDIR}/${P}-vendor.tar.xz" || die
    tar xJf "${FILESDIR}/${P}-deps.tar.xz" || die
}

src_compile() {
    ego build
}

src_install() {
    dobin izer
}
