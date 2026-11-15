Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742961;
	b=PlD0ZAIvv5v9Jz62OOkuYB1Obgc26I9jYXe4kofZBBut0iIJnDdQxcqwmgSOIlvIHxme
	 Y1dpa6PcqhtwFyzRfX9jfD2Pv9t+IiwaywSrr98i+Qw2BmPnkEG3W4UDr5cGimHL06HQx
	 T6/3OzNpe9DZqyrtbU5CWrve/PaAfUtaNycYe2Gp2nufBRtb4SDf7BteFCQ2zHE2oIOvb
	 4VUYGseZW9EtDOGZkAU+CAT7ULS9DuqbTjzwsrgNCVsb8rjZglXc1FFF4X0W51nRSA23/
	 GtSAncAhihjjhGR8ENwXZDvFaVUG9cIBJDLeH0IWEJYipjdCAyfVYFwNNekcp52by+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GAy8mI/qOiqS0+CAJuRmtxRG7FkEVXydteGLGUAp1pg=;
	b=qGkIjdLANo/WdM5gbfT8r5b6nj6KAMHA0wJbnNzuxMjm7pdPQv54YP7UDVHqmNykV6Mz
	 zweaLtYLQlgy0DZuUFTXfMVblBxTXEp9eP2pNee4YddJ27RS+4gXgnVKBh/P6VTz9+VV1
	 Zc5YX+lZlWFGzTSNJ8Vgi7DhDoviwmdQdZ2aT0WlMsTvHK/DT69xdPR1p72A+YYZy4VEu
	 JOROtHWBhkUZzVt48uGtQejOMqTBYXBxI7byEG8Hv2KrNSx34B/U7Vayew75NYAxjsIzC
	 E5w09H8mYBnOd52+4MK4viB0CzlakN+Nt8/w0EQtuxjjgRwTt/z8ow5pQQrS1jPiuZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzvNv9PX;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A8606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106A8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzvNv9PX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so550785e9.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794742959; x=1795347759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAy8mI/qOiqS0+CAJuRmtxRG7FkEVXydteGLGUAp1pg=;
        b=JzvNv9PXMogFqMX/lOS5IuyM2E4+9jhrFlNE9eLYrWuVT5O+jGKWkIO7mM63aUEZoh
         +o9hwqSk+Da4g4kN2Lw/q+F+1n3dAU03WZtOc8cMc0LhfHAN/eVbY86gKsvWorceGj1e
         7FsMR50nh4NEcWgXCrTLor1ObBHYt9R0gwA27cNGWtgn1vnli/khD5jV85gVTDp+6nUE
         a9g4cM3xHrFvlS/Q+SK+TcoeTThuyv5jhIOgs3EiCx8AVtV76Wtfk3TEej0l09ewLY8U
         lPy13WsX1YucpNvvBsKAMvFZLgRZKx3ibdLaXnS0lcRptcsjMoqU/ePOVaGCGaHIL3k4
         xlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794742959; x=1795347759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAy8mI/qOiqS0+CAJuRmtxRG7FkEVXydteGLGUAp1pg=;
        b=Yvt+eN7KwY/z8KXoZqZoxqBd7ogOFD5AVrh0GiulfWkEMRJlM8gFw/6qQt11ozQY41
         XcouZPjv8i+JjiKT32cf20MdJIIAeDLUhfyhYeOtLqxwyQso+Rr/0Slk84WXrYlBIfWZ
         7mabo1lathwSt38qhfcN1Lcr+97e+SS8EEE/A//Wl3sY3YVx1rit+kZSQ7NeSf/y0/mL
         qhhUbXxaSgGaULEnuYiDKuJ/vqSlXweRLV8tqVgVTkrgJpbpS1aEvxC9ah2yOjsYtzRe
         QZCO1ZRzvhwlIhc8R2o6wfS4McXaM4GI9VTkAkR+5gTKJidFuogszNCgGxxUIkazYKt4
         c54w==
X-Gm-Message-State: APuU4Z97moMhQJMDBXMB+LlmoB0KXBT4rSxwyS/efyNVYb8PKg1Tx/d2
	DqTP209WvE5l4IVv4AvgsDjHd0RNe2Zqh64E+ykHCuAmauQP4/Z1AXJ+3s8i+Q==
X-Gm-Gg: AYBFou3UDlz/dLfUzX2LZDSOllCwjsCc/JC5yhueXGDpBqyMJlRD5I487az1iDgOYjA
	Rty1IRzx7ux0WpSOligSit0EHV63mQUpE/fRziRrS2JefCrUebOrSFOhQNeUjat8k0ivEJD5MgC
	4aDs9RGi1BV8j83HMQmw1ror59M3d+ED+uNyB+f5zcXFoluiqwsbmPmPL99gpWthgvmEJ/LzRwT
	lf2YEwazc+4sji3onOallyP/ygT3brIvLwV6dL7331qK2B5Z4+Qqo+GzwJSiXoYEB9teOuDf0Vk
	/UtRu+cqdOze0wMc5h2wPhGgF09PG4dUJainwv3hDdomOxdGiywAZYKwpOPh7RuUbSLVtIVcsG1
	SlgykqQdzMTcK5I1F2y+u2ou6dFAgd5rOFHQ0YBHAhKlEoHHE8K81V3uwmwxkGTeAOxnE11vIwT
	f+78vimHOmGysOCWnkS54L9vhak13Z56jkz9wffD46hyNCcUfGpF8ni2UkK8O52I+aKrxQbU4xs
	B6YNtcMx1kHXgXXI3QmrPCwnAaE6rO8cVig1Txk4Jl/4rYzP5/IwvwlgKgLS69YflgiKKl6rW9Q
	HMzY1Ts3cv16YRZGkmifFBrOSjS9W0wII0YZZRTy2jqEaQ==
X-Received: by 2002:a05:600c:548b:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4bb55ab07c6mr162264925e9.35.1794742959013;
        Sun, 15 Nov 2026 03:42:39 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:474b:1700:da41:1869:5f63:edb1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm188277905e9.4.2026.11.15.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:42:38 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: netdev@vger.kernel.org
Cc: akiyano@amazon.com,
	darinzon@amazon.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	evostrov@amazon.com
Subject: [PATCH net v2 RESEND] net: ena: avoid double-counting TX DMA mappings on failure
Date: Sun, 15 Nov 2026 13:42:34 +0200
Message-ID: <20261115114233.2307630-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ena_tx_map_skb() increments tx_info->num_of_bufs after each successful
DMA mapping. If a later fragment mapping fails, the error path adds the
fragment index to this count before calling ena_unmap_tx_buff(). This
can cause DMA unmapping of buffers that were never mapped and
out-of-bounds access to the buffer array.

Remove the extra increment so that cleanup uses only the number of
successfully mapped buffers.

Discovered by comparing the in-tree ENA driver with Amazon's standalone
ENA driver.

Compiled with W=1 under x86_64 defconfig and allmodconfig configurations.
Fixes: 38005ca816a7 ("net: ena: add functions for handling Low Latency Queues in ena_netdev")
Signed-off-by: Evgeny Ostrovsky <evostrov@amazon.com>
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/net/ethernet/amazon/ena/ena_netdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index 7eb6456ed0d5..e0df628e1df6 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -2608,7 +2608,6 @@ static int ena_tx_map_skb(struct ena_ring *tx_ring,
 
 	tx_info->skb = NULL;
 
-	tx_info->num_of_bufs += i;
 	ena_unmap_tx_buff(tx_ring, tx_info);
 
 	return -EINVAL;
-- 
2.43.0

