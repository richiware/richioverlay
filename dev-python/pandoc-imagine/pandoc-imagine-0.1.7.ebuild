# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="A pandoc filter to process codeblocks into images and/or ascii art"
HOMEPAGE="https://github.com/hertogp/imagine"
SRC_URI="https://github.com/hertogp/imagine/archive/refs/tags/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
S="${WORKDIR}/imagine-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/pandocfilters-1.4[${PYTHON_USEDEP}]
	"

BDEPENDS="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
