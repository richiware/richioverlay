# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/yujinrobot/yujin_ocs"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Yujin Robot's open-source control system including libraries and exectuables"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/roslint
dev-ros/ar_track_alvar_msgs
dev-ros/base_local_planner
dev-ros/move_base_msgs
"
DEPEND="${RDEPEND}"
