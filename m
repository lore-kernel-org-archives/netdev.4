Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081991;
	b=mSQXiXbZMHTPx7Cy8e0FSqRIlhM0cdMqT2SVnqJUQ2FROIAZFuPpdXVgcZd97i5BMxHG
	 Ogym0tisKyFyDQlug67OX9TsInrdibdw4HTUkRdWQvxCeCMadx9Sf5F73HLbQXI7qnNik
	 uXHW4awi1IpZTi5zzcu1TkyZWsAA6T/TVsx5CBpgkzaSddyKWQNXdKoqUt2irbXXnlYeX
	 LN8eI1x2eF5zGw31dzNEY75Mvj88vdMjA+PQ0Ri8l4Xb7fqF0fQOpNqiYVuh3H1KAh79y
	 w7xZAiz26WS3SxfZCTM77DBI6+zF3rZAEG3Uw2VMvTxDwmvLCnzHdCnKyC5ikV9hN/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A+aU9SIn2Zhiu/uvRNR7gVgAVOlE/lo6ePmTFuyRaj0=;
	b=v2XJu6iMnamb3W1lGFIlNwojsrrhYB55In0TytjYaW4z0zNJTvrAtvWueZsB6SHBOU2f
	 eXFZLAnID0lXGNZreixHpnAMSjuKzX79d3BWO9iEvO5TcydpAJckPsf4jVguow3ZDMJKS
	 X25SThWPjScb9bRuf7MIwdnXkUPD+Bb80BWmop/f/2A3V1Hw0BjKc7apVgFUUptJe5Pb7
	 Rg8NU6/hWmTmFHQaiUj6iXCGEQZq1nAMTh/NNNpEVA2k9RHs13F1UTotugXlhELD4w00F
	 xEID/NGIKtyA85gyPLK/fz9qzqmXQPxNBW0+7bAB6tW1hcVSYX36Yd9dGl7ARUm1K9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=akvbrKpA;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A430606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A430606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=akvbrKpA
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4139101c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081990; x=1795686790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+aU9SIn2Zhiu/uvRNR7gVgAVOlE/lo6ePmTFuyRaj0=;
        b=akvbrKpAOrneaIgcnfJZk8zsV6GIu5bfoiQaSgz9Rcwe76DkeB0kS9fVad281LiadH
         MoKVzuRGAoJdAbOvb+9z4AVAdPQb6mALszieK8SQEUOs2jSFGYRzGtNQeF17PrXTYVTY
         FZvKOQ67KsdGSzdlqKAVmu+qEdc7njqp3GZSEvRetdprbQcjt1zK7vliYcB8PCWR4vK4
         bBIk1T+GdNGGMcg6x1l8/j88+sI0w/A+2JYj3mjuhbEHetw7G3oAir8vUY67m0H6wxxi
         PHw8dNqSV0LEWHGJjUy2xPmvghyZ7YDtJESK6hjJU7+goRBYOeqwgOGyPiHiKVfEwLuv
         maCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081990; x=1795686790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+aU9SIn2Zhiu/uvRNR7gVgAVOlE/lo6ePmTFuyRaj0=;
        b=gOEgSJwc7VO+iD/MnPOMjCrQSPRSp/24jhbSpoCqLazWYBHevjLtOQ990MTiNRkieB
         XFeEm/t3xJbS9j2MTpvJNMteZMKQ77u/dzwKPw135dwaBLPAbX56PxFKDXphBHXnTa9m
         v6LpieS2JYPcQ0dW2V/X/zgKjx3UdimeLkplqGQm4eZ3xQyrdhTcHLXgISvKB7tJCcxh
         bFy/O2FQZU0gjQ8hlN+1ST6W0mPng4HSfVp4KOnkFIxdVt9ERVSRSb0BaaLj1Gr7uw8P
         UVFXTyuRn/qJpHewa/a66cvFMj3ncFIlEu96NYLGdGgtDcO86I0dWcaW8rj3cIw0SM3N
         IOzg==
X-Gm-Message-State: APuU4Z/QK7Qw2tn0QxikCSh+V+cJsym6Q4Y53/krIQUBaoQnMjWYvvgL
	6XSKYehdiUhZuEmm3v9GbdPYE15TXZDTwMD+KneNfw104L4BU2jn5avG9oSa0fSc
X-Gm-Gg: AYBFou2xuVdBBKFP0gXagbzbm50Rtkr29ODFeTV6Rrt3MT96xLBqwSIbwAr7wbNxSy/
	6CYKBXNxXnFlPnIEgVl2TE4R1ISHX8JiPmbPx4IYM6qeob5uegQlBrXOSHCXRzZxXL7C3wy85bM
	oby+qZE1SQqsSisxxcQ7NX79Hr46M86dsPLzYR/5zSf+IBc3lZngB5Pgv6CHX3LAIHvQ7QHBuzd
	yR/VLXh7hJhoSN2M2lPoxjxF+Pbfa/hBgf5uNksgmMaxFYQGTV3+GhP2zR3D931BN5R6yp9iTj5
	xq5lXqHLgSQN1IVahto6UwB124lMhty2sWID2WnlPPomacfKkMhC8vqSYxJL2q3+IPUm7eb4iLh
	e8O9BDoXxtK+rTxj2LiGiISe62A6gij/vmAt5qu8oncsDX7ZWVb7QvkThD3MCwoyY+7XHwcP3Ld
	rm1YcLWKhmRMhrWzNJdWLLuWAFuv/8jjJVQ7wHaXHYLRAo/Dtqu1y8iu9xUYFJjpkMoy0rgD0NI
	DLT0f8lB/XiiBP7QD47GTSe4El0xRSVXcf3C+W1Q1lAUZsVSurD24JZDJAqWv1dpAWxhAVuuRd7
	xlYZP01GWGPASFjRjLbcX91XZOe9zllN1I49vAqqNJyGYUbBhll2unSDxqtSgr3F6c48A4L5ioE
	COOY=
X-Received: by 2002:a05:7023:a8b:b0:1af:d88f:fc51 with SMTP id a92af1059eb24-1b543d264e1mr5503203c88.30.1795081989999;
        Thu, 19 Nov 2026 01:53:09 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5b02sm12862850c88.6.2026.11.19.01.53.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 01:53:09 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v6 2/2] selftests: net: add a test for vxlan snooping moving a MAC
Date: Thu, 19 Nov 2026 17:52:56 +0800
Message-ID: <20261119095256.42005-3-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119095256.42005-1-ilskdw@gmail.com>
References: <20261119095256.42005-1-ilskdw@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test for a learning VXLAN device that snoops a known MAC.

The first case moves the MAC from an on-link IPv4 remote to a remote
behind a router, and checks that traffic to the MAC still flows. Its
pings run on one CPU, because the route cache is per CPU and only the
CPU that filled it hits the stale entry. This case fails while the
device keeps the route cached for the previous remote.

The second case moves the MAC from a global IPv6 remote to a link-local
one, and checks that the FDB entry records the new output interface.
Both remotes are on-link, so this case checks the interface, not the
route cache.

The third case adds a dynamic entry with a "via" device, and checks
that traffic from the entry's remote leaves the device in place.

This test was written with the help of an AI coding assistant.

Signed-off-by: Zhefu Peng <ilskdw@gmail.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 222 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index baea3e7f0..69d440c5b 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -118,6 +118,7 @@ TEST_PROGS := \
 	test_vxlan_mdb.sh \
 	test_vxlan_nh.sh \
 	test_vxlan_nolocalbypass.sh \
+	test_vxlan_snoop_move.sh \
 	test_vxlan_under_vrf.sh \
 	test_vxlan_vnifilter_notify.sh \
 	test_vxlan_vnifiltering.sh \
diff --git a/tools/testing/selftests/net/test_vxlan_snoop_move.sh b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
new file mode 100755
index 000000000..e1f0ebb19
--- /dev/null
+++ b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
@@ -0,0 +1,222 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Check that a learning VXLAN device fully updates a remote when snooping
+# moves a known MAC to another VTEP:
+#
+# - The route cached for the old remote is dropped. The old remote is
+#   on-link and the new one is behind a router, so a stale cached route
+#   blackholes traffic to the moved MAC.
+# - The output interface follows the new remote. The MAC moves from a
+#   global IPv6 address to a link-local one, which needs an interface.
+# - Traffic from the remote of a dynamic entry keeps the entry's "via"
+#   device.
+
+# shellcheck disable=SC2154,SC2329 # set by setup_ns, run by tests_run
+source lib.sh
+
+ALL_TESTS="
+	test_move_behind_router
+	test_move_to_link_local
+	test_same_remote_keeps_via
+"
+
+MAC=02:00:c0:a8:00:0a
+
+ping_ns()
+{
+	local ns=$1; shift
+
+	ip netns exec "$ns" ping -c 3 -W 1 -i 0.2 "$@" &> /dev/null
+}
+
+ping_pinned()
+{
+	local ns=$1; shift
+
+	taskset -c "$CPU" ip netns exec "$ns" ping -c 3 -W 1 -i 0.2 "$@" \
+		&> /dev/null
+}
+
+add_sw_port()
+{
+	local ns=$1; shift
+	local dev=$1; shift
+	local port=$1; shift
+
+	ip link add "$dev" netns "$ns" type veth peer name "$port" netns "$sw"
+	ip -n "$sw" link set "$port" master br0 up
+	ip -n "$ns" link set "$dev" up
+}
+
+test_move_behind_router()
+{
+	local name="IPv4 move to a remote behind a router"
+
+	RET=0
+
+	if ! setup_ns sw ex a r b; then
+		log_test_skip "$name"
+		return
+	fi
+	defer cleanup_ns "$sw" "$ex" "$a" "$r" "$b"
+
+	ip -n "$sw" link add br0 up type bridge
+	add_sw_port "$ex" e0 s-e
+	add_sw_port "$a" a0 s-a
+	add_sw_port "$r" r0 s-r
+	ip link add r1 netns "$r" type veth peer name b0 netns "$b"
+	ip -n "$r" link set r1 up
+	ip -n "$b" link set b0 up
+
+	ip -n "$ex" addr add 10.0.1.1/24 dev e0
+	ip -n "$ex" route add default via 10.0.1.254
+	ip -n "$a" addr add 10.0.1.2/24 dev a0
+	ip -n "$r" addr add 10.0.1.254/24 dev r0
+	ip -n "$r" addr add 10.0.2.254/24 dev r1
+	ip netns exec "$r" sysctl -wq net.ipv4.ip_forward=1
+	ip -n "$b" addr add 10.0.2.2/24 dev b0
+	ip -n "$b" route add default via 10.0.2.254
+
+	ip -n "$ex" link add vx0 type vxlan id 42 dstport 4789 \
+		local 10.0.1.1 learning
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst 10.0.1.2
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst 10.0.2.2
+	ip -n "$ex" addr add 192.168.0.1/24 dev vx0
+	ip -n "$ex" link set vx0 up
+
+	ip -n "$a" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 10.0.1.2 remote 10.0.1.1
+	ip -n "$b" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 10.0.2.2 remote 10.0.1.1
+	ip -n "$a" addr add 192.168.0.10/24 dev vx0
+	ip -n "$b" addr add 192.168.0.10/24 dev vx0
+	ip -n "$a" link set vx0 up
+
+	ping_pinned "$ex" 192.168.0.10
+	check_err $? "ping before the move failed"
+
+	ip -n "$a" link set vx0 down
+	ip -n "$b" link set vx0 up
+	ip netns exec "$b" ping -c 1 -W 1 192.168.0.1 &> /dev/null
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst 10.0.2.2 "
+	check_err $? "fdb entry did not move to the new remote"
+
+	ping_pinned "$ex" 192.168.0.10
+	check_err $? "ping after the move failed"
+
+	log_test "$name"
+}
+
+test_move_to_link_local()
+{
+	local name="IPv6 move from a global to a link-local remote"
+	local ns
+
+	RET=0
+
+	if ! setup_ns sw ex a b; then
+		log_test_skip "$name"
+		return
+	fi
+	defer cleanup_ns "$sw" "$ex" "$a" "$b"
+
+	for ns in "$sw" "$ex" "$a" "$b"; do
+		ip netns exec "$ns" sysctl -wq net.ipv6.conf.all.accept_dad=0
+		ip netns exec "$ns" sysctl -wq \
+			net.ipv6.conf.default.accept_dad=0
+	done
+
+	ip -n "$sw" link add br0 up type bridge
+	add_sw_port "$ex" e0 s-e
+	add_sw_port "$a" a0 s-a
+	add_sw_port "$b" b0 s-b
+
+	ip -n "$ex" addr add 2001:db8:1::1/64 dev e0 nodad
+	ip -n "$ex" addr add fe80::1/64 dev e0 nodad
+	ip -n "$a" addr add 2001:db8:1::2/64 dev a0 nodad
+	ip -n "$b" addr add fe80::b/64 dev b0 nodad
+
+	ip -n "$ex" link add vx0 type vxlan id 42 dstport 4789 \
+		local 2001:db8:1::1 learning
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst 2001:db8:1::2
+	bridge -n "$ex" fdb append 00:00:00:00:00:00 dev vx0 dst fe80::b via e0
+	ip -n "$ex" addr add 192.168.0.1/24 dev vx0
+	ip -n "$ex" link set vx0 up
+
+	ip -n "$a" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 2001:db8:1::2 remote 2001:db8:1::1
+	ip -n "$b" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local fe80::b remote fe80::1 dev b0 nolearning
+	ip -n "$a" addr add 192.168.0.10/24 dev vx0
+	ip -n "$b" addr add 192.168.0.10/24 dev vx0
+	ip -n "$a" link set vx0 up
+
+	ping_ns "$ex" 192.168.0.10
+	check_err $? "ping before the move failed"
+
+	ip -n "$a" link set vx0 down
+	ip -n "$b" link set vx0 up
+	ip netns exec "$b" ping -c 1 -W 1 192.168.0.1 &> /dev/null
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst fe80::b via e0 "
+	check_err $? "fdb entry did not move to the new remote and interface"
+
+	ping_ns "$ex" 192.168.0.10
+	check_err $? "ping after the move failed"
+
+	log_test "$name"
+}
+
+test_same_remote_keeps_via()
+{
+	local name="Traffic from the same remote keeps the via device"
+
+	RET=0
+
+	if ! setup_ns sw ex a; then
+		log_test_skip "$name"
+		return
+	fi
+	defer cleanup_ns "$sw" "$ex" "$a"
+
+	ip -n "$sw" link add br0 up type bridge
+	add_sw_port "$ex" e0 s-e
+	add_sw_port "$a" a0 s-a
+
+	ip -n "$ex" addr add 10.0.1.1/24 dev e0
+	ip -n "$a" addr add 10.0.1.2/24 dev a0
+
+	ip -n "$ex" link add vx0 type vxlan id 42 dstport 4789 \
+		local 10.0.1.1 learning
+	bridge -n "$ex" fdb add "$MAC" dev vx0 dst 10.0.1.2 via e0 dynamic
+	ip -n "$ex" addr add 192.168.0.1/24 dev vx0
+	ip -n "$ex" link set vx0 up
+
+	ip -n "$a" link add vx0 address "$MAC" type vxlan id 42 dstport 4789 \
+		local 10.0.1.2 remote 10.0.1.1
+	ip -n "$a" addr add 192.168.0.10/24 dev vx0
+	ip -n "$a" link set vx0 up
+
+	ping_ns "$a" 192.168.0.1
+	check_err $? "ping from the remote failed"
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst 10.0.1.2 via e0 "
+	check_err $? "fdb entry lost its via device"
+
+	log_test "$name"
+}
+
+cleanup()
+{
+	defer_scopes_cleanup
+}
+
+require_command taskset
+CPU=$(taskset -pc $$ | sed 's/.*: //; s/[-,].*//')
+
+trap cleanup EXIT
+tests_run
+
+exit "$EXIT_STATUS"
-- 
2.54.0

