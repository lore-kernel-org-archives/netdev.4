Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454320;
	b=zj1QmvIbuPXbURB3QqSP8KoftzOJG7OIa3yjse5LBUaXYZaTv+5tNYf6izo4FZACaWRE
	 0+pLgaHl4y7DGGuv6Yrzp5LT0zsITzJ2oUiDboB1czkSuExGddbuVswSu6yEx9yHHY8qz
	 UTmeOexXMBAyP8YeHU4SqabQAOB2jdxyrlvkGXT4Zycg9aqSr3wte04tC8jnL41mJffdd
	 mjzlsyW1+VfMO1BPKfVBqTjlZviNVlPmbCag/SnfbpPUIyiRtjaYCNDJ1+tmp/DU190od
	 mr8fDZyZwlheGj7fxCVYaNFmkjoT2qhkPBW6VOSZoCKxcSvAUZV0xfHfaFdfDcAsvmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454320;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gj1hSguyCQXDj4T9K/2Fg1c9f4Jum2sq357NB14Izdo=;
	b=qvzC+Qikweye+fTLvU7yHv7ObKrzXr8yMFJmsVVcsfRTpUGthr//GK5Pn5big94saCTk
	 s4NRqXhbOMMIR/bevkVBIAN/nnFB90tjh5CIdcW0GCBrSddRb9HFGS76cdFHOJ9tAbJ9f
	 6/028cRDEsdD4kXic1HttgRFfxEnk4AIUXP3nH76Lw8xqWW03OXyibgfWirdYBYSe7zsj
	 7ZkIv9nw4xd8deqDjbi0CLFJAQRL8feM7/HdAbEm+m72K3uSgOq6jBKSS8W8pxIYxWLeT
	 /LHrSLRhqvNbR0iFDF6aeyjYjncPZsvHffmQ76WqKkaf3xgSw57eRdkq/5sMUg0hBRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=qEOx6wTf;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 47F74606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=qEOx6wTf
Received: from kero.packetmixer.de (p200300c59714c2E05A704819B6bA2DB4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id A1759FA039;
	Mon, 23 Nov 2026 18:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gj1hSguyCQXDj4T9K/2Fg1c9f4Jum2sq357NB14Izdo=;
	b=qEOx6wTfhumqnID6mo/8ZF4Rn69LImUfbk0NWi0PLJkydKb8DKGz3XWCF1MD7Nsw29LGsq
	JfiFja12weGs883Hjz74VbUNxBPXSXXmdjXSGgktiHZXFxKW62lD47tSPhMIna54X13vN6
	R7ZCqeUHP2RLWxlm9baZyKiFHfXmovQXYREQe/5jhvbAxf9hVetgFMjsMarOSWtD7L6/kB
	gkiSOcnfVjmyAOZ8dP1hcUr8/fqGcFf2aodZnrcn+lKU24cIIKHN+WXQQDjGfRx7Xn6W93
	4LBYJ5JFT1fgbZsZi0UMLbkpSoEJWu92JN7SepLygyHNYhvDIuKYM971KZmQBA==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH net-next 00/15] pull request for net-next: batman-adv 2026-11-23
Date: Mon, 23 Nov 2026 18:18:12 +0100
Message-ID: <20261123171827.3294525-1-sw@simonwunderlich.de>
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

Dear net maintainers,

here is another pull request of batman-adv to go into net-next.

Please pull or let me know of any problem!

Thank you,
      Simon

The following changes since commit e2c4b4b08e96e8ada2674ce26ff9e4abc33897bb:

  batman-adv: annotate functions returning objects with __must_check (2026-11-01 18:13:10 +0100)

are available in the Git repository at:

  https://git.open-mesh.org/batadv.git tags/batadv-next-pullrequest-20261123

for you to fetch changes up to a859ae9d28de739ad791a5f83482808665d706f9:

  batman-adv: tt: drop ADD+DEL events of never announced clients (2026-11-20 08:33:06 +0100)

----------------------------------------------------------------
This feature/cleanup patchset includes the following patches, all by
Sven Eckelmann:

- document refcount of returned objects

- mcast: use mla_lock also during mcast_free

- mark functions inheriting critical sections

- bla: register own backbone gw when claiming for local node

- tt: rework local entry hash and locking handling (11 patches)

----------------------------------------------------------------
Sven Eckelmann (15):
      batman-adv: document refcount of returned objects
      batman-adv: mcast: use mla_lock also during mcast_free
      batman-adv: mark functions inheriting critical sections
      batman-adv: bla: register own backbone gw when claiming for local node
      batman-adv: tt: unhash local entries with hlist_del_init_rcu()
      batman-adv: tt: refresh local entry in single flags_lock section
      batman-adv: tt: don't remove unhashed local entries
      batman-adv: tt: don't queue local events for unhashed entries
      batman-adv: tt: remove unannounced local entries via pending state
      batman-adv: tt: keep local entry unchanged when ADD can't be queued
      batman-adv: tt: requeue DEL of pending local entry after failed allocation
      batman-adv: tt: extract removal of pending local entry
      batman-adv: tt: commit only the announced local changes
      batman-adv: tt: avoid list_lock for unchanged local clients
      batman-adv: tt: drop ADD+DEL events of never announced clients

 net/batman-adv/bat_iv_ogm.c            |   9 +-
 net/batman-adv/bat_v.c                 |   5 +-
 net/batman-adv/bat_v_ogm.c             |   5 +
 net/batman-adv/bridge_loop_avoidance.c |  15 +-
 net/batman-adv/distributed-arp-table.c |   1 +
 net/batman-adv/fragmentation.c         |   1 +
 net/batman-adv/fragmentation.h         |   1 +
 net/batman-adv/gateway_client.c        |   8 +-
 net/batman-adv/hard-interface.c        |   6 +-
 net/batman-adv/hard-interface.h        |   3 +-
 net/batman-adv/multicast.c             |  18 +-
 net/batman-adv/multicast_forw.c        |   2 +
 net/batman-adv/netlink.c               |  28 +-
 net/batman-adv/originator.c            |  16 +-
 net/batman-adv/routing.c               |   1 +
 net/batman-adv/tp_meter.c              |  12 +-
 net/batman-adv/translation-table.c     | 930 ++++++++++++++++++++++++---------
 net/batman-adv/tvlv.c                  |   5 +
 net/batman-adv/types.h                 |  14 +
 19 files changed, 787 insertions(+), 293 deletions(-)
