# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

ROS_REPO_URI="https://github.com/orbbec/ros_astra_launch"
KEYWORDS="~amd64 ~arm"
CATKIN_HAS_MESSAGES=yes
PYTHON_COMPAT=()

inherit ros-catkin

DESCRIPTION="Orbbec Astra launch"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
dev-ros/ros_astra_camera
"
DEPEND="${RDEPEND}"
