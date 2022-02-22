# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

DESCRIPTION="Sony Playstation Vita Emulator"
HOMEPAGE="https://vita3k.org"
EGIT_REPO_URI="https://github.com/Vita3K/Vita3K.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lto"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-vcs/git
	sys-devel/gcc
	dev-util/ninja
	dev-util/cmake
	"

src_prepare() {
        cmake_src_prepare
        git submodule  update --init --recursive
}

src_configure() {
        local mycmakeargs=(
                use lto -DENABLE_LTO=ON
                -G Ninja
                -Boost_USE_STATIC_LIBS=ON
		-DCMAKE_TOOLCHAIN_FILE=./cmake/toolchain/linux-x64.cmake
        )
        cmake_src_configure
}
