# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils bash-completion-r1

DESCRIPTION="A shell for Taskwarrior"
HOMEPAGE="https://taskwarrior.org/"
SRC_URI="https://taskwarrior.org/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm x86 ~x64-macos"
IUSE=""

DEPEND="sys-libs/readline:0"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
