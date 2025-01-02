# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10..13})

inherit distutils-r1

HOMEPAGE="https://github.com/robgolding/tasklib/"
SRC_URI="${HOMEPAGE}archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~*"

DESCRIPTION="Python library for interacting with taskwarrior databases."

LICENSE="BSD"
SLOT="0"
IUSE=""

REQUIRED_USE=""

RDEPEND=">=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-2.0.0[${PYTHON_USEDEP}]
	>=app-misc/task-2.6.0
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
