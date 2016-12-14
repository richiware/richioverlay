# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/turtlebot/turtlebot_apps"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="A group of simple demos and exmaples to run on your TurtleBot to help you get started with ROS and TurtleBot"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/image_geometry
dev-ros/visualization_msgs
dev-ros/depth_image_proc
dev-ros/robot_state_publisher
"
DEPEND="${RDEPEND}"
