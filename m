Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800015;
	b=dVXwOUu3R29UxptVnUh0ovE+RWwPnpkjwueguCCex+6VRgAmVefHnpniHyyYa5GS/aj7
	 nl1cVhrGobEC0Rnwb9c7+EglOfapv/lUVUQzncyE843NILGFBHQ/SHRAbUyV2IMU6dixB
	 FfxpcRFz0qxY3y9XGskYpFQAferiJL5Y303tETe5aqjgZ5Exgog1QgGyinzfhI+rjJ8B3
	 aImGQr//RKFrFVdcUJTXupF9OyDmv3rNsX5TNyQJoHT2EWnuWjDpdW5jaT1qcPhbl3tEn
	 BLgfDo3B4Zig+jd+eT+lTCAlRjjIdL04NLOHmISNMjdKhxomAMtjJPsc4wktxcXcfkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800015;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=+bhi6dvzg4ljP3B7TapCAgatTlJLpISmxA2j011epZk=;
	b=U5psJu+AKEK1ucEiG6xki3vicEvN5DcdEHkUm/wMxvLuHkHd8MCS4IlmZXXClTjD6DyY
	 d20G7kbhMLxQdxMIZjqrsTnZpDy4e3XOFKEV1jQlSyvLWGb71poRzgVUXFdKo9fe7mAdg
	 J6k2L/xq95Z3Yn+Sk45XK98j72uQ9rV8EdyMgfjCDGs/szCorPbcyZh9loF/8TAW1tcur
	 z4SfsN9UNGEGl++UAwxdLdgqCOVZrxn0i13MiRzXCiSLKpnKHFeCrLszmUjPYNAUT4JIB
	 8MursauHPLmIKPwLkf9NL0gXnPi068GdBfsh16CThIe5FZQJzc4XMBzhtfO3ObWEOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED364606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED364606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4742822063;
	Fri, 27 Nov 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C92613432;
	Fri, 27 Nov 2026 17:20:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Yb1MH67CWuMAwAAD6G6ig:T11
	(envelope-from <fmancera@suse.de>); Fri, 27 Nov 2026 17:20:12 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v4 10/16] tunnels: guard IPv4 tunnel functions with CONFIG_IPV4
Date: Fri, 27 Nov 2026 18:17:55 +0100
Message-ID: <20261127171824.27362-11-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127171824.27362-1-fmancera@suse.de>
References: <20261127171824.27362-1-fmancera@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: 4742822063
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

To enable compiling INET subsystem withou IPv4, IPv4 specific IP tunnel
core functions must be bypassed when the protocol is disabled.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
 net/ipv4/ip_tunnel_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index 6c2855adff28..ddb8bf44040f 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -58,6 +58,14 @@ void iptunnel_xmit(struct sock *sk, struct rtable *rt, struct sk_buff *skb,
 	struct iphdr *iph;
 	int err;
 
+	if (!IS_ENABLED(CONFIG_IPV4)) {
+		if (dev)
+			DEV_STATS_INC(dev, tx_errors);
+		ip_rt_put(rt);
+		kfree_skb(skb);
+		return;
+	}
+
 	if (unlikely(dev_recursion_level() > IP_TUNNEL_RECURSION_LIMIT)) {
 		if (dev) {
 			net_crit_ratelimited("Dead loop on virtual device %s (net %llu), fix it urgently!\n",
@@ -226,6 +234,9 @@ static int iptunnel_pmtud_build_icmp(struct sk_buff *skb, int mtu)
 	struct ethhdr eh;
 	int len, err;
 
+	if (!IS_ENABLED(CONFIG_IPV4))
+		return -EOPNOTSUPP;
+
 	if (!pskb_may_pull(skb, ETH_HLEN + sizeof(struct iphdr)))
 		return -EINVAL;
 
-- 
2.56.1

