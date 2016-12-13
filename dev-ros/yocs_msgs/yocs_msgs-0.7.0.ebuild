# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/yujinrobot/yocs_msgs"
SRC_URI="https://github.com/yujinrobot/yocs_msgs/archive/0.7.0.tar.gz"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Yujin's Open Control System messages, services and actions"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/actionlib_msgs
dev-ros/std_msgs
dev-ros/std_srvs
dev-ros/geometry_msgs
dev-ros/message_generation
"
DEPEND="${RDEPEND}"
