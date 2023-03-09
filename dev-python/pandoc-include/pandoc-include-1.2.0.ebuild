# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="A pandoc filter to to allow file and header includes"
HOMEPAGE="https://github.com/DCsunset/pandoc-include"
SRC_URI="https://github.com/DCsunset/pandoc-include/archive/refs/tags/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/panflute[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
	"

BDEPENDS="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
