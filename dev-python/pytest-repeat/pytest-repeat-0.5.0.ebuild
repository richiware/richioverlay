# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="pytest-repeat is a plugin for py.test that makes it easy to repeat a single test, or multiple tests, a specific number of times."
HOMEPAGE="https://github.com/pytest-dev/pytest-repeat/ https://pypi.org/project/pytest-repeat/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 sparc x86 ~amd64-fbsd"
IUSE=""

RDEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]"

DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
