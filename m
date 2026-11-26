Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656837;
	b=xtoIIvDXdWqatGwEZmxAIszmKmGmY2uz2jinAsrKcONhJg1ejFgWqndCUzR5iXEGefDz
	 RvqGLwGaviHFklVHkuT5JJoqsuBokMBSLEGgrYj6yyXIDCpOxKQlihv7uR6w86cnMkMW4
	 NWHlMTB0TAMidkgeJ3ro1ygKo69hERzYBspTmci9ydeFD3IYOyRkJax1fFk5ThLKHgaIg
	 wDRbONxeGM8ztfq+9sGy5So/oN6BX2qioEa0B0dIrAAHEMTYi3TXk/cgC8G97jf5b0etp
	 S4dTmK04nS1RsyxY7s00fnDFlc0MeZen3gsKPXOrsnYCJFXJYq1ZsRb7SK2vtE9Ukag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656837;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VQYnJLnWH7S2BjMZDCUYIDIybgaJuYkxv1LZSLJO9LI=;
	b=JJQkCzM72eH6YxZP0pFfXgdVvKbKuSctg/UKcjwt07BE4wWRRv6ch9f37gu/G8JXWALW
	 gst3ZLv0wf1WI8j4UGCaJD0SYbFzCsoE+WX+yOK/vUqZVd3zQ2Y0/gny/NNJEqinTLf5Z
	 LdYiQ7/TnEgwEwydfkypBagZEABMFOkluq606Afej6o/sW5hhSNoCyMgIM9ITa2wdwwVe
	 lGhDYe8YQyrgWH9rHsJDHkHT8cAGN8KaqEM4sbCcku6/My7S6jpg5I1s+s6i+ynKw2+Pc
	 mJ/rHnh19cCRzanb2BF/9WnXtzaAQo5ct4HyXWYSS16yNMxL7U88CiziFkSwWEdhqNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZ0Y6EHK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC2F606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZ0Y6EHK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66D51F000C0;
	Thu, 26 Nov 2026 01:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656837;
	bh=VQYnJLnWH7S2BjMZDCUYIDIybgaJuYkxv1LZSLJO9LI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GZ0Y6EHKRWib4Ev4YL9YSOD+wnjsghmp9QS/Vs6WjgZB2yf+MnPuJYMio2CfOtbh8
	 B7im/QXmlxvRr9riHqiddlOh4VS/SBt4H9dUZ2afv+x31jkIFXDYwqngl8/4bXCGZg
	 Xr9N4b5YcrQhiWza7Jg+JbQHK4eMmbEmi0xW48x1AeyjAjsF6J6lZJawFzZHOED2Q6
	 OsUNe1zXq6PJXGq1V665AqF1EUBvczy30R2oNOZibV9IWeo9dFpgiBcztB2ehW9r7O
	 Gswm0JEabC8RgGdr3dRgqedkjB6X0zkvT9G6BOFyTwrr1CJBL4ND39/DkWvTpl21af
	 KsrHD/x6iPmcw==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ralf@mandelbit.com,
	ja@ssi.bg,
	David Ahern <dahern@nvidia.com>
Subject: [PATCH net-next v2 11/13] selftests: net: pmtu: check that a deleted cached exception stays deleted
Date: Wed, 25 Nov 2026 18:33:37 -0700
Message-ID: <c1700ffd419c7247da4c896cb09f384894c32f43.1795642432.git.dahern@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1795642432.git.dahern@nvidia.com>
References: <cover.1795642432.git.dahern@nvidia.com>
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

From: David Ahern <dahern@nvidia.com>

Add a test that learns a PMTU from a packet too big message, changes
the FIB with a route that has nothing to do with the destination, and
deletes the cached exception without looking the destination up in
between. After a FIB change the exception's dst is stale, and a lookup
that handed it out would replace it with a current copy: deleting it
must work on a stale exception too, and nothing may then bring it back.

Check that neither a route lookup nor a packet that fits, which looks
the route up as well, creates the exception again, and that a packet
that exceeds the PMTU does, through a new packet too big message. The
cache is dumped to see the exception, as that does not look the
destination up and so does not refresh it.

The test is run again with nexthop objects like the other exception
tests, which takes the deletion through the nexthop path.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
 tools/testing/selftests/net/pmtu.sh | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
index c7cd271714ef..5e44ff3a6515 100755
--- a/tools/testing/selftests/net/pmtu.sh
+++ b/tools/testing/selftests/net/pmtu.sh
@@ -198,6 +198,14 @@
 # - pmtu_ipv6_route_change
 #	Same as above but with IPv6
 #
+# - pmtu_ipv6_cached_del
+#	Use the same topology as in pmtu_ipv6. Learn a PMTU from a packet too big
+#	message, change the FIB with an unrelated route add and, without looking
+#	the destination up in between, delete the cached exception. Check that
+#	neither a route lookup nor a packet that does not exceed the PMTU
+#	brings the exception back, and that a packet that does exceed it
+#	creates a new one
+#
 # - pmtu_ipv4_mp_exceptions
 #	Use the same topology as in pmtu_ipv4, but add routeable addresses
 #	on host A and B on lo reachable via both routers. Host A and B
@@ -272,6 +280,7 @@ tests="
 	list_flush_ipv6_exception	ipv6: list and flush cached exceptions	1
 	pmtu_ipv4_route_change		ipv4: PMTU exception w/route replace	1
 	pmtu_ipv6_route_change		ipv6: PMTU exception w/route replace	1
+	pmtu_ipv6_cached_del		ipv6: delete a cached PMTU exception after a FIB change	1
 	pmtu_ipv4_mp_exceptions		ipv4: PMTU multipath nh exceptions	1"
 
 # Addressing and routing for tests with routers: four network segments, with
@@ -2377,6 +2386,87 @@ test_pmtu_ipv6_route_change() {
 	test_pmtu_ipvX_route_change 6
 }
 
+# Is there a cached exception for ${2} in the namespace ${1}? Dumping the cache
+# does not look the destination up, so it does not touch the exception
+cached_exception_exists() {
+	ns_cmd="${1}"
+	dst="${2}"
+
+	${ns_cmd} ip -oneline -6 route list cache | grep -qw -- "${dst}"
+}
+
+test_pmtu_ipv6_cached_del() {
+	setup namespaces routing || return $ksft_skip
+	trace "${ns_a}"  veth_A-R1    "${ns_r1}" veth_R1-A \
+	      "${ns_r1}" veth_R1-B    "${ns_b}"  veth_B-R1 \
+	      "${ns_a}"  veth_A-R2    "${ns_r2}" veth_R2-A \
+	      "${ns_r2}" veth_R2-B    "${ns_b}"  veth_B-R2
+
+	dst="${prefix6}:${b_r1}::1"
+
+	# Set up initial MTU values
+	mtu "${ns_a}"  veth_A-R1 2000
+	mtu "${ns_r1}" veth_R1-A 2000
+	mtu "${ns_r1}" veth_R1-B 1400
+	mtu "${ns_b}"  veth_B-R1 1400
+
+	mtu "${ns_a}"  veth_A-R2 2000
+	mtu "${ns_r2}" veth_R2-A 2000
+	mtu "${ns_r2}" veth_R2-B 1500
+	mtu "${ns_b}"  veth_B-R2 1500
+
+	# Learn a PMTU from a packet too big message
+	run_cmd ${ns_a} ${ping6} -q -M want -i 0.1 -w 1 -s 1800 ${dst}
+
+	pmtu="$(route_get_dst_pmtu_from_exception "${ns_a}" ${dst})"
+	check_pmtu_value "1400" "${pmtu}" "exceeding MTU" || return 1
+
+	# Change the FIB with a route that has nothing to do with ${dst}. Any
+	# FIB change makes the cached dsts of the namespace stale. Do not look
+	# ${dst} up from here to the deletion: that would refresh the
+	# exception
+	run_cmd ${ns_a} ip -6 route add unreachable "${prefix6}:ff::/64"
+
+	if ! cached_exception_exists "${ns_a}" ${dst}; then
+		err "  PMTU exception disappeared after an unrelated route add"
+		return 1
+	fi
+
+	# Delete the cached exception
+	run_cmd ${ns_a} ip -6 route flush cached ${dst}
+
+	if cached_exception_exists "${ns_a}" ${dst}; then
+		err "  PMTU exception still there after deleting it"
+		return 1
+	fi
+
+	# A lookup must not bring it back
+	run_cmd ${ns_a} ip -6 route get ${dst}
+
+	if cached_exception_exists "${ns_a}" ${dst}; then
+		err "  PMTU exception came back after a route lookup"
+		return 1
+	fi
+
+	# Neither must a packet that fits, which looks the route up as well
+	run_cmd ${ns_a} ${ping6} -q -c 1 -w 1 -s 1000 ${dst}
+
+	pmtu="$(route_get_dst_pmtu_from_exception "${ns_a}" ${dst})"
+	check_pmtu_value "" "${pmtu}" "deleting the exception and a lookup" || return 1
+
+	if cached_exception_exists "${ns_a}" ${dst}; then
+		err "  PMTU exception came back after a packet that fits"
+		return 1
+	fi
+
+	# A packet that exceeds the PMTU does, through a new packet too big
+	# message. This is what learning it again looks like
+	run_cmd ${ns_a} ${ping6} -q -M want -i 0.1 -w 1 -s 1800 ${dst}
+
+	pmtu="$(route_get_dst_pmtu_from_exception "${ns_a}" ${dst})"
+	check_pmtu_value "1400" "${pmtu}" "exceeding MTU after the deletion" || return 1
+}
+
 test_pmtu_ipv4_mp_exceptions() {
 	setup namespaces routing multipath || return $ksft_skip
 
-- 
2.54.0 (Apple Git-157)

