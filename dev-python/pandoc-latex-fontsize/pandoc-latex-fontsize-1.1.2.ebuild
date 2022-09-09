# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

DESCRIPTION="A pandoc filter for modifying font size to Code, CodeBlock, Span, and Div that have speficied classes or latex-fontsize attribute."
HOMEPAGE="https://github.com/chdemko/pandoc-latex-fontsize"
SRC_URI="https://github.com/chdemko/pandoc-latex-fontsize/archive/refs/tags/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/panflute-2.0[${PYTHON_USEDEP}]
	"

BDEPENDS="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]

	)"

distutils_enable_tests pytest

python_prepare_all() {
    sed -i -e '/pytest-runner/d' setup.py || die
    distutils-r1_python_prepare_all
}
