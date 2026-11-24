Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556684;
	b=ydY3PaIExKFzXFkpPpxIyZB8Cp5aulmX+6mTTka43rrM1J3X5Q4C3W2Nwyt0YX/hq5/1
	 1yV9SGDopzkphkdjUZfViuxT9zyKV5lLHyTZJVJDj2XLQeOM8/hPhb49Cdl7c8TJXcWvL
	 9abXxeGmvNijRJIGI2ig0xC1LGi0Vwz+AP7H00WyuEB2Hfmq4Y6MIjvUDcm0IVVWR/NCg
	 QTviq4bnE6uXsz6435YYVNL+F93s6dpT6kQiNSr37/1UXl6raaXY94ch6X/wWGzjcqc5+
	 Ux4MS6cN6KbTdBgaU88wKebxpbf8akZGqvPHN0tE9qcCyNcIYz9xxIew15/NKXQENPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Subject:From:To:Cc:
	 Date:Message-ID:In-Reply-To:References:User-Agent:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0rl9mk41eZHabud+t7f7ey5wjCo2o/SBElez5trg9Wk=;
	b=CCaUvHkp92s0PZCvmaB5Zss4aroYr5qnZM3e4AyVH+CLm1LempNgSiET1VAHvJb5RUyg
	 FYEjydtW7oxJbM7GmOqcQ9pbX1wofwxXJS22Vd4a3g4ZrFb9HR656KxkygRP4s4eenHd3
	 qsmnQ08Gqd82K+VD/SWgPyplPzgiUYnKWPh0NXba4K6oboraWrxowwquB81WTgUDaDcds
	 vEhtYHcXm8n9kSFfddJu1NuLs0qPyCXX5zQrNhol1lIi4InkLJ602Yb2eFcp8J6RotnY8
	 jNYnz2d/hVocaW7Faq9UGHeHeMGS5XZ7oxeC93tV1s3T/f+cIYni6Ms8lf2NQMomN3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y7al8s9n;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE4606A33B
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CE4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y7al8s9n
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so1685350b3a.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556683; x=1796161483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0rl9mk41eZHabud+t7f7ey5wjCo2o/SBElez5trg9Wk=;
        b=Y7al8s9n+CKP0okx82ZpIQ5cLUZXP8OtDhiYNptx21myJWzMJmK9Wez/CDTpJVvwgy
         2zzusBigpomIJdT1vz+bKF2PCN1cFcZkJufR2N03tBkPP90eZimvzEv+zPjRBzPFXJYt
         a0xOnanleryiZCAhT8edC5yzaAunCQqDUS2BgMeBxRdnan3St0VVGUCRaVN7B/AhYLhV
         K6IZoSOBAP5r029eVbAla4F+2G+e21pLNZgM2G7PgGTxzaunW/VvOnH2q48ww0SVRbJx
         NphfMlFD9ozljrqK+30CxHfsZag+e+l6VWNeG5VRH5DllHj3J95xOTu8cj+fD5QWibEp
         DXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556683; x=1796161483;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rl9mk41eZHabud+t7f7ey5wjCo2o/SBElez5trg9Wk=;
        b=vBjuE+zNtuNhzm/qjmowMdOowwJhN48RXnOOOTTKlGO1wRdpImvSl+jKVtNrH+6e3P
         WYt1VWEtKnVFjsC0oqrp1E4ckGAPVjD+w1SV9Sef/6Fcz6hkmbDqopJ6ngRA1BSn9emM
         RPwFlNhGiuKPxMUMw1x9OK8EXC8JLBz48CbneaHMdqfyWCzfCLI70+gVlfIbMrpruHb4
         iT2ZJqA3kLvgXV+xTaRoJnYrh/OO0C7gjV6Qq7Nct8r8Ut8omeD+InEEdesW8fre03F5
         D1OgS3BwzKkb7HGiDNdHhPWpLsmyWJBxH5j5XSoq4dI5QnKRAvBeTnF7kHysxwdvK+HF
         jUYg==
X-Gm-Message-State: APuU4Z/Of/u8q/hHWAdTL/ONfRvaG7WDJr/+cDt0euaSBoL4eGa13Ctp
	ZvaoyB+AhK8Aih0/HjT/cNtqYaOphI+7N4rlMljj2MiA/EILsFFygriVn0axXQ==
X-Gm-Gg: AZFdTZcZpKIaPhaYvSttOR8AS5Tix5SbH0cwR7M7uxLoEfYa4EJoHZFPStGhO45xxyj
	sglQlblZEq5j4VjzUtYDSsZfnluc6PianxPcnmRhkrkumf3FA1M6e+YUcHzlzUNxankqUEnPYGG
	Sj1DIR4pPyiRxFWooGiQm0lDukc1W6BNHxsYljIoG5M9CjnQEnp5YM0SVr3x7trCiQj5GOdA3n5
	Z/rdKY+IaO/nrviYNa55fSYhC5xYQFVGJH/M1eO58jM5e2uwHec3c4hlqOGpmQAERo83sLp5hRt
	LDckg5zgS2Rq2BoYczWxuJQM5hiiBaZYMwxpDqqKQfHAk4NlgborfZ/aW4jzh7qUyRyVpPYDP2J
	AjtE7cR9dGozMbh4wA5tY24RVCC5FPUa4xj3xze7FHWdtKQAAYulS6u1Eo9N2X54fDlH04j1w43
	kASCcEzzLGZByDha29rlLrejQzKM3yHYaTTjT94fAP4H/3JfmXr4TLR9wpnHAhJoCdAtaGYDTHw
	lxBjAYxVkqrclWY+g9q+yzGqafBefoXxupBy88m6/kDO3DmCRVmC3ojn0LitBhnS3GQ+Rl8N0Ma
	CUgtvwFTR5Lx6suL1UbvRgIBq2FSfoskLQ0/IvzkPQ1+g0TQA1idglcjcfbhC8NY65OYcHw9Y1K
	PThY5E2NxXv6UfiPHND2cVDtirDmVVUEs1SB05+cvjrjXYw==
X-Received: by 2002:a05:6a00:a112:b0:874:705d:f659 with SMTP id d2e1a72fcca58-8c87cc43fe3mr14094178b3a.39.1795556683030;
        Tue, 24 Nov 2026 13:44:43 -0800 (PST)
Received: from ahduyck-xeon-server.home.arpa ([2605:59c1:38c:400:22f5:2de:b9c3:f27c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm8013888b3a.4.2026.11.24.13.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:44:42 -0800 (PST)
Subject: [net PATCH 3/3] fbnic: Only create a FW coredump when the user asks
 for one
From: Alexander Duyck <alexander.duyck@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 13:44:41 -0800
Message-ID: 
 <179555668160.7867.3912507721876362358.stgit@ahduyck-xeon-server.home.arpa>
In-Reply-To: 
 <179555657536.7867.497419917946087787.stgit@ahduyck-xeon-server.home.arpa>
References: 
 <179555657536.7867.497419917946087787.stgit@ahduyck-xeon-server.home.arpa>
User-Agent: StGit/1.5
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Alexander Duyck <alexanderduyck@fb.com>

When a fault is reported to the FW health reporter, devlink takes a dump
and the dump callback requests the FW coredump with the create flag set.
If the FW has no stored coredump, it creates one from its current state
and writes it to flash. A missed heartbeat on a healthy FW, for example
while the host is stalled, then produces a coredump that looks like a
crash.

devlink passes the report context to the dump callback for a reported
fault and NULL for a dump the user requests. Only set the create flag
when the context is NULL, so an automatic dump returns the stored
coredump or fails if there is none.

Fixes: 005a54722e9d ("eth: fbnic: add FW health reporter")
Signed-off-by: Alexander Duyck <alexanderduyck@fb.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_devlink.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c b/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c
index 0b653c4c20a7..1f7e6e78ac92 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c
@@ -385,7 +385,8 @@ static int fbnic_fw_reporter_dump(struct devlink_health_reporter *reporter,
 	if (!fw_cmpl)
 		return -ENOMEM;
 
-	err = fbnic_fw_xmit_coredump_info_msg(fbd, fw_cmpl, true);
+	/* Only create a new coredump when the user asks for one */
+	err = fbnic_fw_xmit_coredump_info_msg(fbd, fw_cmpl, !priv_ctx);
 	if (err) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Failed to transmit core dump info msg");


