Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661116;
	b=l088ZT9N6Lsn6QlEiQcHSNdcHnzbEshtqrRtcXxD5C6+oHSM3OKhsly8J3D0tdIvMwlq
	 tJRQp2LoXOgqeVAZ1f174+WnmbQ3eG7OdoB6CYs4ZX4V8b2YmY685hUSr0UJfdtXWiXgn
	 GStHRyo3YmkCtjoYQ1DnbF/z4Vy3V7IjF03WjvRtN/1h96XVl2tWAR8b2LuckYA4aaY05
	 tzAnVYUriqg/HqOc/fLYtRui905lXhfKJNycxripruBywmk9OJCKBEGwDydbt7YnPHd9+
	 +pjkyb0MMIJPXw33xOcgSS5OsFUAgGEUpJs+eiBsbGbAoh4YFBAEtjweOcUY2NpxgGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Qy0LDxWtU3WiFF4Cpmua/6KfacVExA5tS3ogGXwY7VI=;
	b=qFKIp4APj5rmFwotX2W30Ivq1tMjjPCt9gF1ikLefx2/oI6w2YRYN09iBYvShQRj22mu
	 vKATx6+J5jt7Dsb3ay54RPrtkDgVesrUfhDryhohDFo3FDEM7osAWAR5vtGQf4xl2Q9R7
	 XQmsqJ881X4IDr4XUsEQWj2fEWZd/RIbta2ocoHI+C+b4UiZhnUpQVq0QXk0jQ74TM8UN
	 ZeyRFsh5LwnNhz2D/jK0AZeO0MlryAKf5JFVc8OkTigSu4EtoJSDaqvgTKQmIms8TJon5
	 8pO00+czdurpNue9ToSJFUwNAEAIl8u0NTbyzyo6xgsoQMltedb20sbSu57zzYv5qzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=Uz7PizGr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B1B606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B1B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=Uz7PizGr
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db3a48dc6so7837295d50.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661115; cv=none;
        d=google.com; s=arc-20260327;
        b=nfQ/5qV64yJpVspVX4R4q00UySXsPl+yKyIb5vK5c+SDrOpr4libD+st38VHyRwzGd
         Ybi0FufNr2fevsBAIOHcixZCXGtBTkS74rWhgzJ+7qhJOnr8IX156ImY1oBoVCJlT/Ko
         sR1gsXrHlQqOawBA5n7iR3buoCLDieoRGDOFdC+hdwJ0CUYAzykY2wS1kH7XpuFZKmha
         F/91JrrcYngy8ezdJNQT7Jw1RvIrjtsQRWdULNZplX4WgBX/yHl1j0VW+7/ei2X2AjM5
         xcrmbWpQlKobVUxJ+khiriZcyCNZYySaNPiZ6NJoWk8iISmCM6PfMg2VoHxUZjoMYe4T
         DdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Qy0LDxWtU3WiFF4Cpmua/6KfacVExA5tS3ogGXwY7VI=;
        fh=Bcu2+5g9XCCN2XMMCGS+PP25a174fHwkDZQbmZDoy7E=;
        b=DACfZwJUsDqbhuGe41l4BoM8Oc/rUvmUIr+HROUiDxwfaf1oHh6e1Uhv3FndSxje5o
         55o2j9gP8h2qRfSEKf5kKhY17ADfBHTzifaDegPnGxgohPQKpPL8Wyq4iZTTM0JBG/YP
         2UTuZ6KCQaFMFlqy0DmFcSN5Jz4q/UB8r/xCFpqFgtYK0gxmJraUBXHaR6XSDYyrlM33
         C0hiHWdB+nefKCIcIMAoBNOq3TW9x7r3vdAnHD8c3QeSA+sCHzr1ymO8m1ucbMwokAnf
         pkk7osJ6spI3XcB++ajnJjiSvMuuW5K7DvbFDk2hY72SS4tZx8y3bboa6q+nGuDzsLUH
         7M9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795661115; x=1796265915; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy0LDxWtU3WiFF4Cpmua/6KfacVExA5tS3ogGXwY7VI=;
        b=Uz7PizGrPPUeLp1h+R+wrNBbwpySLPvVXG1ZD9uifhwGMwE9UrwNwARIbAbJtaFLK8
         Tbs1SpxiAeZaQQK0Qv0BUUfkHQlw7moNmybMAQIXN0pHCwis4PIUuqKRO6rkxv1MZYEz
         Mp0ReY4tWE1xNd6VW1qWhyvDlhPjtyyfHoWvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661115; x=1796265915;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qy0LDxWtU3WiFF4Cpmua/6KfacVExA5tS3ogGXwY7VI=;
        b=KkS0mIzvwt8PqYkiNlzqLZkgOUhSoSwhoWrMo8OTyn76kXmjzPSANGlPYpsGVtqIId
         HS/Uejj9OoKyDmrOmPBt8DnPbwHyDB1UBBXXjwqTVQR9k82l3gQ5Y2UpgcQ8bq4syhQ9
         ty4GdZR895mD6zq4jOZytSk2d9R+u28qjG0nQJOAYUOQK28T0pMEcNVVPHWmaLhRNO0t
         2WGzhvmYfRbiCJMYYNjGStU7XjdvgoR2ltyuihVmwwdtLBijmKEHfU8CbYJuJtjuvvtK
         QLeFA5s+WWJ9RFsN1ZJGfEGZPypQJDAFK1/LtqkOoLW+/rIWDQ+yzNFNWCVawBrSJBy4
         HGJg==
X-Forwarded-Encrypted: i=1; AL+hErEBllhZ3eMaFm+7W9/QQPYuKjT4wtPc9KixEu9RabxF8Tw/JxN4IosTimaYveld+MnUTCOG84k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ez5Gt4D8zLIb/w45DxV/Ab/1zXCMUvHA+sBCSfXkzGbyh34I9
	xfBGimXMHOihfolhLg/0WCS3CeITOHKmWSYTwI/9LMRGhEur0P2IEqmqTQ+Ktf7cuVhFfftRAuT
	us14074rubkkF0tBV+L4zUU7B/kZRXAoP5jljRLvulA==
X-Gm-Gg: AZFdTZd5F/IFWZSt40IqfaXFNgIL8mDO2Avy1RcQmSOO3/Z80ZZ5MmkeoQeO6k075gg
	xvYsXJSGCRKb3/7xrF1T1AnVOZOCHEPxQaVNwuynZhXzohgm7k8QjlrqV6sKFB7Ra1WQOEAoLEf
	Kad29IBST0TRRrZ/xo9/Kgwgd3VX14x79S3CbS+Z39u9JMmgaV8HT+2lJcz95Tz4RBBCAGvLy8l
	bYsnZPcas+AXTqvBS3OdrYiEk/dEbq1IhyeNL3OalMz61CbFM3aIv9uWND+t59+DpCkf0MlbVEz
	5Aqxih6hLrYz1+9tNdA12Gad49gz1CT9wFS92QNcUdhuMj9FVQQpkG0vP/bStAXPLeylD9auao1
	QVLc9CRpRilrf4MroRPzFTAJeUcDQdh+76Kda633yPqpBRzxpkTpcen1Guy2syQw2Gi5zXSv1AI
	wud3s6dD7ldLVs8L1l72zRAx9TRgnEZn8ceAm9lh2trKpJfxpzxlyroFKsf0qIh+6gk0YUzug8T
	67HufoXRI433nvmxVEYL+MfnEhiy8qB0j/B
X-Received: by 2002:a05:690e:bca:b0:67d:bdcc:4264 with SMTP id
 956f58d0204a3-67df44c180dmr6240267d50.147.1795661115337; Wed, 25 Nov 2026
 18:45:15 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 20:45:14 -0600
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dickson Wu <dickson.wu@certik.com>
Date: Wed, 25 Nov 2026 20:45:14 -0600
X-Gm-Features: Aa3M54qTPLQ5kn2kbiAX2CcqbSNatDCxsIG9F8dIgEARuqCsHbX4tztvVfGoQSo
Message-ID: <CAFaZ9eob6Kg4WDo_m203vhom-XtsNN1kFUKgyUs3DcCTev5msQ@mail.gmail.com>
Subject: [PATCH 5.10.y] net: mvpp2: refill RX buffers before XDP or skb use
To: stable@vger.kernel.org
Cc: Til Kaiser <mail@tk154.de>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Til Kaiser <mail@tk154.de>

commit 5e8e2a9624df72fca7c736b2966b2cbf6c9c3ff6 upstream.

The RX error path returns the current descriptor buffer to the hardware
BM pool. That is only valid while the driver still owns the buffer.

mvpp2_rx_refill() can fail after the current buffer has been handed to
XDP or attached to an skb. In those cases mvpp2_run_xdp() may have
recycled, redirected, or queued the page for XDP_TX, and an skb free also
retires the data buffer. Returning such a buffer to BM lets hardware DMA
into memory that is no longer owned by the RX ring.

Refill the BM pool before handing the current buffer to XDP or to the
skb. If the allocation fails there, drop the packet and return the
still-owned current buffer to BM, preserving the pool depth. Once the
refill succeeds, later local drops retire/free the current buffer instead
of returning it to BM.

Fixes: 07dd0a7aae7f ("mvpp2: add basic XDP support")
Fixes: d6526926de73 ("net: mvpp2: fix memory leak in mvpp2_rx")
Signed-off-by: Til Kaiser <mail@tk154.de>
Link: https://patch.msgid.link/20260607134943.21996-4-mail@tk154.de
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
[ adapted to 5.10: page_pool_release_page() in place of skb_mark_for_recycle() ]
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
5.15.y and newer already have this. 5.10 has no skb_mark_for_recycle();
mvpp2_rx() there hands the page over with page_pool_release_page()
instead, so that call moves up to right after build_skb() succeeds,
where the 5.15.y backport has skb_mark_for_recycle(). Everything else
matches 5.15.y.

It goes with f3c6aa078927 ("net: mvpp2: limit XDP frame size to the RX
buffer") that I sent for 5.10.y earlier. The two don't depend on each
other.

Tested on v5.10.275:
- x86_64 allmodconfig (CONFIG_MVPP2=m) W=1 build of mvpp2_main.o, base
  vs patched, no new warnings
- x86_64 defconfig with CONFIG_MVPP2=y builds and boots under QEMU/KVM
- I don't have mvpp2 hardware, so the RX refill path itself is untested
  here.

The backport and the test runs were prepared with AI coding tools
(OpenAI Codex agents, with review by Claude). I went over the result
before signing off.

 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 43 +++++++++++--------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 3e60d40b3f6f..5915a8cdeddd 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -3613,6 +3613,12 @@ static int mvpp2_rx(struct mvpp2_port *port,
struct napi_struct *napi,
 		else
 			frag_size = bm_pool->frag_size;

+		err = mvpp2_rx_refill(port, bm_pool, pp, pool);
+		if (err) {
+			netdev_err(port->dev, "failed to refill BM pools\n");
+			goto err_drop_frame;
+		}
+
 		if (xdp_prog) {
 			xdp.data_hard_start = data;
 			xdp.data = data + MVPP2_MH_SIZE + MVPP2_SKB_HEADROOM;
@@ -3630,12 +3636,6 @@ static int mvpp2_rx(struct mvpp2_port *port,
struct napi_struct *napi,

 			if (ret) {
 				xdp_ret |= ret;
-				err = mvpp2_rx_refill(port, bm_pool, pp, pool);
-				if (err) {
-					netdev_err(port->dev, "failed to refill BM pools\n");
-					goto err_drop_frame;
-				}
-
 				ps.rx_packets++;
 				ps.rx_bytes += rx_bytes;
 				continue;
@@ -3645,8 +3645,21 @@ static int mvpp2_rx(struct mvpp2_port *port,
struct napi_struct *napi,
 		skb = build_skb(data, frag_size);
 		if (!skb) {
 			netdev_warn(port->dev, "skb build failed\n");
-			goto err_drop_frame;
+			if (pp) {
+				page_pool_put_page(pp, virt_to_head_page(data),
+						   rx_bytes + MVPP2_MH_SIZE,
+						   true);
+			} else {
+				dma_unmap_single_attrs(dev->dev.parent, dma_addr,
+						       bm_pool->buf_size,
+						       DMA_FROM_DEVICE,
+						       DMA_ATTR_SKIP_CPU_SYNC);
+				mvpp2_frag_free(bm_pool, pp, data);
+			}
+			goto err_drop_frame_retired;
 		}
+		if (pp)
+			page_pool_release_page(pp, virt_to_page(data));

 		/* If we have RX hardware timestamping enabled, grab the
 		 * timestamp from the queue and convert.
@@ -3657,16 +3670,7 @@ static int mvpp2_rx(struct mvpp2_port *port,
struct napi_struct *napi,
 					 skb_hwtstamps(skb));
 		}

-		err = mvpp2_rx_refill(port, bm_pool, pp, pool);
-		if (err) {
-			netdev_err(port->dev, "failed to refill BM pools\n");
-			dev_kfree_skb_any(skb);
-			goto err_drop_frame;
-		}
-
-		if (pp)
-			page_pool_release_page(pp, virt_to_page(data));
-		else
+		if (!pp)
 			dma_unmap_single_attrs(dev->dev.parent, dma_addr,
 					       bm_pool->buf_size, DMA_FROM_DEVICE,
 					       DMA_ATTR_SKIP_CPU_SYNC);
@@ -3683,13 +3687,14 @@ static int mvpp2_rx(struct mvpp2_port *port,
struct napi_struct *napi,
 		continue;

 err_drop_frame:
-		dev->stats.rx_errors++;
-		mvpp2_rx_error(port, rx_desc);
 		/* Return the buffer to the pool */
 		if (rx_status & MVPP2_RXD_BUF_HDR)
 			mvpp2_buff_hdr_pool_put(port, rx_desc, pool, rx_status);
 		else
 			mvpp2_bm_pool_put(port, pool, dma_addr, phys_addr);
+err_drop_frame_retired:
+		dev->stats.rx_errors++;
+		mvpp2_rx_error(port, rx_desc);
 	}

 	rcu_read_unlock();
