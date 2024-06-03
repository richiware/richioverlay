# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/richiware/devloy.git"
else
	SRC_URI="https://github.com/richiware/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm ~arm64"
fi

DESCRIPTION=""
HOMEPAGE="https://github.com/richiware/devloy"

SLOT="0"

DEPEND="dev-python/pyyaml[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
