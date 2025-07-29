# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=8
PYTHON_COMPAT=(python3_{10..14})

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Python implementation of GNU readline functionality it is based on the ctypes based UNC readline package by Gary Bishop."
HOMEPAGE="https://github.com/pyreadline/pyreadline https://pypi.org/project/pyreadline/"
SRC_URI="https://files.pythonhosted.org/packages/bc/7c/d724ef1ec3ab2125f38a1d53285745445ec4a8f19b9bb0761b4064316679/pyreadline-2.1.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
