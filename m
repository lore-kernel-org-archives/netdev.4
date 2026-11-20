Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209707;
	b=OdK7rYQVandCgjVB73WyISgqNv4TIcW1tEwhX0PTwfcD5Qjun+tozNgaIa532reJpQQd
	 OzmYVcXk2eQ9SVWCDlSHhOiftTEKxaQHzJGjf3Av5yThxMQ5UvJvd91we8QKuQWkWigmh
	 TxaagAW/xeZjdQjE61/CwsjOeKrH5VTSwl2Tp/u54zmJQOjvr+csMKOEUTqkZm6t7m66j
	 8RQoipu80X8BZZv9ENn5trRK4Lc74UllhlrReGw53Q5BmRbD2hp4EuDpCTY/Q/D2ms+iS
	 NwbtYzTVWCwWi7A0f8vNGdd/PFYRAt+lSMR2hAJj8AABSHObgTb2RHWPLM0ERymsLbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H6Box1rhQsdsUXQlMtIEaAYYl9sgKf4lvFMZa7C3ASc=;
	b=wVKYw0oED3okLxvBrl/glAt5KRUBwByGh60fa0smd/0U4Gf5otRncyIBvAVmpPoaP3oC
	 1T3ympMCoLWpY6r7xux739U7c7MyMTO/7I2sbjOgd+kqzq5TfVqvWcmSfRqDTiMycLQfQ
	 ACQe0OpMK5zuh/s9p4cmR6iBTrADNfOPP8PfG2DKbBJSYhOv9xIUTSp4P8SHOaXKgTDfZ
	 Lzsrk3G+M10Frb7DAL7ha3rP6V+/T6WtnnXUwgEhPfRYhUFRab0nNgKoxK7/9gzRPEq7l
	 lC2AKRtPPOyesw5UT8q5di6xe25x5ju26igWJ+wiWHXP55MDQI2FcwNT8wg5Pz1F9qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwbigldT;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047B606A6B5
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C047B606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwbigldT
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38692f62b22so1126199eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209701; x=1795814501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6Box1rhQsdsUXQlMtIEaAYYl9sgKf4lvFMZa7C3ASc=;
        b=cwbigldT0pFQj4CfLxSnixHS5YrdAxx4PdBr68v4RtRCCmtgevXRlPbkMbSrX1Glo5
         LC1NFnzCxssEmleKxL9layeVuUa92BM3eRpmHRaZJviq5YreZv86gduEISkytnsRbvap
         N0Preykmc9LictH7xjo1ACJSC7v09MNAJRzM28f8R0bfEUf/2/NXBwkHN8DH3SHb+/EF
         gPe8ZFLDHBNO9dsIBBo6It0T0n8/Kl6rB7D3Cr3L43aCb4e3Y40uBSbuF712KKAwEoUG
         pwZ0p8qya2Gl4vUbfPNj897R6gHAb47Za/OdFVq7vtUDGcPGbHzUlX8MpOzWYnnOrVk6
         R+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209701; x=1795814501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6Box1rhQsdsUXQlMtIEaAYYl9sgKf4lvFMZa7C3ASc=;
        b=ALs5A+5VMKrqbYKFQKvmj5ZnWEE49koUswvQ7mXmIyoOGmmnCHY1CIfghFVTVHhfXI
         jnCsmlt/5AFO9l0oKW4Uz8rrHK7Wvlsak02PT1wkLuvvAIsJMavOn3yJFk/5sPrinyPX
         QdBvfUa49/fXuGEglerqJ51FRUMnfjd1OZ8N+geTnPdTGWe08AY7HS2aiF242NWNhcwM
         9UNCFcAhES50sDAceVhEn9e0jG9fKY3w5B2aABQ1VeRgfUjimfnI2d49hBvCd5yatzTW
         zNf7MSFa3/j9a885FrJ/RR12tZZfQhsBIbnaYt/dvNKj1cmAOTLO8qDA3oGtXeb9Avjs
         wTvA==
X-Gm-Message-State: APuU4Z+lKedFL3nAWWEyaT3dZEPCtZ43gx38uQYQlBlbsxzWG5yUMj6u
	RN7xiXqKdgOOFSIpy6shUSSXDyv65H00WidyBg5/PKFyEq1Yr87VLfS/w82FQad0
X-Gm-Gg: AZFdTZc99FtljxswQ48T0P+nY8+PCY1+EzFvenaoxxgJzSxDz/VqOcumWo34lryXiZR
	OYUG0F/75qyeGtUOaRhjkxs8Z6VKDDUIXazAqY4Yh2LTQNZmm4fw4dcjwtdvjx5t83byacnZ9ta
	I5PYV9gG+kuUdra8VRIBFd9/kIot4sA7GsM0xZxWizw4jFIJMKfClOL8BVDadK3fYn8by4rY05d
	aIca4hIl7L2Vm9A8MAWY08pSAUke3AIt11P+il+28GE54ls6ApN4FsKUnq1/OzKNIeQJgdVb2xp
	ADKOLt4+7cvLpKE6PLLBwwi3f93fQtBL7sbTuuQc4pS41+2BdlYYyxBeNhM4Ne3e4wnGnkE19eH
	wua7fOsngBAP06vSJuvcRzNaP+QYUZvXgVYIDql/1t+PFEZfH71Y9O0dutxTLaedOilQ66ZYNX9
	4Jo2dy0RcBIdmkSxK9eae9XyyC+EEhjtlbkYORokmAvD+OAi/pVZAHnPq+CV8TIF4hV0I96s0TA
	bQkK9TcBXdNenp2ZWXTcSA75yvGP+lgL04AL9ytxM9tV+KOc5XgQhf422jH+PPxpNE7dhJ3VWwp
	Y2W7+dRIIeiC/ijgo6ET601VbplLD8d/ADybUFMg06OeSTSyWRV6uK9td4pQNmg7toJIhGf30wo
	M4z2iIJK6xQQVNqT8duRRMFRwVf2K
X-Received: by 2002:a05:7301:53c3:b0:380:f8fd:d19b with SMTP id 5a478bee46e88-3856fb693d7mr4611208eec.38.1795209699830;
        Fri, 20 Nov 2026 13:21:39 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm12039766eec.28.2026.11.20.13.21.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:21:39 -0800 (PST)
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
Subject: [PATCH net v3 3/4] ptp: ocp: report disabled SMA inputs consistently over DPLL
Date: Fri, 20 Nov 2026 13:21:37 -0800
Message-ID: <20261120-timecard-common-v3-33316bf475-3-ahmadexp@gmail.com>
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

Disabling an SMA input clears its mux field. Zero is also the selector
for 10 MHz, so a DPLL read reports 10 MHz while sysfs reports None. The
DPLL core then treats a request to enable 10 MHz as unchanged and skips
the setter, leaving the input disabled.

Substitute SMA_DISABLE for disabled inputs before looking up the
frequency, as the sysfs path already does. The None entry reports zero
Hz and a subsequent 10 MHz request reaches the setter.

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
 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 95a4df468e79..653c3b1ca066 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5889,6 +5889,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
