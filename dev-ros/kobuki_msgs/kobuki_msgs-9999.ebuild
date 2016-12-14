# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/yujinrobot/kobuki_msgs"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Custom ROS messages for Kobuki"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
