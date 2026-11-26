Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711334;
	b=hI3VKlNmhMVblMH2d/fjbHcKSclXNtdNRK1daXQ9hXKzxXqybigII0GbpFK4I7ZgZeug
	 q5BhajSTusL2Fem7ozrDG0zz50bHr1WdWOsQDbhtHWc9f1rnBMowscrV394zmDvXQ6hX7
	 eO6Iic6ZYXR9pWozot0ZnUsS4iTMTzZHAhjevaqHPgYA04Wj0dzkCSQUgS2rpc+7bxEPB
	 w1Z6M5Q+OElvF5RaMEU+8wAqidvuwxpatfKBrG2MLQFpawJjx1rbpo/s8+USBj0gien6L
	 omcWFvb1WAe/YqHeh85SqQuYbKmoja4UMW0+cFVhfjujrN+ghzTN3bCau8PjUAuELeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tXzlqriDCchISdhq2S4x7+9hMGbGzDajZ595wmRIilo=;
	b=Dj1Hjd13hur4GKilWRVuyRG8A2BAOOmlgZ6c6kiByvQXHD3PYEtT3mBWgRfLgY21V/xd
	 EjpQcg58kumuWC/5DNwtVp6WzRgEVCv3bk+89amIKasPT6phdNEHQag23u6Ei5nW5JTrL
	 ouuZ2PF27jeDDx/gYfMz0CMnD8x2Zr1li/xSQ31krBbgtJyXt8B4jewiRcOGL/37lU2EP
	 XfSV3oHkfCl+XHvwE6Rnsn9zEebYTltLEVtq+VhrHBc3s9cTDIGIU4l+FHQK2QyRtamg4
	 t16bVhBPl/OhvO3aW5IgoZNphoL7pfcVFl1N3lB+40U+p17VejXpkps/2TIoXvQMjoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A0c7Uths;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9671606A691
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9671606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A0c7Uths
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so10752085eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711333; x=1796316133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXzlqriDCchISdhq2S4x7+9hMGbGzDajZ595wmRIilo=;
        b=A0c7UthsOC0y/rSaEOriAcQVtilu/udmayAq32HbAEviVBvxR+C4kBogoyExh3LyPw
         OND69ody1GWoMla+Q2cAXKemA/dRJOP6wucsz5VGwlz3UNlgBOqcgWxWQelGyPma/T1/
         MOqYdFIkqjUOYlhmr0c7Q+gY43V+i+SEqm3xPiKY1qftt2Fa2Hrnq7RxW3lGCdL/xSmz
         SbbauCLQr087jfUqM58s9VEsxqkfm2yJJvHc0K+YLWqIHo9X806kGEhxAjycVH5bZZpQ
         ysoFteqjAY3ei0lX/ilwdSyUwIMQHYgJ2TNJElTAQIuIdDimakxtsS5EMVCzT1xsz6tH
         uRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711333; x=1796316133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXzlqriDCchISdhq2S4x7+9hMGbGzDajZ595wmRIilo=;
        b=XXhbotFWdLyc7RMxK45i34A1xAPPcZV/D0x6bMTURsLS8cRr1Comed1ThKVQRZqOlj
         wmgfzSYjcn3M1l7FR9F0ynIJNBkdlCrFpoojOqV3cM8L/gdphUoCNn/XWJ4UJiC+7HD1
         hQUHZICF5/nlFTsBGVfavUzwo2vci8/nSZHte0NBwue/02jKLFG9oZSWyUOlvUMQ+0k7
         zc2mfcULfNfcczmSw3QQj7X5wGX/nkxS4p+SprBoPjGs1X4LKrIhOgig69dPcBD3wBNf
         sbwJpVg6E3ldxgaijDqltoYrUA5mF/6JnuU0916uJREEm/nGBvjsUF/tZ/COfvj9nyhN
         RMjQ==
X-Gm-Message-State: APuU4Z9Jmkl7yZG92/wJIbjkRUQ01FvkKrUtkG5FP68tROJSZzZH7KLL
	wUEwMgLks8SgV7pzUdRr32909OaP/+tycrcvlygDbtlAR6U9wEw8j/nhG3k/hp2e
X-Gm-Gg: AZFdTZe9sOqtF2IZ4psKbnBpZ63LhKsRf+c302WBCjKpoWMKXA9YK3WmKghwd6KpTUg
	bS3HhDMGJM/QOR/yy4OG8ClQSVIWDzdBrJHlBe6mSH2RWAoOFz3zvRDgIsc1buG6xdUq70M3EgF
	gY8TXZ6sGdzEdkJCo8+EmLVSMjKa+Kohh/LygVpsQEFpTvQ8ZAjqQUsX9r6CloATk4oAns8zJtR
	C/1O6RtcqO/NVYY2UkerDBotc+ZwtpQUBq7D0e1vPeSUmnqCb+FvnTb+djAVB/MLcjU8LY7arbd
	OGvnABWNG6DarujoGZ61ABPEVVOqV+VUfSivKKbkHlhvTnYn94hafZdICN0YK1Gm0yKGXw1zTiC
	UXZF20PWRfogUcUC2LdadTLVWdnjD8UvV2M7U/8XolhzGTMOxseqRuDF9/Q+b0M36LytrZFPmgk
	k0ePV1xoS272qX29I1GyBFzfxl3iqdMQTYFZZHS7hUAPmIfHllaIWzzvcEf5mP0cVDq85YV/dZQ
	zWlTUz1ml6C27rgM10ruVFCXteu4wK0sRQU92uiBMBzrL0mER46jGC43jyWe/QWEQ8H/hxEGPEB
	c6Q55dHLz8OtcJz0TOgqnc51kIXuvEMmXbIWFqCkLzkwXR4KKcGZxF3W5IyEJmOfs6zkSHVkQGv
	/uiE6CuqAuQjkbrWZVTv7+gPROQPPriK7AQ37RsScVJ6RdZoZYQig/oLKhLgwgqzfT5TJJobgaV
	tsLWei3x4Yy2O+11pPdw==
X-Received: by 2002:a05:693c:414d:20b0:386:9f89:aa80 with SMTP id 5a478bee46e88-3869f89aee3mr17238179eec.0.1795711332806;
        Thu, 26 Nov 2026 08:42:12 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:12 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 1/8] net: dsa: sja1105: keep pin function on EXTTS disable
Date: Thu, 26 Nov 2026 08:42:02 -0800
Message-ID: <20261126-timecard-driver-v6-1-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

Disabling EXTTS currently selects PTP_PF_EXTTS, changing the shared PTP_CLK pin from periodic output to timestamp input. Only select the EXTTS function while enabling capture; disable continues to clear the state and synchronously stop the timer.

A coding assistant helped analyze the teardown side effect, develop the correction and source-derived regression test, and prepare this changelog. The test exercises the actual function with configuration writes stubbed.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index 350f958dcb2a..da35805152e0 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -816,9 +816,11 @@ static int sja1105_extts_enable(struct sja1105_private *priv,
 	    (extts->flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
 		return -EOPNOTSUPP;
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
-	if (rc)
-		return rc;
+	if (on) {
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
+		if (rc)
+			return rc;
+	}
 
 	priv->ptp_data.extts_enabled = on;
 
-- 
2.54.0 (Apple Git-157)

