EAPI=6
PYTHON_COMPAT=( python3_{9..10} )

inherit distutils-r1

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/richiware/colocon.git"
else
	SRC_URI="https://github.com/richiware/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm ~arm64"
fi

DESCRIPTION="Utility for configuring and using colcon in a different way"
HOMEPAGE="https://github.com/richiware/colocon"

SLOT="0"

DEPEND="dev-python/pyyaml[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
