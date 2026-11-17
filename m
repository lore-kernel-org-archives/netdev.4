Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950337;
	b=Pl2a0rScJecr0MziRczxFDs3C3o1NEA/nXQMlvf7sS2Q9aYBCjELXGf6GwN+T7gkX1N5
	 mjJ4kSMyhVXOeXy6LORDvqOHC021sLVClul8Pw8LPXZxfHCNLxICxzFHSAUCYrwQMfw1R
	 j+/oGwRY7JhPRn+mi3BV4YHopZeZo7YqEgBSZ7uXdx/C0PDu+MYrYsovpIRW7UQ8kH7TP
	 tU0mCGbHNLJIvY7m+gauqigya4ocUqjOiFZMB6HOpmfAAUT65jD3fdmQM/5tZSivY1KPx
	 76iGi/emK6bWmtqcQyyZwbJxWUsQ2s8inw1vV/ns8ayVgxOs4gDUqwRtpKbOzG6LXDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NzJ2Bb+Q4pFA7Ac8kYSSler8jRAlZD4cmkNKcBAuToU=;
	b=Zb065oZfpYCJesv64ZpW0sgKRONc9EZD5/uVXCc9SYTNuM1FxYwsjRG9slg3EmTWfxq/
	 JAjhNIy0avGA/1qLNhEdR6aJiJa/P58UL1l5O3zmxB4WWGBU60cUUNf3oVgXfrx97ZLlY
	 tzc5rGSjRe+lWX9h8RudihW52Raz17ucIepEyuJ2d7FzhNk7hqGY35U7mGboKTvSbMmaU
	 QvPQdpcVjWqke7yKQHMFNb+Rngzw86EuFQhY4p3J0PuPcgwA+ViMBnU6rFhiSQvC/lWvX
	 d5m1lS0gDZGbf4TJ2HEBTVI6J33g3UNFZi1/kXeS41C9K1uf/9QaigWayDo9rYC04rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuhNEevQ;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA15606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA15606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuhNEevQ
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1479be604so167729e87.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950335; x=1795555135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzJ2Bb+Q4pFA7Ac8kYSSler8jRAlZD4cmkNKcBAuToU=;
        b=HuhNEevQVm7s12s4eGURYZ9cLr8EgzuW96w/6GL4+Jpy5MWVFBGaFzbztXeVsFCiD+
         sfSgOYMFd0qd9D50Upp0IvR1M0WMmAGihDdNOemsFTRGbZGjIFcEaOdKgzw4sc6U2CJD
         Ea7ja44M2g3/s9w9PSSNV7n+ZbZkahcZ79Odw73Wj/1HfekoPBJJRhKR8vAY+flc4B3I
         Lhw6qCu/iRERrrqxXmK7C4+UsJjLLr7+Ug/mo/YkXokJGfpC6pTCHbiLdpSsu3q5YWJp
         3h/60oc5eG+sOM4szip0ljuHeYdgCl/6USJwswn/NGnJ1Ajeqfz7QstS2I3cIgY2mz9B
         T8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950335; x=1795555135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzJ2Bb+Q4pFA7Ac8kYSSler8jRAlZD4cmkNKcBAuToU=;
        b=vfKZhOu/esnsjiNqqlXcEn0mlLLBnl+PMBQLOYXlX1/XuNzabXTBbdC6yihw/V3qvU
         /5XKZhv1+i/wu0u8lc54ty4QeQ5JLcZXHzbV5uq23vnO+E4hU31oHNruasuDXaI8t8Gb
         lTNMkFTPacbe2e3kUm0PyPiL54W+8h8Hh9gwBjsINPxKLbX6YTWdzj7sJz+MMuSr+Du6
         wVZ5Dy36VjQeTkvK3qqH4ApYJ6Y8Bli1261GmCIi68j961cuvLiyhZ/xKy/AXkEKDmOg
         eacLDufYeJejuZUv2BBlQmPMLgRT5Aju9QIfOf/SHk85vYn0OembpQJ5HCPoseeZ3JL4
         0J3g==
X-Gm-Message-State: APuU4Z9g4wlC92SE+oQLm5LFpbCqDmAUIsYM4Z7p67i2GmlWOhn+5mLW
	kHww4++fa6X4zTxmg0EhE91gz/j2xHs8nDGHu4dqLuds7iIAzCnsUC37sa6OQqNk1RA1Mw==
X-Gm-Gg: AYBFou1Z9IcSHR28DoHwswvp0mdUUY6mA+WLhfGyoScyLBc1CNZkVXtT4Ek8WEgMfN1
	4+IrcDHxt5psCy0FJ1wf0n0bvKj4Da4p8gWIUdsrQYLuMc+DrZ+YK+BxUQZMBtDIq6Kdu9AhHCi
	0k4AZ+RKFQBv/riZoxPwEhmPw0lDB2Bj957syV/TM/ITeGpuKPsh/sTUncAlhpu3ReE/dMIxslf
	SGcPICtAkNNdeUrZIwfWiRrWhXYrneJhZC2E4f2+XP4nYPjyZ68UdvWMrJsQnWokO02CdZ+ONZi
	mavHECXdHG0LQDwTkRG7eVI45EHQ2uzABbwaxNSu45acruo9n11uEus/rMAIaoKxipa2G7FfZQN
	5HmH+zgpFecg+UCxbmcT1N1zDFMtus9wAOp94VJ88prV78ZxHThWyNg1vlUQn4tkntP/5anl6C8
	V2a+sCAi7e6fwQ0O8SGHkYBCS0oyQk1pqOk1QvnsYp0f+StBy2un5W6uQq5kk05tMs1U62fIg9W
	VDkWI6LsQ09+wS7ukZ49AkNXShemXGw7jGHOJSBfVoKGV9ySlmbDap3GEoX272skEPKmgmI4gYh
	Z42TUljtnounmcATL71odO6NzLg5LNyEfzf2y3+ZyqI6lsbMMZrn2n6SSi8ecB1DfiNrCZEN8f/
	oBy30/yCvHP1bWwkiyQ==
X-Received: by 2002:a05:6512:3e19:b0:5bf:a592:1d6b with SMTP id 2adb3069b0e04-5c1aa2b7054mr105065e87.62.1794950335244;
        Tue, 17 Nov 2026 13:18:55 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:54 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v7 0/8] tunnels: add core and gre drop reasons
Date: Wed, 18 Nov 2026 00:18:45 +0300
Message-ID: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Several tunnel receive and transmit paths free packets from unrelated
checks at a common drop site. For example, a missing GRE sequence
number and an old sequence number both increment rx_fifo_errors.
Reporting a reason through skb:kfree_skb and drop_monitor lets an
operator distinguish a tunnel configuration mismatch from a reordered
packet or a peer that restarted its sequence numbering.

Patches 1-5 cover the shared IPv4 and IPv6 tunnel receive paths and the
GRE and ip6tnl receive handlers. Patches 6-8 cover IPv4 tunnel and GRE
transmit, including FOU and GUE encapsulation failures. The IPv6
transmit path will follow separately.

The series adds four reasons: TUNNEL_OPT_MISMATCH, TUNNEL_OLD_SEQ,
GRE_CSUM and TUNNEL_ENCAP. It reuses existing reasons for tunnel
lookup, header validation, PMTU and allocation failures. The device
error counters keep their existing meanings.

I used Claude Code and Codex to help develop, test and review the
series and edit the patch descriptions. Testing included virtme-ng
and a local run of the Sashiko review prompts. I take responsibility
for the changes.

Changes since v6:
- Rebase onto net-next a0aa9ceca03f as requested by Jakub.
- In patches 4 and 5, report TUNNEL_INVALID_HDR for the ERSPAN checks
  added by 7ccc5e05043b ("erspan: drop packets with an unknown ERSPAN
  version"), including the type I check on IPv6.
- Carry Ido's Reviewed-by on patches 1-3 and 6-8. Leave it off 4 and 5
  for review of the new drop reasons. Shorten the patch descriptions.

- v6: https://lore.kernel.org/netdev/20261110202021.821224-1-littlesmilingcloud@gmail.com/

Changes since v5:
- Split out the vxlan patches (now in net-next) and defer IPv6 TX.
- Set a reason on each path to a drop label. Keep NOT_SPECIFIED for
  looped-back multicast and ip6_tnl_rcv_ctl() failures.
- Add patch 6 to distinguish allocation failures in ip_tunnel_encap().
  Its IPv6 counterpart will follow with ip6_tnl_xmit().
- Mention reordering in the TUNNEL_OLD_SEQ description. The vxlan
  series already updated the RECURSION_LIMIT description.
- Describe AI assistance in the cover letter after 1e035297ffda
  ("docs: remove Assisted-by references").

- v5: https://lore.kernel.org/netdev/20260930183910.3151873-1-littlesmilingcloud@gmail.com/
- vxlan part of v5: https://lore.kernel.org/netdev/20261005201417.906344-1-littlesmilingcloud@gmail.com/
- v4: https://lore.kernel.org/netdev/20260922221507.3268127-1-littlesmilingcloud@gmail.com/
- v3: https://lore.kernel.org/netdev/20260916143717.1875082-1-littlesmilingcloud@gmail.com/
- v2: https://lore.kernel.org/netdev/20260913034937.875068-1-littlesmilingcloud@gmail.com/
- v1: https://lore.kernel.org/netdev/20260831215137.549324-1-littlesmilingcloud@gmail.com/

Anton Danilov (8):
  ip_tunnel: add drop reasons to the generic RX path
  ip6_tunnel: add drop reasons to the receive path
  gre: make gre_parse_header() report a drop reason
  ip_gre: add drop reasons to the RX path
  ip6_gre: add drop reasons to the RX path
  ip_tunnel: make ip_tunnel_encap() return a drop reason
  ip_tunnel: add drop reasons to the transmit path
  ip_gre: add drop reasons to the transmit path

 include/net/dropreason-core.h |  31 +++++-
 include/net/gre.h             |   5 +-
 include/net/ip_tunnels.h      |  20 ++--
 net/ipv4/gre_demux.c          |  64 +++++++----
 net/ipv4/ip_gre.c             | 199 ++++++++++++++++++++++------------
 net/ipv4/ip_tunnel.c          |  61 ++++++++---
 net/ipv6/ip6_gre.c            |  66 ++++++-----
 net/ipv6/ip6_tunnel.c         |  45 ++++++--
 net/ipv6/sit.c                |   2 +-
 9 files changed, 331 insertions(+), 162 deletions(-)


base-commit: a0aa9ceca03f8eceb58174c9c72d480b2422d199
-- 
2.47.3

