# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A terminal user interface for the DeepL language translation API"
HOMEPAGE="https://github.com/DeepLcom/deepl-tui"

SRC_URI="https://github.com/DeepLcom/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
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
    dobin ${PN}
    default
}
