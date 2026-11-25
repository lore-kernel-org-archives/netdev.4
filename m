Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566164;
	b=tMbXNG/AvJ0pogi+3Yh5Z072KBqQyJoErCrWtZcNoUpXu34Z+Pa6TY707bvIs3COgDri
	 x2lD9gjb009viH4GwtUiZe3zTE8wnZaotaxeGw5CGJnYdF/qLygN0oe3tH4MGFKQ1qcUv
	 m98A1Wo96z3D9hB106b2OjnIkKC4OXEz+Ek4DHqAQNd/2jwSyMgb/V+jFNo05VLL3knp3
	 SZtT885VEe3ylPrxdyQswqwU6nhk2cTgmEkRgw5DW2cgYD1zzGdgkMicZnyC4Y/qABeYa
	 yymAAgiLwb0IAvg2FthTM8951R1GlDYwbZoNfd1KyjW6whxx9aNhP40hO87vVd3jXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yDDEbBwiCXtAPYvUwSqi6leKCN8T0j7nwZva/lpaRX0=;
	b=nWCHH2XSFcUU86ziHT7yqVjT/UTT32hcGjix9RXotHmzhLaljWIzY9IseqzyoXF2qpLf
	 R5J8Lauucccqw1iSEWQfTK4RgBsJYvqj52WHaqM6ZVtyT1daSiu4ChG2npNu7APqfjgHx
	 tWEKuF33c+osUrNpKZSuRF3DhDaghlCr0ndvwr3wP5fa9GbjxTW+ibfVges99QiiB4XG/
	 Uoa1W1PrcyBwPfKEk7L8OWr2SSg063xYX5iikE6Xg56lsNTFLR6iTrel8E1pfaxAjttjE
	 tI9aqPBFAs/FiSkKiQ5+qR2TBd4s1zNA31JYnLS/S3FqQNzXJJB1wPmXLCIy+2iyzng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b="gF/+bAGu";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E48606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=gF/+bAGu
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3214424f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795566162; x=1796170962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDDEbBwiCXtAPYvUwSqi6leKCN8T0j7nwZva/lpaRX0=;
        b=gF/+bAGujjFgABB2Ctql/5gnqR9plAJB+Wu/BJa4QorsRwfOTVJf+bhMsXRDSVdO0j
         xgPLCmDSAbFXmyxVQaz/M8jcthOsPOeAuWpUfHNTLoqXNwBmWLY8Mt5NSiUCYYpKIGQp
         jBeKis6OXIiYTzebnZAhs75D/BReZlRy3CmwqO5GCgiQUQU/9vIlZAfh9RkLchFu9ysl
         AL2bST8jayUIceCcFGL83NW60EPLS3Su+6yz2knkqdKR8hqnOXLaV54jZ7g1QTst0GIb
         j+toxypBQVw9U6zI5H0cLjAtE3QywOiehwsZqyudNsVPQD4129EtPIx+aqPL0w/fKji3
         mfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566162; x=1796170962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDDEbBwiCXtAPYvUwSqi6leKCN8T0j7nwZva/lpaRX0=;
        b=Rq9B9wtEGJrDjq/TDdkBNjALGgMH5HQLDkmWG5nU9m27Qgr0hbjn2ZvaPz2nTGKjeq
         SKNE6It8dCj+n6DI1urJ5yM8wqcV9ul144ub0ux0SSNQG/qNnJI4U+8uMAJ5sEY3knWm
         MmU8sOhW0zzPxVlRCywcnKadTnZsK43dsVvdykuFd/mc8ahsP0uusTow7+BvIM67YSYJ
         yR2JSED5rwjSqewOBdsy7j4YZ96nfIojEs+kODorDSAzK6EXd1WSMpOyCoDOGyItGJOU
         ZQzk/2/0xLbr//fh40RTNDkFdXjW+GA4HLYXq1eOQG2gPeud59alUmbZdq8FMPy5G8Kt
         sDSA==
X-Gm-Message-State: APuU4Z/sV04GlsneUQ32QOuzUE7RWyIZ4vuyKXsgPH36LL26hxTRTgRp
	woZIQkADnPDxm0AVYvbvX0jFcEXi7CaIAN77J5LMPUx3jOEUR3SfYfO63UaT9a3hEFMuMAN920C
	ToP6WkJGAnNLKIR9PIUEEw9uLFr9DJCeTM9ruuYlmcYsjiChTCTLjaiKFAB+TvV7XyYo=
X-Gm-Gg: AZFdTZdZwCO4XF8nl2RqplLTYSL2/Cruc+0sxy/bckHwcZcoEIv088MS+fdywyMnZFv
	/wOkBkw4SnF+zrc2oxHUF2QgttDKs20GggXDhiBg/hzZeJlZEnd6jLS5IfIyAAXP98L+eBwvgzf
	zRpCvB73R79KZHRQrIZtvAUAjtBox/s+9ta4/ZL/D1Swx3BBNhDOSDevdO8VXsrK48DTHSJobpC
	rd1VUbp+y3NEZQu/1WnQxabFOu/fv3khXKgt1/9q4L5NVI4F1HSY1RsQ3zKafyzYGiplifhTkOD
	EHqYqPHkxoP07e7J2NtJRSGPDFqlnVt0LTaRUDO8k2uzNViur0NiGJNWzKNMbm8ApEQ7SY/ghaS
	SaG0UuEMM3S9MrsyY0cEafkZ3DMXr+sYy6N9Qy9J1aTirOmH1MZep1HH8kat98qZZaG6QrIw5V4
	IV5hJmJF0TBmByRekYvrNu91pqJd4ZWgMr33VXsPDoxqeZUNUsRb/fTte+zdCMCTCw9J1i8cIti
	e7/jfzR/NJ4GWZ58fE3GKIS/Pq6PgKps7rlTNGmesmEr+HuP+29kRgl1m7JoEEO6ub3bYYbptYW
	bzoBPGk9cWrhJGj7ybGUWBf1sqVY0hXCQU1X1QJctU8bN2lqkktQ+Q==
X-Received: by 2002:a05:6000:41c9:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4abaab633bcmr31756949f8f.3.1795566162219;
        Tue, 24 Nov 2026 16:22:42 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5c82:5cd3:7bc5:2809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31518448f8f.16.2026.11.24.16.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:22:41 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Antonio Quartulli <antonio@openvpn.net>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Ralf Lici <ralf@mandelbit.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH net 0/7] pull request: fixes for ovpn 2026-11-24
Date: Wed, 25 Nov 2026 01:22:31 +0100
Message-ID: <20261125002239.1191542-1-antonio@openvpn.net>
X-Mailer: git-send-email 2.56.1
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

Hi all!

v2 of the ovpn fixes PR, addressing the review on v1.

All patches fix code released since v6.16 and carry Cc: stable. Let me
know if these should rather go via net-next.

Patches 1-6 fix issues reported by Sashiko and confirmed by code
inspection; they are not triggered by OpenVPN userspace. Patch 7 fixes
a selftest crash we hit on musl.

Two of them fix crashes reachable by a CAP_NET_ADMIN user via netlink:

* NULL deref on TX: an IPv6 remote was accepted on an AF_INET UDP
  socket, and ip6_dst_lookup_flow() then dereferences inet6_sk(sk),
  which is NULL. Such remotes are now rejected and the socket family is
  rechecked on TX (patches 3-4).

* Out-of-bounds access: a raw socket with IPPROTO_UDP could be attached
  and used as a struct udp_sock. Only real UDP/TCP sockets are now
  accepted (patch 2).

The others avoid UDP packets with source port 0 and fix TX accounting:
TX bytes now account the same payload as RX, and locally dropped
packets are no longer counted as sent nor refresh the keepalive timer.

Changes since v1:
* patch 5: replaced, TX bytes are accounted like RX for UDP and TCP
* patch 6: also cover TCP packets dropped from the output queue
* patch 7: fixed Fixes: tag
* patch 3: clarified commit message
* rebased on current net

v1: https://lore.kernel.org/netdev/20261022121606.732029-1-antonio@openvpn.net/

Please pull or let me know of any issue!

Thanks,
	Antonio

The following changes since commit c5de2ce2fccdb7d3b48946179634eaa3d7ce2e7e:

  tcp: fix shift-out-of-bounds in inet_csk_rto_backoff() (2026-11-24 11:10:47 +0100)

are available in the Git repository at:

  https://github.com/OpenVPN/ovpn-net-next.git tags/ovpn-net-20261124

for you to fetch changes up to 8fca08ff62c9304549055290805f07add388816b:

  selftests: ovpn: avoid calling freeaddrinfo() on NULL (2026-11-24 15:55:18 +0100)

----------------------------------------------------------------
Included fixes:
* fix selftest tool segfault on musl caused by calling freeaddrinfo()
  on NULL
* fix TCP TX accounting, which counted packets dropped locally as sent,
  including those queued while the socket was owned by userspace, and
  refreshed the keepalive timer for them
* make TX byte counters account the same payload as RX: UDP relied on
  stale skb metadata, while TCP accounted the whole encrypted packet
* recheck the UDP socket family on TX, since userspace can still change
  it via IPV6_ADDRFORM or IPV6_V6ONLY, and tear the peer down on
  mismatch, ensuring the IPv6 TX path never sees a socket without IPv6
  state
* reject UDP remotes incompatible with the socket family, fixing a NULL
  pointer dereference on TX when an IPv6 remote is configured on an
  IPv4 UDP socket
* reject sockets that are not real UDP or TCP sockets, preventing e.g.
  a raw socket with IPPROTO_UDP from being treated as a udp_sock and
  accessed out of bounds
* avoid sending UDP packets with source port 0, and do not account
  locally dropped UDP packets as sent

----------------------------------------------------------------
Antonio Quartulli (2):
      ovpn: account TX bytes like RX
      selftests: ovpn: avoid calling freeaddrinfo() on NULL

Ralf Lici (5):
      ovpn: avoid sending UDP packets with source port 0
      ovpn: validate sockets before attaching peer transports
      ovpn: reject UDP remotes incompatible with socket family
      ovpn: recheck UDP socket family before transmit
      ovpn: fix TCP TX accounting for locally dropped packets

 drivers/net/ovpn/io.c                       |  18 ++--
 drivers/net/ovpn/netlink.c                  | 129 +++++++++++++++++++++-------
 drivers/net/ovpn/peer.c                     |  19 ++++
 drivers/net/ovpn/peer.h                     |   5 +-
 drivers/net/ovpn/skb.h                      |   2 +
 drivers/net/ovpn/socket.c                   |  16 ++--
 drivers/net/ovpn/tcp.c                      |  95 ++++++++++++--------
 drivers/net/ovpn/tcp.h                      |  10 +--
 drivers/net/ovpn/udp.c                      |  48 ++++++++---
 drivers/net/ovpn/udp.h                      |   4 +-
 tools/testing/selftests/net/ovpn/ovpn-cli.c |   3 +-
 11 files changed, 246 insertions(+), 103 deletions(-)
