Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138207;
	b=Q2kY9MA+xZJpmOmNOtSKkgZZ5CkY0C1CS10vvN5w80Yy2Z4Jtp4liSP7QlIGHtVEbHXG
	 02GmNBDBg7cJJWN9VCGyCJra62ND5UMoxEzSq40ShN8tIimPeNo3wanWhaVwtRiiYEf5P
	 MuL/MPKZ1p0zqwzAINWl0atwluRLBAzdI2rhPvpRPo8S7L/r8BJg4RBZuakN8L9mniufE
	 I89RQ6K9KNupTPLFtoQZ3K5MSTfjlArAcEAdnMQ42QGpKILo8UHWg7D/9kE70YuVPI4Sx
	 nDjecZLh2ptUiRMnw4mKbfqBA/pdtEwi0VCS7Qra2T1u7yqWBPmPiSw4v5JCYsbdX3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138207;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=euy6zwzEItDbotu812dUlYznDcxDvkH/6H2goSWxWFI=;
	b=K0g0FoNGZaSE+C1rMq+bU8bUe5ipZQFLf/DJ3iqqWYmuSld+gQE+ZnAanIjA1BJp+2xj
	 WN32qMdXtEXYYrausGQ/kuqTit6kkCpI4g3AtNhTjEeBV1JX+XwKvRyHnJ6zgLRr5WMRG
	 bef40Ba/x2DEY01u7CHJXvTZgUco6h4+Oq14t/bUWb4Et0cAnBTwnjwSbePHjs6KM5jJz
	 MxmSvpOl9hF1Z2z109qc2r84x8GKpGnUAoh5HqDqUpbpW9Ok5SQfDlJiV31hiMPaWUduc
	 QpLqnrIWaUX60fMQ8b52qoNaUkFDS2VPq+8/3fV9+wAjlRlIaBkR50tPCDQ+GgX2YWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ITa4JVKT;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB706606A33E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB706606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ITa4JVKT
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cde1479f76fso268256a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138206; x=1795743006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euy6zwzEItDbotu812dUlYznDcxDvkH/6H2goSWxWFI=;
        b=rGDvDkMOoid5at5CdRnsjGum+Q/uvOSk5uOfYGwd4TYXJjPCCgiRe74OU/77WpoWaX
         2NU1+uo52oCPaVWqaAyyJAZMcNYXi8LTW638umzmi9/CuQZ+Fd0sM6rEYQw72BfHyss+
         8yaXL7Td+cJtE6xWA7F8ROOYSKM2wF/bxGUUZDkx7UNhclJmRFnnO+Sx6ferUklSsTMI
         oV2mlkmt6iy2kiZak8+0OT1Ue+eLqzNOdjxM//nizBIlVqaRWT22xaIDJHg89r+fjtoG
         njzThmeO8dIgy2KQRgPcn/a/GtOZl0VzqffHYjuAFJ72T+aT8jC/tV19XVcFHCshQWnV
         +3aw==
X-Gm-Message-State: APuU4Z9hU/tAreqdF7Fc201sNe9kTUFT+vpdqAdIr6HGU9FE2Rl5cQmw
	3xE7WDWZ3yFMGe32tUHvKDnTOweqh1pr3Xg0EBqbznzNUwOq+8JOefqSZQAxkdwMYbivbm+1YjX
	7k4Qk6HvVZoVexTejASd5ExKd8wzXQZdnH+6Fufu1XjT+8DPtr1v0GoDYcDoTIkIMopBzwzZb3C
	dxP3x5Ax6e6GQqtGAKD1Wvp6e8/Yo135LFbHw/HBiC7zW6pC9ZB424UZ6Bampss9ACgHx313q65
	NQoNRprShE=
X-Gm-Gg: AZFdTZdZOUfrRkzvsOYq69phNRE+cC+7BvAYcuukKGbnwigSCFTJy/411CwE7mPW7o5
	pIFaQuBEjOLX/qsmndJ6SgYWOJORom9AFIk6JjkAB+PkgoD5xbfgDG7NygM77MtzsouhkHklVbm
	EJw8t6Xe9GU0LPV1lFpa3S34A+rlWO6hDYsD0353Rrd/lmbe4ESpk2+UckimrEvQwM9pZNlNHLk
	9Mf2SYrdPXBKIewyIykIUq94nXWXOb0ep1ZNmrWlyYIcNtgOZ7yXsc4QpIzSwDdtsurGsuIF9ky
	C6IN7Z3N4/musFU7MI0pDCWnY/NaYoa2RSyHdS42CsHYKweOrA58705itanX3/RIvu7gBJ4YkGi
	l9B+4fFHvB7csHc3ZD7Pwoj0uk4Xr/tPMOUdebwHcD6zuUAfnxqTaH6wIT8b0c/YHkkLDj14Xja
	YPhaXO8VBw8A02YGjas2ThSrSwumlrYok2XN4sXQ==
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr1178753a91.50.1795138205608;
        Thu, 19 Nov 2026 17:30:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm2080051a91.4.2026.11.19.17.30.04
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92109408212so9367536d6.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138204; x=1795743004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euy6zwzEItDbotu812dUlYznDcxDvkH/6H2goSWxWFI=;
        b=ITa4JVKTPQ0rOgE+Fd1eW1bMeOlMuhQdBHz9ao2cy+OHL9L4LB5vogUsPo7FcjWXJ5
         izm8Y9DJfJkQMpKjSrja16nTYpMtTGxamZkOzmccIgxe440LQdCBLXTC9QIjiEH50mm4
         4KjuHGuz/HdMMhDVp/W9wHQ1O2SXn1O0BIr/c=
X-Received: by 2002:a05:6214:6286:10b0:921:320c:bdec with SMTP id 6a1803df08f44-92134adae84mr20251236d6.23.1795138204198;
        Thu, 19 Nov 2026 17:30:04 -0800 (PST)
X-Received: by 2002:a05:6214:6286:10b0:921:320c:bdec with SMTP id 6a1803df08f44-92134adae84mr20251026d6.23.1795138203785;
        Thu, 19 Nov 2026 17:30:03 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:03 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com
Subject: [PATCH net-next v5 2/9] bnxt_en: Fix bnxt_reinit_features() when irq_re_init is true
Date: Thu, 19 Nov 2026 17:29:14 -0800
Message-ID: <20261120012921.2537903-3-michael.chan@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120012921.2537903-1-michael.chan@broadcom.com>
References: <20261120012921.2537903-1-michael.chan@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

bnxt_set_features() takes a snapshot of bp->flags, closes the device,
and then blindly restores the entire bp->flags.  bp->flags contains
statistics flags that may be cleared and the memory freed when
irq_re_init is true.  Do not restore these statistics flags until
bnxt_open_nic() reallocates the memory.  bnxt_open_nic() can
potentially fail to allocate the stats memory and the restored flags
can potentially cause NULL dereference of the stats memory.

Fixes: 93e90104bd12 ("bnxt_en: Create and setup the additional VNIC for adding ntuple filters")
Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 0808911186c5..95a2227e45cc 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14130,7 +14130,8 @@ static int bnxt_reinit_features(struct bnxt *bp, bool irq_re_init,
 				bool link_re_init, u32 flags, bool update_tpa)
 {
 	bnxt_close_nic(bp, irq_re_init, link_re_init);
-	bp->flags = flags;
+	bp->flags = (bp->flags & ~BNXT_FLAG_ALL_CONFIG_FEATS) |
+		    (flags & BNXT_FLAG_ALL_CONFIG_FEATS);
 	if (update_tpa)
 		bnxt_set_ring_params(bp);
 	return bnxt_open_nic(bp, irq_re_init, link_re_init);
-- 
2.51.0

