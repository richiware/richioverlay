# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=6
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

if [[ ${PV} =~ 9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/colcon/colcon-gradle.git"
else
	SRC_URI="https://github.com/colcon/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm ~arm64"
fi

DESCRIPTION="An extension for colcon-core to support Gradle projects."
HOMEPAGE="https://colcon.readthedocs.io"

LICENSE="Apache-2.0"
SLOT="0"

IUSE="test"
DEPEND="dev-python/colcon-core[${PYTHON_USEDEP}]
        dev-python/colcon-library-path[${PYTHON_USEDEP}]
        test? ( dev-python/flake8 )
        test? ( dev-pyton/flake8-import-order )
        test? ( dev-python/mock )
        test? ( dev-python/pep8 )
        test? ( dev-python/pylint )"
RDEPEND="${DEPEND}"
