# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Generates ctags-compatible output for the sections of a Markdown document"
HOMEPAGE="https://github.com/jszakmeister/markdown2ctags"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

DEPEND=">dev-python/setuptools_scm-1.12.0[${PYTHON_USEDEP}]"
