# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/stonier/ecl_tools"
KEYWORDS="~amd64 ~arm"
PYTHON_COMPAT=
ROS_SUBDIR=

inherit ros-catkin

DESCRIPTION="Build environment tools and utilities for the embedded control libraries"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
