# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=6
PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/awamper/draobpilc.git"
else
	SRC_URI="https://github.com/awamper/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm ~arm64"
fi

DESCRIPTION="GPaste GUI"
HOMEPAGE="https://github.com/awamper/draobpilc"

LICENSE="GPL-3.0"
SLOT="0"

IUSE=""

DEPEND="dev-python/humanize[${PYTHON_USEDEP}]
		dev-python/blinker[${PYTHON_USEDEP}]
		dev-python/python3-keybinder[${PYTHON_USEDEP}]
		dev-python/python-xlib[${PYTHON_USEDEP}]
		"
RDEPEND="${DEPEND}"
