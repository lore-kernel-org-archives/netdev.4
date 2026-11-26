Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656838;
	b=4iJlZGfMflEMzmAJierHODAtVAs6oBeOE67mA+gUbnjwmKglXgjNDC58QSWK//Rqwx+j
	 vPljc67cisRalpQvAdpjBZwt8DgzCrqPEbAqq7jpET/0buLYoJ2Pb5u71SEjGIezBldbJ
	 6PHrXaXJzlUdiZlTeAGw747NtfhnsWTmbIbp0hgXTTEvcAuzxStfAD/aN2V8fTVrOpsvK
	 JmSa9W/q6fu+tCq1TQ4R/fzktJg9FPQmqzqA+WrpbfVsdz9hU7EfrTzkGBudbZXQQ/eQA
	 0qXEkS/DTnbbcZG9kjQCOfbAIO9/FSLLiJtUVX8Dq+B9h1c0JHj6kfxyuu7APWVuZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656838;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ggltb7RoF9HsjuZzJaLHwGvo3eh4NABtovn8kGjeIQ8=;
	b=pyggDfW4WQMUp8v7aOMELUkkrAo0BM4Dcm5sewwHlzssbyxw/7kD+xyT7gVApgaIzv4s
	 75boI33X7zdfB1DOVabeNnAg/pP4X77yCOGL2b8OTMhFvxc9gA42OsrFcIsTcTEpCRC2s
	 lK4/2ZPsi9Lh4ZFg8BFIKqjBRcwbvTEZapR6TEWuuRllvaI/AutnP+sWP791Qei1uqas2
	 G+N17yTxE5hNXzSgEl+Hs9blPd0NhTIae/esv4zzypBrYj4GM+cyInXz0ur6LV+3CZISf
	 CQqwhyANP6oZwcyhL3o6ikPrLVoZw0xa+TdxGnkPlIWF2832UG5MASjQXNBJJdQrD8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQ7+e5EU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA54606A32A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQ7+e5EU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D01F00A19;
	Thu, 26 Nov 2026 01:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656838;
	bh=Ggltb7RoF9HsjuZzJaLHwGvo3eh4NABtovn8kGjeIQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kQ7+e5EU6NJhgb+qf5r677cATCrfpUXieShqBjw8sYQfwxnsbx/NsAwzGVrsJYO43
	 llUTx+JRA+DA62P84Z+JOz2CwX/QtGfjM/y1DmNmswgSCIkNLavPRD3v6MXa2iv8HI
	 JxIPIeaxK5xRXDuAKDa3a2bH4Z5ny4Of9fnKZe/shs1qgGQxpiuc/uSp6ZilR0PFDY
	 bHICMLfAFs4gwGknyfPKIuVgI+BzpEFtXXDUUwKHv0i3kQypwFuWoEvF+HvutmtKWx
	 RzTJRR6eDW8A11H7s19T/YCVLhkZkSMzB2XUJ94Gm/PPltt4nFUAgwfQWSxYLE+B+8
	 mEkmHFrqVoAtQ==
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
Subject: [PATCH net-next v2 12/13] selftests: net: fib_tests: Add stale pcpu test
Date: Wed, 25 Nov 2026 18:33:38 -0700
Message-ID: <44f185f53dfff14a9395f2bb78bbfa9c2a164279.1795642432.git.dahern@nvidia.com>
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

Avoid regression with stale pcpu route entries and add a selftest
that covers the regression fixed by
    8f34e53b60b3 ("ipv6: Use global sernum for dst validation with nexthop objects")

Signed-off-by: David Ahern <dahern@nvidia.com>
---
 tools/testing/selftests/net/fib_tests.sh | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index d7ac3c727f70..dc2ac5d7f29b 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -14,7 +14,7 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
        ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
        ipv4_mpath_balance_preferred ipv4_mpath_oif ipv4_mpath_oif_nh \
        ipv4_mpath_oif_vrf ipv6_mpath_oif ipv6_mpath_oif_nh ipv6_mpath_oif_vrf \
-       fib6_ra_to_static fib6_temp_addr_renewal"
+       fib6_ra_to_static fib6_temp_addr_renewal ipv6_nh_pcpu_stale"
 
 VERBOSE=0
 PAUSE_ON_FAIL=no
@@ -3228,6 +3228,56 @@ ipv6_mpath_oif_vrf_test()
 	cleanup
 }
 
+ipv6_nh_pcpu_stale_test()
+{
+	local cpu
+
+	echo
+	echo "IPv6 nexthop object stale pcpu dst test"
+
+	if [ ! -x "$(command -v taskset)" ]; then
+		echo "SKIP: taskset not installed"
+		return $ksft_skip
+	fi
+
+	if [ $(nproc) -lt 2 ]; then
+		echo "SKIP: pcpu test requires multiple cpus"
+		return $ksft_skip
+	fi
+
+	setup
+
+	set -e
+	setup_ns ns2
+	$IP link add veth1 type veth peer name veth2 netns $ns2
+	$IP link set veth1 up
+	$IP -6 address add 2001:db8:10::1/64 dev veth1 nodad
+	ip -netns $ns2 link set lo up
+	ip -netns $ns2 address add 2001:db8:11::1/128 dev lo
+	ip netns exec $ns2 sysctl -qw net.ipv6.conf.all.forwarding=1
+	ip -netns $ns2 link set veth2 up
+	ip -netns $ns2 -6 address add 2001:db8:10::2/64 dev veth2 nodad
+
+	$IP -6 nexthop add id 100 via 2001:db8:10::2 dev veth1
+	$IP -6 route add 2001:db8:11::1/128 nhid 100
+	set +e
+
+	# create a pcpu dst entry on cpu 0
+	taskset -a -c 0 $IP -6 route get 2001:db8:11::1 &> /dev/null
+
+	# re-add the route entry
+	$IP -6 route del 2001:db8:11::1
+	$IP -6 route add 2001:db8:11::1/128 nhid 100
+
+	# cached dst on cpu 0 must have been invalidated
+	for cpu in 0 1; do
+		taskset -a -c $cpu $IP -6 route get 2001:db8:11::1 &> /dev/null
+		log_test $? 0 "Route get on cpu $cpu after route re-add"
+	done
+
+	cleanup
+}
+
 ################################################################################
 # usage
 
@@ -3322,6 +3372,7 @@ do
 	ipv6_mpath_oif_vrf)		ipv6_mpath_oif_vrf_test;;
 	fib6_ra_to_static)		fib6_ra_to_static;;
 	fib6_temp_addr_renewal)		fib6_temp_addr_renewal;;
+	ipv6_nh_pcpu_stale)		ipv6_nh_pcpu_stale_test;;
 
 	help) echo "Test names: $TESTS"; exit 0;;
 	esac
-- 
2.54.0 (Apple Git-157)

