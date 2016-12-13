# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
CATKIN_HAS_MESSAGES=yes
ROS_REPO_URI="https://github.com/yujinrobot/kobuki_core"
SRC_URI="https://github.com/yujinrobot/kobuki_core/archive/0.7.1.tar.gz"
KEYWORDS="~amd64 ~arm"

inherit ros-catkin

DESCRIPTION="Core (non-ros) kobuki packages"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="dev-ros/ecl_navigation
<dev-embedded/ftdi_eeprom-1.0
"
DEPEND="${RDEPEND}"
