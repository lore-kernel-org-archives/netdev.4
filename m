Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906396;
	b=U/EchDHgNQWFc6w4MVITWKhfOHw/R1HtxVGDzWoUPf91YpdW7H5dAg/cw6OGLBiYynFy
	 BS0Rm123FzUmjeHoND/Ckig6ad2I4Fdk5zjiDv8cYMaiy55wEEmlrvpatA/Vdv9gcXHqF
	 P+qFpYK3IeENDeq44bkJWfPsT8oqjNYcIpT4+h/oMiOeeRNbS65HT5+Dh6v0UyL0TwDv8
	 B4tYEXhihMI+tTh91oF7IPe3cAYNJV5U2Ro+04RhAxZGOELQp42rizuAVAG2Tl1ntVdhK
	 FZGBKKmGK/YptlH9WiJjRYfyvacGuXYzVfhStFKMn1GIZ/hv98L1EufDXD7YMeilTtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gLQ5AUW4d2+qMZuC/oCY4fCyjAhl4GpJFl1CEuDTSqc=;
	b=ZZ+x+V0xsbOycG65u2H6kqr8LXZ9TpGX9+/LQ2k9Ty5exk66K8YuLgpvZ57RlQ0OmpVz
	 wOIqxW5w7x2fqNkc98q+E47CDn3rUEfv26jIftKcqF4Ri6efv+iIXBGSA3qmsoQr3ql/i
	 9RgQbFFSoCLoh8O26vpMgiiTBZcCfHKqUWJjZenh5fd7AYgj4j6gUiyJp4a2zvfNt0Itx
	 C0MeX4+/n5yIm/sWrsIIuQm+bOP8O7jE5BEnKG+to59vmUn5nYZbLCBtrNCvN6nQFvQg0
	 wI59EFkU37SCf0W/j+5MAXHR/MHqXcfog+mEGkEIBiNwJ25wLqlZjmIFuFK1LE06X8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpou3kHx;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0BE606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0BE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpou3kHx
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1479be604so418343e87.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906395; x=1795511195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gLQ5AUW4d2+qMZuC/oCY4fCyjAhl4GpJFl1CEuDTSqc=;
        b=gpou3kHx8sl52PrRVh6G70qelRKOciw83vO6keQtXSY5YGcWyqkFlKdM+X8YRaNlrm
         isYb64ZeexlQHKMakQUOPrJnHI+3tF1i72m2GgFscgrddcHh1HmmAZyX3569K5hMqKjs
         b/SMuvXMNvON3YVUoVjHzI9kp1ZeCCRQeYJU4vT3F7msiWgcV4+Z4SOkM0HlpDkOxdUA
         fyLljN5cFdMoZajNazuoBDzMTR17q0dIgpe71YYsLCejd+JzPLX5NLO5YAx7xjfCDM2c
         bW8KUqBe3UAoQqwy9k+jfZ2vNeWnZoH9J/6YBfRWuzs6eqaNVo5FPAt6YyS5s3kcMu3X
         zvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906395; x=1795511195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLQ5AUW4d2+qMZuC/oCY4fCyjAhl4GpJFl1CEuDTSqc=;
        b=nX08LXF5vvqaQjYT6KfCrjinbMCWrVyE28uSAnUnq7zjxt3Cy47aXmAbSqI91U5GJo
         4F9/0pSYrewIGk6pyJQzDVf07E9A9a6ipJkOeCryUyWuWIrKb5fEEf79oVFWye1qHWh+
         dfLry6hVWDKhP0xk55L90wOlfNKQPf217jBfuL7tEbNLNmfKkJDt6YnZPd0NsmEnhSm3
         GuoNHTTbudE/Lh7AfF0SR7oUD3Rkm16PmIPIvPwyo9okm9ncX/UO2csPR23wRLj65WnM
         6WQNqCLgi8zEMlS3LEGtleWSI0eCIQcu1PiZq2zvk0a8Vg6xB5Zpjp1m5jWsg2M6EBrp
         9HPw==
X-Gm-Message-State: APuU4Z/uW603WK6jVISCn92AhHEPn7xq0yiDfHUlN/WRjWLmGklnd88b
	082eAX23s4YjA/KBYf5ot4R6ILk72fTc4/92ikB/VlkGn80EzbuRTOWuTthRRt0T
X-Gm-Gg: AYBFou2Q+PEaUezSoDMcULwN0vxl6XNGNNxj0ofId3CEzT1ea5i6LrVf4z4Oq751TYv
	uLkk1feRHqc0GnWyvCURpqZu+UrN2lnzrZMEVSIibPl0j/Q7lo9UbqFXvzqEgd8M4v3fgvhUcNs
	N1f581MTcjObqcquLBPcwWxkwZ/6amiHQUbmgmbHl6CXWedEJ4nmI6J4USsHDMINVkyLnBnoflc
	31m3hmBjxg7TR1klqJo4P8peBZiwxbqZcgD6m4I5dlK5SUmHgEKk99ON4szbLzge5COEjFl5pQy
	ivvkmxlr2dIU8+DaZlivNPswbcwnPAEJWazETNd8i2NuSlWaDA/2wEuYQQ7YvYmVCbUbCjjzp1+
	mefPZxGGJz7/IgZUD8uQPDOb8tjSQ9OhicFejA1MlvEhFSUkaudeicJ+FktNbBJSkW6OPBnfR6p
	UjkZJFtG+VjhbqMeqsVCvfZvv/KJKQIyjxaC5UVDJy+UFNWFkhFE3CJAeuTZA5ict14KUcknuRI
	11Yb6AjZPUB68bVudzk+ISKtEour8Gnl9ou1cnklCoXd8C7YN7R7ZTDoqPOc33MB0miCO8SbzaA
	+v8oF3RxB6IwSFzn7Y/rYuB6JAD7+g/XfZyGzuafs9H5sd1SHySLIXU0j8EpZ0YmUKEfrBdpfoQ
	xCoj+mNdCGUba3fon/h0nzCKeMhKPmjL0QD/OEBtUiCrRjFDZXw3WqX3hZPY=
X-Received: by 2002:a05:6512:31c9:b0:5c0:d102:8374 with SMTP id 2adb3069b0e04-5c1707804d6mr5128839e87.17.1794906394286;
        Tue, 17 Nov 2026 01:06:34 -0800 (PST)
Received: from qblck ([188.130.155.185])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713509f0sm3805043e87.63.2026.11.17.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:33 -0800 (PST)
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
To: netdev@vger.kernel.org
Cc: bharat@chelsio.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] cxgb4: allocate the full ethtool filter location array
Date: Tue, 17 Nov 2026 12:06:08 +0300
Message-ID: <20261117090608.33178-1-ralerrdirsardx@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The ethtool filter location array stores nentries u32 values, but
cxgb4_init_ethtool_filters() passes nentries to kvzalloc() as a byte
count. The insertion and lookup paths allow indices below nentries,
which can address memory beyond the requested allocation.

Allocate nentries elements with kvcalloc() and the element size.
The array remains compatible with the existing kvfree() calls.

The size mismatch was found by reviewing the allocation, the array
declaration and the indexed accesses in the filter handlers.

Fixes: d915c299f1da ("cxgb4: add skeleton for ethtool n-tuple filters")
Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
---
Compile-tested cxgb4_ethtool.o with GCC 14.2 on x86-64 net/main
aa40afa831eb using W=1 and KCFLAGS=-Wno-error=format-truncation.
Both baseline and patched builds reported the same get_drvinfo()
format-truncation warning. Hardware validation is pending.

 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
index 0092bc16f887..c72c0bcd45c8 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
@@ -2269,7 +2269,9 @@ int cxgb4_init_ethtool_filters(struct adapter *adap)
 	eth_filter->nentries = nentries;
 
 	for (i = 0; i < adap->params.nports; i++) {
-		eth_filter->port[i].loc_array = kvzalloc(nentries, GFP_KERNEL);
+		eth_filter->port[i].loc_array =
+			kvcalloc(nentries, sizeof(*eth_filter->port[i].loc_array),
+				 GFP_KERNEL);
 		if (!eth_filter->port[i].loc_array) {
 			ret = -ENOMEM;
 			goto free_eth_finfo;
