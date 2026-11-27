Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795819070;
	b=5hdpogvi0Mvv0kwXqhe4eo+HgxtTG5BJBFX0I3a3bhybtxEr6uTFe6QTtCot9T4uM3oD
	 SkywEFzKPEnhxVzQqsQtpLAEVph6zapTvzpOmwUeXxiXMgo+AA4JagOcoAYS0bTJLy4zO
	 +ynw38vZ6mnSRqDyzb3bCzoOFk4AUg4P4JV7AtheR4qLU/dF1dr74DtwLZgMBM0SaeGeV
	 SJtuNTU36WZxzYTXBMtPAR0PGr9WuJRhnIg1U0+gouB654Lr5QelQcy1wUKBYNI+ds1x3
	 F0tkS0x2DU0TH3rlKaH6KqlX/bVOmO00bKNVDzwCfXs5zlokmmkHQsULjAacF7yOoww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819070;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tQTuiTysv88wPS84RZ+a9Tm4Wp4SVgkgMieh1jZXifU=;
	b=odQpF7GPvuP9yM7d2rxDEo8SdFrXgEbKG3aeWidNJhX29koyG6X+WY4qN1XuyqFv3Xo+
	 /gfa+tUFxy9F2r8OXPAMcykV2iBT4pOPAZB3KgHX3M4SbO4k8iJRi2pcNDPy3EXm0XxEA
	 s2TrPOrOVPIPmlrOScT6/0XwNDf4uAyTF9uGJdYhoilZ9O5Yx02X7bDOukve+D/zrrD+6
	 2HbSZU8OHqF0VaEKZCGzuXqMzD3PjwqHes0A5BuxtTcHGgPbQHE0LZj2mIfp36f5l6adn
	 /EpqpCBymPHUloZ46O6jRu4IB1C6aIzgND5RW+99yYjBe8stKcXyDOAbQkxtlh9DwAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTyIZjBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE9606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTyIZjBh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795819069;
	b=l2+pWGwaauJJQqZ5M8YKUAjuVpgwrVyYJXlKp9Wi012GFRuYkh7yAPCKB4gAiLSf1yBz
	 xtwkrxXVlEiZlUuCtuDObl4VNF6JsfHQx4vZNG0Frnq4s5mlHP5oc1/EJXSkG8n1BEsTG
	 jiDINYdFn28e3cyVht646VU2qI2aiXmenWFNculimlz4TgnV9JdvLoSbVmtVJO/xG1K8f
	 qiKvZ4cfyM++gU8XOMApphM0cxQYhVqmT7rxIVn+C9wTsVZSSncJpZJd6fjPYmLKK+vf2
	 8+h63i8ae2G5Ef2GUY1UvawzFx3RIrFXdGRsWRhrFQ6Myi27mmup6Cc9UMfzWgYHClw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795819069;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tQTuiTysv88wPS84RZ+a9Tm4Wp4SVgkgMieh1jZXifU=;
	b=m4r53syJanrqqToX/12zXDcg1oLBqZvF0WpJR1La+Q3UquenOdliLiz8tXUeHotV2BE4
	 xfO7Xfez4Ar87N7sTEHUQtdMxLASx/qpz97qFoiE3LUQVdVNORllpJKmWfHgu4KuJ6KW+
	 /rgq5iyZ91vkJ5WJ7thrbhAF/+sNo0OQepeNhC8RfkoodFKc2biaIN32eZ1j7ftXe1RZL
	 yr2k8PbB2OqKq8AAr7CC8s7X5eYK3mZMSUlw/bjpLz6rngI4+ACS7Tku9qPz81ZkQstAI
	 Ak5AKaTCN8Rqx7POXekueUAqUlNxN36X6h1dGPGIl9SMjOcPi9sI72l0eoeBwOFoqcg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DC731F00897;
	Fri, 27 Nov 2026 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795819069;
	bh=tQTuiTysv88wPS84RZ+a9Tm4Wp4SVgkgMieh1jZXifU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kTyIZjBh0W7X2aKtBXKsrKQXTvAzOwUuGADvBR8yJlq7U1zyIEP0M+8dY4EdxrjUQ
	 ix1zsD6HdDyQwfOxtINTbF3o9WT3qA5xoLjK3f2xSfmj6m4P34AW98T9mzGuNMynKB
	 MZ2hIzzQNIH774hcYr7GS0pJRdZSTLAZ8jOPln7Au31IlDJ8vC5AL8eOkq05KlYJ37
	 0LQFDsd06nXtmAAWBVS3ARFWPgi6e0o29ziLtBRp9JE5SvlcTSCSvF/nwwQ0p9oh7X
	 Wxriuw/zYVohYIDtkVC23fCpnNLxhW07Zr3OdJt9/ebZpn47BYARh2gqMJqRxn07lo
	 XF6M3I9EkiT1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 825F14DE56;
	Fri, 27 Nov 2026 22:37:44 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH iproute2-next 0/3] ip: support LISP (RFC 9300) tunnel
 devices
Date: Fri, 27 Nov 2026 23:37:38 +0100
Message-Id: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADIGCmsC/z2M0QpAMBhGX0X/tZX9NPEqciG+8ZdmbUjJu1suX
 J4659wUEQSR2uymgFOibC6BzjMal8HNUDIlJi7YaM21Eh+2YwerVaJXpmyGpgLXFiWlxgdYub5
 fR7/qcO3UP88LyedEtm4AAAA=
To: David Ahern <dsahern@kernel.org>, 
 Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, Matthieu Baerts <matttbe@kernel.org>, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795819063; l=1702;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=7nd6BlqaJsHgxYsTrMLtC0L57s6XiuJ62VdGDLEwrvw=;
 b=WHzsU4HmU2rdBO7RCecfGGKZX0kQYFjNY4iJ3rNAc4i+PU5BSlwio9yzH1DVUGMWfniADGx7i
 vwCJH+vpSXpCSIQO3IM64IjtPeMijPHRytppnHeKs9A8D9XJl0wjTvX
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

This series adds the lisp link type to ip, for the LISP (RFC 9300)
tunnel devices of the kernel series
  "lisp: add a LISP (RFC 9300) tunnel device"
posted for net-next:

  https://lore.kernel.org/r/20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b@free.fr

The purpose of this serie is to support the selftest of the kernel:

  https://lore.kernel.org/all/8707e3b0-c948-44ea-8afc-d33387925173@kernel.org/

A LISP device carries the packets of an instance ID, or of the
instance IDs that have no device when it collects metadata. The routing
locators of a destination come from the encapsulation of its route or
of its nexthop, which ip already sets: the series only adds the device.

  ip link add link wan name lisp101 type lisp id 101 local 192.0.2.1
  ip -6 nexthop add id 1 encap ip dst 198.51.100.1 dev lisp101
  ip route add 10.2.0.0/24 vrf site nhid 1

Patches:
- patch 1 uAPI header
- patch 2 link type, with its manual page
- patch 3 test

---
Vincent Jardin (3):
      uapi: add the attributes of the lisp devices
      ip: add the lisp link type
      testsuite: add test for lisp

 include/uapi/linux/if_link.h            |  12 +++
 ip/Makefile                             |   2 +-
 ip/iplink.c                             |   2 +-
 ip/iplink_lisp.c                        | 137 ++++++++++++++++++++++++++++++++
 man/man8/ip-link.8.in                   |  66 +++++++++++++++
 testsuite/tests/ip/link/add_type_lisp.t |  59 ++++++++++++++
 6 files changed, 276 insertions(+), 2 deletions(-)
---
base-commit: 8055701cb470fdc9e5e9909369bff3f7e24c872e
change-id: 20261127-iproute2-lisp-639a94e27fe3

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


