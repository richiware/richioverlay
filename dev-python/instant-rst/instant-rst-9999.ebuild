# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=6
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gu-fan/instant-rst.py.git"
else
	SRC_URI="https://github.com/gu-fan/${PN}.py/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm ~arm64"
fi

DESCRIPTION="Local server for preview rst document instantly."
HOMEPAGE="https://github.com/gu-fan/instant-rst.py"

LICENSE=""
SLOT="0"

IUSE=""

DEPEND="dev-python/flask[${PYTHON_USEDEP}]
		dev-python/docutils[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/flask-socketio[${PYTHON_USEDEP}]
		"
RDEPEND="${DEPEND}"
