# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

HOMEPAGE="https://github.com/vit-project/vit/"

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/vit-project/vit.git"
else
	SRC_URI="${HOMEPAGE}archive/v2.2.0b1.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/vit-2.2.0b1"
	KEYWORDS="~*"
fi


DESCRIPTION="Visual Interactive Taskwarrior full-screen terminal interface."

LICENSE="MIT"
SLOT="0"
IUSE=""

REQUIRED_USE=""

RDEPEND=">=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	>=dev-python/tasklib-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/urwid-2.1.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
