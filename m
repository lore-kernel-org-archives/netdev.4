Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634093;
	b=2T1Kf1cfZ8kt9/Bv9B3eIy9fUq0Mflb2xBII52QAIgZmbNqoYWuHV2bzRiTaCuLHuSsh
	 MZapqN9aTAXpPVRmF4+A3Kf9TkfxF7PXQC6M7iPTDQg7BOSpbsPhy74GHbTmzkN4P2lLQ
	 pqOpERXOdeGAKPE3kUrvkLxK8bxo82UjCw23khqqeA2tW2SFf18ivADI4jNKoRlgJMypv
	 clTuBOhW3Vpwi0qMcbqBUMTtcCesAI04RsJ4JRaY8y1hb/MiTPV7EmBIcZ4owisXQ9w+O
	 OHA9uwnVtxhbGq2kmhwUE5NpGNNWtt3y4822SrQxWNDCav8wpTiWvAkGvbmiSMXdz+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=63JxpqsX0+4spykxt7lp1E0tcGyKvLEmW+in0KkChYM=;
	b=NY8bfAh+dCYNaVTda2PC1kIIOZ+5v7z2pSVaqPqxrhfdzcyxeh2FqAJAP6XPIfdxf/9/
	 ehB4201xAuPnzjhvGBknUQIAdRZOGprOaxn3aY62NzvDOQrulNQhc7FYb0o/IIygnRIz2
	 qx0+JzYBgjAk6k+m+fiugLfDKu/oOBEXxCgysgxDbB2CXD/2rST8xwoLEACkYjWe31Db0
	 DrSj3DOzib9nVf97YI66oztr2eP5rhXQ3H3b87j9wggERgH7wGuZymC5vl2Fj1V98MLsZ
	 NBhXeQjZT8DXfABVUfV/OnwxlTSdDSGnPcaVkFGwlIJe0zWF3GG5k48z5ZiA8wg9EUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=BdsluJAJ;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3552606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3552606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=BdsluJAJ
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04244c3d0so50357505ad.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634092; x=1796238892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=63JxpqsX0+4spykxt7lp1E0tcGyKvLEmW+in0KkChYM=;
        b=BdsluJAJHD/evAcJTF4hQ7wYcuZgNGW1w2kvC4Z5dG9Hi8V+fwwGeFY5EhB34+YFvu
         Tn4pNRuQ8XQ77OuT7xZ5wQqmigOO+oXPUIihrlFL/XHZf7D8UwTAirJCmvU9G24TX8Xw
         fGiiwkYpOe/5FlkyRi3R981fewGh5UCdg7MTyackpGjXuEuGC69yzx871njurMoFSwLv
         JUO9NTu0hSjwdgfYSBHTXx6gSHQMTs8uPyx6BmuJ2I7+QFL8oxofzLs6iJv5xLQDP0qC
         iqojYPQz9RihV4LX8kVOf4yQ8Ics0KUtKOa1jTtX2YEx/JjIzH+EP5enRID3OEpTs7y9
         v7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634092; x=1796238892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63JxpqsX0+4spykxt7lp1E0tcGyKvLEmW+in0KkChYM=;
        b=Rr8hg/a+Xok7bo9TAQJQ/LmZc+YjEuGXHHNHYHHAFodONcAj5IzJKPiKq4xRs+6u3Q
         iud+6NjssK5jwIek7GYmIzBM0rmCXttC9OMy2cRoIHFoHamTbQsRtXaDDtGaUYIaSby5
         loGvHb+v6oPT56H1NtAhyZUKLlaIeh0QrGpMp8WlOuEV5hzjhz2LVk/iy65dl221xbMm
         RDsbFHwG4q/hnH3laxecqHZY5YUbUGhA4j5fR44v51/WFYqjj5XZ05USL1Nmeb0RhkD7
         dMyi4z4D2VOj0rDSxOeABlfnuiLBAFkCwELnDKtnmLqwqVuCS1bpk/EywajXrQ83qOvZ
         rNZw==
X-Forwarded-Encrypted: i=1; AL+hErFmNrNcccDx7UyyuAZy/VcZ73NzE9E0efoyWGf1W4KAh1xkmcib7eX51EFDbHtoOvXMkMJLM7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OE1mOgIrCNLgaTiJBqb3LC9LuMNOecEbomojYCXkam5srOJGi
	kZg+Y3FqLkLrTuLJYg5OJffMEOFFcM85Raxy51Dqyo2kgTCpmLjvxJUyiT28g6kHszIieEaVFML
	LuY5hRfM=
X-Gm-Gg: AZFdTZf8pKWXo/4KRLyn58EiNz4dXE3mr8Lsm+XVIqUXkmG1plsc332nDOi9VY20eJe
	4ZX1LMlDEBPsBTe8R6HVV8CA5pDsOG4Dw+Nu/eQLWCbd/3eUhgZzHNA/2ueW+V5fuEiLfX6pZxf
	+pRsBI7E3fNf+SRrcC+lWMgSqkpeZ4DBKoXbj97qr1KevTmr/pY4qMYjPo9oCHIzfHBZXoQ+/Me
	sj1p8f1zJaaMfoBG9vtH+ww7bji0KhzcxFkVyiyxC8W0h7fpgfV/FM0KKPbmAa/yE6NJ4PpuCot
	naOt1oJO1S6gawQZNlvCRGWYLl193M+VgMX6Bt8c1JI30kRwuFg07atL+HMeycFe4gljz30eUCN
	RorykeZGVRcFyZr3b6Oxdlg4NTjn56fWKRPHgCQhcg03kfQAWIIonps0WtPzLMNa0TwKUnS49H2
	d+K1Ei5E2DoTW9Bp7bbjZwpxRX/TjqL1Zu6XCeSNFw94A3bUSikVvVk6voRmyTwVGRm68n0CnZF
	kLWf1TzHN9XXtAXrUiBCiu2mkLowzM1MXs3RRqaX3HppFDvm5wa2b5W4xbHtY6K1zXvyaUFl0Jd
	xHprdyOF0zBe2MJIod7+UDoey++LMGcE4aUMTUXbZPrcyfUJXdSJEyK6aNtRH0R/7bF2YhP9C/N
	4CD//hg/Axa+juHaOzDA1E/lK/V/KMxPntKXcWvQ/DRumXSti7jw=
X-Received: by 2002:a17:902:e5c5:b0:2f0:345a:25ab with SMTP id d9443c01a7336-2f03f18dbf9mr193440235ad.59.1795634092161;
        Wed, 25 Nov 2026 11:14:52 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:51 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 00/12] amt: add an IPv6 outer transport
Date: Wed, 25 Nov 2026 19:14:38 +0000
Message-ID: <20261125191450.2497936-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
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

The amt driver runs AMT (RFC 7450) only over IPv4: the relay and the
gateway bind one AF_INET UDP socket and every message is routed and
sent with the IPv4 helpers. RFC 7450 defines the protocol over either
IP version, with an IPv6 form of the Relay Advertisement, so a gateway
on an IPv6-only access network cannot reach an amt relay today.

This series adds an IPv6 outer transport to both modes. The outer family
is fixed when the link is created: an IPv6 local address
(IFLA_AMT_LOCAL_IP6) selects IPv6, and the inner multicast family stays
independent, so an IPv6 tunnel carries IGMP/IPv4 and MLD/IPv6 alike.

Use case, which Jakub asked about on v1: Blockcast runs amt relays and
gateways to deliver multicast video over networks that do not carry
multicast natively, and some of those access networks are IPv6-only.
The gateway side has to reach a relay from such a network, and the
relay has to answer it, so both ends need the IPv6 form.

Patches 1-5 convert the relay: the AF_INET6 socket, the IPv6 Relay
Advertisement, tunnel state keyed on a union amt_addr, and the
Membership Query, Membership Update and Multicast Data paths, which
share one amt_udp_xmit() instead of IPv6 twins of each sender.
Multicast Data over IPv6 is checked against the tunnel MTU and never
fragmented. Patch 6 sizes headroom and MTU for the 40-byte outer header.
Patches 7-8 convert the gateway; the learned IPv6 relay address is
published under a seqlock because, unlike the IPv4 one, it cannot be
stored in one access. Patch 9 adds the netlink attributes, last, so
that no intermediate commit can create a half-working IPv6 device.
Patch 10 adds the AMT headers and selftests to MAINTAINERS, and
patches 11-12 add selftests. amt_v6.sh uses the same tools as amt.sh
(smcroute, socat, nc) plus jq, and tcpdump for one check that it skips
without it.

The series is based on net-next 24630ff92eff, which merged net with the
six-patch "amt: relay tunnel lifetime, validation and request-path
hardening" series (net v7). It depends on that series: the tunnel
creation, MAC and per-source cap that patch 3 re-keys are the ones it
introduced.

The IPv6 Relay Advertisement is sent from the address the Discovery was
sent to, as RFC 7450 s5.1.2 requires, so a gateway can discover the
relay through an anycast or secondary address. A Discovery sent to a
multicast group, or from ::, is not answered, since neither can be
used as an address. The IPv4 Advertisement has always been sent from
local_ip, which breaks the same case for an IPv4 gateway. This series
leaves that alone: it changes the behaviour of existing IPv4 relays and
is not needed by the IPv6 code. The IPv4 control senders also look the
route up with a zero TOS while the packet carries AMT_TOS, which is the
mismatch that patch 2 avoids for IPv6; that is a possible separate fix
for net.

The IPv6 socket is bound to the underlying link. That makes the IPv6
route lookups strict about the output interface, as the IPv4 ones
already are, and keeps link-local peers on other links out of the
tunnel table. An IPv6 gateway accepts a zero UDP checksum on Multicast
Data only, as RFC 7450 s5.2.3.3 requires; a relay requires the
checksum on everything.

The IPv6 tunnel MTU follows the route's path MTU, as on every IPv6 UDP
tunnel in the tree. RFC 7450 s5.3.3.6.1 and s6.1 want a relay to offer
a switch that turns dynamic tunnel MTU adjustment off. The IPv6 stack
gives a tunnel no way to do that: it records every Packet Too Big in a
route exception before it looks up the socket, and "mtu lock" does not
apply to IPv6. So this series does not offer the switch. Patch 5
explains this in detail.

Received headers are handled as commit 3656a79f94c4 ("amt: re-read skb
header pointers after every pull") requires. amt_rcv(),
amt_request_handler() and amt_update_handler() copy the outer source
address by value before any pull, or after the last one. The discovery
and advertisement handlers take header pointers only after their last
pskb_may_pull(), and the send paths never pull the received skb.

The iproute2 support is a separate iproute2-next patch:
https://lore.kernel.org/netdev/20261125170100.3054010-iproute2-omar@blockcast.net/
The selftests skip when iproute2 or the kernel lacks the attributes.

IFLA_AMT_LOCAL_IP6, IFLA_AMT_DISCOVERY_IP6 and IFLA_AMT_REMOTE_IP6 are
the next three values after IFLA_AMT_MAX_TUNNELS in this series. The
net-next amt limits series appends IFLA_AMT_MAX_GROUPS and
IFLA_AMT_MAX_SOURCES at the same position, so whichever of the two
lands second renumbers its attributes after the other's.

Changes in v2 (netdev's Sashiko review of v1, and net v7):
 - The base is net-next 24630ff92eff. The three net prerequisites of v1
   are now in net, as v7 of the hardening series. v1's "amt: send the
   relay General Query directly" is not needed any more, and the GSO fix
   was done differently: the device still offers software GSO, so the
   tunnel MTU check in 5/12 is made per segment with
   skb_gso_validate_network_len() instead of assuming a single packet.
 - v1 3/13 and 5/13 are one patch now (3/12). v7 made the Request
   handler stateless and moved tunnel creation to the authenticated
   Membership Update, so the endpoint key is carried through
   amt_tunnel_lookup(), amt_tunnel_get_or_create(), amt_update_tunnel()
   and the new amt_relay_mac(), which both handlers use for the MAC.
   The ICMPv6 Destination Unreachable for a full tunnel table is gone,
   as v7 drops such a Request silently.
 - 2/12: route on AMT_TOS through the flow label (Medium on 4/13, Low on
   2/13); count route and allocation failures with DEV_STATS_INC();
   drop a Discovery from ::. A failure of ip6_local_out() is still not
   counted, as udp_tunnel6_xmit_skb() returns void and passing a device
   would add control messages to the tunnel's byte counters.
 - 4/12: the Membership Query and the relay's General Query take the
   gateway endpoint as a union amt_addr, for v7's stateless Request.
 - 5/12: at most one Packet Too Big per multicast packet (High on 6/13),
   not one per tunnel; the inner family comes from the parsed version,
   not skb->protocol (Low); a tunnel MTU below IPV6_MIN_MTU, which a
   source would ignore, only drops the payload.
 - 7/12 (8/13): the message says that none of the new sender code can run
   yet and that the amt_send_membership_update() conversion changes no
   IPv4 behaviour (Low).
 - 8/12 (9/13): an Advertisement is accepted only if its UDP length is
   that of the device's family (Low); the deferred Query check in
   amt_membership_query_handler() uses amt_from_relay(); the IPv4 half
   of the 0.0.0.0 fix is net v7 3/6 (Medium).
 - 9/12 (10/13): the policy of the existing IPv4 attributes is net v7
   4/6, so the hunk that refused a 16-byte value is dropped (Low).
 - 11/12 (12/13): disc_answer() reports a harness failure separately, so
   the ff02::1 check cannot pass because the capture never ran (Medium);
   the script skips without CONFIG_IPV6 before creating any link (Low).
   CONFIG_IP_MROUTE is already in the net selftests config.
 - Fixed by net v7 and inherited: the Update handler use-after-free
   (High, 5/13), the duplicate-tunnel race and the zero-key MAC (Medium,
   3/13).

Assisted-by: LLM

Omar Ramadan (12):
  amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
  amt: send the Relay Advertisement over IPv6
  amt: key relay tunnels on a union amt_addr endpoint
  amt: send the Membership Query over IPv6
  amt: forward multicast data over IPv6
  amt: size the encapsulation headroom by the outer IP version
  amt: send the AMT gateway control plane over IPv6
  amt: receive the AMT gateway control plane over IPv6
  amt: add netlink attributes for an IPv6 outer transport
  MAINTAINERS: amt: cover the amt headers and selftests
  selftests: net: add amt_v6.sh for an IPv6 outer transport
  selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes

 MAINTAINERS                              |   3 +
 drivers/net/amt.c                        | 861 ++++++++++++++++++-----
 include/net/amt.h                        |  60 +-
 include/uapi/linux/amt.h                 |  13 +
 tools/testing/selftests/net/Makefile     |   2 +
 tools/testing/selftests/net/amt_gw_v6.sh | 207 ++++++
 tools/testing/selftests/net/amt_v6.sh    | 355 ++++++++++
 7 files changed, 1301 insertions(+), 200 deletions(-)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh
 create mode 100755 tools/testing/selftests/net/amt_v6.sh


base-commit: 24630ff92eff08500ec4772728d4b1fa08c28f47
-- 
2.47.3

