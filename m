Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776653;
	b=YpGOTzqr1pqGoK1ks1+BUoVfwr/KTOpTovzr70qHvsXEMx2OjRNM8TNevxvqPONoIIu3
	 SaSfoCJ4GiOLYDDS7oXWHr4rWeGJGHaxfdSbi5aZAn1Rt8fU3fqmUUmttZOdvtFUBuDZR
	 l+JoginEn3vgcmEYMBXzo7Pv2f2hjB43OgIFns67/KI0y9FiX00wd7keHICb05qnxomjJ
	 8Hv8EfVGw5K1bSg5gIeG2NYnosY6/DWf0ko8zwPm1BixEc/HsB/1L4EkWFPUdBx6x+TDJ
	 eYM8pG/pYQV/4cRp35L0e/45xvEl7PUUGbb7PEfCCL7acqRA6zuz6+VFPojoKJq973g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776653;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LRJZMVd6Qc7oM9Ur8bhmPaB9qK2/g4UpfM7Rn2aSIj0=;
	b=K6L4aL0K3W8I6DrF5zUVdEdXsGZ6kAuBh2OWXreABSZYwUEDcp+xWQLdoSTtgagJldQw
	 zB8PFkjMrf9jkoL+zdUNqOHuC2h6Gw8utWo5Rp10qsh+ymuhKEy1UI1vNJLZkgRS7uF6l
	 vtat57hylpsRkBTFv0I1f/SKYu5/Zple5EwE67RbgbEPuDRirjWmIuWFVFswF1hod7+xG
	 bfkpQYlny1DhnG0GSg7T+y/lCh/J0MTArhTxdswlEiMwu5lRUH+qefiw86LVUz5n9x4PR
	 ep1lskKwnAuOzc9tdcYStUNUh5QzeIfEUBxXPLzqK0Tu1p940nfi4vSJ2PGe+w+EZ/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DR/6i0j1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C151606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DR/6i0j1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795776652;
	b=FB7tWREFJg4looPdeTbdX6KvI2U9Q1FzfIZcTSa3Sg//Ra+DvUdWFLgACr/zp5/try1R
	 gIbpBUbYBP0lQKhXAC62fyrw69a7ocXpg6dFN9eJXjklJ5XjCi2P5Dn99Zs1dwkFIF4QV
	 2+Xk6Fp26FEXw6Y8ZB0lHANkG8sSqAtaapbQllLN79q3OLkCsBjc8Ts2mT1bMUPKjQ9Qr
	 aIS+WcTEae1d7jqMTBwvj8xcpIbs2JJfm8E6VQ43wGETgapvpX4GF4YZ0+a1juhSUcDMD
	 fzfYo9yf8dbpE4oaNDml6rBtFiu3PfxoQmuwKgkZbgl85lN1rOkQJe/zo3snQHgAt+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795776652;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 X-B4-Tracking:X-Change-ID:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LRJZMVd6Qc7oM9Ur8bhmPaB9qK2/g4UpfM7Rn2aSIj0=;
	b=WiePbz30tNa+0ycdD/YYCbiWVh603ZXCamd01FZ+5AHwqIwCJaxdvz1skTFK7JPz99uN
	 76I06cbSUAJcrbYNfIqoOt1VygpoH9OB3JTAmvKZQQZ2mlacUGmehmvMkiesfuFrIK8u6
	 +xk2ntvFFFcd6L7xrQ9aFnaufQAk06BAB73DaUsXA0I5STTXQd14WB0N96dSmFzpr+pVp
	 jbWNXDqSoLS+ElH9ZdNaGRbv3wCBATRt3dd7kmdFqJcYfFrhBhacnfjCWJLqx2/H3BZXk
	 bifyuHgUwT7Irr9nKSuG08iaAm8Waq1QM6K2Ex6sq+Y6dZTcSEbRYA8s+tICZlF/qAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08A611F00897;
	Fri, 27 Nov 2026 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776652;
	bh=LRJZMVd6Qc7oM9Ur8bhmPaB9qK2/g4UpfM7Rn2aSIj0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DR/6i0j1nBZspqZ4PrP5bid9gpOlpYzROeWWsy6Wh0AwP7OrMnM9s2t7sZufW26n8
	 dKiVOyiqksqsh/P2fFPlS38KQHnLv+n6OeY9G6eyto6R4jX5RnqV0P9uR9gHPrxMok
	 PD7m3Sy806Jd2njp5MQR4H9dl9FXicexmOgIpBqgtwdaMpW7PSbUX1QUh+4w0fEo6Y
	 uPr7Msg81kDBN4XNZiCcfOqMVxumhzOtzUdKNiv0YrU2ctj601uMfWLrP0bc+fwM8r
	 0xIbDfBXk+1M1wX76qd43tXE6ge32ZOEs7jdIVPIUGaZm5c3GkvuLhQgzHsYlho2Pb
	 BPja3jJyX2Ejw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8D2794B72B;
	Fri, 27 Nov 2026 10:50:47 +0000 (UTC)
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
Message-Id: <20261127-ktls-net-v1-1-a047fdb54612@certik.com>
X-B4-Tracking: v=1; b=H4sIAK5fCWsC/yWMywrCMBAAf6Xs2QU3Fl+/Ij0k6cZGy0ayUYTSf
 2+ixxmGWUA5R1a4dgtk/kSNSSrQrgM/WbkzxrEymL05EpkTPsusKFzQBHs4E4eezAVq/soc4ve
 3ukENYPhLfbsH+9ImLXNWGV224qemlGUsKc3YPKzrBuQy0KCRAAAA
X-Change-ID: 20261127-ktls-net-2fa381ef4129
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 08:47:22 +0000
Subject: [PATCH net] tls: rx: fix skb extension reference leak
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>, security@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795776430; l=2316;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=ZT9LWyJjTuc2AU4pnEhY6CiCH+8k4KmgqGBYXiphoUY=;
 b=KGxIvDDLwpFRYgdm+3LyKKsEUxfv3yV3taUjwPxDtsXdp7ZF5+eevhRkvnDYsDqwkUZ43NP7c
 orcFTUu/RXdDdqib2VXMKu6M81n/keFbTbRmjonCNqDb6qqroK5mupn
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Transfer-Encoding: 7bit

From: Dickson Wu <dickson.wu@certik.com>

tls_strp_load_anchor_with_queue() reuses strp->anchor for every record
and calls skb_copy_header() to copy the header of the first queued skb
onto it. skb_copy_header() goes through __copy_skb_header(), which uses
__skb_ext_copy(): it takes a reference on the source skb's extensions
and overwrites the anchor's extension pointer without dropping the
reference the anchor already held. When the received skbs carry
extensions, for example TC_SKB_EXT set by tc or SKB_EXT_BRIDGE_NF set
by br_netfilter, every reload of the anchor leaks one skb_ext.

skbuff_ext_cache is not charged to the memory cgroup, so the leaked
objects also escape memcg limits.

Drop the anchor's extensions with skb_ext_reset() before copying the
new header.

Fixes: 84c61fe1a75b ("tls: rx: do not use the standard strparser")
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
Tested on x86_64 UML with KASAN and kmemleak at v7.4-rc4:
- kTLS RX receiving 5,000 one-byte records whose skbs carried
  TC_SKB_EXT (tc flower in a user namespace) or SKB_EXT_BRIDGE_NF
  (bridge with br_netfilter): skbuff_ext_cache grew by exactly 5,000
  objects and kmemleak reported 4,900 to 4,978 unreferenced objects
  from __skb_ext_alloc. With the fix: no growth and no reports. With the
  fix reverted: 5,000 again.
- The same kTLS traffic without extensions, and plain TCP with
  extensions: no leak before or after the fix.
- On v6.1.193 (bridge path, run from a user namespace) kmemleak
  reported 3,038 leaked skb_ext objects before the fix and none after.
  The patch applies unchanged to 6.1.y, 6.6.y, 6.12.y and 6.18.y.

A reproducer is available if it helps.

This was found and the fix prepared with AI coding tools (OpenAI Codex
agents, with review by Claude). I went over the analysis and the patch
before signing off.

 net/tls/tls_strp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tls/tls_strp.c b/net/tls/tls_strp.c
index 53d3256d0..8ad7f339d 100644
--- a/net/tls/tls_strp.c
+++ b/net/tls/tls_strp.c
@@ -475,6 +475,7 @@ static void tls_strp_load_anchor_with_queue(struct tls_strparser *strp, int len)
 
 	skb_shinfo(strp->anchor)->frag_list = first;
 
+	skb_ext_reset(strp->anchor);
 	skb_copy_header(strp->anchor, first);
 	strp->anchor->destructor = NULL;
 
-- 
2.43.0


