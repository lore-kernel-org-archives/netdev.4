Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209702;
	b=0gtUFGAuDgm7TyC2PWm/keGeNILJbeMFvI4L2iwYxbLBDtw0YgSdhziKA5+Fsz/2m3H2
	 9fSlyGB9wJXYoIrWYpVC+ev7XxLX+/7BWrhK+6XlL0D2U5sY0CueCeWkTf+WhV/Jlp2T9
	 O7NiQQbg28lHOdsUf4IOixDHUAWJumDzD9Zjqi07TJx8Ba20h/5VvQW2PJA4nksPuGYsJ
	 tytvmNCsLyscbJenMRwS1/u6yvoaPnLfszBvTpjUa4Gcl97l9kYuKNZgZVX8afuAxa8Ox
	 VBRTjqxf0P8NGtHTg/xOazZBtjbsSocWNSGEZMq0onKLYdlGzLKlphX65thQOv4Ay8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ANGf/snzpA9m25XhNa5xfyC3AlfFLOgd7mgTNmp2jQE=;
	b=ORdapLFxe/abQIbfaQg0VWGRirXOBKEpDEkyF5JZU+JT+TFSzesdda1bxI5rt8COY2ra
	 +15ZZg9ZRbmPVyUv1cO1xoVIc1x+YlyAiI5BIjZQrXk3Ro3Oq9qSNEtouArnsQJUVk+W1
	 GdCWZzWemRokqze2MG0jqF5kNoY5ohVFQir4ieH4NTfAWVqXmycDf1R48h/oBthgqxaqf
	 E/nwpW5Q8X9GoQWP7bLGNHIBreggaZBcd1DmHTx55xXKzhASXNOL7Aahlkq2VVKtzH+/o
	 oraCjQ1TEn0rzYuE0Jv6ZdyBj/iMn5jLpKR9JAnkU6FKWutthE2rOVzy1D+oww/jtnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKnI16q9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48414606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48414606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XKnI16q9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3863db981d4so1250909eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209697; x=1795814497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANGf/snzpA9m25XhNa5xfyC3AlfFLOgd7mgTNmp2jQE=;
        b=XKnI16q9nyCLqF6cgO0nDhpFH8rO8PqDaDeZ5gjjyHyQp5DH4NtelxOHtQOCEGt4h0
         eCWt/ysKjBvhMWhT3NPSAImyg7nL5c+/F1XmCpvat8cNvgu49efo1vJY8w5o8kVAVo5y
         NYnXTdXtvlsNiRb/GBqsqb8msmhJ4p81AnQC0p/3LClp46haCQEG+CVjb+0nwUzY9W+Q
         mk8jrRIoTvv2yiy/Ce/Awsd3yIMNnG5lE7tk8p7yLg0IJGMrXtRdvZDZdWFO7IwUUx5t
         HB2PbUBBL1S7txpBZdFYkri/NlmKC8h8IB4CNWJzkj0Wt3XKnlEwQuxdIsZGAIggRvHO
         bY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209697; x=1795814497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANGf/snzpA9m25XhNa5xfyC3AlfFLOgd7mgTNmp2jQE=;
        b=b76XDcUSwZT+tAARpKl4Gf3lqoF0ATzOnpbSahxUbO93K2qMPjFptINqGR8UCUmk4V
         D7zABNol/kojbSUbWSJ150+vkFq0Mh8BJI/tzaGO22vjFbGNBS9+NlxMzbgW99lLi8BP
         Q1pLJRzu09vtmL7FM5fQ5EOtWntVxWpnkB1K9TeEvP2/3tWh2Os1gm0A99VLchwZtMyY
         ia6W9SJ0vEfBn0t7ovkTAnmJH01orf5JqEiAQDYuSDpw+b9c/WiegiR9lvEljVDuvjGO
         o3zGU5EPJeUpU4JsqadXj58K3tecXECzGzQud08crI/RLRsxeu+XdN6hcL9sFkrp9ekK
         TvzA==
X-Gm-Message-State: APuU4Z+SU5ExWnsdbIvUa2O07+O/o413BbD1QRIOWEikh1SpyGWiT8PT
	GCiq+Xpk8CDci2Pal7bEz55z+xzU/6LfEpFa2hgs6M5bDdgnFABdXXWNtqx4OvuK
X-Gm-Gg: AZFdTZdo7TEaQ0svtKKuVkXlBoecv05YIrI010VVkO/8EW3BokZvnQi9c3t4ddxDzvk
	inWrsx3k10Na89ffrRodiXkQWv8GUpNKtCz7efLhwHLwCvAeIiELsFV+rslc5Tla3z6I3KgDEqC
	p3xKFW9rPzYiOiKJCUAcsHsi5aq5Id8ydgezrOymadEPVt9IV0aQAus1lw5BkaU0A4NSKWWbnyt
	X5g/0qN12YTDQ9nXAPL5jScgI7i3V3TYeqW2mNKg8kWpMry21zyKDnfKKFxlRf4ABtJA86ipzEe
	e6wujxSB78ffdNmtKD8nj+JoiYVGnKJtlstRQbtDC/WLLEujltWD7ExE5J66XLPavUIiHtPUFVC
	NkICt4RembO82uhJjZalPcgAYWq9jAihcsaHAf9cz4OY5Uo72lrPvO6G6CAQnuBh9ud7SkbWbLn
	3ccUCY4ekl+PtNjaaeIwHNZo0EEVL1BkYbm9qBZIxfE0Qe1/vuI45QS13lYEtyi5tNUCbcE+0K/
	my+xscGODmIGj+UyJCgLFjWzKg4EA09bO6/t18qyJq/tPvqBGxsPWLcM1HeOhO5ObchAt0HKdKU
	BP6LKJQ48QAH3JUPKRtH8Huyv6gWHa78JII9H6N8p8olebhK6xluqHIwdr+7cd7OIi6rYv9Gfhm
	90KS5SI1a454ZPWWfooU2uI4el2lAcpJldMM3mXZnr7hNvGGlRg==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr5794269eec.38.1795209696839;
        Fri, 20 Nov 2026 13:21:36 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm13100540eec.11.2026.11.20.13.21.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:21:36 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v3 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Fri, 20 Nov 2026 13:21:34 -0800
Message-ID: <20261120-timecard-common-v3-33316bf475-2-ahmadexp@gmail.com>
In-Reply-To: <20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com>
References: <20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com>
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

The selector table index is not the hardware selector value. Passing the
index to the SMA setter can select unrelated signals, or fail on ART.
Use the table value, as the sysfs path already does.

Mask the direction enable bit before the frequency lookup. Otherwise an
enabled, direction-configurable pin has no matching table entry and its
DPLL get or dump fails. Apply both corrections to all board variants.

Reported by the netdev Sashiko AI review and confirmed by code
inspection. Source-derived C regression tests pass with ASan/UBSan;
restoring the faulty selector, mask, disabled-state or DCF value makes
the corresponding regression fail. Tests use stubbed MMIO, not hardware.
The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
physical card was tested.

Codex prepared the fix, tests and changelog from the review and upstream
source, at the request to separate common-driver fixes from WiWi support
and validate removal ordering.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index b16d36c3305f..95a4df468e79 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5869,7 +5869,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (tbl[i].frequency == frequency)
-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
+			return ptp_ocp_sma_store_val(bp, tbl[i].value,
+						     sma->mode, sma_nr + 1);
 	return -EINVAL;
 }
 
@@ -5887,6 +5888,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	int i;
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
