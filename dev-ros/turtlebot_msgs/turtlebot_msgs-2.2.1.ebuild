# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/turtlebot/turtlebot_msgs"
SRC_URI="https://github.com/turtlebot/turtlebot_msgs/archive/2.2.1.tar.gz"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Turtlebot messages, services and actions"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/sensor_msgs"
DEPEND="${RDEPEND}"
