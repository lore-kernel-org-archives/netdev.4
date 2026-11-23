Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461693;
	b=eb54X2a18Ga+VowcezXsbsnp7XwjwZLwvRTTHyAbDNstP2qoiXX2SyFzvJsfXwSfLj+n
	 qzT1xwVyuE75dXsjG+wnKVSQRSG7374nFhHlyHfEhcBtFJ0k9oUCN+mIYPzC9VCRw2ep3
	 3meTcz+H+4DAYYEESrTSE6grbOh1/GNGzNTDpMeTwVAzTk41FHAdxIjY2pzP91Ul8GMoN
	 910EhxfEAvmO+74rSo46sI9LWR2+bH/kHjY/f2yElO8lf6fSvJx+mzNVO/mvVLnaCA68z
	 rmcdTVhpjH7ZdcO4+MvG09PdhPPj2BfNTAGs+mjfu2Ix5/YYJG1o1UbvK2LL/i6Z9zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LkPv/8+8CDVDjxxi1/O1lO8+pepBCDayhxWnJ+keBBU=;
	b=hU4z2UCvMy4oCOPdlkesDl5RTsKQOgU+s5AC/DD75zhkJBDtgaLAePyJqZInsoVB8ML/
	 Lxwqj0serAFZuSG59Jcn0M3CQQZC7ZN+wW61sKsb4SmqOZaWDN0wKNpq0AozU5Shr8CqP
	 bsPtPiFgGz16QQ69Hg3WqTWYrSWjuL9P+e9ImYH/tcCAzHGzPQ6fkTGNdbXnWCI2rRL02
	 3jN22nTmo7v1lioJul4IOJe4piToNH9kZAnEghzy9FAkYEFjQu/YZ2R0wYw+KY03ByKZw
	 9+c+FzOl3Ie55wuZAt6zVjsGrTsp5JvbdbggJKlzoMiozjeKCiJ54uqafI2dGHt5Pog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o7JZOk7x;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB97606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB97606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o7JZOk7x
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862bca06702so6808621a34.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461691; x=1796066491; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkPv/8+8CDVDjxxi1/O1lO8+pepBCDayhxWnJ+keBBU=;
        b=o7JZOk7x1UKnV6HVyZffsPhGY+WqOPm4TpaTK3JzbrkSpDSxMYHvngsz0f4SS+3bbX
         ugocxYybjKIc+K5q/OxzWRWmihSDhjxjo1bsYUh/ltrNHsjhtSNXzz+WEJcgC7ZsvYRd
         +Di/w3g9pBcEWogCuDEcRwE1Mt6nOKCEBxlJ57ak+sSONcuKs9uKbkCxZKeqKM4m6A2y
         RtIwZK4JwkKQZYZSenPFz7dnxvIPNdzdYTQFDTInqRxkn0p8BdOIneI2O5jTC1lRWLLd
         r2aQwRN/tO17Ubzgrga74umiaanQzSKN2Xi12KPvpzsVs8/sve+vud5vPcwyyxtJ493C
         hvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461691; x=1796066491;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkPv/8+8CDVDjxxi1/O1lO8+pepBCDayhxWnJ+keBBU=;
        b=x68jGx+gZn68cgdYwX1mBRLBolSIseL/EmZLIGDko8o25eALyjoa21XFf5YMAGiMJq
         Z4D4ebenJj5nH9UDU0qnke6DC5gHPkg3EbhDbrgF5K3RgDWD5WaBGtoTmQZZU6+5ORYH
         Uk7UFZxHqjQm/IT4f3Aj/hWLV6JZCkzcF4y7WJvshFLSScigPsuHRH40vNeRLUp7tAAj
         Kq9WHaI2dTCpWWyZFas4FjQM1ijI21YmpFEjTGiIcC1c0CGkFqeq9wGnE9e4ibH7yRTI
         RY/MZlWYtnbf8GyV+UKVb+C/JmZIguVGlMf9uh1MjUkAlelaSU++YZmSTJ7f6kdz+qxN
         pPog==
X-Forwarded-Encrypted: i=1; AL+hErHry0qEhtACfn5opA3IIubRvwza7z6cLHsTCG+18EOZB8WAg2X7fBhBTbQd6p3XIxAV6IIBlL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MYikf9g1kTQVI+qJJL0CJvYZheud1y8ye0FvbRmRd+VBwJeRg
	DPMsdQSMmjzzJQUNx/fZaKzAALV74Je0EZ91HO30Kos/G29XWeaaBsxLwQnkxrEPzyJqiZiPQQe
	wl2BH86f7D/cdaLXlywHa2A==
X-Received: from oabpp19.prod.google.com ([2002:a05:6870:9d13:b0:4ad:bdb3:7d44])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c12b:b0:4f6:5279:5c89 with SMTP id 5614622812f47-57a0b03f55bmr11653636b6e.47.1795461691320;
 Mon, 23 Nov 2026 11:21:31 -0800 (PST)
Date: Mon, 23 Nov 2026 11:21:26 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261123192126.4012643-1-nilayvaish@google.com>
Subject: [PATCH net-next] eth: mpnic: use netmem_get_pp() instead of page->pp
From: Nilay Vaish <nilayvaish@google.com>
To: Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>
Cc: kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

mpnic reads the page_pool of a page straight from struct page when it
returns Rx pages. The page_pool fields of struct page are being moved
behind struct netmem_desc, and netmem_get_pp() is the accessor for them.

Look the pool up through netmem_get_pp() and hand the same netmem
reference to the netmem variants of the put helpers, so that each page
is converted once. The XDP frags are taken as netmem directly with
skb_frag_netmem().

The driver no longer depends on where the pointer is stored. No
functional change.

This patch was written with the help of an AI coding assistant (Gemini).

Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c | 29 ++++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index af5e490c112d..90bb37fab8ca 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -662,8 +662,12 @@ mpnic_page_pool_get(struct mpnic_pg_ctxt *pg_ctxt, struct mpnic_ring *ring,
 
 	if (unlikely(pg_ctxt->idx != idx)) {
 		if (pg_ctxt->pagecnt_bias &&
-		    !page_pool_unref_page(page, pg_ctxt->pagecnt_bias))
-			page_pool_put_unrefed_page(page->pp, page, -1, true);
+		    !page_pool_unref_page(page, pg_ctxt->pagecnt_bias)) {
+			netmem_ref netmem = page_to_netmem(page);
+
+			page_pool_put_unrefed_netmem(netmem_get_pp(netmem),
+						     netmem, -1, true);
+		}
 
 		page = ring->rx_buf[idx];
 		page_pool_fragment_page(page, MPNIC_PAGECNT_BIAS_MAX);
@@ -685,8 +689,12 @@ static void mpnic_flush_pg_ctxt(struct mpnic_pg_ctxt *ctxt, bool napi)
 	if (pagecnt_bias) {
 		struct page *page = ctxt->page;
 
-		if (!page_pool_unref_page(page, pagecnt_bias))
-			page_pool_put_unrefed_page(page->pp, page, -1, napi);
+		if (!page_pool_unref_page(page, pagecnt_bias)) {
+			netmem_ref netmem = page_to_netmem(page);
+
+			page_pool_put_unrefed_netmem(netmem_get_pp(netmem),
+						     netmem, -1, napi);
+		}
 	}
 }
 
@@ -774,6 +782,7 @@ mpnic_add_rx_frag(u64 rcd, struct mpnic_rcq_state *state,
 static void mpnic_put_pkt_buff(struct mpnic_pkt_ctxt *ctxt, bool napi)
 {
 	struct xdp_buff *buff = &ctxt->buff;
+	netmem_ref netmem;
 	struct page *page;
 
 	if (!buff->data_hard_start)
@@ -787,13 +796,15 @@ static void mpnic_put_pkt_buff(struct mpnic_pkt_ctxt *ctxt, bool napi)
 		nr_frags = shinfo->nr_frags;
 
 		while (nr_frags--) {
-			page = skb_frag_page(&shinfo->frags[nr_frags]);
-			page_pool_put_full_page(page->pp, page, napi);
+			netmem = skb_frag_netmem(&shinfo->frags[nr_frags]);
+			page_pool_put_full_netmem(netmem_get_pp(netmem),
+						  netmem, napi);
 		}
 	}
 
 	page = virt_to_head_page(buff->data_hard_start);
-	page_pool_put_full_page(page->pp, page, napi);
+	netmem = page_to_netmem(page);
+	page_pool_put_full_netmem(netmem_get_pp(netmem), netmem, napi);
 }
 
 static void mpnic_rx_csum(u64 rcd, struct sk_buff *skb,
@@ -1684,9 +1695,9 @@ static void mpnic_clean_bdq(struct mpnic_ring *bdq)
 	unsigned int head = bdq->head;
 
 	while (head != bdq->tail) {
-		struct page *page = bdq->rx_buf[head];
+		netmem_ref netmem = page_to_netmem(bdq->rx_buf[head]);
 
-		page_pool_put_full_page(page->pp, page, false);
+		page_pool_put_full_netmem(netmem_get_pp(netmem), netmem, false);
 
 		head++;
 		head &= bdq->size_mask;

base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
-- 
2.56.1.839.g22a8290db9-goog

