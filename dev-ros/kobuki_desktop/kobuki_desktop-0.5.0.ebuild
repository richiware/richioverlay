# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/yujinrobot/kobuki_desktop"
SRC_URI="https://github.com/yujinrobot/kobuki_desktop/archive/0.5.0.tar.gz"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Visualisation and simulation tools for Kobuki"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/kobuki
dev-ros/rqt_plot
"
DEPEND="${RDEPEND}"
