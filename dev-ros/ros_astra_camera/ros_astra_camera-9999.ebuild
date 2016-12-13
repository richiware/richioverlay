EAPI=5

ROS_REPO_URI="https://github.com/orbbec/ros_astra_camera"
EGIT_BRANCH="filterlibrary"
KEYWORDS="~amd64 ~arm"
CATKIN_HAS_MESSAGES=yes
PYTHON_COMPAT=()

inherit ros-catkin

DESCRIPTION="Orbbec Astra camera"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
dev-ros/camera_info_manager
dev-ros/sensor_msgs
dev-ros/rgbd_launch
dev-ros/image_view
"
DEPEND="${RDEPEND}"
