# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Python package that makes creating Pandoc filters fun"
HOMEPAGE="https://github.com/sergiocorreia/panflute"
SRC_URI="https://github.com/sergiocorreia/panflute/archive/refs/tags/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/click-6[${PYTHON_USEDEP}]
	<dev-python/click-9[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7[${PYTHON_USEDEP}]
	"

BDEPENDS="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
