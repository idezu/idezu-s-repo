#not yet tested do not use !!!
EAPI=7

inherit git-r3 cmake

DESCRIPTION="Maui Shell is a convergent shell for desktops, tablets, and phones."
HOMEPAGE="https://github.com/Nitrux/maui-shell"
EGIT_REPO_URI="https://github.com/Nitrux/maui-shell.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sci-mathematics/gmp-ecm-5.70.0"
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
		-DCMAKE_INSTALL_PREFIX=/usr 
		-DENABLE_BSYMBOLICFUNCTIONS=OFF 
		-DQUICK_COMPILER=ON 
		-DCMAKE_BUILD_TYPE=Release 
		-DCMAKE_INSTALL_SYSCONFDIR=/etc 
		-DCMAKE_INSTALL_LOCALSTATEDIR=/var 
		-DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON 
		-DCMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY=ON 
		-DCMAKE_INSTALL_RUNSTATEDIR=/run 
		-DCMAKE_VERBOSE_MAKEFILE=ON 
		-DCMAKE_INSTALL_LIBDIR=lib/x86_64-linux-gnu ..
	)
	cmake_src_configure
}

src_compile() {
	make
}

src_install() {
	make install
}
