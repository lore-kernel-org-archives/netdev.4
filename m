Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399065;
	b=MKseMGcmgBXUgEPqUrYACtRfpjHrOsS9HDtJd6FY0GArmxCj1Nza9aCTUkJLunK/p6Jq
	 geElD/GgLwsKUwSrNCIu11fF5GDnC2UoJi56+DUtVPxJDIxPQIWjTdq2esAIXzpNH/L5f
	 P4uc/zji4TTqkCwjNBFh6TRnKpd/15uYcI2WrhZIKM5wZO+4/4sMdlbAionY9MbopLSiK
	 LK4nffug0egy2inFeoa2SEhB/EFg7/LAI7oUh5AO4ssUvi/crIcEpUQAAPFAzFqWxXRHy
	 s7ctzEPEf/rZTxKR7gqVYtzYvXxhI8qXz831GFf3GMbk7KflMvtJySqt9Jii1kswo/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vgRCsOVYlrUWkrYEeFSmC3EUeEM0D8Du93v/OGMM+J4=;
	b=mgz7My4ZXGldf+ju/r4bgXpHI3pkt6NbkY2g7arAr2ZEXHpcdf6mmI9SFhLxumvPn8j3
	 06njf78ZDSL/31VsQCxhGpiD/FuIPotrNHdM0lDN/YRmWYbD8yrjGuV2JiX/XkwHsdacK
	 LAF482VKy5TPA2RzoD/IsczmZrjXLAfAyzcQPDcKqPKVMzqMS1jznwWlCwh4HPU6vXUs6
	 Sz8Y5bsRYiyyVN9t0Ynt6hcxPJgAEfpcR34uPFRZht+TgM7sX+o77R/wqajvtGkIabm5g
	 lBnDKN2Wus9nupNlfzKb+kciNpDkrhA4CgxFhVugt5uXIYvcLjC5xzzF9yMpPaHviyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amke9AEx;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDCE606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDCE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amke9AEx
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3863db981d4so3623822eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399064; x=1796003864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgRCsOVYlrUWkrYEeFSmC3EUeEM0D8Du93v/OGMM+J4=;
        b=amke9AExZWo2HPSaHEEzi8IVS7MQAYQj54S0JgqSQUOiIv3EMYXVUy2W5hx0j5VONB
         pXCiL0ITDT/UO1Vvfxv4kZOV7DOCjr75o9hQFqhvN0PwecyMl6biDif4LAMRvK1aEuVN
         UtwoUUaMf1XJvRFwh65C7GfnNwYqH+mow8o2qBr2WUHudMU5ZYZp9J7qpxkBCSaElsyy
         T4gPX+YLlCCuq5IMlu5n1OevnnNhZdWDU1jtXmK8sHYFiX47FlYIIEMM2vjSWgOsL/vT
         NHSgpV7c5L7W0Z6hl52+H3vtSv7ot2MafimtWqRX9SJv/lFpK0HkCbrNPUbQuz1BIrtG
         5Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399064; x=1796003864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgRCsOVYlrUWkrYEeFSmC3EUeEM0D8Du93v/OGMM+J4=;
        b=bOgE6rRoOHQFryYps03zyPl5dOhCou7jkiuP9p8bvEHmS/rseyzV100fKckKvaQCiu
         EIxFfpVHVuvjN0VY8xmm5C8gb8Xg6w74G/Br0pkPycgecXzUrUMTZdNvTS+IuT1fVYVm
         3C0VRggKkLRP4IRs+fYwAswMzEpj6KIZpx/lrdnmh/rtjDwZXV6S1BvJ9rbkwf93atOD
         +Hni3mv8WS7AoYSGO7daJGSBjVcz8+hmYot/CiztK6v4bCRTJ+LjL0uOVulmCDR5GdhK
         vUzhPCmX122gT+o6R5tit5V0sNG8eFX9Cd+7c57EZx7/JubkKYpug9oEmIdR/KUzXTEC
         aMtg==
X-Gm-Message-State: APuU4Z/4hQ2jM81FzHFyPUrTup4N1k+3aTL0PY1481mIq39x3Uu8onPy
	SmrCgFSuBk38pX0zMYych1HukvmQvzgFQSZXl2UAUYl5yLEZo5g6FEszvsAOC1Zd
X-Gm-Gg: AZFdTZdQxXrWgYLbaOeQP6/WzYovPg8DohFkg4greV7KQEvpoEFaXFCQOSh6hc5QZuK
	rA655EkYPuCOlikwgrHzyj8jFa/tj+JTluSDra88i9WLQEjCP+9/kqq5VTpLta0gWDqVzwjK392
	yKD3W/Wvndf4Ah2fbSDG/AfHVmMqJJGeqMSpP8ymDaMHXTImqucOks2fx6FYstCsF7F+Q2LUaRX
	QR/k68VsdKBIj0gRXCZi7HA4QMFfrBZYwy3TsbFoJwbmMEzpGMacCjCFvHYqUfB1G9BZH08X4e4
	a/rPtaF3NfE2KNDWt7oUC+zHJmv/nrjr4yaUfsIUhoVQo24snGyk9y2ncAId3xYSnm7gDVicjoj
	gWc2F41U5+q/XwZVsX16Hhr3iMYBE0/ZWLBN+kBHRXaoiJGc8XsPifu301LU8K9cbB2ERfAj3/w
	e6FH4SNEBVOQN+BC26k9bUYtpr7hbkz8Uf2PGnTB8bCAd8KIgaJMXfXHSb4gwRTkGeb6ltVAnC7
	zP/2+bR3x9gwWbwlyqZg3HGIkP6RYpIhWaBZJ0XKdXop8KGfZahkfZ0pBn7pIWHKu5+rl5ycqSs
	TP3Dx6zVwp21gImQ7ZXsIYyUPpL/ho5EsAirgvvJeNtOcsFgan2Lunoc8aSnhgKR9O50w/DeW8h
	hKbTZsvy2cZGV+FyBIXLnqvxEsaO6u0TDSmN8wmyEulCiOZcPWCjia7IYZx05P603Yjut6sDg
X-Received: by 2002:a05:693c:8954:10b0:386:ad5b:ab01 with SMTP id 5a478bee46e88-386b239ef4dmr1169080eec.10.1795399064241;
        Sun, 22 Nov 2026 17:57:44 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm30096077eec.15.2026.11.22.17.57.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:43 -0800 (PST)
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
Subject: [PATCH net v4 3/5] ptp: ocp: preserve disabled SMA inputs across driver rebind
Date: Sun, 22 Nov 2026 17:57:41 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-3-ahmadexp@gmail.com>
In-Reply-To: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
References: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
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
for 10 MHz on FB and ADVA, so a DPLL read reports 10 MHz while sysfs
reports None. The DPLL core then skips a 10 MHz request as unchanged,
leaving the input disabled. ADVA X1 has no zero selector; its disabled
input instead fails the frequency lookup, blocking DPLL reads and later
frequency changes.

Substitute SMA_DISABLE for disabled inputs before the frequency lookup,
as the sysfs path already does, so the None entry reports zero Hz.

The software flag alone is insufficient after a rebind. Recover it from
the mux enable bits when initializing direction-configurable FB-style
connectors. The existing direction selection picks an enabled side if
either side is enabled. If the selected side is also disabled, neither
buffer is enabled: represent this as an input with the None function.
The mux does not preserve a direction for that disconnected state.
Do not write the mux or change the interpretation of fixed-direction
firmware, which does not provide these enable bits.

Source-derived tests reproduce the lost disabled state using retained
mux values and a fresh driver instance with stubbed MMIO. The corrected
rebind and DPLL re-enable cases pass under ASan/UBSan. No physical rebind
or card test was performed.

The issues were reported by the Sashiko review. Codex assisted with the
code, tests and changelog using the report and public SMA-selector RTL.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179538006912.3135.16971430532149423594@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v4:
 - Recover the disconnected state from mux enable bits at initialization.
 - Explain the original ADVA X1 error, not only the false 10 MHz case.
 - Drop the earlier review tag because initialization behavior changed.

Testing: 243 configurations across FB/ADVA/ADVA X1, covering all four
connectors, enabled inputs, outputs and disconnected states. Initialization
performs zero writes; fixed-direction behavior remains unchanged. Re-enable
uses the actual DPLL core get-before-set function. The old source fails
the rebind case. Three disabled-state negative variants fail at runtime.
These are source-derived tests with stubbed MMIO, not a physical rebind.

 drivers/ptp/ptp_ocp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index df1a428eb2fe..e27abe2c24c7 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2932,6 +2932,14 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
 		reg = ioread32(&bp->sma_map1->gpio2);
 		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
 		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
+
+		for (i = 0; i < OCP_SMA_NUM; i++) {
+			reg = ptp_ocp_sma_fb_get(bp, i + 1);
+			bp->sma[i].disabled = !(reg & SMA_ENABLE);
+			/* Both buffers disabled: report None. */
+			if (bp->sma[i].disabled)
+				bp->sma[i].mode = SMA_MODE_IN;
+		}
 	}
 }
 
@@ -5889,6 +5897,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
