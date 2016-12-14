# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

ROS_REPO_URI="https://github.com/sniekum/ar_track_alvar_msgs"
EGIT_BRANCH="filterlibrary"
KEYWORDS="~amd64 ~arm"
CATKIN_HAS_MESSAGES=yes

inherit ros-catkin

DESCRIPTION="Separate ROS msg repo for ar_track_alvar"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
dev-ros/message_runtime
dev-ros/geometry_msgs
dev-ros/std_msgs
"
DEPEND="
dev-ros/message_generation
dev-ros/geometry_msgs
dev-ros/std_msgs
"
