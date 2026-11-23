Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438158;
	b=G8AYlnQiaCh1BpyGOCC5liLV5g+mNsUL5Sq9m3F8ZiTMebdaz6Cac2fU3sDKAs59avD/
	 g/yraj/VHHwbgmkyDHmECZt8x2s9ltmenBqhX3J6WwNDhEyW22razO0NUdc80F7g7C4bm
	 qe7rNsD1fV1/+jBA0MP2lipcJsA04odmtRxXhV5Esm41Hsw5D4CEn2xbT3VWotZla1brM
	 1+BE97vEhnWmMD6V6usJdHVRjDGe6k/mk+5tDF+Hd0f8vxVRke9qkVAeag7hhOlRhneRA
	 NoBspVROwuj6WBg51FJ6oJHGa1o/fV0E9QOC7DlgAKVi5D0LJFAjLNa7P/tdD5mjSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uCB/3nRWyCrriJhM0/9kpHJFQO/Pdm9osUstoRGqfT0=;
	b=DhVvkYPGXJr/Eg45715BgdEWt2x8XttY0oSXoPkyCj7jiDVZkgVL86hhSug+3bc8c2yf
	 x251Zfe1O2CRZS3o+dTvffUSGG4TrUZHz+6HvDcnJ3QKQxyY6tAPN3mIa76z6w1VR0JPc
	 ob6neA8etO7sRAxijXrQAgJLrULOPsP2v5dSnwTeVHdB6y+8rmw7UwjVROqBn+g/3WTE5
	 xCkvSwAcfzSZCkwsF9m7qwJfOQpj6vpAU/bKWP918OnAgzReKGcNfx6kA3l5bPmxP4UNs
	 WrbGjAuvs0V2+fTgZmke52nqvV2AhcNDArBeC4/GOpahGNUt+EvuFJOXyIdzxYu8v0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZvZ/FKo8";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD6606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZvZ/FKo8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so25127455e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438156; x=1796042956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCB/3nRWyCrriJhM0/9kpHJFQO/Pdm9osUstoRGqfT0=;
        b=ZvZ/FKo8CerKwBRWZ75tCKi0x7Lp6P2M5ltRlTVz0MMncbLoCorN7Y2IlL8cXEWu+n
         3tp36PZISLdXazPQFUYYOpTG3V3t9CrHnSwQv6+l+2L1Bf46YpIZ3Hu30s3vSYUwlV5i
         Nkr5O7Kj3I8k8cvyJXAnlrxgAe2iGzHHhJF3FYuevthpXultsURZi+4zvTMN9XkIiy9W
         YTEawiktGKQw01RZWBQUCduLhb+vonsF1o0XAQoWywIsAxc1C3VE8RGyx9g0HzuQ0T6o
         2e7vZkPXuXjpCqE8ROWpC4cRMDF1g4/A1HbBpA4LfRs88hDhs5fjmH8frcXBCm+4Os7S
         jYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438156; x=1796042956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uCB/3nRWyCrriJhM0/9kpHJFQO/Pdm9osUstoRGqfT0=;
        b=DjkFldQhreFZUiYbc6V9XfagrIQQ+v5q1yHeHl/iOCE9AKSWvWonCKE3vHP9BUGxek
         8BqjH5UvMut0IRm4uBsJDkDrDMgGgnKHy51aYNPMXN6i1LoENHnhy3Q3x2a0GSvSKt6z
         50KrNAKVw9N8Mxk5dM5lXdfVRwVIDQwgRITKhB+QjP4+K2RJ+tvTNxsiLrFnu+tvR08a
         MAF6Cw8cXHIA4XOU51UY21GkAz3lP0ISfTBhiQZioXSy4Ze5metotVphirSyUWrKFqwh
         zpbcaGMeONzqDmD97RXjgAugZBnuaewH34cdCRh6NJsrIqfYwnt333ueu6lgv8wATrz4
         nnkQ==
X-Gm-Message-State: APuU4Z8JSKiHgviJJTdVRMjvph6T+mWr1oyWVZpSEFS/KDnyDY9zT3Zw
	YtImt5jGGgBI5XI5FiBr7k72sk85kULa2n/UlgIzjxjyh8a2Xb3Culky
X-Gm-Gg: AZFdTZfouIF50d0N7ODbdKkKqwG28qqhHRwrCblk7PrNnxkLGGi8vNdaM86fVLDxegy
	z0hJvhVSbSDZ0a7gY2qZlk5g43v68XQVXHkm/V3368jLznR5lcrMLPjBaFuQSTs3DzwkNSLzC0X
	Rt67BcYcl7N2A+Nr1Bay1jkPRrCqKzIRcxWimrcP+cF9T/aPxGEJZ+JJjDVfmFJ8FhugEXy6YNH
	xxyrL3hNULX6uGTxWoyOI1bLAVuH3PWD4h7gIJJ4ir2xtFcn1VVi0Gj95dXfY5pulZhyhFrFlPX
	GEzS4ZYefJVfqF0YtLkPj1Gr/AHr5RTnqQPcGh+WEpMA4iPN4NqA8O8U6FRJdTlpJ8fvuRRK8V1
	a83Scn3vFhKdiZR4cDDRfDwBlYfGY13jojOEdKOXIXuXPZFvdqt2+xpvZ0BB4uTv95s1PSKtM7p
	nBmyZLjjCWHnEEfPPXsOUG/K30cnSHg1iNTdlcIoX6P2F1rHGTAGN3iq5DDgHcdOSsrmDO02lh6
	atlRqNSucp57ZzyP8EIMO/GmfyYni2aSZXhwDzgtYLDw106PDgPgCzjL8knw4fyya9hLmyp78Z8
	1K38Bf+2CS/kVwaETKhM+lSSXdE0VstZ7oHHTYM=
X-Received: by 2002:a05:600c:5395:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb8880e599mr233863595e9.8.1795438155659;
        Mon, 23 Nov 2026 04:49:15 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm165097045e9.5.2026.11.23.04.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:15 -0800 (PST)
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
Subject: [PATCH net v2 4/5] vmxnet3: drop XDP frames that do not fit in one rx buffer
Date: Mon, 23 Nov 2026 15:48:54 +0300
Message-ID: <20261123124855.1021-5-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261123124855.1021-1-filzador@gmail.com>
References: <20261123124855.1021-1-filzador@gmail.com>
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
without a head can only belong to a dropped frame. If the last body
buffer of a dropped frame has rcd->err set, do not count the frame a
second time in vmxnet3_rx_error().

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reproduced and tested on the
reporter's lab systems as described in the cover letter.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index e8be95c..66f6773 100644
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
@@ -1662,10 +1663,27 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 		       rxd->len != rbi->len);
 
 		if (unlikely(rcd->eop && rcd->err)) {
+			/* The last body buffer of a frame already dropped */
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
-- 
2.47.3

