# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PYTHON_COMPAT=(python3_{10..14})

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Generates ctags-compatible output for the sections of a Markdown document"
HOMEPAGE="https://github.com/jszakmeister/markdown2ctags"
SRC_URI="https://files.pythonhosted.org/packages/2b/ad/7542bf7ff34effc010c63dcf3e10c745e54806da751975672c0ddaf5d45c/markdown2ctags-0.3.3.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
