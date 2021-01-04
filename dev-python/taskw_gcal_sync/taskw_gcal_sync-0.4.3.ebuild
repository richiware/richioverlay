# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license
EAPI=6
PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="Taskwarrior <-> Google Calendar synchronisation tool."
HOMEPAGE="https://github.com/bergercookie/taskw_gcal_sync"
SRC_URI="https://github.com/bergercookie/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

IUSE="test"

DEPEND="dev-python/arrow[${PYTHON_USEDEP}]
        dev-python/bidict[${PYTHON_USEDEP}]
        dev-python/click[${PYTHON_USEDEP}]
        >=dev-python/setuptools-30.3.0[${PYTHON_USEDEP}]
        dev-python/colorlog[${PYTHON_USEDEP}]
        dev-python/google-api-python-client[${PYTHON_USEDEP}]
        dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]
        dev-python/mypy[${PYTHON_USEDEP}]
        dev-python/overrides[${PYTHON_USEDEP}]
        dev-python/pytz[${PYTHON_USEDEP}]
        dev-python/rfc3339[${PYTHON_USEDEP}]
        dev-python/sh[${PYTHON_USEDEP}]
        dev-python/taskw[${PYTHON_USEDEP}]
        dev-python/typing[${PYTHON_USEDEP}]
        "
RDEPEND="${DEPEND}"

