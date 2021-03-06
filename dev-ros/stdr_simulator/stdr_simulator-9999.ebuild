# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/stdr-simulator-ros-pkg/stdr_simulator"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="A simple, flexible and scalable 2D multi-robot simulator"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
