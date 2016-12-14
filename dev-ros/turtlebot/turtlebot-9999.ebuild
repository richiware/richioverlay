# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/turtlebot/turtlebot"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="The turtlebot stack provides all the basic drivers for running and using a TurtleBot"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/kobuki_desktop
dev-ros/joystick_drivers
"
DEPEND="${RDEPEND}"
