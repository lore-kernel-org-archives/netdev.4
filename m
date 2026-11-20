Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205661;
	b=3Xp/+9lAbAQGlWwIOzKoL2jcz9GFF2po0KptrRDCQvbTsic0PMG+RUMKoSp0YNprLJrK
	 2FhTFWtbNw0iLgMvnw1pTYGsfS2QQF4SIIUV/z4YjzDsH/yFH3A8GCiMYtKMoafq+bHEe
	 RNwRkH60Uo+heKEx2Y9RBzi8hhI2IfDiR2qZLG7RLBFPVNfx8lDdqsGwKyJP2aiBsdQE5
	 nBDA/O7tBqLmb85ZzfDU/nyptlkF67Wa7rFCrWfvry4a7vBABUCL/3ysT6xq29dc3T4t4
	 naHcGyieYWMMToFVyX+IAeeGGJ9re7OcZuO5lOvQftwyIyMpYx108btbtQIU4JK8PVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2Ct3kYTyYXnyej+Byik8bcduRVve0+j2vmJbuwTKNMg=;
	b=c7fQl06RS7CY3hRj2tJ4brAM3k9JHBKtrFTR0BIVG2Ix7G715gZBBuO0Ov3kLGChsgyv
	 /GNGSHAPZEEiH4+p+LuXKCT8bdBkAup8vg3vhL4452z8qc1zsJPuVfFsgmXirsEhYXEqd
	 hD1c8gvxW4qR2iXfY+jkZUtpheBWwMgtyuMyxYyUO7ifcCEPdoZkdUyYsliFAjj2iu6lA
	 G+TBX+9gpDjqEVQWrIvgfo7h8B1w30fnN5Xg3PO7nFwXngTfhqQtLhyUKiFDp2JDQoQNV
	 7FXvvyJAXuYQ/W96WA7Pi85UuZor2AC+ZjLpOWnuV2p7E0l3LPS99BPkNagvr6E6s8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pLigCP2N;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A600606A6C6
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A600606A6C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pLigCP2N
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3ae17c536so1246737c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205652; x=1795810452; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ct3kYTyYXnyej+Byik8bcduRVve0+j2vmJbuwTKNMg=;
        b=pLigCP2NewfTVUzj5X1BBt+7oneO46bJZwJKbK86ELkzhT3CY7Gi2j2XpmGTejToxn
         AvqliF+eHxqwh3TilcPyOjj2Y6WPxga01U0fNyAj2W7W5bbgql7UJ90sz2P3osFMdriQ
         NyFUXTsOmosfCACsOOeG7lGsLG7kB7FdVdzJY2Ya2wiIL+V4gQQfkZTTvlyP1V9LBWfS
         dz2QM6obcIZO8l2XNFdtPZrDVaJyH3bBg3q9qxIpXjxOLtjxVk+SKip9eI9s/T2Xr00e
         XDWGFUvpDoBAZzf9OOg61qtbgAoICz6Th28aPbccXSGOSiYg376Wf3LOYQc6ELeO8yo7
         R/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205652; x=1795810452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ct3kYTyYXnyej+Byik8bcduRVve0+j2vmJbuwTKNMg=;
        b=o+fUtdaFBPC7yJiuKC3QnzYqWnsPJRVbnS1EELsCnMq3nDURpvPTIE68jRs5UqTiQC
         WqwbVqG+Y6edMQ+C6pWC5joT9r4Fn6n11zK5rPYbbr+EaLi3JoFE+md5bVeTgVRNW2tx
         QkgF8Vq0kMtNxTOlw1eZu6Gu75Wr87I3wu4S0givjZOWkHlqS2okejklDTcbl/lVhxJn
         Oy3jtePvmbaZmZvFEaJq2do8y8+uYwfBuTCk7P01Op7/mnUC/SRYIVNiKdfmaqFJJ/U4
         Gf440IjZBUxxN0V5k1NAQIpFG1azSmMdANum7dp6D3AnkufeJ9Se7WD1X+vM83Lsa+iT
         IYqg==
X-Gm-Message-State: APuU4Z9YnvIhRYDcyhe367/tBVnQ2PPQGSFCCxAeeiTOmwG/x4X01M7j
	Gr4oghUa/vyKPEtI/LBVPU6W8tyaMJTkyWxqSEOFt6VvRqRJeHEUVvxnWEbpBMO5t+PJ9LQY+Ss
	NbDW1lwpbqsNPp0/oXHhzfhJxH+vqriJyai8wPflcVZfb2fNwJRd8Rg+mKok6y/0tsl2t/qq9f2
	SA17RmEzsNAoyHCd0zaiD/oegnNW9lB3CyvJa1+KEgMHu1BjBjAYM+rHhIKenaAv0=
X-Received: from dlam5-n1.prod.google.com ([2002:a05:701b:2085:10b0:15d:6b8d:2adc])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2804:b0:1b5:434d:b61b with SMTP id a92af1059eb24-1b5568cd633mr3451533c88.22.1795205651562;
 Fri, 20 Nov 2026 12:14:11 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:03 +0000
In-Reply-To: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120201408.3445445-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120201408.3445445-3-almasrymina@google.com>
Subject: [PATCH net-next v6 2/7] net: devmem: prevent mixing TX bindings and
 reject non-devmem xmit
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Josef Bacik <josef@toxicpanda.com>, Stanislav Fomichev <sdf.kernel@gmail.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"

Two devmem TX paths do not validate the fragment memory provider or
binding strictly enough:

- When sending with MSG_ZEROCOPY and SCM_DEVMEM_DMABUF across multiple
  devmem TX bindings on the same TCP socket, tcp_sendmsg_locked() and
  zerocopy_fill_skb_from_devmem() only check skb_frags_readable(skb),
  allowing fragments from two different devmem TX bindings to be
  appended into the same skb.
- validate_xmit_unreadable_skb() checks the binding direction and
  target device only when net_is_devmem_iov(niov) is true, allowing
  unreadable skbs backed by non-devmem net_iov providers (such as
  forwarded io_uring zcrx RX skbs) to bypass validation on
  NETMEM_TX_DMA devices. Using netmem_to_net_iov() also assumes
  frags[0] is a net_iov without checking first.

Add net_devmem_skb_binding() to return the devmem binding of an skb's
first fragment (all fragments in an skb share the same memory source).
In tcp_sendmsg_locked(), check net_devmem_skb_binding(skb) != binding
only when a devmem binding is active so normal non-devmem TX keeps a
single unlikely(!skb_frags_readable(skb)) check with no extra taken
branch. In zerocopy_fill_skb_from_devmem(), check
net_devmem_skb_binding(skb) != binding and return -EMSGSIZE instead of
-EFAULT so tcp_sendmsg_locked() starts a new segment instead of
aborting the send with an error. In validate_xmit_unreadable_skb(), use
skb_frag_net_iov() and drop unreadable skbs on NETMEM_TX_DMA devices
unless frags[0] is a DMA_TO_DEVICE devmem net_iov bound to dev.

This issue is theoretical and was found by manual code inspection and
LLM review; it was not triggered in production. Compile-tested and
boot-tested with the net_core KUnit test suite; not tested on real
hardware.

Fixes: bd61848900bf ("net: devmem: Implement TX path")
Fixes: ae28cb114727 ("net: check for driver support in netmem TX")
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/datagram.c |  4 ++--
 net/core/dev.c      |  8 ++++----
 net/core/devmem.h   | 22 ++++++++++++++++++++++
 net/ipv4/tcp.c      |  4 +++-
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index 489d92fe6dae..9d4192b1042e 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -712,8 +712,8 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 	size_t virt_addr, size, off;
 	struct net_iov *niov;
 
-	if (i && skb_frags_readable(skb))
-		return -EFAULT;
+	if (i && net_devmem_skb_binding(skb) != binding)
+		return -EMSGSIZE;
 
 	/* Devmem filling works by taking an IOVEC from the user where the
 	 * iov_addrs are interpreted as an offset in bytes into the dma-buf to
diff --git a/net/core/dev.c b/net/core/dev.c
index 1a63f6b939f7..5bb300083b7b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4189,10 +4189,10 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
 
 	/* All net_iovs in an unreadable skb share the same binding. */
 	if (shinfo->nr_frags > 0) {
-		niov = netmem_to_net_iov(skb_frag_netmem(&shinfo->frags[0]));
-		if (net_is_devmem_iov(niov) &&
-		    (net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
-		     READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev))
+		niov = skb_frag_net_iov(&shinfo->frags[0]);
+		if (!niov || !net_is_devmem_iov(niov) ||
+		    net_devmem_iov_binding(niov)->direction != DMA_TO_DEVICE ||
+		    READ_ONCE(net_devmem_iov_binding(niov)->dev) != dev)
 			goto out_free;
 	}
 
diff --git a/net/core/devmem.h b/net/core/devmem.h
index c4f476947dfa..c685288f5021 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -10,6 +10,7 @@
 #ifndef _NET_DEVMEM_H
 #define _NET_DEVMEM_H
 
+#include <linux/skbuff.h>
 #include <net/net_namespace.h>
 #include <net/netmem.h>
 #include <net/netdev_netlink.h>
@@ -117,6 +118,21 @@ net_devmem_iov_binding(const struct net_iov *niov)
 			    struct net_devmem_dmabuf_binding, area);
 }
 
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_skb_binding(const struct sk_buff *skb)
+{
+	struct net_iov *niov;
+
+	if (skb_frags_readable(skb) || !skb_shinfo(skb)->nr_frags)
+		return NULL;
+
+	niov = skb_frag_net_iov(&skb_shinfo(skb)->frags[0]);
+	if (!niov || !net_is_devmem_iov(niov))
+		return NULL;
+
+	return net_devmem_iov_binding(niov);
+}
+
 static inline u32 net_devmem_iov_binding_id(const struct net_iov *niov)
 {
 	return net_devmem_iov_binding(niov)->id;
@@ -250,6 +266,12 @@ net_devmem_iov_binding(const struct net_iov *niov)
 {
 	return NULL;
 }
+
+static inline struct net_devmem_dmabuf_binding *
+net_devmem_skb_binding(const struct sk_buff *skb)
+{
+	return NULL;
+}
 #endif
 
 #endif /* _NET_DEVMEM_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d510e982dcea..94dee9f1017a 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1254,7 +1254,9 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 		trace_tcp_sendmsg_locked(sk, msg, skb, size_goal);
 
 		if (copy <= 0 || !tcp_skb_can_collapse_to(skb) ||
-		    unlikely(skb_frags_readable(skb) != !binding)) {
+		    (unlikely(binding) ?
+		     net_devmem_skb_binding(skb) != binding :
+		     unlikely(!skb_frags_readable(skb)))) {
 			bool first_skb;
 
 new_segment:
-- 
2.56.1.750.gf70dc682cf-goog

