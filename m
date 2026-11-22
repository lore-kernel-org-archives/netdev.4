Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307339;
	b=cYIDr8TTjax77MLAp+VNqjqWK7KYQh4t2Zpkt9Wn7tuJ03k+Xzl3RKwqsIukgJSG/AF1
	 4corgDuZ5g7N9lqEagFBQS9/zVgO99zXyvxHDIK0ZhiwSVDmmZeJ0ULwRIyFdvi5iX10B
	 Y3atn46y096k7nn4DFhSmTljJ2EtrqQSDdNZ7FAvOjeGIeMIP71I8sy+vz0zut6ojWlRc
	 40hp/R90MxOn49EfC6lRETYe1FhsLNBjWFBkenUa38d6T4iVv7tK/mPnqDmFPNphuriPV
	 Jh2LtTY+k/P12LMF/u9e8K7fIQZ15ZvNBP49qu8tcOcZF2RkAOpDoFJE295TrVFfgGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J4rkI/3lcB0t873F/Ch5NZS7moBAkp3mZ08wbMwuyY8=;
	b=xJ2pOjich1ZcZ2AAml5r5ez9Td3cX9V9XlFW3/r3CIU7xN445RQGP/vaw8ljAAlGbwAc
	 EkTy/fMRTZmLBhLMP8x2Jd0gjpx3nkgOMNcmDWtyU+kF0FGZw9O3AvtoYMHnDCs3CQecw
	 aRREMVH+ri3e7e7qgoB0xyybTfcvbBijFDvXLYV3ywtdgwqIUr8+IAlNBn7Ie0uCwuXfr
	 iBKuWMwIw0WA3lW6+VGW+/R1vHB7KgBrW9ADSXuQE4LS60HNJDwAXyD10pHcq1zGetkRe
	 JMZHNmB5aa+WUWxNtFgzIuY4yScJvQsWjE6G8T7EXMhy/V6S6IQLvsT/DnwcAmpJleA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5RSggNY;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59728606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59728606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5RSggNY
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2040741f8f.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 16:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307338; x=1795912138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4rkI/3lcB0t873F/Ch5NZS7moBAkp3mZ08wbMwuyY8=;
        b=E5RSggNYQ2MZc6toIGh1CcUASP15BMuuAhOlBVwBpUDPxNpAJQh3dbQxtyaVrSj7gJ
         E8cELtLN/UJMDXWTWgneMIncfVsYkCO5JclcYrqsN5xmaUtqCRfgUDJccoG0l4RczZQz
         K+i+NkkKMSZ7q8JdjiBXoZd+7Hn+leGCdyp9WkfFVK7Q+iCVbSJ48kj9BUZZckR8LYUn
         5aZqcrsjtZYN+MxKf+Sa5q56fvD9KrBGt0n1oS31gW7Kb7PaGev45HHNlVqE0j/0q1qj
         dTAdx4HB7DxvlqCrtbLN6K12d9mIN9lMEgbshLnQNo1HJyORcz9F2c96s5CqvXB8U9Sa
         r3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307338; x=1795912138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4rkI/3lcB0t873F/Ch5NZS7moBAkp3mZ08wbMwuyY8=;
        b=A3Ymtr544x8PFbCjpkTSwBpqWhv05yXBH/Dn4XWw/apkekiY0lFdOVkGx6OYmxQc6d
         lJ4L4xFnBRlrXrcI2Ctg32MXXQzWnoBIfLZ0Tialt/6ncuig0Wc6YEiK7nbGhggyXBVE
         vHH7Vf1J9/bsByGmm31s/N0csqIcnYz1hYrmrrUD+xfndQhGnBX08B6UVUgY40MMEWqJ
         /E6g1dEyGrlpQE3a5ajru4pGZYmfLyGpnD1OUw7zoHLolqd1X+bqcStOdSgBNNPJURmh
         OsNl3nVgpC3Rdy0MDQG1NGR18AMW4/JH/ywdNrfvVYHDAJs8UPYasZsoPh/1UnkgtCzU
         vvow==
X-Gm-Message-State: APuU4Z+ZXery30J4IoX/8N6J9Qid5GuZel4FuCe3iD1E9CR8wbPQIebv
	xaELWj4M3BjO47pXdj0fUuWOfdCFMiKnqWevJNZAtDf72uuSAQrvwQv18RgHmYoD9REGIUxy
X-Gm-Gg: AZFdTZfLG+H7AhS4R/vtjRYcI1+LGteNz0pJQsdx5ICsGWks0bGgOXW2X9go7wqaglX
	Zc4l2PB6eJFZ5mgzJYX69cSeJPrpkVCaXqDWNSh7CztGWaSqCdHdTyxho/PbuvWGvkZHR7J6YTU
	PM3iaClPZfwbUb6agE1ijUhZHPO3cDWIwkJ3dbRsT3TzH8vHqBx0p8afAM6e48i5mta5LLU7RVT
	vF8YmcfAoOMpDZJUugGZcQjfBtjjuR6Owd8PRDj1Z3YhtPurntjgglkED97jsoPWvGQP67vsOoh
	NeFaykko0mGl7x+Zim1h2DBTtd/2ndOAPqivImLtMxMhwB685O4Y7iAgTsk6GyCDai1WFd0KQPW
	i+lKCBtHRquV2vC0O2PDkN+WM71WO9udiMKhcR/+Z5nhM3GFMwQMty0IOrT77hRUSDuL5GW9hAM
	g4NQc19Io6ZofSVyDL5Z0JABEoC+rHt7k9o5zD+LlZRJMONLqcbfoBG26JegxsKIComnu/j77rI
	sKn8NY72qziP70xRuBwbh+PArEgvVm+JZNiqzW/dQqBRYHlw7tTX1iQP5IreZcV8EIyKDRp9OAN
	WOx06IXfmkHyPkdF/rQihEv+CiuWRi/c66wBRQ4=
X-Received: by 2002:a5d:5d0a:0:b0:4a7:e4c7:2795 with SMTP id ffacd0b85a97d-4abb71cbe31mr17127173f8f.36.1795307337743;
        Sat, 21 Nov 2026 16:28:57 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm14415962f8f.31.2026.11.21.16.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:28:57 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: Ronak Doshi <ronak.doshi@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: netdev@vger.kernel.org,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net 1/2] vmxnet3: drop XDP frames that do not fit in one rx buffer
Date: Sun, 22 Nov 2026 03:28:46 +0300
Message-ID: <20261122002847.616-2-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261122002847.616-1-filzador@gmail.com>
References: <20261122002847.616-1-filzador@gmail.com>
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

With XDP enabled, rx ring 0 buffers are page_pool pages and the device
is given a buffer length of MTU + 22 (skb_buf_size). The device still
accepts somewhat longer frames (observed: up to MTU + 26 untagged,
MTU + 30 with a VLAN tag) and splits them over two descriptors.

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
existing allocation failure path does. Count the dropped frame against
the NAPI budget. The completions of one frame may span two polls, so
start each poll with skip_page_frags set when no frame is in progress
(rx_ctx.skb == NULL): a body buffer without a head can only belong to a
dropped frame.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reproduced and tested on the
reporter's lab systems as described in the cover letter.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index f8df83f..fb98eb7 100644
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
@@ -1666,6 +1667,21 @@ vmxnet3_rq_rx_complete(struct vmxnet3_rx_queue *rq,
 			goto rcd_done;
 		}
 
+		if (rcd->sop && !rcd->eop &&
+		    rbi->buf_type == VMXNET3_RX_BUF_XDP &&
+		    !VMXNET3_RX_DATA_RING(adapter, rcd->rqID)) {
+			/* The frame did not fit one XDP buffer. XDP here is
+			 * single-buffer and the head holds a page, not an skb:
+			 * drop the frame, reuse the head, skip its body buffers.
+			 * Count it against the budget like other XDP verdicts.
+			 */
+			rq->stats.drop_total++;
+			ctx->skb = NULL;
+			skip_page_frags = true;
+			num_pkts++;
+			goto rcd_done;
+		}
+
 		if (rcd->sop && rcd->eop && vmxnet3_xdp_enabled(adapter)) {
 			struct sk_buff *skb_xdp_pass;
 			int act;
-- 
2.47.3

