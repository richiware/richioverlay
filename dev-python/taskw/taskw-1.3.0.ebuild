# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

HOMEPAGE="https://github.com/ralphbean/taskw/"
SRC_URI="${HOMEPAGE}archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~*"

DESCRIPTION="Python bindings for your taskwarrior database"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

REQUIRED_USE=""

RDEPEND="dev-python/six[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/kitchen[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	app-misc/task
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
