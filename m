Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566173;
	b=hVaPCg3n3RkIT64tn+c9DjeRkcfzDe6hxWjV+Y4G7HN6o7Z9zy/e2Go9lGSLtnxFudsi
	 KDYimjEOLh0nCU9iD8LKnMuUwqGex3d4NDIuIbcirIsnaopDOOheKKkHJw+bHl9TmIlBu
	 0sHJ6xDpMeGQdD3OcUJlS9Kvto929ETbSfKW94lsqOqMkZDBaaOrGkPc4Tuo0ySjcZM6J
	 knBpfyW/q8BhJp+zsRjnKVcsojlwWlOMthCmztj1Z5dic3YQm46Hv5JhFf+9RdwpTKMli
	 iYolO23hNXkZwsH6KD7AW5mDEXnPvG7mW/0ZIsHF6LXy2puDr+JDNmoS14KHIzAMxwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIPhS8DwvcQG0pi15UwBlmuo6rGqkjQxdAWMcWGTY80=;
	b=g7aHXIzzm2Cz283iQ34pUkLKw66g5P3/ZUFUHR2so8UIs19cNGMt4Z/To0WvtAE4znxS
	 s55b+aowNmJfZmIabWfo/yurepF663ywelQXrVe4y7gMeYOh6s0bcEdPQEIEvtLxMWPt+
	 NW4xcwlVwILv+6DuCN4vMkqgMsahio5BSFQ1GxXxDPDl+iAL7Hfux9f7jQf5sX1YZqoKV
	 42ipUUldqbgTTKSPsMxdOnrwHo9m6KyxPZP6weQ9oAr6wPzek8wm3nWjk62sNX1pf9jmw
	 P/QCRnRSXsUd9R9gMy4gJlTt2kYlGDwa9lM/Hzdvjt3ysQL8KoAXGlEro83/S+XBfQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=YSNEVpCG;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9E606A333
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC9E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=YSNEVpCG
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a358881793so2651579f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795566171; x=1796170971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIPhS8DwvcQG0pi15UwBlmuo6rGqkjQxdAWMcWGTY80=;
        b=YSNEVpCGusdRr9mfbwmbcP00nQMPYXfo8QrV80XwhCXqyjlwcwDM6gyd0yL2VoEmYb
         F0yRxdUIvPELodnAXnTZSp9NO/mK3xkwd7KqVSdUG4/395ACe+oP1ZRzBRHz7ZL/E2hS
         fsBXHjMi+n706XRjY8T+N+GnQwAMWM3P82YbxfgMrDzI0KEqfA8wkyBWVNRfU7M72wH9
         cp5164O2AUakNq4Ety2Df5dXI8xs4DlAY5UXB66e+PloxjwTlTxsfmOboyMnZ8JNwFjV
         W52f8yKZxYGaHY540AxQV8q2HYzBpk/1tsUN5r0eFjGVK46SqHZqCIXnAyqE5Z9uDt3W
         ZvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566171; x=1796170971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIPhS8DwvcQG0pi15UwBlmuo6rGqkjQxdAWMcWGTY80=;
        b=BHJ3I7+8lC4Y7QOT84egkB7YANfI+ugDqoJUr7v4jG3PDfmmhIBg8yCdO6sQKjoLaC
         HZigFITCWvB8IiLGbNICaAiVSAsgKudbe/N/u/DmkdSDR1ebrSn94zaLO54OTJrPLioj
         PKD+Hd4JQywY6+cS8cWX4mT63nXoOHF5H4EXOphh9jjeYSldJbdcjMRmm9BLS42HH1z+
         P3ifr1Tm+nrH0BNszbbE09nVlgus634VIrphjc/u7uv/0gjzDzffGfR96oDjcJV7BwQV
         Q6TCKpiLbCkxFldfWIjKTpPogEKp6BybNm7GWhMVMuN+SQUDcorcvD8dwOVL1L3j7Ocm
         9ISg==
X-Gm-Message-State: APuU4Z/HMh375bxEzuLX+llK+iJXXLmb8sQQeWTFZDRCUlrTl+sQ0/o4
	odXXhUO8rXEh1tOz7MarGJ9MbRaBpopERa1B4AQN+vMmtxJ4+x0rDpEFo7qMY+BbJ3DhqKsqAiL
	WbTuzfFZMinxAw7MpjWZpaIdDbonOvxi7dUfgRZ7RVeXGvFoZMfRLTLcfgVrRjppX3Y8=
X-Gm-Gg: AZFdTZfbsBRI1GihmiJgqfyJd648EDwj5cVcL9AoLYQf4j6dJ9AQd2rF35tHM1s6hYS
	5TTC2ONM40OvU0JPUBH9wozTrvkiiPMEUPiI0dyaYek90ERFbXnVdrpmiRZxYtnxF2TRL8e5mgr
	Iw18HrsVW+nLuZQXBwyzIy/tb2T1gecsSiDNEwzHySRxKGQ79ISUThNeWf/45JediRJh2WUwlmG
	OrThIy5cCUFu5Q5MS7RRAlHCjyn0BrQyIRzbWlac+aQ0Y6wyZr8PBlFNMlvD56wfgXlppnI+ZVy
	e1ThJ/TbdoBDWz0rVtaZTNwK5VBKs2GxJvUhKul93FUpQYomPIOBIEpRo+7ocF1TxWc8f0gjkAE
	z+9SRhogjh7iDuuFrcUeO73elNwOgMVz7Ra44GtzFl1Nv3GrGB9pyD2FQ92k3qM9M/NESuj5zFm
	Irxt/HKQ1tRKEtVbwGbmWIGtAPaiE+KWlsPD+v+QI8yLb5AIZWVSOwncti0PINxcm9wb+omPVsn
	6KQdnUBl9ctmGh3Av3lOoIc5+TKxC57SHIo1zJohQybLPI+DS2hqm9UhPAs/LDWWMiZ0EB51GsX
	dpPCQSj2Opt5hzXIglM1DbdoxA5cMV+vB4zKSHXJFZV5EF0jiiCf
X-Received: by 2002:a05:6000:250a:b0:49e:1601:2fa1 with SMTP id ffacd0b85a97d-4abb514618bmr36156915f8f.33.1795566171232;
        Tue, 24 Nov 2026 16:22:51 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5c82:5cd3:7bc5:2809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31518448f8f.16.2026.11.24.16.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:22:49 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	stable@vger.kernel.org,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net 4/7] ovpn: recheck UDP socket family before transmit
Date: Wed, 25 Nov 2026 01:22:35 +0100
Message-ID: <20261125002239.1191542-5-antonio@openvpn.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125002239.1191542-1-antonio@openvpn.net>
References: <20261125002239.1191542-1-antonio@openvpn.net>
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

From: Ralf Lici <ralf@mandelbit.com>

ovpn validates UDP peer remotes against the socket family when the
remote endpoint is configured through netlink. The socket itself,
however, remains owned by userspace and some socket options can still
change the family seen by the transmit path.

For example, IPV6_ADDRFORM can turn an AF_INET6 socket into AF_INET
after ovpn accepted an IPv6 remote. Conversely, IPV6_V6ONLY can make a
dual-stack AF_INET6 socket unable to send to an IPv4 remote.

The IPv6 TX path relies on the socket carrying IPv6 state, as
ip6_dst_lookup_flow() dereferences inet6_sk(sk), which is NULL for
native AF_INET sockets. Checking the family at transmit time
guarantees that ovpn_udp6_output() is only reached with a socket that
has valid IPv6 state, regardless of how the peer remote was installed.

Recheck the socket family in ovpn_udp_output before selecting the UDP
transmit path. When the peer remote family no longer matches the socket
state, emit a ratelimited warning, drop the packet with -EAFNOSUPPORT
and delete the peer with TRANSPORT_ERROR.

Peer deletion is deferred through a common transport-error work item,
because the UDP transmit path can run from non-sleepable contexts while
ovpn_peer_del may release sockets and sleep. Use the same helper for TCP
transport errors instead of keeping a TCP-only deferred delete work
item.

Fixes: 08857b5ec5d9 ("ovpn: implement basic TX path (UDP)")
Cc: stable@vger.kernel.org
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
[antonio: use queue_work(ovpn_wq) instead of schedule_work() to
 follow the module-owned workqueue conversion]
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/peer.c | 19 +++++++++++++++++++
 drivers/net/ovpn/peer.h |  5 +++--
 drivers/net/ovpn/tcp.c  | 23 +++--------------------
 drivers/net/ovpn/udp.c  | 24 +++++++++++++++++++++---
 4 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ovpn/peer.c b/drivers/net/ovpn/peer.c
index 2067825bb5b6..5e22015351eb 100644
--- a/drivers/net/ovpn/peer.c
+++ b/drivers/net/ovpn/peer.c
@@ -83,6 +83,24 @@ static void ovpn_peer_keepalive_send(struct work_struct *work)
 	local_bh_enable();
 }
 
+static void ovpn_peer_transport_error_work(struct work_struct *work)
+{
+	struct ovpn_peer *peer = container_of(work, struct ovpn_peer,
+					      transport_error_work);
+
+	ovpn_peer_del(peer, OVPN_DEL_PEER_REASON_TRANSPORT_ERROR);
+	ovpn_peer_put(peer);
+}
+
+void ovpn_peer_del_transport_error(struct ovpn_peer *peer)
+{
+	if (WARN_ON(!ovpn_peer_hold(peer)))
+		return;
+
+	if (!queue_work(ovpn_wq, &peer->transport_error_work))
+		ovpn_peer_put(peer);
+}
+
 /**
  * ovpn_peer_new - allocate and initialize a new peer object
  * @ovpn: the openvpn instance inside which the peer should be created
@@ -117,6 +135,7 @@ struct ovpn_peer *ovpn_peer_new(struct ovpn_priv *ovpn, u32 id)
 	kref_init(&peer->refcount);
 	ovpn_peer_stats_init(&peer->vpn_stats);
 	ovpn_peer_stats_init(&peer->link_stats);
+	INIT_WORK(&peer->transport_error_work, ovpn_peer_transport_error_work);
 	INIT_WORK(&peer->keepalive_work, ovpn_peer_keepalive_send);
 
 	ret = dst_cache_init(&peer->dst_cache, GFP_KERNEL);
diff --git a/drivers/net/ovpn/peer.h b/drivers/net/ovpn/peer.h
index 1879bfb76992..4b20a421cd40 100644
--- a/drivers/net/ovpn/peer.h
+++ b/drivers/net/ovpn/peer.h
@@ -72,6 +72,7 @@ struct ovpn_route_key {
  * @refcount: reference counter
  * @rcu: used to free peer in an RCU safe way
  * @release_entry: entry for the socket release list
+ * @transport_error_work: work used to delete peer on transport error
  * @keepalive_work: used to schedule keepalive sending
  */
 struct ovpn_peer {
@@ -107,8 +108,6 @@ struct ovpn_peer {
 			struct proto *prot;
 			const struct proto_ops *ops;
 		} sk_cb;
-
-		struct work_struct defer_del_work;
 	} tcp;
 	struct ovpn_crypto_state crypto;
 	struct dst_cache dst_cache;
@@ -128,6 +127,7 @@ struct ovpn_peer {
 	struct kref refcount;
 	struct rcu_head rcu;
 	struct llist_node release_entry;
+	struct work_struct transport_error_work;
 	struct work_struct keepalive_work;
 };
 
@@ -156,6 +156,7 @@ static inline void ovpn_peer_put(struct ovpn_peer *peer)
 struct ovpn_peer *ovpn_peer_new(struct ovpn_priv *ovpn, u32 id);
 int ovpn_peer_add(struct ovpn_priv *ovpn, struct ovpn_peer *peer);
 int ovpn_peer_del(struct ovpn_peer *peer, enum ovpn_del_peer_reason reason);
+void ovpn_peer_del_transport_error(struct ovpn_peer *peer);
 void ovpn_peers_free(struct ovpn_priv *ovpn, struct sock *sock,
 		     enum ovpn_del_peer_reason reason);
 
diff --git a/drivers/net/ovpn/tcp.c b/drivers/net/ovpn/tcp.c
index 8fe8a8e750a4..5340860c0b82 100644
--- a/drivers/net/ovpn/tcp.c
+++ b/drivers/net/ovpn/tcp.c
@@ -148,11 +148,7 @@ static void ovpn_tcp_rcv(struct strparser *strp, struct sk_buff *skb)
 	ovpn_recv(peer, skb);
 	return;
 err:
-	/* take reference for deferred peer deletion. should never fail */
-	if (WARN_ON(!ovpn_peer_hold(peer)))
-		goto err_nopeer;
-	if (!queue_work(ovpn_wq, &peer->tcp.defer_del_work))
-		ovpn_peer_put(peer);
+	ovpn_peer_del_transport_error(peer);
 	ovpn_dev_dstats_rx_dropped(peer->ovpn->dev);
 err_nopeer:
 	kfree_skb(skb);
@@ -240,7 +236,7 @@ void ovpn_tcp_socket_wait_finish(struct ovpn_socket *sock)
 {
 	struct ovpn_peer *peer = sock->peer;
 
-	/* NOTE: we don't wait for peer->tcp.defer_del_work to finish:
+	/* NOTE: we don't wait for peer->transport_error_work to finish:
 	 * either the worker is not running or this function
 	 * was invoked by that worker.
 	 */
@@ -283,9 +279,7 @@ static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
 			/* in case of TCP error we can't recover the VPN
 			 * stream therefore we abort the connection
 			 */
-			ovpn_peer_hold(peer);
-			if (!queue_work(ovpn_wq, &peer->tcp.defer_del_work))
-				ovpn_peer_put(peer);
+			ovpn_peer_del_transport_error(peer);
 
 			/* we bail out immediately and keep tx_in_progress set
 			 * to true. This way we prevent more TX attempts
@@ -497,15 +491,6 @@ static void ovpn_tcp_build_protos(struct proto *new_prot,
 				  const struct proto *orig_prot,
 				  const struct proto_ops *orig_ops);
 
-static void ovpn_tcp_peer_del_work(struct work_struct *work)
-{
-	struct ovpn_peer *peer = container_of(work, struct ovpn_peer,
-					      tcp.defer_del_work);
-
-	ovpn_peer_del(peer, OVPN_DEL_PEER_REASON_TRANSPORT_ERROR);
-	ovpn_peer_put(peer);
-}
-
 /* Set TCP encapsulation callbacks */
 int ovpn_tcp_socket_attach(struct ovpn_socket *ovpn_sock,
 			   struct ovpn_peer *peer)
@@ -538,8 +523,6 @@ int ovpn_tcp_socket_attach(struct ovpn_socket *ovpn_sock,
 		goto err;
 	}
 
-	INIT_WORK(&peer->tcp.defer_del_work, ovpn_tcp_peer_del_work);
-
 	__sk_dst_reset(ovpn_sock->sk);
 	skb_queue_head_init(&peer->tcp.user_queue);
 	skb_queue_head_init(&peer->tcp.out_queue);
diff --git a/drivers/net/ovpn/udp.c b/drivers/net/ovpn/udp.c
index 30c7eb261e7b..7672094a6766 100644
--- a/drivers/net/ovpn/udp.c
+++ b/drivers/net/ovpn/udp.c
@@ -416,6 +416,7 @@ static int ovpn_udp_output(struct ovpn_peer *peer, struct dst_cache *cache,
 			   struct sock *sk, struct sk_buff *skb,
 			   struct ovpn_route_key *key)
 {
+	unsigned short sock_family;
 	struct ovpn_bind *bind;
 	int ret;
 
@@ -432,18 +433,35 @@ static int ovpn_udp_output(struct ovpn_peer *peer, struct dst_cache *cache,
 		goto out;
 	}
 
+	sock_family = READ_ONCE(sk->sk_family);
+	ret = -EAFNOSUPPORT;
 	switch (bind->remote.in4.sin_family) {
 	case AF_INET:
+		/* userspace might have set IPV6_V6ONLY */
+		if (unlikely(sock_family == AF_INET6 && ipv6_only_sock(sk))) {
+			net_warn_ratelimited("%s: peer %u: IPv4 remote, IPv6-only socket\n",
+					     netdev_name(peer->ovpn->dev),
+					     peer->id);
+			ovpn_peer_del_transport_error(peer);
+			break;
+		}
+
 		ret = ovpn_udp4_output(peer, bind, cache, sk, skb, key);
 		break;
 #if IS_ENABLED(CONFIG_IPV6)
 	case AF_INET6:
+		/* userspace might have set IPV6_ADDRFORM */
+		if (unlikely(sock_family != AF_INET6)) {
+			net_warn_ratelimited("%s: peer %u: IPv6 remote, IPv4 socket\n",
+					     netdev_name(peer->ovpn->dev),
+					     peer->id);
+			ovpn_peer_del_transport_error(peer);
+			break;
+		}
+
 		ret = ovpn_udp6_output(peer, bind, cache, sk, skb, key);
 		break;
 #endif
-	default:
-		ret = -EAFNOSUPPORT;
-		break;
 	}
 
 out:
