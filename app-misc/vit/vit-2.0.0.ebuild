# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

HOMEPAGE="https://github.com/vit-project/vit/"
SRC_URI="${HOMEPAGE}archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~*"

DESCRIPTION="Visual Interactive Taskwarrior full-screen terminal interface."

LICENSE="MIT"
SLOT="0"
IUSE=""

REQUIRED_USE=""

RDEPEND=">=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/tasklib-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/urwid-2.1.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
