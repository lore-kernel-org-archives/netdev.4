Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461751;
	b=AgEvzuDduvtY3pfp/duSYZw+xkzKn2+yviyBNqdJc3h3QU0V1j0EuBBw8NiuRxd5aHuY
	 2ZFSu0jQjUDEf/431gDbvS55dgNaMgs4gNojyPKOoGvPaVVjMJ7gOZBpc4inVxGzTHO3n
	 fsXigyBjlP5llz2tYJLLpYwyyTrSQUw0v2jerNyAByGRiCU4Y1NAEJ/bsGxdA4oerS5Ch
	 HU0Mkb88yELRSBV12pylfKRlaE1kqvu6mY0TcndXVHBPB1lOzuNi2d6Om4+RB/YQpu0jp
	 13O/MOzFeNCcBfd1VRqYBTtqmM3KQgDir4rHOUGYCnduI/MTTTPU5fmPQ4f1uNv9J4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ETps0+A920M+I0wsn4d1uMr+F5f++KxdjGc1y6/+WnU=;
	b=G7JSllwIzeCjiqvMRQUrrp7tklkz9mCJQohKXqShDbm/NnOTA3ZCQ//MhlcjO813UT8G
	 4xjCbNcuYn/aUNyz9DMxR0a48SXofvLfIC3EHSXp93i/HlG0oeYEgmmSFqWA7kajPJykE
	 8RjrH02kD2tkbPfWg8wmqnLQWJZuaRNocY66advaFRu8DLOpesuIqbaNQRn7ROd7X0x2H
	 zYXh86e3ggVuMWwewiv5qYgvv5DtDkZOg4mvIfX6c6dBEFkZffzF6rt1lSGSCGYjMh5fb
	 sO9wvzvXH0GgUuTggcy6cKVkm2Yr/Rjj2Qub2dlKo3l8viiQAPXzGvXuMg549jMwijA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BoMeULWF;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E50606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E50606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BoMeULWF
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2291467c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461750; x=1796066550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETps0+A920M+I0wsn4d1uMr+F5f++KxdjGc1y6/+WnU=;
        b=BoMeULWFWP5wAz1YCCVkQ2NzIWtEVoPuXzlaMGe3h9ArbVkxH5Qx0q85F4SRwAEvGy
         Kd193zO/7vSlCrZAg4DbjrpUBrN9elJ2S/7NlzlPpyXOr8UM+g63CO5NR1ERTREu3d3I
         ejooan5dzs0yQ7xQtC4Uv+1ynLn1wSAmv6cRDp/7VWifNNK6MiEG7LH8mkMfHfXqx/gz
         U/Pvbz5X1m06NStiP+QPjhxh3yvG/MirJ/Ksh83Pr4alkVVrYQZ63oWqA1GfppPDyAN9
         QflyXTrUgRiZyD4zLf2mu1tLCPvKn4ep1mrsY496FXBc5B5K1WqOdyemkz+b/+r/T0c4
         5Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461750; x=1796066550;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETps0+A920M+I0wsn4d1uMr+F5f++KxdjGc1y6/+WnU=;
        b=KrBozsL9xGr/H66ag3dPmdAmQn5jV8QJTMmwAN76Oy/4+wsuohbT1zb6QItJam1GaI
         HHSXLrGGk004arhD2ZTuZ6WCXAJBXLKTBT9JvRZNTbllQecQSQ6kwReAYW66eeoCJN2t
         BI9i+am0iNRfL2TrHtKdrd5KoV5yvGejGoQuuVx+e4X3PylyuvefiR1l024aV2HRG5ln
         zD5tEh6O35iMM3g8VaGXLL7Mq2FpayCFbmP7FLeCjkeUmH9q6Q09x7rdAAUK7C/1zC/E
         cS0fcX/fzq+MTOl9MiV+3VfTtIyo65AFzYXWS9mhuIPThSqeky9sXOwGIJ3+ma7o5qly
         PF5w==
X-Forwarded-Encrypted: i=1; AL+hErF0ivS7gmpFEQs0oppX+6Cl3JWEKVFpvSMrEKpIRZ44H6DiF1e5v5/bsZem+tGf44XzjCxeBY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AIHueqIshYbFtgYmGkp5snb3Wb5csXWVRrfP5g51qJhvicJUa
	igL1NGR04ICf5jc8MHHFkdL4SI3o/JQfAtyf+YwW4XFvE/SpJ7cxfgAq/i0wwGYXWzEpN5Itq9y
	dRnAtgPhCyN5Nsbxv2kI04g==
X-Received: from dldz14-n1.prod.google.com ([2002:a05:701b:418e:10b0:1a1:ce17:436b])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:21cd:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b5568fbfcbmr10792987c88.39.1795461749885;
 Mon, 23 Nov 2026 11:22:29 -0800 (PST)
Date: Mon, 23 Nov 2026 11:22:20 -0800
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
Message-ID: <20261123192220.4013325-1-nilayvaish@google.com>
Subject: [PATCH net-next] virtio_net: use page_private() accessors for the
 big-packets page chain
From: Nilay Vaish <nilayvaish@google.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>
Cc: "=?UTF-8?q?Eugenio=20P=C3=A9rez?=" <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, virtualization@lists.linux.dev, 
	Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

Big packets mode chains its receive pages through page->private, reading
and writing the field directly.

struct page is being shrunk as part of the memdesc work, and its private
field is one of those that will move. Direct users have to go through
the accessors before that can happen.

Use page_private() and set_page_private() instead, like the rest of the
kernel, so that the driver no longer depends on where struct page keeps
the field.

No functional change.

This patch was written with the help of an AI coding assistant (Gemini).

Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---
 drivers/net/virtio_net.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 0988a946ef35..5eef2c315963 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -680,8 +680,10 @@ static void give_pages(struct receive_queue *rq, struct page *page)
 	struct page *end;
 
 	/* Find end of list, sew whole thing into vi->rq.pages. */
-	for (end = page; end->private; end = (struct page *)end->private);
-	end->private = (unsigned long)rq->pages;
+	for (end = page; page_private(end);
+	     end = (struct page *)page_private(end))
+		;
+	set_page_private(end, (unsigned long)rq->pages);
 	rq->pages = page;
 }
 
@@ -690,9 +692,9 @@ static struct page *get_a_page(struct receive_queue *rq, gfp_t gfp_mask)
 	struct page *p = rq->pages;
 
 	if (p) {
-		rq->pages = (struct page *)p->private;
+		rq->pages = (struct page *)page_private(p);
 		/* clear private here, it is used to chain pages */
-		p->private = 0;
+		set_page_private(p, 0);
 	} else
 		p = alloc_page(gfp_mask);
 	return p;
@@ -881,7 +883,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 		 * Currently, big packets mode doesn't use page pools.
 		 */
 		if (!rq->page_pool) {
-			page = (struct page *)page->private;
+			page = (struct page *)page_private(page);
 			if (page)
 				give_pages(rq, page);
 		}
@@ -929,7 +931,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, page, offset,
 				frag_size, truesize);
 		len -= frag_size;
-		page = (struct page *)page->private;
+		page = (struct page *)page_private(page);
 		offset = 0;
 	}
 
@@ -2705,7 +2707,7 @@ static int add_recvbuf_big(struct virtnet_info *vi, struct receive_queue *rq,
 		sg_set_buf(&rq->sg[i], page_address(first), PAGE_SIZE);
 
 		/* chain new page in list head to match sg */
-		first->private = (unsigned long)list;
+		set_page_private(first, (unsigned long)list);
 		list = first;
 	}
 
@@ -2725,7 +2727,7 @@ static int add_recvbuf_big(struct virtnet_info *vi, struct receive_queue *rq,
 	sg_set_buf(&rq->sg[1], p + offset, PAGE_SIZE - offset);
 
 	/* chain first in list head */
-	first->private = (unsigned long)list;
+	set_page_private(first, (unsigned long)list);
 	err = virtqueue_add_inbuf(rq->vq, rq->sg, vi->big_packets_num_skbfrags + 2,
 				  first, gfp);
 	if (err < 0)
-- 
2.56.1.839.g22a8290db9-goog

