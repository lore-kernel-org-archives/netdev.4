Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168038;
	b=iipFzGBK1Nl2bxZbTWGoPNia91KP6Z8eU/BaZfgFgrm4j4mKCH9LYQXz1sYhCmaek5z6
	 mNBL5BEGs13AAGyNHw4IexndYN3zt59tdLd25YrvjBF2IcbsPPsQe6ZLsPPGDiWCXIx1T
	 Md3ydozQqB/wKeK/0eEATPL5EH6I/DTGMaEHbOiRx+JkUjU8duIcqB4uUh7lKdxWQwSIJ
	 25VQkn/1575UGXfRl2rgCLkF0IJm6zHsf3CpyRuUCcjnb1QuM+5v4Tenn8aNtGJ0aa3Tb
	 RMY9KszGIgMS+bWpI8s23w9BiiwXaymsjJX+RIKze6VskRnhrqWcuy7sZtGaUr1rQew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168038;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SvTdqnVwIENDhZTrSuh8g7cNIkRmaUcL7O5Mg6MGuzQ=;
	b=uugNeAKM/+Nn5gWyIpy0xADmXDctpHXprenAzcbZJKjouXUbJWdQBwaDRKxiEf8ANkvl
	 h5Yj1RE/STCLhJJ9SGBii3BR0/TX2iujbmkkYsmFXt16PrQ4Iw1TXjQmv1N3XHBOZEuIV
	 wm+m1GRQdPsmndpuH26tip/9aHn4rV+Mmm7t3AzAkJH5oj0DDICpGyUsTAPBNLHlUUyju
	 qAI440twuv5ljOIQ0co6jtRqa06DTuLqt/W6iDGyJW8D6Wl+3IpDIgd7xF59qLItQAe4i
	 XfzHHqb1KOCtEuwSxs6x2jIj7a2BPFBm/KESpZa0o1Rz541AEBCHd09BvbATwW8rxzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J9AE9jX6;
	arc=none smtp.remote-ip=95.215.58.120
Received: from mta1.migadu.com (out-120.mta1.migadu.com [95.215.58.120])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80440606A33F
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80440606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J9AE9jX6
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rAEFlL3ehnQf0utZCaA12Sm49W28OORcQYGQItYKVKk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795168035; v=1; x=1795772835;
 b=J9AE9jX6wAeP3qm9/xD1RHirECT6wkPpuHj6mQ9BFWd3FeBysvnrai0d9kxxkVNpg3akTf8k
 OM4sAp+jZza22OKO4lC+HfVWzGPiMBykiT1aCQ7k+zGjZ7eOVzzwx5CHir9OGfExUkxkxwKSkuO
 2OD8BetTI382/XPcTVjLmL18=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fca0a44074f6fe16;
	Fri, 20 Nov 2026 09:47:15 +0000
X-Mizu-Trace-ID: fca0a44074f6fe16
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Patrick McHardy <kaber@trash.net>,
	Florian Westphal <fw@strlen.de>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
Date: Fri, 20 Nov 2026 17:46:59 +0800
Message-ID: <20261120094700.46500-1-jiayuan.chen@linux.dev>
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

q.max_size and max_df_size are used by ip_frag_reasm() to set
IPCB(skb)->frag_max_size and the DF bit of the reassembled packet.

ip_frag_reinit() reuses the queue for a new datagram but does not
reset them, so the new datagram inherits them from the old one.

On a router with conntrack defrag, if the largest fragment of the old
datagram had DF set and was larger than the egress MTU, a new datagram
without DF gets DF set after reassembly and is rejected with
ICMP_FRAG_NEEDED, even though all its fragments fit.

Reset both fields.

Fixes: 5f2d04f1f9b5 ("ipv4: fix path MTU discovery with connection tracking")
Fixes: d6b915e29f4a ("ip_fragment: don't forward defragmented DF packet")
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v1 -> v2: Target net
v1: https://lore.kernel.org/all/20261119061751.222641-1-jiayuan.chen@linux.dev/
---
 net/ipv4/ip_fragment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
index ef7fd61284a3..0688be8142c4 100644
--- a/net/ipv4/ip_fragment.c
+++ b/net/ipv4/ip_fragment.c
@@ -250,6 +250,8 @@ static int ip_frag_reinit(struct ipq *qp)
 	qp->q.flags = 0;
 	qp->q.len = 0;
 	qp->q.meat = 0;
+	qp->q.max_size = 0;
+	qp->max_df_size = 0;
 	qp->iif = 0;
 	qp->ecn = 0;
 
-- 
2.43.0

