# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/yujinrobot/kobuki_desktop"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Visualisation and simulation tools for Kobuki"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
dev-ros/kobuki_msgs
dev-ros/rqt_plot
dev-ros/gazebo_ros
dev-ros/gazebo_plugins
"
DEPEND="
dev-ros/kobuki_msgs
dev-ros/rqt_plot
"
