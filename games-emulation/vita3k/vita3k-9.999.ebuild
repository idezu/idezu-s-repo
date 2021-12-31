# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Sony Playstation Vita Emulator"
HOMEPAGE="https://vita3k.org"
SRC_URI="https://github.com/Vita3K/Vita3K/archive/refs/tags/continuous.zip -> ${P}.zip"
S="${WORKDIR}/Vita3K-continuous"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lto"

DEPEND="
	dev-libs/boost
	dev-util/ninja
	media-libs/libsdl2
	dev-vcs/git
	sys-devel/gcc
	dev-util/ninja
	dev-util/cmake
	virtual/pkgconfig
	gui-libs/gtk
"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		use lto -DENABLE_LTO=ON
		-G Ninja
		-DCMAKE_TOOLCHAIN_FILE=./cmake/toolchain/linux-x64.cmake
	)
	cmake_src_configure
}
