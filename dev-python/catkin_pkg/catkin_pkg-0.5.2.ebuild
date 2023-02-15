# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=8
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Standalone Python library for the Catkin package system."
HOMEPAGE="http://ros.org/wiki/catkin"
SRC_URI="https://github.com/ros-infrastructure/${PN}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE="test"

DEPEND="dev-python/docutils[${PYTHON_USEDEP}]
        dev-python/python-dateutil[${PYTHON_USEDEP}]
        dev-python/pyparsing[${PYTHON_USEDEP}]
        >=dev-python/setuptools-30.3.0[${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/pytest-repeat[${PYTHON_USEDEP}]
        dev-python/pytest-rerunfailures[${PYTHON_USEDEP}]
        test? ( dev-python/flake8 )
        test? ( dev-python/flake8-import-order )
        test? ( dev-python/mock )
        test? ( dev-python/pep8 )
        test? ( dev-python/pytest )"
RDEPEND="${DEPEND}"
