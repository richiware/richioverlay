# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/turtlebot/turtlebot_simulator"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Launchers for Gazebo simulation of the TurtleBot"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/turtlebot
dev-ros/turtlebot_create
dev-ros/turtlebot_apps
dev-ros/turtlebot_msgs
dev-ros/turtlebot_interactions
"
DEPEND="${RDEPEND}"
