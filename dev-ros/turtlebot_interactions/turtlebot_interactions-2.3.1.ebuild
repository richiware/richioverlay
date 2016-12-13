# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/turtlebot/turtlebot_interactions"
SRC_URI="https://github.com/turtlebot/turtlebot_interactions/archive/2.3.1.tar.gz"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="User side interactions for working with a turtlebot"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
