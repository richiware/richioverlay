# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/seebye/ueberzug.git"
else
	SRC_URI="${HOMEPAGE}archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

HOMEPAGE="https://github.com/seebye/ueberzug/"

DESCRIPTION="Command line util which allows to draw images on terminals by using child windows."

LICENSE="GPL-3"
SLOT="0"
IUSE=""

REQUIRED_USE=""

RDEPEND="dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/attrs[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
