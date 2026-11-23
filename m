Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430535;
	b=XI6xiwGZ2vbe0CPsBRFHXUTOTunOPYiu+SBZOIQ5s8nH5JVk4UDb63uVl+U0WoIF2fA2
	 EbNTV8rx0hb0bprfJk3xKQp25vCgpGyBLe352jwwv6IWJU6PRELPqtQTAiHvlChSkID0d
	 QrCC6qpDDwVmXY/Nacw/aU5qbhpSGaUcRB7Mey7RAv635M69nfOlFzuXAcKRntcgKmUoq
	 mfHu7OO8cKCMjPUp82LcoY42rvo3k0nLahrCJGBdo0Jc3gpCfPzan035GZDKLNda/E26I
	 sOzx/kPO2B3wpbD5KgX0LCZ0zqZYbt7bUBESHUjQiy6i3xwm2tX9kzAi4LWLk199yTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GickDQFGcbJGPwiL8mZkl6lo5IjSY39jJGAkgczbLfs=;
	b=JFIFy1fQf6bjbiwbi0quAAeWY1e5xB9XFtaaEjfOa+GFekAJD4PYwTQy4Ztn8x4gV4UW
	 6uUHNg5d71Y3bbIDnIIlWv3JvaECCpyEtRzqGfui0n7BqjZCM4JtJOIBwgSSN2H2HfUlQ
	 92MGGfq4jSefZtRtzheyQfre2d51rALZT4GU4U0q+je0UmQFatK5E9+w5OSZVcxLNUAQj
	 JP8mdha1WS3l1dCeG73IW8ReSUzvrHFVVBeacgXmqnW7BYi+kriw+xqmRiw1hlN41IDu5
	 rHhHkyVKKb71Wv2HaWjHEtxl2Djwa3HSxcw5A/hQHH4soH4jc/q6V24SAmFXYoVApwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aT6Tmm/Q";
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AE606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0AE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aT6Tmm/Q
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso3872218e87.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430533; x=1796035333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GickDQFGcbJGPwiL8mZkl6lo5IjSY39jJGAkgczbLfs=;
        b=aT6Tmm/Q9ZsA4xY7JnuckZM5cP5YgEhGqgR7Kvxd/YkDeHLQKuVra8UhhogmkydMZg
         olMn/1AWYHVZnhxJCuo6eisxWWzv/mC1xDrddvM0Zl0CjYXPhgFoo6Q5bD4FUjzc5kZv
         N/M9EtA2cLMznlf8EPVwiZJ09MWBTKsmWPQTLKfqJ35URE8gKgqqmgIaXok4Aw3Yifl2
         cTAY/o8vUkHOS74+UqjvDEtzqJJzgpELOomhmC4a55FXDpJRho8lzcji6l/612LHI0NB
         BIIyEblDREiY3A+l9clv75eQpVkq13DCZzYhNzX9DnwkJ9oygfgI+zxzSTaQQ6axhFnB
         GdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430533; x=1796035333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GickDQFGcbJGPwiL8mZkl6lo5IjSY39jJGAkgczbLfs=;
        b=XdQQm2QJaiSPT9+koPXI0cHzNhmkhvDQm9PqZihMkfNeENTxz2073upOpchdGbzj2r
         li05JAJyDDxuc1O+IioIWnZQ9vzPzkkwgC8XAWaSnZXZ0il3kbRmFLgRQuWbMOJH78yb
         MT011IjEl2f1TxkdaBWh1+bvvLcktOiyxDxRkAE1choN3wPI+jkBBBbjtVPkne17OHUT
         jS/0SN7GXc4xzrf5XGxZy8wjIEaXP5o1//2j5gUoaz5pdKStF9yI7VK+hrxMvtrH1m0v
         f7gZWGW7RMJ70fl3TgYzUlhi2H2RqLbYjkCFi9RwhXzrXfSYYWEKAjcQYa47lXMYSxPR
         VfGw==
X-Gm-Message-State: APuU4Z9L8L8DETOGFZuOuhlZPsbZJWARsKdSVNjTcScFM3xbPFbUuNnD
	NefFvqYZTP75CH2jyQ7uu6l55jGksjKnfNb8XYnePNYgiaXgMuVfbazC9VFXwR1bLDthgA==
X-Gm-Gg: AZFdTZceGwwjXriOsU7r/BjU5O3zoPt0bh5fGPpfZZ17+g9dW0v6ER4dLQvuk7h+qha
	VObKpX6Etz+q6QwK3p86oATSBMsrflAyuj9dp9n9FqMwy1qaoPhGx7S5HcZUE7JXTDbAJsu+Ivq
	p7ZZI1zFe8isZICGKu49GMsrRxFXYOT5Uzf7pNOj4TST/9d7Q27NowhhO2yCp8+rge84kS/KEkn
	bbGy93CivNEElAlacgMKoohSZMIOzmkbbK19hT3OKgHHftLhmsKO1yiYCVuOT3hkOr03RebZ7Bp
	YNLOvsCuFhb5ZsMw6wgUfIdEZ8maIQh+56V8CkAEnlcVgIUIpyEz/0u2L2PNTmfJHzxS9hdOFb5
	K4Axp1pigOZWlI0wjfLwybt8YqRjelW9JnDdX2CNtBZ38S9s0cy+WCx6Q1YiJH4CnzwBFPnS52y
	EuA/ewZkAlCgec/KH9Rmw7urs56MUbDN7rKDE1LgMjCEKFO1DYkXmjq/RaMFdLbjFA1yw4u+Y/k
	FRdGZ6zL6C9PtJH3g1JVbZ4GMaUwz7QxpmA0pYgYhN0q7bRY9dL1RuuzuYechDrTdQenBpUpcgk
	h8WXU+ydGmSCnXHGH1wb6HZncr5OygQfxblqw0SG/KUHnwX92xf1m5q0r4ZuBriwFFUocruBcVa
	ahlA4pJItLLMQSThy+Q==
X-Received: by 2002:a05:6512:2354:b0:5c1:56e4:c705 with SMTP id 2adb3069b0e04-5c1b79fd08amr3091035e87.3.1795430533165;
        Mon, 23 Nov 2026 02:42:13 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:12 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 0/8] tunnels: add core and gre drop reasons
Date: Mon, 23 Nov 2026 13:42:02 +0300
Message-ID: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
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

Changes since v7:
- Rebase onto net-next eb6d6c80d354.
- Group the four new drop reasons with the existing tunnel reasons,
  immediately after TUNNEL_NOT_FOUND, as requested by Jakub.

- v7: https://lore.kernel.org/netdev/20261117211853.3733250-1-littlesmilingcloud@gmail.com/

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


base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
-- 
2.47.3

