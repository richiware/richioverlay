# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/ros-drivers/joystick_drivers"
SRC_URI="https://github.com/ros-drivers/joystick_drivers/archive/1.10.1.tar.gz"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="ROS drivers for joysticks"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/sensor_msgs
dev-ros/roscpp
dev-ros/diagnostic_updater
"
DEPEND="${RDEPEND}"
