Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593199;
	b=KF+QzwGH+dbMCPKcZq7DOTM40xxMko98Y4ZDGdZe9GhKXpg+zhYiRyUfY4WEQ6vEJwEC
	 5MmppF9s0jyW7H4sck1Bv6ZL0NWcmoQ58CIqxT3be42IpYbMKDfGorwFR1dWV+Qb5vLbh
	 cp8SbQgP9jKk7xXjSIwpHNTY/HYXgLjOZmXmN+heGfOu/bG7tBlHjYuFKi354tZjLMTrD
	 000bOIY8k3yxiUfJof03dUP2+aHn/cA8H6vteMEUQN4cKhL1VkpdZcNKGFhsQ8neBCZUU
	 +sVxVUr5EZCVxaT/4jB1plcFeOvXX4hYVnh0deoNKClG4LvWZNws2J2a2YeBB+velYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nmWR8PDCE7Mkvh9YH3W5vy4LG0+HhjzQaLpAoDc5rWw=;
	b=WDiFeTQSNoMhZyFCDM3biQP1aO23q1U6wvFjuuUyuB/2cXC6IKEGAlnT9Vr7NN17L/I1
	 TO2hptkED8T/chitwFnOeeHwVt4/KzMv0nwKuZFIUPg9rnOz8qkXQJx6aKC/WbtvaibWE
	 xYt6O7Zd2i6ouBnllckM94dX75VQnKJv2m87+P+L5oLRJVOrl6PLIpa1QdE8FFP2LpESP
	 o81whwd7mWmRm1zcZxIRitSJUzPQG9sVLoBeH6Cp0q4luwHYrfrdBWFKL0jv+lS0TON91
	 gDBjdI9XZwO6WmCoyD6/wXjKPizErWoOglvHpzc5QPF2h5smWWK8nXk0WnV8c+SjY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sz1H1IZt;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFF606A339
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8CFF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sz1H1IZt
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3123433f8f.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593197; x=1796197997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmWR8PDCE7Mkvh9YH3W5vy4LG0+HhjzQaLpAoDc5rWw=;
        b=sz1H1IZtEkpJ4wdjj2eiyewLBY2SqDqIkhO0iDcQSXpXxBV2PrxDYfbe/0bGR0EfQb
         QEfiO8Kojg4ZWj2SeFLGlIQe+EvS9Se3nGa55dgjqX8ZfDLghAwmdxlOCwUcYiXd1QM5
         0zTwvPjeMfTaj+7m05/Bw2OnVf6xFwTgIRp/MVZi/axIoQXTiMSJ5D4Wq8au56rHRj9a
         Yk+kKrcS18Y6mQoILU63CLTC2zp/RdqKgfJDr+EJY++kgmZqcAVukNbCE0r8XLqx2fT9
         L90Qyzc/xSmsL72wgyBEllE6tJVbjdt6I9HvoewH74k9vqKOkPH9IGfAzF2QRkBPxjDC
         0N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593197; x=1796197997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmWR8PDCE7Mkvh9YH3W5vy4LG0+HhjzQaLpAoDc5rWw=;
        b=cgLLGZMhKGPUinsESQSTc4XEKUIGMbN5MHuihRNNNFs6MuzXgpZesgXZrSFhqLSaEs
         LzAL92RIJfs/qNU0GUWyTc/J3rYO8lmTnim1/w4bBht0ydH12hT4kTQW/nY7lkW0YgH9
         dBVw9RZbhFj+zcK8JoR4PSVrdDu7OHc8+BGfL8+zz4cUApH1S1UP2zadeWCp3dnq5Op8
         FW0C+vPraoKfmdnJGW98g91P/Ba9vIAoz9ufky7d9MSCr7vDjJyGHKp4IabmInBJ/281
         aDnoQi5Tni6pM8i+Arp/N8jPW1NADDrGaWIBRQ3lBQDfA+NFpIZOlw3Wnv11O+4GQH/V
         0KRw==
X-Gm-Message-State: APuU4Z+hgMQHPmMc3nU89mVyhkFHbHen7mnNNs8rCh0R3RRZCvGX1EUa
	bh2PB4p82qZ9P9hikRLCCqmNBB6HAhAajtL5kNWmUmulsA2bC3C8r8z/M7ikw2KrymLPRMZymSc
	=
X-Gm-Gg: AZFdTZc9WYxt5Gf+vQULExKPtPutNTG2GoAD7aVbMENrgd+AiY6NJQUPpSyQyNO9Wb7
	ZityntnT5SHgwF8lwrapCRI/VHENsgvm2GXZQ1AZ3trXsXz1u5FIMdsF2eNQ1XNkWnQ80pSJA4W
	9XIJ08Bqsay9Un7hOqYa/aAyL2QaELHXIXAqJAZfCpghQpFNoLpy1Wj1tUX34+w8NYGjDihER8J
	I7L3bH+6hXe8GGKP7t9EkYhfuQ9z8dSb6g3yusvanSqRL50YMLqh8/YXIFFGeWt1TkDuZI0hXoa
	Fk2naGS8+M75ROXxhyqQtWOoO2JVWMW4wRb7/jXdG9WbtnuYrz78cJBePZ0kaohud1Kfa+GahRz
	Q1m5RAJFX9iLLxphl8+FTTq3SSS7EyVGlYJvronL9ThcNdo7VPdfeurNSQvh3TrXNKusfcfrlAo
	edU5+xtizU7UsVv9deAyDPiMUeb+HVhA30Xo/z+M2zxk25Ltx4fIjWphxxJKgB7o4OSz8scg59i
	IUsdMPEtZYFqa5Zr6HTtpB78GjAqtkeFda6FSt1qALQW8tBmvKallFn7T8r7E+FFhosHuzs6EpP
	a34rMIfv/lwyHBLKA8XIpt7gbQuQjxTpu3wxqfg=
X-Received: by 2002:a05:6000:4a07:b0:4a7:14d0:9c4c with SMTP id ffacd0b85a97d-4abab02c4femr31779852f8f.6.1795593196975;
        Tue, 24 Nov 2026 23:53:16 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm33001138f8f.28.2026.11.24.23.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:53:16 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: ronak.doshi@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	u9012063@gmail.com,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net v3 4/5] vmxnet3: drop XDP frames that do not fit in one rx buffer
Date: Wed, 25 Nov 2026 10:52:54 +0300
Message-ID: <20261125075255.1517-5-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261125075255.1517-1-filzador@gmail.com>
References: <20261125075255.1517-1-filzador@gmail.com>
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

With XDP enabled, rx ring 0 head buffers are page_pool pages and the
device is given a buffer length of MTU + 22 (skb_buf_size; the previous
patch keeps the XDP MTU low enough for that). The device still accepts
somewhat longer frames (observed: up to MTU + 26 untagged, MTU + 30
with a VLAN tag) and splits them over a head and a body descriptor.

vmxnet3_rq_rx_complete() runs XDP only for completions with both sop
and eop set. A frame with sop but without eop falls through to the skb
path, which uses rbi->skb although, for a VMXNET3_RX_BUF_XDP buffer,
that union member holds the page. The result is a kernel BUG in
skb_put(), or at BUG_ON(ctx->skb != NULL || rbi->skb == NULL):

  kernel BUG at net/core/skbuff.c:2637!
  RIP: 0010:skb_put+0x3c/0x40
  Call Trace:
   <IRQ>
   vmxnet3_rq_rx_complete+0x893/0x12b0 [vmxnet3]
   vmxnet3_poll_rx_only+0x38/0xd0 [vmxnet3]
   __napi_poll+0x2b/0x160
   net_rx_action+0x336/0x420

One frame of MTU + 23 to MTU + 26 bytes from any host on the same L2
segment is enough to crash a guest that has a native XDP program
attached to a vmxnet3 interface.

XDP on vmxnet3 is single-buffer, so drop such frames: count them in
drop_total, reuse the head buffer and skip the body buffers, as the
existing allocation failure path does. The completions of one frame
may span two polls, so start each poll with skip_page_frags set when
no frame is in progress (rx_ctx.skb == NULL; the first patch of this
series makes that hold for the data ring path too): a body buffer
without a head can only belong to a dropped frame.

This also changes the non-XDP rx path, whose head buffer drops (skb
allocation or DMA mapping failure) had the same problem before XDP
support was added: if the poll ended before the body completion, the
next poll started with skip_page_frags false and ctx->skb NULL, and the
orphan body hit BUG_ON(ctx->skb == NULL && !skip_page_frags). Such
bodies are now skipped.

Every path that sets skip_page_frags now counts the frame in
drop_total; the two body buffer allocation failures did not. If the
last body buffer of a dropped frame has rcd->err set, do not count the
frame a second time in vmxnet3_rx_error() (nor in drop_err/drop_fcs).

Like the other non-PASS XDP verdicts and the existing drop paths, the
dropped frame is not counted against the NAPI budget; that is a
separate, pre-existing matter.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reproduced and tested on the
reporter's lab systems as described in the cover letter.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index e8be95c..234897a 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -1614,7 +1614,8 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 		adapter->rx_prod_offset, adapter->rx_prod2_offset
 	};
 	u32 num_pkts = 0;
-	bool skip_page_frags = false;
+	/* A frame dropped at its head may continue in the next poll. */
+	bool skip_page_frags = !rq->rx_ctx.skb;
 	bool encap_lro = false;
 	struct Vmxnet3_RxCompDesc *rcd;
 	struct vmxnet3_rx_ctx *ctx = &rq->rx_ctx;
@@ -1662,10 +1663,29 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 		       rxd->len != rbi->len);
 
 		if (unlikely(rcd->eop && rcd->err)) {
+			/* The last body buffer of a frame already dropped
+			 * and counted
+			 */
+			if (!rcd->sop && skip_page_frags)
+				goto rcd_done;
 			vmxnet3_rx_error(rq, rcd, ctx, adapter);
 			goto rcd_done;
 		}
 
+		if (rcd->sop && !rcd->eop &&
+		    rbi->buf_type == VMXNET3_RX_BUF_XDP &&
+		    !VMXNET3_RX_DATA_RING(adapter, rcd->rqID)) {
+			/* The frame did not fit one XDP buffer. XDP here is
+			 * single-buffer and the head holds a page, not an
+			 * skb: drop the frame, reuse the head buffer and
+			 * skip the body buffers.
+			 */
+			rq->stats.drop_total++;
+			ctx->skb = NULL;
+			skip_page_frags = true;
+			goto rcd_done;
+		}
+
 		if (rcd->sop && rcd->eop && vmxnet3_xdp_enabled(adapter)) {
 			struct sk_buff *skb_xdp_pass;
 			int act;
@@ -1845,6 +1865,7 @@ skip_xdp:
 				 */
 				if (unlikely(!new_page)) {
 					rq->stats.rx_buf_alloc_failure++;
+					rq->stats.drop_total++;
 					dev_kfree_skb(ctx->skb);
 					ctx->skb = NULL;
 					skip_page_frags = true;
@@ -1858,6 +1879,7 @@ skip_xdp:
 						      new_dma_addr)) {
 					put_page(new_page);
 					rq->stats.rx_buf_alloc_failure++;
+					rq->stats.drop_total++;
 					dev_kfree_skb(ctx->skb);
 					ctx->skb = NULL;
 					skip_page_frags = true;
-- 
2.47.3

