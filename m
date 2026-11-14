Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647771;
	b=PqAD83oQFxz9oI7CWs52kfbAdJuYEVoYI7rT/MXF6fINq9YZohsLfuBwYvI5h//DTBZe
	 hf5N4/KS4dANNzqDjfKH0kQkfIUoJj18EqocukkMY+/CNjjzJbccqWwbMP+6Wp2bqbddv
	 uvO80eSGp1TWjDS39xz+ZsXKjdaSRq4XGdDvH2EgoOe7JlLq2i7Nvbcm9+29q29C3fQ5Y
	 Oji0Ytk/fWmy3lK989U2qe+evOjiFaPgDxLqURw3DvsQ4nWF7BgLJAo6+Xt1TKL8j9CEY
	 2tAgnZ6LxYlQF5TrGFInuuihvPQgl5KEuVmWFlkc4erw9q+6uUf+CMnOJXHqCs53t2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647771;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VeB0jYC6+zpSJAoBxeDUgpp5ixdXEAE72IDA3+gAE3M=;
	b=s4DO5eX2K27dh3ORpHQCZ/tAqCZmxR7uaQf8kbs8vIM9IDKHFJLhLBuuN/vy7pmMLDLD
	 Rlw0zglk9xiPlcaYek8pIJw9QNS9+mPNmJ8lHQtlCXUgj7CLKFQcp7dRYpuKs030VD/7y
	 qwCaA+UfdGSRzmUBZKDKp6PDB5EBd0yVVthB9ZJF5OKvWBddcxYV1PalphYz0hbw4af4G
	 HDQ2OlhnKt2VnPxldjsrVU77cQENH9c1jzM+pgSwFcMMvfjKLCwF6DfxSGhh4MNhrB/pt
	 Nj5u3/g2JRgBvxcY35oVlo6k3ACzI5d8GF08WhdicLpBS4Z7hIsPbMlS1VOTkOSSQAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=e474Cllx;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 5F46860A2602
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F46860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=e474Cllx
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 4DE2AFA262;
	Sat, 14 Nov 2026 10:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeB0jYC6+zpSJAoBxeDUgpp5ixdXEAE72IDA3+gAE3M=;
	b=e474CllxrcR39m3gPVulcyvj/7YmhHLQVhpSzL6UofdzAruhudb5Hpx+/e9B3kYzIWdWJj
	afteiIijqvXeY8ad7F0tdYtdIMVRgFHnGxkAEgd1CIhr97Ywejmxa2+oJyX+LQwnSaUk2w
	O2sZWAz8chSqtaa7hpaXlPn0CxxKN8j5EGP3Mks//sEDYDB7OXv95ltV0EbaZjnWRt7cz0
	p6sJYrZeE4IpwpA7T2ljHLXSnFSi+cjYGspoymttUXvaOIk5mxrCAQR5Gt80tdrH+lnqGM
	qhN7hJuLPPIIxz2WigLQGOG8ClN/xR/M46v8bBXbL9OaPg9F1B4K6fr09ybMVA==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org,
	Sven Eckelmann <sven@narfation.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH net-next 12/15] batman-adv: dat: increase hash generation when purging entries
Date: Sat, 14 Nov 2026 10:15:53 +0100
Message-ID: <20261114091556.3336038-13-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114091556.3336038-1-sw@simonwunderlich.de>
References: <20261114091556.3336038-1-sw@simonwunderlich.de>
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

From: Sven Eckelmann <sven@narfation.org>

If batadv_dat_cache_dump() is preempted during a netlink dump and resumes
in the middle of a hash bucket while __batadv_dat_purge() concurrently
removes an entry, the dump offset will be shifted.

Without incrementing the hash generation counter, netlink won't set
NLM_F_DUMP_INTR and the userspace will not be informed about the
inconsistent dump.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-83da443f-ce69-4393-a29f-e02b70d1ec96
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/distributed-arp-table.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/batman-adv/distributed-arp-table.c b/net/batman-adv/distributed-arp-table.c
index 37de9787104d5..d558d2300d607 100644
--- a/net/batman-adv/distributed-arp-table.c
+++ b/net/batman-adv/distributed-arp-table.c
@@ -248,6 +248,7 @@ static void __batadv_dat_purge(struct batadv_priv *bat_priv,
 				continue;
 
 			hlist_del_rcu(&dat_entry->hash_entry);
+			atomic_inc(&bat_priv->dat.hash->generation);
 			batadv_dat_entry_put(dat_entry);
 		}
 		spin_unlock_bh(list_lock);
-- 
2.47.3

