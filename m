Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795819081;
	b=2NZqdEIi6jOkIRPp6FxxiXHF+Q0/OKJoYYQKRrcK0geNYjV8uD/ZIUYBo4aIA5gk3xYL
	 x7q7WII1emqF1R9enCW7uPvaYGZmGEVCyCv38pUf+IIwR9rREb8L+3sSkCfTFYBDDlq4t
	 LfKJMNMEfqRTxsjBd6XVUTxND7A4Mr7RRYQTq4PqJjku3QQtRX8/6P1McEn1/G9NYr1Ka
	 59DdKQymWXjjarEDQicp8YxdYJpM7YLhR+TvkSOMEA14vrpR90eqHEpqPz/T3lPiyntvK
	 V8AOrp21Ul+jFeOA0xtFBFb6kwHvofkvDl4f+Kun7oWmn8vD5Ac1O7ZV9A6XIdKllkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819081;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=owBk4iDcvDUYIi4skPC8MVBy75S6KDyQZLxxF59Cok4=;
	b=FICaBvEUXqxSu3vqS3kVsdfcLxol6mwHnJ0QSkBfmBZbDj7C8f3hVmBMGKK7OBZnJyUp
	 tjEM0sR5aad+R35I6deHdwOv39QCEs5YYqmYxODSFntvz+HGH5WHj+N+wx5QvcF3qI+R/
	 IvzlnliSfOegXx5pyTlCWth/UCDoPSZlNEdhSwNi4+LvCjkC5oAeItr9xYvesNKHH6JKh
	 mzFMVC9xzQuJnJk6eiOa7lVxilce/XpZv2ATbX5l4MaJtrPyPgPdAkCmtJbk9v33md2uX
	 sj+GCEHM9YCu3AnOti2RBnl5DbwdOjwXUyFRSs7lnvL30F637IP2Y2i2IvGtgLHVFDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOd33vm9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0A0606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOd33vm9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795819080;
	b=YTrhiFWvet4o8Lwc1J4q5B4ZB9kFihEwSsw+W2rpBkcWbhDJQ7Zd2/RFw6RutcEFjkO6
	 Pgn/yeswJ9SX+n++t+QH/G+ZHsxIuf60sn3w8e0Aa0SusSyeeunT2STxQYigi8u8HgbfB
	 p8o1B5Z8lVo9Tfu0gQj+Oz20Z2FNGz6ygAxAC29B5/KoPlwxFCxlhXTwqqe0Z59g1bHkl
	 7aGaeVRgC6dDtF+12VJt1xg0Wa2Wy/qVE5Afzhc0XAXsSmnFecqvClotWfOhT7SZHQsgO
	 U1DIz7QiR94VIZ0jaYlFc4RGc3dmtgQeetsGAhM8WXm0N+gaznU0tLnhSMUt9HKDkIg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795819080;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=owBk4iDcvDUYIi4skPC8MVBy75S6KDyQZLxxF59Cok4=;
	b=Gl5JEq4ooTs7oqoh/Dp9A2Xo0SL44alL/d3aGhXUTUwArYUhBmB2q7NtYVu9uwG9x2aY
	 EHDM4eoWaFPqrQ7izF7MGmF1dZAl+/xgv6v2rRJo7U/yvmLDuKr9YoA7EZhNPT/pcEQem
	 D1pJ0nuyUkCzHFFWsGiv28WEDSEv12v9WKvXJF8pMuqsWOLJjsFq9faV4pxQACZ2jg0+F
	 1GeKul4Scuwi/E2TsD/XY9El25I4N7KQgPuz84pxKuHAbgxJI3gPLfd1bxPyFIE9PiekN
	 un5DX03aMy0iNO9yUGs3YhtB8oksOtK4elsU53wDzwD/6qPCK4qYR+yd8CMFmqn2uBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53F341F00893;
	Fri, 27 Nov 2026 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795819080;
	bh=owBk4iDcvDUYIi4skPC8MVBy75S6KDyQZLxxF59Cok4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LOd33vm9u/wb/RrUFr6NsjC9qT+CF/KMgriFbhEVmNuc6XAhZ5SukuMxwTph3BWZ0
	 QNoDfgBwGCiWW+9G3zJmCAGvy5VAcruJO4VpdEz4x8K6Anr+8yPOyssUo++cmIcd9l
	 YoZ9goEUH++lGFgkwkwTgKAv2YCidktN5OtNmdshxMZITUS8brdHhbb6AZuAIjpDGc
	 8SHZITsFE+H2Te+Tb7e+n+gq3FLX2yxPyKwC7+epBpaueFUzuEvzJIqWv0XJnswTTt
	 FLMrNnpnO0B/yWKfH35xJeDkOreVdm3rlNQ/mfmSHrqp9MdW/LINXhmbh9AW+6TmvX
	 mV/VoF1eAmb8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF8D94DE5A;
	Fri, 27 Nov 2026 22:37:44 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Fri, 27 Nov 2026 23:37:40 +0100
Subject: [PATCH iproute2-next 2/3] ip: add the lisp link type
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-iproute2-lisp-v1-2-df8ea175bc06@free.fr>
References: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
In-Reply-To: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
To: David Ahern <dsahern@kernel.org>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, Matthieu Baerts <matttbe@kernel.org>, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795819063; l=8485;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=+ysE7hPAXIomvgClV6sSo2c8QlUQOfnnp5smPoELXPE=;
 b=SP7wYqIJqVDMDMsP4nblaD0yHKB54dg8lb7qEEYCELq6ATAS8EGggnuQl1X/nLMqZQQ9QiZcm
 +lom8kuKr5NBasw+cUkFGm3Xz8eV/DOinF4PWihhKd2dMKHO6yaRrM0
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

A LISP device is the data plane of the Locator/ID Separation Protocol
(RFC 9300) in the kernel. It carries the packets of an
instance ID, or of the instance IDs that have no device when it
collects metadata:

  ip link add lisp101 type lisp id 101 local 192.0.2.1 local 2001:db8::1
  ip link add lisp0 type lisp external

The local addresses are the source addresses of the packets that the
device sends, one per family. The generic "link" gives the device or
the VRF that the remote addresses, the routing locators, are reached
through:

  ip link add link wan name lisp101 type lisp id 101

The routing locator of a destination and, with "external", its
instance ID come from the encapsulation of its route or of its
nexthop, which ip already sets:

  ip -6 nexthop add id 1 encap ip dst 198.51.100.1 dev lisp101
  ip route add 10.2.0.0/24 nhid 1
  ip -6 nexthop add id 2 encap ip6 id 102 dst 2001:db8:2::1 dev lisp0

  $ ip -d link show lisp101
  9: lisp101: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1444 [...]
      link/none  promiscuity 0 allmulti 0 minmtu 68 maxmtu 65499
      lisp id 101 local 192.0.2.1 local 2001:db8::1 [...]
  $ ip -d -j link show lisp101 | jq -c '.[0].linkinfo'
  {"info_kind":"lisp","info_data":{"id":101,"local":"192.0.2.1","local6":"2001:db8::1"}}

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 ip/Makefile           |   2 +-
 ip/iplink.c           |   2 +-
 ip/iplink_lisp.c      | 137 ++++++++++++++++++++++++++++++++++++++++++++++++++
 man/man8/ip-link.8.in |  66 ++++++++++++++++++++++++
 4 files changed, 205 insertions(+), 2 deletions(-)

diff --git a/ip/Makefile b/ip/Makefile
index 978f6841..4cfcd243 100644
--- a/ip/Makefile
+++ b/ip/Makefile
@@ -13,7 +13,7 @@ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o ipnetns.o \
     ipvrf.o iplink_xstats.o ipseg6.o iplink_netdevsim.o iplink_rmnet.o \
     ipnexthop.o ipmptcp.o iplink_bareudp.o iplink_wwan.o ipioam6.o \
     iplink_amt.o iplink_batadv.o iplink_gtp.o iplink_virt_wifi.o \
-    iplink_netkit.o ipstats.o iplink_ovpn.o
+    iplink_netkit.o ipstats.o iplink_ovpn.o iplink_lisp.o
 
 RTMONOBJ=rtmon.o
 
diff --git a/ip/iplink.c b/ip/iplink.c
index 6b325e20..ed8a3dad 100644
--- a/ip/iplink.c
+++ b/ip/iplink.c
@@ -40,7 +40,7 @@ void iplink_types_usage(void)
 		"TYPE := { amt | bareudp | bond | bond_slave | bridge | bridge_slave |\n"
 		"          dsa | dummy | erspan | geneve | gre | gretap | gtp | hsr |\n"
 		"          ifb | ip6erspan | ip6gre | ip6gretap | ip6tnl |\n"
-		"          ipip | ipoib | ipvlan | ipvtap |\n"
+		"          ipip | ipoib | ipvlan | ipvtap | lisp |\n"
 		"          macsec | macvlan | macvtap | netdevsim |\n"
 		"          netkit | nlmon | ovpn | pfcp | rmnet | sit | team | team_slave |\n"
 		"          vcan | veth | vlan | vrf | vti | vxcan | vxlan | wwan |\n"
diff --git a/ip/iplink_lisp.c b/ip/iplink_lisp.c
new file mode 100644
index 00000000..cd83a9af
--- /dev/null
+++ b/ip/iplink_lisp.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * iplink_lisp.c	LISP device support
+ *
+ * Copyright (c) 2026 Vincent Jardin <vjardin@free.fr>, Free Mobile
+ *
+ * Authors:	Vincent Jardin <vjardin@free.fr>
+ */
+
+#include <stdio.h>
+#include <string.h>
+#include <linux/if_link.h>
+#include <linux/rtnetlink.h>
+
+#include "utils.h"
+#include "ip_common.h"
+
+/* An instance ID is 24 bits wide, RFC 9300 section 5.3. */
+#define LISP_IID_MAX	0xffffff
+
+static void print_explain(FILE *f)
+{
+	fprintf(f,
+		"Usage: ... lisp { id IID | external }\n"
+		"		[ local ADDR ]...\n"
+		"\n"
+		"Where:	IID  := 0-16777215\n"
+		"	ADDR := IPv4 or IPv6 address, at most one of each\n"
+	);
+}
+
+static void explain(void)
+{
+	print_explain(stderr);
+}
+
+static int lisp_parse_opt(struct link_util *lu, int argc, char **argv,
+			  struct nlmsghdr *n)
+{
+	inet_prefix local6 = {};
+	inet_prefix local = {};
+	bool external = false;
+	bool has_id = false;
+	inet_prefix addr;
+	__u32 id = 0;
+
+	while (argc > 0) {
+		if (strcmp(*argv, "id") == 0) {
+			NEXT_ARG();
+			if (has_id)
+				duparg("id", *argv);
+			if (get_u32(&id, *argv, 0) || id > LISP_IID_MAX)
+				invarg("invalid id", *argv);
+			has_id = true;
+		} else if (strcmp(*argv, "external") == 0) {
+			external = true;
+		} else if (strcmp(*argv, "local") == 0) {
+			NEXT_ARG();
+			get_addr(&addr, *argv, AF_UNSPEC);
+			if (addr.family == AF_INET6) {
+				if (local6.family)
+					duparg2("local", *argv);
+				local6 = addr;
+			} else if (addr.family == AF_INET) {
+				if (local.family)
+					duparg2("local", *argv);
+				local = addr;
+			} else {
+				invarg("invalid local address", *argv);
+			}
+		} else {
+			if (strcmp(*argv, "help") != 0)
+				fprintf(stderr,
+					"lisp: unknown command \"%s\"?\n",
+					*argv);
+			explain();
+			return -1;
+		}
+		argc--, argv++;
+	}
+
+	if (external == has_id) {
+		fprintf(stderr,
+			"lisp: one of \"id\" and \"external\" is required\n");
+		return -1;
+	}
+
+	if (external)
+		addattr(n, 1024, IFLA_LISP_COLLECT_METADATA);
+	else if (has_id)
+		addattr32(n, 1024, IFLA_LISP_ID, id);
+	if (local.family)
+		addattr_l(n, 1024, IFLA_LISP_LOCAL, local.data, local.bytelen);
+	if (local6.family)
+		addattr_l(n, 1024, IFLA_LISP_LOCAL6, local6.data,
+			  local6.bytelen);
+
+	return 0;
+}
+
+static void lisp_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
+{
+	if (!tb)
+		return;
+
+	if (tb[IFLA_LISP_ID])
+		print_uint(PRINT_ANY, "id", "id %u ",
+			   rta_getattr_u32(tb[IFLA_LISP_ID]));
+
+	if (tb[IFLA_LISP_COLLECT_METADATA])
+		print_bool(PRINT_ANY, "external", "external ", true);
+
+	if (tb[IFLA_LISP_LOCAL])
+		print_color_string(PRINT_ANY, COLOR_INET, "local", "local %s ",
+				   format_host_rta(AF_INET,
+						   tb[IFLA_LISP_LOCAL]));
+
+	if (tb[IFLA_LISP_LOCAL6])
+		print_color_string(PRINT_ANY, COLOR_INET6, "local6",
+				   "local %s ",
+				   format_host_rta(AF_INET6,
+						   tb[IFLA_LISP_LOCAL6]));
+}
+
+static void lisp_print_help(struct link_util *lu, int argc, char **argv,
+			    FILE *f)
+{
+	print_explain(f);
+}
+
+struct link_util lisp_link_util = {
+	.id		= "lisp",
+	.maxattr	= IFLA_LISP_MAX,
+	.parse_opt	= lisp_parse_opt,
+	.print_opt	= lisp_print_opt,
+	.print_help	= lisp_print_help,
+};
diff --git a/man/man8/ip-link.8.in b/man/man8/ip-link.8.in
index 8fd900e6..97990a4c 100644
--- a/man/man8/ip-link.8.in
+++ b/man/man8/ip-link.8.in
@@ -280,6 +280,7 @@ ip-link \- network device configuration
 .BR ipoib " |"
 .BR ipvlan " |"
 .BR ipvtap " |"
+.BR lisp " |"
 .BR lowpan " |"
 .BR macsec " |"
 .BR macvlan  " | "
@@ -410,6 +411,9 @@ Link types:
 .BR ipvtap
 - Interface for L3 (IPv6/IPv4) based VLANs and TAP
 .sp
+.BR lisp
+- Locator/ID Separation Protocol (LISP) tunnel
+.sp
 .BR lowpan
 - Interface for 6LoWPAN (IPv6) over IEEE 802.15.4 / Bluetooth
 .sp
@@ -1596,6 +1600,68 @@ When
 is "ipv4", this allows the tunnel to also handle IPv6. This option is disabled
 by default.
 
+.TP
+LISP Type Support
+For a link of type
+.I LISP
+the following additional arguments are supported:
+
+.BI "ip link add " DEVICE
+[
+.BI link " DEVICE "
+]
+.BR type " lisp " {
+.BI id " IID "
+|
+.B external
+} [
+.BI local " ADDR "
+]...
+
+.in +8
+.sp
+.BI id " IID"
+- specifies the instance ID of the packets that the device sends and receives,
+from 0 to 16777215.
+
+.sp
+.B external
+- makes the device serve the instance IDs that have no device: the instance ID
+of a packet comes from its tunnel metadata, as the
+.B id
+of the encapsulation of its route.
+.B ip rule
+or
+.B tc
+find it there for the packets that the device receives. One of
+.B id
+and
+.B external
+is required.
+
+.sp
+.BI local " ADDR"
+- specifies the source address of the packets sent to a routing locator of the
+same family, when the encapsulation of the route does not give one. It can be
+given once per family.
+
+.sp
+.BI link " DEVICE"
+- specifies the device, or the VRF, that the routing locators are reached
+through.
+
+.in -8
+The routing locator of a destination is the
+.B dst
+of the encapsulation of its route or of its nexthop,
+.B encap ip
+or
+.BR "encap ip6" ,
+see
+.BR ip-route (8)
+and
+.BR ip-nexthop (8).
+
 .TP
 AMT Type Support
 For a link of type

-- 
2.43.0


