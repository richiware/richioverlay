# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=(python3_{10..13})

inherit distutils-r1 pypi

DESCRIPTION="A pandoc filter for modifying font size to Code, CodeBlock, Span, and Div that have speficied classes or latex-fontsize attribute."
HOMEPAGE="
    https://github.com/chdemko/pandoc-latex-fontsize
	https://pypi.org/project/pandoc-latex-fontsize/
"
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/panflute-2.0[${PYTHON_USEDEP}]
	"

BDEPENDS="
	>=dev-python/hatch-fancy-pypi-readme-23.2.0[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
	)"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/pandoc_latex_fontsize-${PV}-py3-none-any.whl"
}
