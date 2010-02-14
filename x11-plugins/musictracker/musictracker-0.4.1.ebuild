# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A Pidgin plugin to advertise the currently playing song on your
favourite music player in your status message."
HOMEPAGE="http://code.google.com/p/musictracker/"
SRC_URI="http://musictracker.googlecode.com/files/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

DEPEND=">=net-im/pidgin-2.0.0
		>=sys-apps/dbus-0.62
		dev-libs/libpcre"

src_compile() {
	econf \
		$(use_enable debug) || die "econf failure"
	emake || die "emake failure"
}

src_install() {
	make install DESTDIR=${D} || die "make install failure"
	dodoc AUTHORS COPYING ChangeLog INSTALL README THANKS 
}
