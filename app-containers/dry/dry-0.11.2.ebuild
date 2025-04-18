# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A terminal application to manage Docker and Docker Swarm"
HOMEPAGE="https://github.com/moncho/dry"

SRC_URI="https://github.com/moncho/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT+="strip"

BDEPEND=">=dev-lang/go-1.22"

src_unpack() {
    default
    tar xJf "${FILESDIR}/${P}-vendor.tar.xz" || die
}

src_compile() {
    ego build
}

src_install() {
    dobin ${PN}
    default
}
