Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205213;
	b=xVShj2nVcoRisp/ttx8i3+IY0afy4gg3dRhH3y+lHLWeYHUbnokZSJuudKzxUsQpnNHC
	 gHy9Osf4uIvcDFt4krlQP+cR7Y3XU8VJZ2sJphzEfyl0hXzpvIr/uOMzBd32QxLy1qzJU
	 hoG/5xsEL+1ocIISJuuNPmbo87Y0CaGzsPCTYwq1xU7fH5lDcWMcFzEtuBfxgLLokhcFD
	 ooMdECLDszT4UgJVr0Jah4uymxEb0SSoLhhkTXrpwdAtrOZI+ORqNd1+TUkDQ1OmUkKfu
	 KD9lc0NAJoGN/h8vU5DePJ/mHCECdZSmyjoW41hE1O3C50OLI31So//8Q9SuTi3s7mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jtRzdCCEvFfqCczLl23898lPlKXB6z3dSaQB4Mvu8LY=;
	b=WT5GfGUfJPI9x394oh+R7Zd5bbR7R4p+xT7SIpQ+0JVJAHDLX1TGLEGhTJHff5PvFu7e
	 TeSERSm2bNemGYdQtSwSt1mkzm17iru6FJ9Yx6R+C71toRr2sFjo3vOFSHF+ym2/534C8
	 pbzcJQX46ETW8sgOMmZpUNNjRwFpS/Q3wkEt2z84a6S2HK01TR4t0NVIeKgs4/VP1TdZc
	 zHaOrutpr12cLVxUthwWekjmgPzNHSYn9Tlaf4t3kOZ0gV2tyLM719wyVcQhFNUvOsUW1
	 o86UQdsNSdW/b3SpVj+6K5/8Z5e7BF+aNM1DEBeaK3d2UZVzD65SWZAVt/U5Dli8pXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lL5+ZRFH;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B761606A337
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B761606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lL5+ZRFH
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b600fae14dso476969b3a.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795205202; x=1795810002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtRzdCCEvFfqCczLl23898lPlKXB6z3dSaQB4Mvu8LY=;
        b=lL5+ZRFHmGFeF6lc0lHMVpRPJVtJtDC+iJ9tigDavjhjGSMwhncnsED3bNZK/qYz/r
         El3GOfpYAEFZ8Y/1AObX/5aL6E7fA8AJE2WPWjJoooaAexx9t9CYKCud20CwATK7MTKa
         t5uOe9jBFT65VD3faym0fPr0Sqv7wCrTVcNCGxP0MGZ1VcmLrlr7UXV3JppGyhYlkGYf
         G38jO93oIwFP4jGkH0a2nNJ/G2V2QBZhRa3VzsSE9PXPzpgbaLxXrN/7eyCLxgtrmy6T
         SI3Dgd/KuTKxg/T2etbOfor4ZGRwpV3qn1WQj2BfI5ioSIfnhv6830sNu7WBFOM8dMkZ
         x0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205202; x=1795810002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtRzdCCEvFfqCczLl23898lPlKXB6z3dSaQB4Mvu8LY=;
        b=kEfUEGCxcoL5o0EQ4ip9qcSx8Baroz5du/++nbquFqKPTl2cay+VdesYtMbYuk9hJE
         7om26NLflJm/q5K0N8T6PMz9VLtekGFlv78huSR3tjnjs1RP3rEmM5WxQ3d5kaoI5W0C
         Tv2dcokjhc2pVl+neMLxfMGrIBUTB3/tayEJVe+BWGHJhtnL7yrz3wf5aH69VwAYrXyN
         ncVd7L3mF5z2eMWEiVRsyiumGzMP+fpzQSrwzJr0Gdxkg6OudxrNTXXcuXcT2w1t52iE
         fGsgh36yY9P09Jo3CgeeW1DhveR5VM4H0T3aACjZqtJONbTaC/zFPoTvVvGILozjenZF
         x3/Q==
X-Gm-Message-State: APuU4Z8S0gW1f/ygSOmY9f1opfS12plIozWVX1YFm/0oTLOUX745vvEQ
	lBcvU23GyT3fDSYsUIfC/nYwaisWtb4o+0FZNEk1Iiuzg8su5SOPd5/kIrhqvw6XnjqMbhkkV1r
	60hE/OlA=
X-Gm-Gg: AYBFou1vkOuseJZmXgBPBnEdtbZhH+6kiKt76KJvhMUJ08z6KX47FKKZeZy4QHJJjoX
	0JF2L7x7gsbquvXB8MZyhMsOKBQuy+roWHlpzYADym6HNdX/pHU0HqwwAQ/sGGkLNQblaK1nMAU
	j89GnC+JUlMEZid6Ev7ITMxpTF/10axAi3T6l3oq9nkxXZuVp93X0ekggzOm2g4Ims7qniUvFI8
	gvrFDwCPN6uYySlnW4PkmzWpDWDV6dQLM5PVso9xJTky/DB3j+VcRvUQa4NldXlgsUWp8j7j7E8
	Hk01vQks9zcpypKQZkZPLY3XsjeQCyhgub6aeDN2pUdOBqwrV5c/kJoFpuRHnYefLZ+AsaVc2ov
	QNtPv/bVbZ+CTWdDA1BpJzSfLKKAbBWSS9bjSENMkQzHRX8k2fTsNoIE1XzLXkO7ZNrr6jMwy6D
	gBnWAhHGMbTWIrf68vYbizFVjvIu76bzVdjfZymW2ywIyRaIzUANtCEdE+BwKZvReDp6BULllpx
	FoKiv+5sGwp0YW8x4kYcmQMMR6URHM8uHGJgIVUYBx58PxILcyyM30ZRoHlqaKmWJN5u1/Ee4Hi
	Oot59IKb2XO6aRTVtUbLlRmWHrChlMen8RpV3732YRD+O/TxzGa33KWrF7nUpb4CD87M
X-Received: by 2002:a05:6a21:6f11:b0:3f8:d7eb:1ac1 with SMTP id adf61e73a8af0-4014d456c18mr4159173637.53.1795205201680;
        Fri, 20 Nov 2026 12:06:41 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm1619282a12.18.2026.11.20.12.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:06:41 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC next-net 3/3] selftests: fib_nexthops: test route flush with nexthop objects
Date: Fri, 20 Nov 2026 12:01:30 -0800
Message-ID: <20261120200635.95798-4-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120200635.95798-1-stephen@networkplumber.org>
References: <20261120200635.95798-1-stephen@networkplumber.org>
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

fib_nexthops.sh exercises "ip nexthop flush" but never "ip route flush"
against routes using nexthop objects, which is how the dump and delete
paths drifted apart.

Add ipv4_route_flush and ipv6_route_flush: a single nexthop object, a
group, a blackhole object and, for IPv4, a route via an IPv6 nexthop
object, since each expands differently in the dump. Flush a batch mixing
nexthop object routes with an ordinary one, and check the nexthop objects
outlive the routes.

Also check what must keep failing: a delete naming the wrong id, and an
add combining an id with a nexthop spec.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 tools/testing/selftests/net/fib_nexthops.sh | 126 ++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index adbec51917eb..501ed0fc05a8 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -29,6 +29,7 @@ IPV4_TESTS="
 	ipv4_large_grp
 	ipv4_large_res_grp
 	ipv4_compat_mode
+	ipv4_route_flush
 	ipv4_fdb_grp_fcnal
 	ipv4_fdb_port_fcnal
 	ipv4_mpath_select
@@ -44,6 +45,7 @@ IPV6_TESTS="
 	ipv6_large_grp
 	ipv6_large_res_grp
 	ipv6_compat_mode
+	ipv6_route_flush
 	ipv6_fdb_grp_fcnal
 	ipv6_fdb_port_fcnal
 	ipv6_mpath_select
@@ -2148,6 +2150,130 @@ ipv6_compat_mode()
 	sysctl_nexthop_compat_mode_set 1 "IPv6"
 }
 
+ipv4_route_flush()
+{
+	echo
+	echo "IPv4 route flush with nexthop objects"
+	echo "-------------------------------------"
+
+	# "ip route flush" dumps the routes and sends each dumped message
+	# back as RTM_DELROUTE. With nexthop_compat_mode on, a dump of a
+	# route using a nexthop object carries RTA_NH_ID plus the legacy
+	# expansion of that nexthop, so the delete has to accept both.
+
+	run_cmd "$IP nexthop add id 601 via 172.16.1.2 dev veth1"
+	run_cmd "$IP nexthop add id 602 via 172.16.1.3 dev veth1"
+	run_cmd "$IP nexthop add id 610 group 601/602"
+	run_cmd "$IP nexthop add id 603 blackhole"
+	run_cmd "$IP -6 nexthop add id 604 via 2001:db8:91::2 dev veth1"
+
+	# single nexthop object: dump has RTA_NH_ID, RTA_GATEWAY, RTA_OIF
+	run_cmd "$IP ro add 172.16.101.0/24 nhid 601"
+	run_cmd "$IP ro flush 172.16.101.0/24"
+	log_test $? 0 "Flush route with single nexthop object"
+	check_route "172.16.101.0/24" ""
+	log_test $? 0 "Flushed single nexthop object route is gone"
+
+	# nexthop group: dump has RTA_NH_ID plus RTA_MULTIPATH
+	run_cmd "$IP ro add 172.16.102.0/24 nhid 610"
+	run_cmd "$IP ro flush 172.16.102.0/24"
+	log_test $? 0 "Flush route with nexthop group"
+	check_route "172.16.102.0/24" ""
+	log_test $? 0 "Flushed nexthop group route is gone"
+
+	# blackhole nexthop object: the dump reports the route as
+	# RTN_BLACKHOLE even though the FIB alias is unicast
+	run_cmd "$IP ro add 172.16.103.0/24 nhid 603"
+	run_cmd "$IP ro flush 172.16.103.0/24"
+	log_test $? 0 "Flush route with blackhole nexthop object"
+	check_route "172.16.103.0/24" ""
+	log_test $? 0 "Flushed blackhole nexthop object route is gone"
+
+	# IPv4 route via an IPv6 nexthop object expands to RTA_VIA
+	run_cmd "$IP ro add 172.16.104.0/24 nhid 604"
+	run_cmd "$IP ro flush 172.16.104.0/24"
+	log_test $? 0 "Flush route with cross-family nexthop object"
+	check_route "172.16.104.0/24" ""
+	log_test $? 0 "Flushed cross-family route is gone"
+
+	# flushing a mix in one batch must not disturb ordinary routes
+	run_cmd "$IP ro add 172.16.105.0/24 nhid 601"
+	run_cmd "$IP ro add 172.16.106.0/24 nhid 610"
+	run_cmd "$IP ro add 172.16.107.0/24 via 172.16.1.2 dev veth1"
+	run_cmd "$IP ro flush dev veth1 proto boot"
+	log_test $? 0 "Flush mixed batch of nexthop object and ordinary routes"
+
+	# the nexthop objects themselves must survive a route flush
+	run_cmd "$IP nexthop get id 601"
+	log_test $? 0 "Nexthop object survives route flush"
+	run_cmd "$IP nexthop get id 610"
+	log_test $? 0 "Nexthop group survives route flush"
+
+	# deleting by nexthop id must still ignore a conflicting selector
+	# rather than silently deleting the wrong route
+	run_cmd "$IP ro add 172.16.108.0/24 nhid 601"
+	run_cmd "$IP ro del 172.16.108.0/24 nhid 602"
+	log_test $? 2 "Delete by wrong nexthop id fails"
+	check_route "172.16.108.0/24" "172.16.108.0/24 nhid 601 via 172.16.1.2 dev veth1"
+	log_test $? 0 "Route with other nexthop id is retained"
+	run_cmd "$IP ro del 172.16.108.0/24 nhid 601"
+	log_test $? 0 "Delete by correct nexthop id succeeds"
+
+	# adding a route must still reject nhid together with a nexthop spec
+	run_cmd "$IP ro add 172.16.109.0/24 nhid 601 via 172.16.1.2 dev veth1"
+	log_test $? 2 "Add rejects nexthop id with nexthop specification"
+
+	$IP nexthop flush >/dev/null 2>&1
+	$IP ro flush dev veth1 proto boot >/dev/null 2>&1
+}
+
+ipv6_route_flush()
+{
+	echo
+	echo "IPv6 route flush with nexthop objects"
+	echo "-------------------------------------"
+
+	run_cmd "$IP -6 nexthop add id 611 via 2001:db8:91::2 dev veth1"
+	run_cmd "$IP -6 nexthop add id 612 via 2001:db8:91::3 dev veth1"
+	run_cmd "$IP nexthop add id 620 group 611/612"
+	run_cmd "$IP -6 nexthop add id 613 blackhole"
+
+	run_cmd "$IP -6 ro add 2001:db8:101::/64 nhid 611"
+	run_cmd "$IP -6 ro flush 2001:db8:101::/64"
+	log_test $? 0 "Flush IPv6 route with single nexthop object"
+	check_route6 "2001:db8:101::/64" ""
+	log_test $? 0 "Flushed IPv6 single nexthop object route is gone"
+
+	run_cmd "$IP -6 ro add 2001:db8:102::/64 nhid 620"
+	run_cmd "$IP -6 ro flush 2001:db8:102::/64"
+	log_test $? 0 "Flush IPv6 route with nexthop group"
+	check_route6 "2001:db8:102::/64" ""
+	log_test $? 0 "Flushed IPv6 nexthop group route is gone"
+
+	run_cmd "$IP -6 ro add 2001:db8:103::/64 nhid 613"
+	run_cmd "$IP -6 ro flush 2001:db8:103::/64"
+	log_test $? 0 "Flush IPv6 route with blackhole nexthop object"
+	check_route6 "2001:db8:103::/64" ""
+	log_test $? 0 "Flushed IPv6 blackhole nexthop object route is gone"
+
+	run_cmd "$IP -6 nexthop get id 611"
+	log_test $? 0 "IPv6 nexthop object survives route flush"
+	run_cmd "$IP nexthop get id 620"
+	log_test $? 0 "IPv6 nexthop group survives route flush"
+
+	run_cmd "$IP -6 ro add 2001:db8:104::/64 nhid 611"
+	run_cmd "$IP -6 ro del 2001:db8:104::/64 nhid 612"
+	log_test $? 2 "Delete IPv6 route by wrong nexthop id fails"
+	run_cmd "$IP -6 ro del 2001:db8:104::/64 nhid 611"
+	log_test $? 0 "Delete IPv6 route by correct nexthop id succeeds"
+
+	run_cmd "$IP -6 ro add 2001:db8:105::/64 nhid 611 via 2001:db8:91::2 dev veth1"
+	log_test $? 2 "Add rejects IPv6 nexthop id with nexthop specification"
+
+	$IP nexthop flush >/dev/null 2>&1
+	$IP -6 ro flush dev veth1 proto boot >/dev/null 2>&1
+}
+
 ipv4_compat_mode()
 {
 	local rc
-- 
2.53.0

