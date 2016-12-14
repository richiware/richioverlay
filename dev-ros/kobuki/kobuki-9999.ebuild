# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/yujinrobot/kobuki"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Software for iClebo Kobuki"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/yocs_msgs
dev-ros/yujin_ocs
dev-ros/kobuki_msgs
dev-ros/kobuki_core
dev-ros/xacro
"
DEPEND="${RDEPEND}"
