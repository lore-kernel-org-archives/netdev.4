Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647768;
	b=t3lkh/hN/urtDT8Uzhk0VFFw278LjJtkqtWA3dUnJuIgvCNz6uY0nkgnfl70k8ccBY5U
	 Xc0FwU/lRw3cEkgaXTX0fs+WD1+Z7BUclmzkWka3B1pBvqGIqxchX6/N12e4v7S8WHO68
	 +5WU2dD0viFNPygBT04PjQe/OE/G3J8TLdOzoJx80k6nRWqecoaBkIyxbWkZCu59W9x1r
	 seb7iRWbMDtByGl9D0du2DAkvoq0fSS5DDwLvGZyq+H2gOl2CBUcPjcR7l5lscv2EHKMz
	 PhMhwzAx/1r6mIlUyxzQSKheS7AW9iKsZblc+Bbo2e1wFaxEWmlt0U5No/JkSafxc+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647768;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8rVR2pfADRlgq70ZT1O0ahhdqRFAWPhCLjcwG3mDrpQ=;
	b=qAWbKE/snzE3ZYB4bfgBuKBNv4XnUHnpLQZgzpykBASJnEHiP1aYTRV2x2yB9YD/nT9o
	 eAMYZoF+LTXmtXfeY/064f5GCsaisUkLavq4ttqlCCsjXH3erDDQyUra3JEYY+eLMJxUF
	 2HXpALj205bJSTGTEsz/Q8OtvJrwBREgomkbAHWLB2/8cYXvYYnis+SW4EBeSXltqP9IR
	 17+37AEdJowdoS0fFMoffWHIh2C/0H3pTMMOyP7WZQnNfT/TJoSg0C/pShtiO6bf5J0pU
	 Iz9LlM6pUQ37MQEnLDKk9f1AvMJx/yKcwuRIbSyxfkA74YB0Ix/yw/xN8PJBpEluvPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=T4go6vgD;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 22357606A33E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22357606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=T4go6vgD
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 1962AFA039;
	Sat, 14 Nov 2026 10:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8rVR2pfADRlgq70ZT1O0ahhdqRFAWPhCLjcwG3mDrpQ=;
	b=T4go6vgDBFWAAJ3xBilyOc3Cwt+O0E0Xtnv/5WnmDZecU/oSLwVpIIhpwtkHKVQxvLvwpx
	dH4ofneexeDeiqz9ZO4ySpQlwzZWxcdMRt7pJTvyC8fjjMnJFiUmsW6K8kfXF4sTawoygj
	7woPEmOJlpcEA+7Z4A3LGwt0Pd5ghPTVmU+8OOOOGoU4ly7Dx1uN5Th6tPBzIcLbLPToXQ
	OHzl/dT7gM+lbEjQ2G2boXqdUEikb6At2kfTahisrEVynlZczh9yLvCfw+h+wiSXKO8we1
	uXnYDVXwzSfi1P5gsAuqOXq6gQB9414OFwnOSPvp+SaCTkSNZ1yIH/6czNsMlw==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH net-next 00/15] pull request for net-next: batman-adv 2026-11-14
Date: Sat, 14 Nov 2026 10:15:41 +0100
Message-ID: <20261114091556.3336038-1-sw@simonwunderlich.de>
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

here is another cleanup pull request of batman-adv to go into net-next.

Please pull or let me know of any problem!

Thank you,
      Simon

The following changes since commit d5c0415dfb58b646696292a7af3d084200933f84:

  batman-adv: mcast: document the value stored in is_routable (2026-10-31 23:04:11 +0100)

are available in the Git repository at:

  https://git.open-mesh.org/batadv.git tags/batadv-next-pullrequest-20261114

for you to fetch changes up to e2c4b4b08e96e8ada2674ce26ff9e4abc33897bb:

  batman-adv: annotate functions returning objects with __must_check (2026-11-01 18:13:10 +0100)

----------------------------------------------------------------
This cleanup patchset includes the following patches, all by
Sven Eckelmann:

- use dedicated key types for various hashes (4 patches)

- pass explicit key and update documentation (2 patches)

- consolidate skb consumption (4 patches)

- increase hash generation when purging entries (4 patches)

- annotate functions returning objects with __must_check

----------------------------------------------------------------
Sven Eckelmann (15):
      batman-adv: bla: use dedicated key type for claim hash
      batman-adv: bla: use dedicated key type for backbone gateway hash
      batman-adv: dat: use dedicated key type for DAT hash
      batman-adv: tt: use dedicated key type for hashes
      batman-adv: originator: pass explicit key to orig_hash
      batman-adv: hash: document key argument of hash operations
      batman-adv: never consume skb in BLA rx and DAT incoming snooping
      batman-adv: always consume skb in batadv_forw_packet_alloc()
      batman-adv: split fragment forwarding into lookup and forward
      batman-adv: document skb ownership of always-consuming functions
      batman-adv: tt: increase hash generation when purging clients
      batman-adv: dat: increase hash generation when purging entries
      batman-adv: bla: increase hash generation when purging entries
      batman-adv: increase orig hash generation when purging originators
      batman-adv: annotate functions returning objects with __must_check

 net/batman-adv/bat_iv_ogm.c            |  14 +--
 net/batman-adv/bat_v.c                 |   2 +-
 net/batman-adv/bat_v_elp.c             |   6 +-
 net/batman-adv/bat_v_ogm.c             |   2 +-
 net/batman-adv/bat_v_ogm.h             |   4 +-
 net/batman-adv/bridge_loop_avoidance.c | 224 +++++++++++++++++----------------
 net/batman-adv/distributed-arp-table.c |  90 +++++++------
 net/batman-adv/fragmentation.c         | 111 ++++++++--------
 net/batman-adv/fragmentation.h         |   9 +-
 net/batman-adv/gateway_client.h        |   9 +-
 net/batman-adv/hard-interface.c        |   2 +-
 net/batman-adv/hard-interface.h        |  10 +-
 net/batman-adv/hash.h                  |  15 ++-
 net/batman-adv/mesh-interface.c        |   6 +-
 net/batman-adv/mesh-interface.h        |   4 +-
 net/batman-adv/multicast.c             |   3 +-
 net/batman-adv/netlink.c               |  10 +-
 net/batman-adv/netlink.h               |   5 +-
 net/batman-adv/originator.c            |  31 ++---
 net/batman-adv/originator.h            |  28 ++---
 net/batman-adv/routing.c               |  33 +++--
 net/batman-adv/routing.h               |   2 +-
 net/batman-adv/send.c                  |  31 +++--
 net/batman-adv/send.h                  |   2 +-
 net/batman-adv/tp_meter.c              |   8 +-
 net/batman-adv/translation-table.c     | 190 ++++++++++++++--------------
 net/batman-adv/translation-table.h     |   9 +-
 net/batman-adv/tvlv.c                  |   4 +-
 net/batman-adv/types.h                 |  57 +++++++--
 29 files changed, 498 insertions(+), 423 deletions(-)
