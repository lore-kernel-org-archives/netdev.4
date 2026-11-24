Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495366;
	b=XkZx9ZI9dA7FWIiR1/iCAbJ9FpyHgp2NtYFPekvJnkefoVcaDWVUb42NcmnIjqAa/edQ
	 wNGzBj9BVAnTxcXaWLsrHEgwDC6jzWp0A0hgxVkgIXGqjhM4MkEy9DcWBrh0YkiYINrP1
	 yrLVGXaxLbLw0eO8lqd6JCbellbv+AQWFAHDXJfanXMXSI1dVElHU4jiWegp+NBjX+wo0
	 8Gce+UDbBnqld6PZqujA9QMMFJJDNnqezWsWEbnvCM4fZeiR60W/dm5dG8Yo7+Q5xDe6+
	 73bINW6kXcL537Q5pNAyX8gwOM0ziyRthFn0n30ZnqgZnQ0VvIFCGxFJobQrJ3IFuuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g0REQExNNyBnd2hiqzHK7o6gPmAUPJWtB27KGrID9vE=;
	b=CxLifuA1CVpEt/vkot1FBRcmluC1fiWhMubzCFEtLW1K9B1PojOK0+kwHRKCVX1alCyO
	 ryY4DX+IKuMwqF8XepzjG/AFHbuLhj7IXf+r7TSYmRCXsUQBrWGIMCXmYjb6Z2f09WGjL
	 uj9i350yHvPk+6OwY8r8eSvvOKCuz9zKDNeTpa4e2Qq6ubelkHthkG8NoyZDQT8gIvUjo
	 JjrsnY/YkPQUwrJk3wUtpGCPppOexKAHpgLwwsYxf9xeOlppvEODqhCpR4xpaxkENClsy
	 Y/jh9ETNG8C4/Gj0kBVrHYdxy2Ko4BY1/tK6T0+hrvtE+CsqHSKKvD1wik3hJLUoLWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE1U3dGd;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C0606A6BB
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016C0606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE1U3dGd
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so5781562c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495365; x=1796100165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0REQExNNyBnd2hiqzHK7o6gPmAUPJWtB27KGrID9vE=;
        b=PE1U3dGdxQ0Tp+ZOsxchIei3Jcht4ICbD+oLd4d7Shm9oMxLE/wjt5IB5Jpcq+bBjo
         wqeOIGmAC9UK5AYWN18JGHj3gkREOCjJnEihTFLTExI9LovkAFtZjfSPlICxtsGy2E4e
         BY+Im2rDxgoTq7iJTMPkJEHrZh2CaqxoUMC1UoYZ03J+rv7vIjFoyqx+cXWuNZpnfqs2
         Q/cZsiFGdTc2AOx4H5eKQOWKxbHS7kjT9tXWw0KXwjOP2AslDKmLU/FuIB6DhQ1wiW9w
         88doSUvOU/AjAXD2bRq50TkQFIR4Lnxm1D8LXsbOjp8c3xH1CtLRBpGvo4iRlko2mcRW
         8xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495365; x=1796100165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0REQExNNyBnd2hiqzHK7o6gPmAUPJWtB27KGrID9vE=;
        b=txB5mpkwQTPpUf5IGevfG0U080r+RwytloEPbQbdEbme5p0gpBytIZ/eSAgS8zPOYF
         omtuQ7Myvox7KsRl+2CavO1uzkGH3+719jFrgrpyeOFmsfIqnirHTRfUOX8drjeSGiQr
         cpNK6wjPoLAKWkcicFVYi73mvtwNrQ2AvdPqOPX8t+XTx/orAn/YU1TYiC6PAENewt8S
         f//x9QMBW9Sks7QCoCDwjAi7iA7l1/af4Vg7rf6Qw7K1V1b7qAomCi1mBC0f+OBK9A7Y
         Ynkmc+a78hG5BCj7q8B7qhHVFNypRXY8BxrmEDQUyQWF8hZzeDLiz2YO30TRWj+VKDMN
         /USw==
X-Gm-Message-State: APuU4Z+tJ/+SN/IxryMDTiALLFNCVuktYk3KeylnGfmF2l7LwBBpcvkR
	eLRt8hQkYVBhqk+4FCbg7+JOShvhSEPilKMRwUwoFGSeOSQpeBCsrDMoPl/UWffL
X-Gm-Gg: AZFdTZeiP0NST43Aa8ujXSmtmDo4i3vVIoyA3gPMylOw9g+Eg3GLkyQ7yn0W67bCluK
	8awrSzgYy3nGkyh+5Io+SS8uC/+iuLbSP7XcSucARPwV0cqNy2gegkf1mr1hf15sicZdiSSehQx
	b68x5C2mcUWJMNcCjtJfBqK/nxGoGo2iPbl7tFk7ExKqcMNO0mMwduAA5ABEY+aZ1oPLzbCKbgh
	qlbb+hMbtEg/GVpleOZoGrII06YMV9eeNAf01aeFXQAQpNph//zBj9gBGf1w81c8qUPkR/hiPLs
	eAlHdIsqitLtxNLstjcDyiVtLQAkgk9LColT4HUPzsdQgl2Ocvi/v8be5Rz+UFVqgG4mHseAM1g
	UBGVpa/Y/THlu6aroN4BfiridZFbT5BBNoC6ynkGdbsSDZm4piKZRC+XK1+iNLZKb72YBkd82Ro
	YGZ/b5i2gwkk42LnH4C+AsvO6BrvQzzk/uvJ/02whby1uc7cKFH8VIHlSF5q2k+LvpTp/WMIjX0
	Ruy1WNRYhE6Bo741oJAjdXk+A5tr6z3qkEgHBda1qu1F3NO8Q2ltrP21Y6a1nmWaJZQBoowIN20
	nNzEoCAtQhyDu+1zcyqSlg0VLQzc9zFlWYU3Tied2+VYJux/A6WDh7rOfcHfTSVOOD8OtHwpxOG
	urOaA79C9WNTcKxHEjBjNDHbEAdOjaVIQ3sVLEZdwFjtD2nSSTDU2deWMOr9rdyZRk4d2D/d4
X-Received: by 2002:a05:7300:1486:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-38570e24c35mr18256272eec.25.1795495365075;
        Mon, 23 Nov 2026 20:42:45 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm49224329eec.11.2026.11.23.20.42.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:44 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 4/8] ptp: ocp: handle hardware selectors and combined DPLL input routes
Date: Mon, 23 Nov 2026 20:42:43 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-4-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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
index to the SMA setter can select unrelated signals. Use the table
value, as the sysfs path already does, and mask the direction enable bit
before looking up the frequency.

Inputs can feed several destinations. For example, IN: TS1 TS2 produces
selector 0x000c, which is not an individual table entry. An exact-match
frequency lookup fails with -EINVAL, preventing the DPLL core from
reading the old frequency before a later frequency change. The error
also propagates through the DPLL pin dump.

For input combinations, report a known frequency only when the selected
frequency-bearing destinations agree. Timestamp and counter destinations
do not constrain it. Report zero when there is no known frequency, when
destinations disagree, or when unknown selector bits remain. This uses
the same zero-frequency representation as individual timestamp routes.
Keep the exact-match requirement for output selectors.

Source-derived tests reproduce the selector and combined-input failures
using stubbed MMIO and the DPLL core get-before-set function. They pass
with the fix under ASan/UBSan. No physical card was tested.

The issues were reported by the Sashiko review. Codex assisted with the
code, tests and changelog in response to those reports.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Renumbered from v4 patch 2; code and commit message unchanged.

Testing: 4,669 input-route combinations and X1 direction-change recovery.
The boundary test also confirms disabled X1 reads zero Hz and re-enables
PPS at this point in the series, before patches 5 and 6.

 drivers/ptp/ptp_ocp.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index b16d36c3305f..df1a428eb2fe 100644
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
@@ -5894,7 +5896,28 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 			return 0;
 		}
 
-	return -EINVAL;
+	if (sma->mode == SMA_MODE_OUT)
+		return -EINVAL;
+
+	/* Inputs can feed several destinations, including timestampers. */
+	*frequency = 0;
+	for (i = 0; tbl[i].name; i++) {
+		if (!(val & tbl[i].value))
+			continue;
+		val &= ~tbl[i].value;
+		if (!tbl[i].frequency)
+			continue;
+		if (*frequency && *frequency != tbl[i].frequency) {
+			*frequency = 0;
+			return 0;
+		}
+		*frequency = tbl[i].frequency;
+	}
+	/* Unknown destinations do not establish a frequency either. */
+	if (val)
+		*frequency = 0;
+
+	return 0;
 }
 
 static const struct dpll_device_ops dpll_ops = {
