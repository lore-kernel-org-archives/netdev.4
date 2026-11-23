Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438148;
	b=zrJyLSIeeqBnc5uUp5FK2h7DZW+DlBcfBUblCj5phNNjOV03Zzcax8T9nmPixLt92Bh6
	 hd/BsFQ/5GRzxm4o3V0D0/zHtyCNTtNX6YQ4ObGyUrkeAVkqPYE/yuk86/TtAQcwbC6DY
	 cF3HKBHhjiTJSvw1BD3iINii07CoxFhxBQuGO/gDkQEFapdXKvePiUACYjTj3C2NepDV4
	 f/teAbE9pk3vK7hbeIH6ymTSlkLAZ1Gy8B8gj3WaPt/oOLID1GimXkQmDUJ9kpPcjYUvD
	 1me0786U8obhlYO6Y2Eq+sPtil9PbwoafwQnlOmI7R6ANhI2fzvsfqz5Olw8SCHzWSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nAlv3xeWLjPkzwFkSmSMhDw5Up084r6SQ9sON5hrIy4=;
	b=mWTsfJeSffjKzBL+Ade/CVYxRurdENEqqyMXADKr05SwLE1u9qqiJPzSuVsxKUiGpjC/
	 bKT/yz5ID+K+pVoP0PQ42xNh8lOagnJeBYE01PbkzYYMdGHxri1PASZzC/GWSmv3TUkrs
	 999eQrfOmpIOfr+ZzDbJoAcbG5WQ0oZyxiJ9isNja9gJw0bzdC2/K/h+2jmt+Umx0P6Bv
	 2R8rKjiXFlhkLbwJ9s4fEGP1lhMB0kn9IXwSpV3cXD6EPlTL7CEA8801VWe/Bi+wW5BeB
	 xmnvxmEzwT5XgDkpnZnryyuFo1xoajgRxaHKlFyiA9KC/9PuFuUXEw7P3mqONmxcByA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5EMtvW4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5FE606A33B
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5FE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5EMtvW4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so26838705e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438147; x=1796042947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAlv3xeWLjPkzwFkSmSMhDw5Up084r6SQ9sON5hrIy4=;
        b=c5EMtvW4sGHt8pybLjUkbqUlFj/76F7yzHS9ZmTPCmDx0+IY931gi6AXMTpDgQtwji
         R14tAlW4QidV7Ywp9bnWDnGD4DxEkYLtmhdJtJtC9MudsJ/wwerJfU+nZTpeksQ7HZeV
         KWe60KKocXkp5k+Xoi5ZALptMcCHOcat5RRbR8ZUDno0D7BgE2NPWSkGX9fxuxmCjM8j
         bknZga9sKk31kJJZ0ZYir3EPPSf/UHyxTHPyvJWNXIDBYRdnEgj8l6locMQg3HABf6aJ
         2JRkjF2zsrkOUBO+PkvcK72ElKqHaC6oJQ5DKMeMLLcznUclmToeV0ykE+s/+QdH1RHW
         2mIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438147; x=1796042947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAlv3xeWLjPkzwFkSmSMhDw5Up084r6SQ9sON5hrIy4=;
        b=vhawVcb9IJkpQeI9n+9ZmqRsmWJHXtl9Nhu7f0tljac1LGge0GqIrqZ3YGR4q8uA7x
         atQd5ItTqtzpJHTrOFyo9yBk/FfOr78wTuBxwEYg2XckCp/P2NnyJQd5qSCxuHYfJdp/
         BL0F69CIO/9vvFakbQW1jqSvoNHK0VFngixSFCKYJLnGnB8qE8z/UHp5pXLmHukRGEq8
         XFHNGk04Mr3cP/6isyoxnIfRKJOYmBwFcV5crsj/PI91LOhjPB+zQnlX9u1/U6JtsP+C
         jxiwLdK2VZaWYTzH5ztGDhskNh2PR59NA5uy8EnTg7d4mbYvDVJQyFWwyaLATPK82Bn/
         VurQ==
X-Gm-Message-State: APuU4Z9VWqhYupJUfMbknSux9IQuJ21EbgFFZXOX6Fx2mhut8YHWDZxw
	MGEJ1uMR2qICDHhVJtpwDu44wLxbgx4maSkWLOcE4A/705WNUfZBe9pL
X-Gm-Gg: AZFdTZdfCgEOvJuawgE/dUv1r7H2M37yxNhAqTl8Y9Pt9FIilVdce9p4F/goFy1kLcV
	cEVHI4uf7qdSoomwi7YC7lux0/GnJ2I5KhLyBN1jCRr5gq4t2J8AbUnw40geO3dHvsr3f52U6mo
	avUWrr3gHcPBsdTei/HqwcpokxnQEsvv9yxU8LSqYveTMlKD+0oRrYShur1ccywV7KaMzKzQj+f
	S1rR9UvY6DoUt936XRd9IUjxr4jKciw9FSkVHhSiMmvZkxpfe3d7e4kgIlV8bxRdgz3GfdEVuJH
	xLMJCeccOT9nQuk3RJ0rxBlLaxIYH89ufd0ODCOnT0R1yC7nVQRHHl3ktTlku6qipw7uzSwmcx9
	wxXaP3REnk6MtLKsctPzz5C1B8MjjRpLnKz2Yvskop8EwbB9a/PnTwie/SHrnLfda7onFHJ5cJF
	rlCrSXjIGeEUzYvZTvH6KAy6KBk85p1UveeH1NH/7Tu26vnR08v+v6boGLnJ1ygFWIOv5B43q3b
	//25Go3XA6kQu4j+VT5BG3qhYc9p8JSV83g49mKuTyigDG0WCmUMA8ZOD9Os90c8jyim3l3MIax
	Bvf11gPVG/BIBq/gHhEjvB8/BJBWK3sO0L8rh/I=
X-Received: by 2002:a05:600c:674f:b0:4bb:7e4e:de69 with SMTP id 5b1f17b1804b1-4bb88814c37mr228817315e9.20.1795438146683;
        Mon, 23 Nov 2026 04:49:06 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm165097045e9.5.2026.11.23.04.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:06 -0800 (PST)
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
Subject: [PATCH net v2 1/5] vmxnet3: clear rx_ctx.skb after a data ring XDP verdict
Date: Mon, 23 Nov 2026 15:48:51 +0300
Message-ID: <20261123124855.1021-2-filzador@gmail.com>
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

For a completion from the rx data ring, vmxnet3_rq_rx_complete() sets
ctx->skb = rbi->skb in the sop block before running XDP on the data
ring copy. With XDP enabled, the ring 0 head buffer is
VMXNET3_RX_BUF_XDP and that union member holds a page_pool page, not
an skb. On XDP_PASS ctx->skb is replaced with the new skb, but on any
other verdict, XDP_DROP included, it keeps the page pointer.

The stale value then belongs to no frame. If the next completion is a
single descriptor with rcd->err set, vmxnet3_rx_error() passes it to
dev_kfree_skb_irq(). The ring buffer XDP path already clears ctx->skb
after a non-PASS verdict; do the same here.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reported by an automated
review of an earlier version of this series.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index f8df83f..e8be95c 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -1742,6 +1742,7 @@ skip_xdp:
 					ctx->skb = skb_xdp_pass;
 					goto sop_done;
 				}
+				ctx->skb = NULL;
 				need_flush |= act == XDP_REDIRECT;
 
 				goto rcd_done;
-- 
2.47.3

