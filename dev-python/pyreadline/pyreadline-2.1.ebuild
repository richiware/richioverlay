# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=8
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Python implementation of GNU readline functionality it is based on the ctypes based UNC readline package by Gary Bishop."
HOMEPAGE="https://github.com/pyreadline/pyreadline https://pypi.org/project/pyreadline/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
