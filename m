Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715592;
	b=JtItBBpLJiFOPmfe6xxm8/QD90hoAoC8EEJvjX+vo0J+CLgAlXi3OENYC3bOEbXqjoeP
	 FunmaoNqlNS4Em27jk+ECDXz8EuIz98KBjzEWO5MdC1e/m1TnSt0+C1larwhelsedb3eu
	 ARBMHZOfPfltz/ZHW68U8eE9dA3n6/SCyPu1mq+InVbyTuTpOkaeTPM4Jb5ZUjS3F9N3U
	 eas8yji5qBvAtd/KwMA/pdb6LzNpUnTCVtneIr47V097eJRvJFqrj0pqSvd9xEveoh7nM
	 tGpbcafY3+CEE/flq+YcJ27vkXG5vTOdz06AOgFQR64ZcTJ55RrY2yZ0UqdJR0BcK8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HraAlp5Z9pkU4VFXxPB/OmZEpWnOto3TvBIzbQ30zbc=;
	b=Q65U7skwGcfz+SBMs+Lg1YfT4Sl9+0wg/TrwMvuILaZWdbncQVyu+bCgmGZKgpdJLQ1l
	 y6YUeLiJ52SciaJoVEjlvzcxu0j3ZdWJ+XDc5tSQG741tutZFbqDfzin1QsplWiM34vV8
	 UCga6mYdHP6ADpFHNrGZLvCCUI9SNAB4g851iBzJB6BEgkHPjDk2z4r8pebR7RHjmWFnt
	 264xlX12D6PbiznPj9PK/a7/so7g11VJxbUWaXgcaTDiFzUztvyvnnpsUoa0pjktBQlYW
	 zIoKdG4sOjZ8UytWmCMVPfcKAyxdMYWqG8fOhdtHDV0nEu3RWTX9rSbkJETalVWtZhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUSnLy3z;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6756606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6756606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUSnLy3z
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5efadd183so1449000b3a.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794715591; x=1795320391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HraAlp5Z9pkU4VFXxPB/OmZEpWnOto3TvBIzbQ30zbc=;
        b=tUSnLy3zUj28j6FsV6LiBQnqrIlM7HzJBgFzo/Yjbm7TEPxPNz/5Ubm1qdW/9MmFOD
         2FJRTaSM9ENBgGu1dv/VzmGORmvE9MSBaURHJmhe2FCxiHvuarlLC5s6cHkNNJ7rgocg
         pV/9l0ii5Z1n37mHWHF6eyuILPzp1mweL/PJvyfvYAEZJZB6N+U6IrkIfOUb5BOYXK66
         PH3s9hEssLtxFTVgR2Se9HmzbUyvyOF9Jq0r3AdYfDG0NDTDOQiTGoN4v/L5PCtJCo0R
         0VgYbt8M9P3/jWcOnDvreztyiIu4Eh64aa/M32EWCOvVDjcNWeTvwmv76A/Ax08xq/QB
         ft2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794715591; x=1795320391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HraAlp5Z9pkU4VFXxPB/OmZEpWnOto3TvBIzbQ30zbc=;
        b=Gv43qLPTnesDB2LaaPvwhINdIPUFzLYy72hxcUojI3o0PnGMESpprxQN1lwAicgUHG
         299ziLF198p3/zx6eiMjMQ1hWJwcTMXc1wtTtx1QKJ8H8QcXtbFGmCfR10DbmODKepzs
         1lJ9KvGUs5Z8m1REu+kxAZIcvi59j5POe1e7qWFT8E7Xguf5kMqcxeZZX3dNsrEBm5Z3
         yADvgigCctSTjI7EcZErRKp5/82EUFsTeRaSolIhlTXI5zjVk5uCKg7xKzAjAPNcNbbU
         useJOzoVaRjpPdCtJ6GbbPbMJyrTu/voppKk6pWYU2ezz5LKVnisCugWpGH61rTHjiZD
         1uQg==
X-Gm-Message-State: APuU4Z82qwSIUDXd/mfKLoUIVngZAXMI78gp5NUwT2EAeVMAmSkuLTPw
	P3t/poZrFC9hKQgfNEP7GdxTsRRrlBwaL0t+1ZDfpQgCbuSlGexbwqmYiZq6tUeIVNs=
X-Gm-Gg: AYBFou2LmWiF0xxweVpg/xxsmDNYFQuQSL9HB95lADzJKWVa2jSh/p98n4AxPz+NwO3
	YpxuUrgeMWPWffMdh+kh20WH65lrIx2ui1m/1nvWKxBm0kTEGD8FKrCrNpKfQwutF9aNEMl1HyO
	n6s4lDbQkL0TA8J/YwXzulOctdsYnjbOVRx5fHaZFPyKBJUlbveSg4uG0TPRQ66D2FhTErRvnPY
	GgBbDO/IwrSUoW2b3//7iw4zxv9rFXBB9da/ygZuRCoXxEt/7XbxfkNzyn01Kinj7aggPfSwMQL
	/TkYEx+orwT7T/MHmUXRTAxT6pUU84GCqXuWzWkGRGn/mWmVTGS8bNpfAhsLsHgI4Syi5qndE5C
	g8lIRPbnS8m02gARMHJBGDeuxoWTkkCH3Uqx+WZCRvYcOlAoBPuoxMzNKwj5yf7yB/0/PU8a1L1
	PynFbUtWIhvxlcOa5M3nBqDZVgE9ymewjAO60fNENamR5RcyboG1q1bdAiRMsu+4pgoJUIGHeQH
	bj8jr/ZCxEMTAyEiRgKk4hajshrmfDTDZW5aEwGLj3vLcXJ/EIMs16LDUx7E13SX6VUWZk4mDvB
	delep+nko+ozMaCXT2bR0THtHjvMSNZpg1zuCR+wRz8qNEZwywHwIc5VdhHCFMItP21eK0ykaND
	U77s=
X-Received: by 2002:a05:6a00:802:b0:8a0:6417:8f9b with SMTP id d2e1a72fcca58-8bd62be6f46mr6530397b3a.32.1794715590830;
        Sat, 14 Nov 2026 20:06:30 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm2485668b3a.10.2026.11.14.20.06.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 20:06:29 -0800 (PST)
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
Subject: [PATCH net v5 2/2] selftests: net: add a test for vxlan snooping moving a MAC
Date: Sun, 15 Nov 2026 12:06:09 +0800
Message-ID: <20261115040609.61134-3-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115040609.61134-1-ilskdw@gmail.com>
References: <20261115040609.61134-1-ilskdw@gmail.com>
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
behind a router, and checks that traffic to the MAC still flows. This
fails while the device keeps the route cached for the previous remote.

The second case moves the MAC from a global IPv6 remote to a link-local
one, and checks that the FDB entry records the new output interface.

The third case adds a dynamic entry with a "via" device, and checks
that traffic from the entry's remote leaves the device in place.

The first two cases ping from CPU 0. The route cache is per CPU, and
only the CPU that filled it hits the stale entry.

This test was written with the help of an AI coding assistant.

Signed-off-by: Zhefu Peng <ilskdw@gmail.com>
---
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 199 ++++++++++++++++++
 2 files changed, 200 insertions(+)
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
index 000000000..5b7831043
--- /dev/null
+++ b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
@@ -0,0 +1,199 @@
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
+ping_from_cpu0()
+{
+	local ns=$1; shift
+
+	taskset -c 0 ip netns exec "$ns" ping -c 3 -W 1 -i 0.2 "$@" &> /dev/null
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
+	RET=0
+
+	setup_ns sw ex a r b
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
+	ping_from_cpu0 "$ex" 192.168.0.10
+	check_err $? "ping before the move failed"
+
+	ip -n "$a" link set vx0 down
+	ip -n "$b" link set vx0 up
+	ip netns exec "$b" ping -c 1 -W 1 192.168.0.1 &> /dev/null
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst 10.0.2.2 "
+	check_err $? "fdb entry did not move to the new remote"
+
+	ping_from_cpu0 "$ex" 192.168.0.10
+	check_err $? "ping after the move failed"
+
+	log_test "IPv4 move to a remote behind a router"
+}
+
+test_move_to_link_local()
+{
+	local ns
+
+	RET=0
+
+	setup_ns sw ex a b
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
+	ping_from_cpu0 "$ex" 192.168.0.10
+	check_err $? "ping before the move failed"
+
+	ip -n "$a" link set vx0 down
+	ip -n "$b" link set vx0 up
+	ip netns exec "$b" ping -c 1 -W 1 192.168.0.1 &> /dev/null
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst fe80::b via e0 "
+	check_err $? "fdb entry did not move to the new remote and interface"
+
+	ping_from_cpu0 "$ex" 192.168.0.10
+	check_err $? "ping after the move failed"
+
+	log_test "IPv6 move from a global to a link-local remote"
+}
+
+test_same_remote_keeps_via()
+{
+	RET=0
+
+	setup_ns sw ex a
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
+	ip netns exec "$a" ping -c 3 -W 1 -i 0.2 192.168.0.1 &> /dev/null
+	check_err $? "ping from the remote failed"
+
+	bridge -n "$ex" fdb show dev vx0 | grep -q "$MAC dst 10.0.1.2 via e0 "
+	check_err $? "fdb entry lost its via device"
+
+	log_test "Traffic from the same remote keeps the via device"
+}
+
+cleanup()
+{
+	defer_scopes_cleanup
+}
+
+require_command taskset
+
+trap cleanup EXIT
+tests_run
+
+exit "$EXIT_STATUS"
-- 
2.54.0

