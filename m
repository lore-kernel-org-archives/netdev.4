Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539961;
	b=MOciXQYNrKcxCbyeupk00JEbJ8CcrkQCLOF2ByxMhtkCSteH5//g5wRbu9Pc6CX/s5eM
	 bW8LKnxuQWD8Iq++7O5dLrZYFQBsvIxk0SmbCKYtscyOuD69pGmbOFp1e2249h09EOc0m
	 GMyyhV1KRliyV1PikeDnDxN/w6G/B3j6V4K3sG+71KCwlzwErzhHHdw19/KqNsyDHSS1S
	 g16cHM9mGWQ8dv/eVV92rohKC0LoS9DHebJNG+hS5hIBAK9QZs/kE9k5zfEycbEA9ANxq
	 Qp0mhAIj8QGxaRQJAhv8+GqL4OAIzrxvDQcbxhOAfPvoAuvcQErh8QLfxBFratXqzNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z9pbJVTlR5PLcfnhzrvyRIl/uOzqYqCXnJGseZz6l8U=;
	b=1g8uAYsOqgtRtGIFChvYV+TpeooJd7/PlHFBNHMBUxlee0hGH8i3HsBpDEdCfPSdAR01
	 Ld3IKcPohzKw8sTf6j9WkM++gwG+l0dsyXK6fkfBOP+XDnt4yCLCxixQJzd+Co0Q+M4Qy
	 cmrOiD3dIDJhVZ+BnyljmDXo/zD49FDjyrFROwLvnGY7XbY2s55lCyvUvyntdR+6VVwf/
	 IoRDpuyc1Yx4XXWBxkm4sEBrJVyNo8KeGVHC3FXVmPN36tSpbFsPc02Qf63efvQBGYLhL
	 yc8QDm/lwSRMBiSCHX5b+FPizMKSgon2KPQ9PFN6zPfgbRt1raUXhn146ptosF0r3fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgK8ZGIX;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6A606A6A2
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C6A606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgK8ZGIX
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2ca055399so1397379137.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539960; x=1796144760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9pbJVTlR5PLcfnhzrvyRIl/uOzqYqCXnJGseZz6l8U=;
        b=JgK8ZGIXRozre07Hjjv1sQwvquTZM0VYkcEhRsUf04mFc3uMQwiXCLPCGO7QR7334t
         LMqqMSrQBOFQDzgJBiBKRaZL/Q9LEH3wz00wzeAw70MGw76gXYhPWcPzADvI6Epnqua4
         K1Qa40tIsM5ugSvehUQJs5jzYf0jDtwO3ndrr6IsIRhgqOebhWKwydKfIkszw4FMxrE+
         +0bVyhvjhuFb9lGTrIMgNahpM6E32jxVqzSErL6pcoOFkmcHF3u54fh4hQviINQMdakh
         LdBH4+2iDOMEb9w0YGpdt/TNj/kyn5ghRhBr7KgIuH+QeOAUpwEDQxqvpdUitPK5UyH+
         QwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539960; x=1796144760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9pbJVTlR5PLcfnhzrvyRIl/uOzqYqCXnJGseZz6l8U=;
        b=N1phJdOxoa0MFGSvFRabW+015XJ1PR6fKe8BG+xRSGS32j0J3FhjJLCrfcb++FAn8A
         IqNptl5z6EVDlc4uEIzsBfjW0ScLqY6oiyXH80JbqGsImLRw5ahvstO444gst0mFWKX9
         6wcMVXnxJf1HV5EzWKhN40SFgBMZUuFG6wIuM+iOSvcknzdby2E6e0Q8j+DBZ3+yJ5MU
         JTnJR5YglLMFtcyWs7D+VpHlXcT+Q0Z0R8AzPatusrZOy4UYS1R2A+QQIkmgDVjt9g8z
         b/JgWGGtQMVNRQHTpUoZ9ARiOgxJX9LNTBAOnNKGiVWUQzkqquklCqxp5g0s9wxTPKzV
         JhqA==
X-Gm-Message-State: APuU4Z81cwa2aPtMn25WLjn09hqSNdBlmM0ZlRTYgSZapBbkIukxGgUS
	DstpoaepiTbCZsBmZVOgDOioaVWYgfetwZlq+MGgaLQnALwOJxmOp9SyJQHfsw==
X-Gm-Gg: AZFdTZf1z4BSAeI0E6jCpWZpIE5H3r4ICTw0julGxiJ5v0LTOOduSpqvGuzzEs2vI+m
	UqI8UqKj5YKwdoc8aZWKRZBhmdfERQ+tp0RIWRuqXtmPMpFslJ3pzex1lRQpnS2tTRd2B4ZziGh
	MdVXp000GzfcC8PUS5uZkQJhjDJjgNQ/TWcHkeo5Am+2dPadSRGczszEPRMh3Yj1O/wnOtS+BEu
	Qq/0EFv3tsDD7x4NBr3vTEPCiBJ8qJPxzNoieLhs/g2SoyHWvvDBkKnKqeWlH7prtwG8BdvoE/y
	1iC7y5iOrweN9jAM62fpObMGg32/pbqf0mvmJy9L6hZ7WvKtFqBES0nKBMbUpl7WQ8ifxGmTSax
	d+oyBp+xesCvMc9hfjir2rXk3ht6pY2REdIK5y6JTa1i4ovZ150DcFAGfXEG1otIDLuUXNjX695
	m2dBOUIFqLdFBz6cQV7FjtYuZYXbPL9MH/Ha776tsFWjH4oI99iLyj88FiWW/rhE2/UhoANJt8Z
	GuqJMQkk+JZx0m6o3GqBOmBNwWgdolwIn2BCMcMMdT0pYPPvU9NuRODeaUQoOFjCp1WgvVaNTx7
	3hVUSRMNGMVD+rTN7tReK5E3CYmNg71PFucEjKvhz4w4jZaMm849eiHfK/3mOMMD+AtJ/YKSBy5
	CdhaqzgaKtqSpB2HD1sRHrAvpoAXJ5zEcAFGy3nP2p8rdAxmurYVwc27vft9XtBkmMtNOQgorLs
	3d1EyWVWd8ag==
X-Received: by 2002:a05:6102:1614:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d7396ed4a0mr6070502137.37.1795539959986;
        Tue, 24 Nov 2026 09:05:59 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm140078216d6.17.2026.11.24.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:59 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	elder@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next 5/6] packet: use Ethernet header length in vlan_get_tci()
Date: Tue, 24 Nov 2026 12:05:43 -0500
Message-ID: <20261124170551.1874487-6-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
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

From: Willem de Bruijn <willemb@google.com>

vlan_get_tci() uses dev->min_header_len to locate the outer 802.1Q/AD
header on SOCK_DGRAM captures, with an is_vlan_dev() fallback that has
been obsolete since commit 447cbe95ebb9 ("vlan: fix skb_under_panic and
races when toggling HW VLAN offload") stopped adding VLAN_HLEN to
vlandev->hard_header_len.

Only Ethernet and loopback devices set min_header_len (to ETH_HLEN).
Check ARPHRD_ETHER / ARPHRD_LOOPBACK and read at ETH_HLEN directly
instead, removing the last min_header_len reader and letting
packet_recvmsg() use sll->sll_hatype without an RCU device lookup.

This changes the reported TCI in three cases:

- Ethernet devices with hard_header_len > ETH_HLEN (e.g., smsc95xx,
  rndis_host) previously failed the min_header_len == hard_header_len
  test and reported TCI 0. They now report the TCI.
- Non-Ethernet devices with hard_header_len 0 (e.g., tun, rmnet)
  previously read a VLAN header at the MAC offset. They now report
  TCI 0.
- packet_recvmsg() previously omitted the VLAN fields if the device
  had been unregistered since the packet was queued. It now fills
  them from the queued skb.

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 net/packet/af_packet.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index bf0ad6d5c1e3..b169d3e11b17 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -547,29 +547,18 @@ static void *packet_current_frame(struct packet_sock *po,
 	return packet_lookup_frame(po, rb, rb->head, status);
 }
 
-static u16 vlan_get_tci(const struct sk_buff *skb, struct net_device *dev)
+static u16 vlan_get_tci(const struct sk_buff *skb, unsigned short type)
 {
 	struct vlan_hdr vhdr, *vh;
-	unsigned int header_len;
 
-	if (!dev)
+	if (type != ARPHRD_ETHER && type != ARPHRD_LOOPBACK)
 		return 0;
 
 	/* In the SOCK_DGRAM scenario, skb data starts at the network
 	 * protocol, which is after the VLAN headers. The outer VLAN
-	 * header is at the hard_header_len offset in non-variable
-	 * length link layer headers. If it's a VLAN device, the
-	 * min_header_len should be used to exclude the VLAN header
-	 * size.
+	 * header is at the ETH_HLEN offset from the MAC header.
 	 */
-	if (dev->min_header_len == dev->hard_header_len)
-		header_len = dev->hard_header_len;
-	else if (is_vlan_dev(dev))
-		header_len = dev->min_header_len;
-	else
-		return 0;
-
-	vh = skb_header_pointer(skb, skb_mac_offset(skb) + header_len,
+	vh = skb_header_pointer(skb, skb_mac_offset(skb) + ETH_HLEN,
 				sizeof(vhdr), &vhdr);
 	if (unlikely(!vh))
 		return 0;
@@ -1012,7 +1001,7 @@ static void prb_fill_vlan_info(struct tpacket_kbdq_core *pkc,
 		ppd->hv1.tp_vlan_tpid = ntohs(pkc->skb->vlan_proto);
 		ppd->tp_status = TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
 	} else if (unlikely(po->sk.sk_type == SOCK_DGRAM && eth_type_vlan(pkc->skb->protocol))) {
-		ppd->hv1.tp_vlan_tci = vlan_get_tci(pkc->skb, pkc->skb->dev);
+		ppd->hv1.tp_vlan_tci = vlan_get_tci(pkc->skb, pkc->skb->dev->type);
 		ppd->hv1.tp_vlan_tpid = ntohs(pkc->skb->protocol);
 		ppd->tp_status = TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
 	} else {
@@ -2454,7 +2443,7 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
 			h.h2->tp_vlan_tpid = ntohs(skb->vlan_proto);
 			status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
 		} else if (unlikely(sk->sk_type == SOCK_DGRAM && eth_type_vlan(skb->protocol))) {
-			h.h2->tp_vlan_tci = vlan_get_tci(skb, skb->dev);
+			h.h2->tp_vlan_tci = vlan_get_tci(skb, dev->type);
 			h.h2->tp_vlan_tpid = ntohs(skb->protocol);
 			status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
 		} else {
@@ -3626,19 +3615,10 @@ static int packet_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 			aux.tp_status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
 		} else if (unlikely(sock->type == SOCK_DGRAM && eth_type_vlan(skb->protocol))) {
 			struct sockaddr_ll *sll = &PACKET_SKB_CB(skb)->sa.ll;
-			struct net_device *dev;
 
-			rcu_read_lock();
-			dev = dev_get_by_index_rcu(sock_net(sk), sll->sll_ifindex);
-			if (dev) {
-				aux.tp_vlan_tci = vlan_get_tci(skb, dev);
-				aux.tp_vlan_tpid = ntohs(skb->protocol);
-				aux.tp_status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
-			} else {
-				aux.tp_vlan_tci = 0;
-				aux.tp_vlan_tpid = 0;
-			}
-			rcu_read_unlock();
+			aux.tp_vlan_tci = vlan_get_tci(skb, sll->sll_hatype);
+			aux.tp_vlan_tpid = ntohs(skb->protocol);
+			aux.tp_status |= TP_STATUS_VLAN_VALID | TP_STATUS_VLAN_TPID_VALID;
 		} else {
 			aux.tp_vlan_tci = 0;
 			aux.tp_vlan_tpid = 0;
-- 
2.56.1.839.g22a8290db9-goog

