Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525455;
	b=yc6fSKOWI9mrrwyAHS8cOSi94fXH7Z4BTv31e+fwa9ZgMvwAqdl2c5o9QfJeLCFYRwr5
	 TYGVdQxD/cNS5yURzFWLI0NHMZGqBKoTXA0OkWEAvC/aMlWA80eOVpUAtYzCV6pxf82CN
	 A5bFEp9zOwpZzwvQuFEdbFO8zlSTSJZ4QUcdhu2qxjkJMSeGFtx476ReV4c7O7O4hoGco
	 pMH+IxhSUj83P0oF1/C/Vz0XLQL/513XF+hroi/ad+fasEiLFGkXLgDE3BSoAYn2nixlx
	 1B84EFV1bRcSvWAvpoUIYUSwpI1Qa3qek9gsaUDqw8xisTNFlniaO45XNfogeK54vxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LnSsE6qCBrKWNREKQsxolRPYxwVpYEu+kSD2fYS4EEc=;
	b=JBptt5dFbJTzX3dHQwMbg1VsE4sx9gsJ42M9+V+hTLOy9wTMkmj6VW9+ptGNkKE8jFaC
	 SJqGoHEWBAcVGkiAZ29Jni8lfGWD25vaiNi8Skhordo6aQ1giiuUoymfbxI8Lh0g8JfQy
	 WywIx3sSZZ76nRALeLOPFGgQ3XrpxUx2wLX5WO17QaExCeDLU9VtLDc1LexLRvBw+O4FU
	 W7z7RjCp/Rz5g5CMLm7AxMxfAObFcHsKFlqbn0xf9ck0ean2JQnsahg1bqkAjms2fPrtm
	 ohrbdGeKSlvD+JnOD3USSBbx6qgMtLCVQh89akVc65kInUEtNR9MAMGLEodMVoqxEgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZ218Wpg;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA5606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54DA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZ218Wpg
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1905534b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525454; x=1796130254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnSsE6qCBrKWNREKQsxolRPYxwVpYEu+kSD2fYS4EEc=;
        b=qZ218WpgDCSQhh72Cm5p9A+5nFtIbRVnlHsTU/g+r5KRIv029l/xtsznDebK4r6TII
         QSxk0rj1gqaxYh21TumjWWu75UAmCo6o6Ju2ZIPE3Dho97ZiC/+WXSs1nlDMx8smThcu
         5/A0YobOEyRI10MuCVnovKe7wSbj4Z1aTFTVmG2I5+FQjQXPanDjrEP+5PbAzOy07o7h
         x8QLXBkF0FMzVtmed5vyuNqskUDKLPv8o1e8L2iTPW3KnH51DP4Ig5zK6lV2vKZ0jLyw
         QqAqiIo8WXh3/aG4XjE6oeKyB2zMfoAnCIuQNk/sH/pTq1/S6POUnP3x8lCMp5GxfdEy
         LVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525454; x=1796130254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnSsE6qCBrKWNREKQsxolRPYxwVpYEu+kSD2fYS4EEc=;
        b=A1tQXYMANw7B0uc6wZjeT49zJVcP7NAoM8PKqgs5RthzFm/Z69awFE4+8vq7SBbAHu
         7ABWVKBl7YgJTFf5ijO7EZgeY2tZeooY5YHNpUuS4Ci9GSeGPJWuFaff7ha3xzp6SGcz
         AxXlr0ZHBHAgPY1RnrY3jfgxGp5zTOF+Wb5Eb0aWRzWttAjALodjLiIMYgU7xXfrgSH1
         MiWKapBlRVCv38/eVAia0hEffp+3WP4o0lUd4bX3Xt88Htc/HuyOQ8erXYAsEBroi92W
         Vlae32mvK+K7UtkmTZ0dXlvTQeBKyptt4kpoPSwe0uN4XnNNzAgjfBw4CwAsHq+QF1pk
         Pcgg==
X-Forwarded-Encrypted: i=1; AL+hErEI80Qbu3C8XI3Xv9xsWsC2XEj6D7k2D0otTpeFEhgbH9hEYSvRktZ/rZM8foO3gaMjzuc0UyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rCCgTzVitCll6yAy3YSIJkHyAMncfOZA19k7sycHl6yqwuI/x
	X2PM4nufnyCZkQsWReT95SnAkO70w3AgYBcQh8UU86AojTEF7Acrojbc
X-Gm-Gg: AZFdTZcpSe0Fbg2e83OCBe8KfJoAjDOT1b0f8rWfox+15ptjcbPueA3Wc+AfZm1O9pz
	wzaHB3bMUSBchBij7LVWrlysGkyrwKes1eJCqTEk9MUbWwNUZQpOTXsy2NE/JqfKiXLHN4IQXOD
	A8ekAf/aF7hyjwff+cIPtnbt2XXOcyCbhait1El/oZdvpRsBIaQfVMdmJbMT3zCmsCFY+Tfo4mM
	9Dr+S9Zg7u1mJe+Y0GQMzVVk516ENgiuu23QruF4393mWQS5alSDCXTtJw0WXnDtfdJKJUTw0Zb
	RojUztd5hJgm0wQQ44bd8xbhwneIECXi/4vA7+JG1BpTHme4kFPAYyiwwqVRrKmyZyJFCn3XuQ5
	HoYVHPAsNkQfTii8//a3L+ooSQT8lk0KKQNW8/FWhicRlAkly2S+afr61HLE7lf+1dn+7z0pq04
	mcVREPsekRYmvUWmrcWOCmplw3dtYTBLiXczHCjxQzsnt+qe95HPD0fwgXLjYSs9Lw7i7n67ZYT
	x/8Yngzh/ZkbMQ6CcPMGK+oEhv41SZToTtjUCqWgRJyZTJJOtsrVFcaBbXe9kWDUATbTDQmaxDn
	H8Y49BsIoVqcWP/qf+rnwaPIFUMbvSzCxeb/+8vT7X2EyWgcRL+W3uc+R/Ruy2hbzcn0dAKfHKy
	pCK+lOSH9zBAR
X-Received: by 2002:a05:6a00:4149:b0:8a0:1e49:71bb with SMTP id d2e1a72fcca58-8c87dce2226mr13367245b3a.57.1795525454534;
        Tue, 24 Nov 2026 05:04:14 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm7200611b3a.29.2026.11.24.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:04:14 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Ido Schimmel <idosch@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Thomas Haller <thaller@redhat.com>,
	netdev@vger.kernel.org
Subject: [PATCH net] ipv6: keep the prefix route of an address with an infinite lifetime
Date: Tue, 24 Nov 2026 22:04:10 +0900
Message-ID: <179552079832.1290967.7922979459179290523@gmail.com>
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

When an address is deleted or gets IFA_F_NOPREFIXROUTE,
check_cleanup_prefix_route() keeps the prefix route alive as long as
another address on the same prefix needs it. For an address that is
not IFA_F_PERMANENT it sets the route to expire with that address:

	lifetime = addrconf_timeout_fixup(ifa->valid_lft, HZ);
	if (time_before(*expires, ifa->tstamp + lifetime * HZ))
		*expires = ifa->tstamp + lifetime * HZ;

An autoconfigured address whose valid lifetime a Router Advertisement
set to infinity is not IFA_F_PERMANENT, and addrconf_timeout_fixup()
returns ~0UL for it. lifetime * HZ then wraps, *expires stays at
jiffies, and the prefix route is removed at the next garbage collection
while the address remains valid.

Treat an address with an infinite valid lifetime like a permanent one.

Fixes: 5b84efecb7d9 ("ipv6 addrconf: don't cleanup prefix route for IFA_F_NOPREFIXROUTE")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user; ra.py sends one Router Advertisement for 2001:db8:1::/64 with an
infinite valid lifetime:

$ cat ra.py
import socket, struct, sys
s = socket.socket(socket.AF_INET6, socket.SOCK_RAW, socket.IPPROTO_ICMPV6)
s.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_MULTICAST_HOPS, 255)
ra = struct.pack('!BBHBBHII', 134, 0, 0, 64, 0, 1800, 0, 0)
pi = struct.pack('!BBBBIII16s', 3, 4, 64, 0xc0, 0xffffffff, 1800, 0,
                 socket.inet_pton(socket.AF_INET6, '2001:db8:1::'))
s.sendto(ra + pi, ('ff02::1', 0, 0, socket.if_nametoindex(sys.argv[1])))
$ unshare -Urn sh -e <<'END'
ip link add va type veth peer name vb
ip link set va up
ip link set vb up
sleep 3
python3 ra.py vb
sleep 1
ip -6 addr add 2001:db8:1::5/64 dev va
ip -6 addr del 2001:db8:1::5/64 dev va
sleep 70
ip -6 addr show dev va scope global
ip -6 route show 2001:db8:1::/64 dev va
END

Without the patch, the SLAAC address is still "valid_lft forever", but
the last command prints nothing: the prefix route is gone. With it, the
route stays. Our test also sets IFA_F_NOPREFIXROUTE instead of deleting
the address, with the same result, and checks that a finite lifetime
still expires the route as before.

The patch was written with LLM assistance; we reviewed and tested it.

 net/ipv6/addrconf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index d9d13e78bf13..b8d2c4cd28fe 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1269,6 +1269,10 @@ check_cleanup_prefix_route(struct inet6_ifaddr *ifp, unsigned long *expires)
 		action = CLEANUP_PREFIX_RT_EXPIRE;
 
 		spin_lock(&ifa->lock);
+		if (ifa->valid_lft == INFINITY_LIFE_TIME) {
+			spin_unlock(&ifa->lock);
+			return CLEANUP_PREFIX_RT_NOP;
+		}
 
 		lifetime = addrconf_timeout_fixup(ifa->valid_lft, HZ);
 		/*
-- 
2.43.0

