Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656840;
	b=5SuRMrHRmh9Yg4f0431obeQs2jpN76yepLudvdTElViyBIoIjOY1Z9N5kH23AiZDGyYm
	 DdLMavwWuBzlBlvWGZA1HUtHZxfuoqcOOmb9z2UnbTGmZnYJlvg0V5efUXwTamfd2Xc/4
	 2fK96BgN90n7W0TuwsAc0F7Cv+hVA2NogK5Wk8cty+U0E+Jp1U111zv5lGLCvlQp4GfEG
	 CoiWlS6pZTRgG0FF1WQC1VkJ7Bp66aPdjwSIlOeI/RZrgmLQwgWzgBxnUhioMTv+QKKuY
	 j7RRv7oH0rDYi1wdH9eXclgUCqo+jyL6NK6/2paBzj5cv7ZdzzRR9LGjU7qxgHkUyYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656840;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=O6X4JKbQfXXurLGaHrznyWnrE06kPkdHh7Wd9DV1C0s=;
	b=2HjBnlqV1TKTQEDQ7Z2UO2+xhJc1q+nsTjFSQdJpMHoYUHHGWONvgVPYBeKYZYt6djkj
	 Ve+XozIh84I6Tra18+SRsQE4gnVvL5fDt3rpnyY7nbF6aePylXGdf4o4Wkoa3kea3kThb
	 y44CUiCMb8nCCf1yiiMsSUndaiqog1qGT3KK66hCogjr4aZMWNdx6MH00RiPHfqGIUwxt
	 1XIwJONhihtDoU/TQ09uQHZalp7ho+db50xSkf0JIVrYn9bshix0H1DiXHrvD3r9Sn9p9
	 iwI7tHoF6jGkTWi7CCWqsa17WLVZp8slAPJhUYgulri2Z6ka9bQqeyNtrwbrmnjHnxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3j5u+7H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E9606A331
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3j5u+7H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345351F000EE;
	Thu, 26 Nov 2026 01:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656839;
	bh=O6X4JKbQfXXurLGaHrznyWnrE06kPkdHh7Wd9DV1C0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k3j5u+7H5QbejIvHUuy1BLEQvEBkGc0DNLqKG04tSoqyEGbyBx3/sYt9AyxymLWz3
	 TAuapVJVxTqcrR75le/+6uZrKGelSEpynWDhZ7ydnmCsq8a/pfDPwRMFqb/dn3zg4/
	 kpmVQ+/HtF4aNtr1D8A/xKSzRVAFecdjjmYuoNyzhOoA7qjXKMdoaNXOImSLw06Vw4
	 L/lQcUVCePLwqW6sLW0sO0fNEqyxGgBrAtmfiCd2zGQFMRG/TfBmPHxGNIu2/j7x4P
	 TBdWjpog7gMr+aXQkbTC+M1467gEwQnrH1fLGdyG24nWS0MT6BfziwCtz2NZZfl+FZ
	 n/YJv+0aJCygg==
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
Subject: [PATCH net-next v2 13/13] selftests: net: ipvs: check a PMTU learned after the DR route was cached
Date: Wed, 25 Nov 2026 18:33:39 -0700
Message-ID: <54d8eada69c6793d4761274f9c2878c0d284fe8b.1795642478.git.dahern@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1795642478.git.dahern@nvidia.com>
References: <cover.1795642478.git.dahern@nvidia.com>
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

In IPv6 DR mode the director keeps its route to the real server in
dest->dst_cache and revalidates it with ip6_dst_check(). The route is a
FLOWI_FLAG_KNOWN_NH clone that is not cached on the nexthop, so a PMTU
learned for the real server afterwards is not applied to it unless
ip6_dst_check() notices the new exception.

Cache the route with a small datagram, give the director a PMTU for the
real server with a forged packet too big message, then send a datagram
that exceeds it. The director must answer with a packet too big message,
which the client learns as a PMTU for the service.

Add the IPv6 and UDP ipvs options the test needs to the config.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
 tools/testing/selftests/net/netfilter/config  |  2 +
 tools/testing/selftests/net/netfilter/ipvs.sh | 81 +++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index 629b2b29ed1a..d237f8651111 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -36,7 +36,9 @@ CONFIG_IPV6=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IP_VS=m
+CONFIG_IP_VS_IPV6=y
 CONFIG_IP_VS_PROTO_TCP=y
+CONFIG_IP_VS_PROTO_UDP=y
 CONFIG_IP_VS_RR=m
 CONFIG_MACVLAN=m
 CONFIG_NAMESPACES=y
diff --git a/tools/testing/selftests/net/netfilter/ipvs.sh b/tools/testing/selftests/net/netfilter/ipvs.sh
index 9c9d5b38ab71..556ce071035e 100755
--- a/tools/testing/selftests/net/netfilter/ipvs.sh
+++ b/tools/testing/selftests/net/netfilter/ipvs.sh
@@ -40,6 +40,12 @@ readonly dip_v4=172.16.0.1
 readonly rip_v4=172.16.0.2
 readonly sip_v4=10.0.0.3
 
+readonly vip_v6=fd00:3::1
+readonly cip_v6=fd00:1::2
+readonly gip_v6=fd00:1::1
+readonly dip_v6=fd00:2::1
+readonly rip_v6=fd00:2::2
+
 readonly infile="$(mktemp)"
 readonly outfile="$(mktemp)"
 readonly datalen=32
@@ -54,6 +60,7 @@ fi
 
 checktool "ipvsadm -v" "run test without ipvsadm"
 checktool "socat -h" "run test without socat"
+checktool "python3 -c pass" "run test without python3"
 
 setup() {
 	setup_ns ns0 ns1 ns2
@@ -169,6 +176,74 @@ test_tun() {
 	test_service
 }
 
+# Send one UDP datagram of ${2} bytes from the client to the IPv6 service and
+# keep the socket open for a moment, so that a packet too big message for it
+# is accepted.
+udp_send_v6() {
+	ip netns exec "${ns0}" python3 -c '
+import socket, sys, time
+s = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
+s.bind((sys.argv[1], 0))
+s.sendto(b"x" * int(sys.argv[3]), (sys.argv[2], int(sys.argv[4])))
+time.sleep(0.5)
+' "${cip_v6}" "${vip_v6}" "${1}" "${port}"
+}
+
+# Send a packet too big message with MTU ${1} for ${dip_v6} -> ${rip_v6} from
+# the real server to the director. The director sees what a router on the path
+# to the real server would tell it, and learns a PMTU exception for ${rip_v6}.
+send_ptb_v6() {
+	ip netns exec "${ns2}" python3 -c '
+import socket, struct, sys
+src, dst, mtu = sys.argv[1], sys.argv[2], int(sys.argv[3])
+inner = struct.pack("!IHBB", 6 << 28, 8, 58, 64)
+inner += socket.inet_pton(socket.AF_INET6, src)
+inner += socket.inet_pton(socket.AF_INET6, dst)
+inner += struct.pack("!BBHHH", 128, 0, 0, 0, 0)
+msg = struct.pack("!BBHI", 2, 0, 0, mtu) + inner
+s = socket.socket(socket.AF_INET6, socket.SOCK_RAW, socket.IPPROTO_ICMPV6)
+s.sendto(msg, (src, 0))
+' "${dip_v6}" "${rip_v6}" "${1}"
+}
+
+# The director keeps the route to a real server for as long as it passes
+# ip6_dst_check(). In DR mode that is a FLOWI_FLAG_KNOWN_NH clone, which is not
+# cached on the nexthop. A PMTU learned for the real server after the route was
+# cached must still reach it: packets that exceed the PMTU must get a packet
+# too big message back to the client.
+test_dr_v6_pmtu() {
+	ip netns exec "${ns0}" ip addr add "${cip_v6}/64" dev br0 nodad
+	ip netns exec "${ns0}" ip route add "${vip_v6}/128" via "${gip_v6}" dev br0
+
+	ip netns exec "${ns1}" ip addr add "${gip_v6}/64" dev veth10 nodad
+	ip netns exec "${ns1}" ip addr add "${dip_v6}/64" dev veth12 nodad
+	ip netns exec "${ns1}" ip addr add "${vip_v6}/128" dev lo nodad
+	ip netns exec "${ns1}" ipvsadm -A -u "[${vip_v6}]:${port}" -s rr
+	ip netns exec "${ns1}" ipvsadm -a -u "[${vip_v6}]:${port}" \
+		-r "[${rip_v6}]:${port}" -g
+
+	ip netns exec "${ns2}" ip addr add "${rip_v6}/64" dev veth21 nodad
+	ip netns exec "${ns2}" ip addr add "${vip_v6}/128" dev lo nodad
+
+	# Let the director cache its route to the real server
+	udp_send_v6 100
+
+	send_ptb_v6 1280
+	sleep 0.2
+	if ! ip netns exec "${ns1}" ip -6 route get "${rip_v6}" | grep -q "mtu 1280"; then
+		echo "FAIL: director did not learn the PMTU of the real server"
+		return 1
+	fi
+
+	# A datagram that exceeds the PMTU must be answered with a packet too
+	# big message, which gives the client a PMTU for the service
+	udp_send_v6 1400
+	if ! ip netns exec "${ns0}" ip -6 route get "${vip_v6}" | grep -q "mtu 1280"; then
+		echo "FAIL: director kept using a route that bypasses the learned PMTU"
+		return 1
+	fi
+}
+
 run_tests() {
 	local errors=
 
@@ -190,6 +265,12 @@ run_tests() {
 	test_tun
 	errors=$(( $errors + $? ))
 
+	echo "Testing IPv6 DR mode PMTU..."
+	cleanup
+	setup
+	test_dr_v6_pmtu
+	errors=$(( $errors + $? ))
+
 	return $errors
 }
 
-- 
2.54.0 (Apple Git-157)

