# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

HOMEPAGE="https://github.com/lpechacek/cpuset/"
SRC_URI="${HOMEPAGE}archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~*"

DESCRIPTION=""

LICENSE="GPL"
SLOT="0"
IUSE=""

REQUIRED_USE=""

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
