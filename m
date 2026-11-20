Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209707;
	b=y/a6nrXpgF9jyOUaL7Jy7wIDikFpaXFtWTaBxV4MyvanDBTc3VlnBmleeHJCotgoTRb0
	 qLvSzrFR8BgXsO4mgQibMrWJcmzuO4xnRgkQKFW9p/TpCdEZpcXlMtSySJmJFi5yFIpVg
	 1k+6mjJa0Xpx7LwCinLqUOGvIO+txloQCHenDfw+PVZr4A+3pGmIhbzquzxnniYkagBy/
	 z2Mj8+JLY4pCSS2cbddmLoYqkfAdWF5k6xUZoPcoPbCqLvZGKuDNol+qX7iUf52tAxqVX
	 mdIzD2/80fMOrA8/evtBTHP3VdyXWqfb2rtILziNESdkOrsXnfJERBaVYvVME42jtGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YNE+204OVSwkU7ngiRg+acwK8aPhpXNPhvlczxli2Ho=;
	b=k9X7Xyzcyws8GKTVqpTfBF0ndUCr4ZlOVHIP8ymPMyMToWt8gU4Y7Uvzg7vOX9041W7h
	 QaXCqCj1PWKlBVBZ6vaPFJT3GAD+1cQW05UWRBMkEdi+vQ2BGBVbdnn6/wVB0cZuJJ+A4
	 5gr1Kv3uMYfqdlEIpQ/3uSLdUE2ypUuCZCCp4XBTQOO0FQ1Gk4+fGuYQAgFDnAFPwgTmc
	 7Yk4a/YFjx73b/Sf1Z2vSwTQqqfXkUZyOjhkJHjzFd+7Vul1gPgv33MSQI6/a5WwFMnML
	 xYAMt/zwd+CHm3XyrDGPH90AKwAMYeygmMiofzd7iWUaxkS3tyX0v3roUxOA253YhGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SwFzPRlL;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8248606A6AA
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8248606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SwFzPRlL
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1406706c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209703; x=1795814503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNE+204OVSwkU7ngiRg+acwK8aPhpXNPhvlczxli2Ho=;
        b=SwFzPRlLnCeKCfE420Fo9kLSiN1X8jeuZ5mG1IhikgqDiggfonH2bJI8yOQDvRrMVW
         PuTDFMNXSb/M/5gwbK3SPWaqKpN8kx+9ctWQvAF4i5ptB4FZhM3dASL5u4fEG6dOyhL7
         /1mpOw2sU7YPavO8NvNUlFoqFBTFKEiGvrtV+0eCQJft2evXR5cCs9Cu5QSbPL1Bao6Y
         YMRkn3z+E+KqVLTRq4rYH9JQ/rbr+lPA72xzoPHQpfAV2n6wsrSmbP4CMEugZorhAHRu
         bDLrjiTLbe4UxWGvct7v/zdd9ul+7CiECiPdANdITze7n4NPcF5iCvY4UZzEJkxkxCIz
         kQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209703; x=1795814503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNE+204OVSwkU7ngiRg+acwK8aPhpXNPhvlczxli2Ho=;
        b=WIoMnu9z/lc+ejUUGooijqNwDUpBkI66P9avil1pegp0FbKXLp32Hs1KSIyBcA/k44
         qoZI/y2OHNl8AJgAKpebWp1vhaISYUC0Eqxkmfa4NPTeP5myAwdGaiJoQL5jTWONo8Vp
         Q7560Y/GBc4dOrpfP+V6zCYRKdbxEO5oo3ryTTqXfN9BXnduVRnHgsnUE6i4sxM0ud4I
         wr0xtyI9AsQS8oVXYfxoXERDvRgIPiWmyjsOogA+cz9+z4EUcOOslDPKEVhc6MK2QgcY
         sWAuqZzbYBhldV6kCK7ILPcI0pcwRehfQHjITKX/cFcqP4HWAA7YQPA6Ymg/lTzgn8Fg
         BzFw==
X-Gm-Message-State: APuU4Z/qou9dPN8lvcrzAUZmfJCSJB5TpbTRrKLKHPLOsPXmAIQenNta
	BpYFGJL75Sfc4gf3w6oHJl8h/+ne2EE2rBuiHFkroH8xw6DhIvxhhs/dxJOnDLIN
X-Gm-Gg: AYBFou1SUSg3HvvXnjG65TDmb1q/OiSXGhbze27QJDyjX9ScD4J3n/oVrvz5TB3K4XS
	WEn59wi7f/vCRvjauiG002aUuWCUVxraLz6pVkTDJEouMpgyERg9sOuZDKGDEZTf3dKaYUkpbz0
	WUn/7pXZ4B9mqSvWNWeiyadNmrGOcGxFws65QR1/3Lttf5A0nii2MbRgTEHEY0yO19pjlXF7Pej
	9BNdytf9HB9jBzYMfn6yXpQVN8dieSFUZGyfTnUpqhq7znNUOohAEntaLJ+ENBYekovkW0WiFau
	xpBY5Eo/dahSLLkEkRbTMTomYg9J28ZYcxnL7RcaZ21Z2oAsMk9q6GXLtnqABwcOv2d2SLgnUE+
	qxEP8OCLCEEJVeeNIa64OhckWPmzZSePsCkbTOWyk5lna2rDVzoevUgEGxjb/JLKUSglxDzOXVQ
	R7isXh9if9lgONYQSkye75awU/DE4bN/U70TEazJTFm/gEKqm104DwcW1pFvf6B5Gz8a5KGBIny
	vltd5u87f+inPEiR+d954UQ7Li+NnYrdgScjNhEkgpYGwgLBBh1EFPvnQhk1ITBMlW+tlwqyi7p
	pNe50CV3zLb5xvgWwbccCF8TPQkrXCdPwcw+47WHkaKirDz4NLeIR/XA/iN8t79yX6g3JAVKVqS
	KPpbckCDi8reIOR0UF6cD10ugQWEr
X-Received: by 2002:a05:7022:f101:b0:1b5:4d40:e9ff with SMTP id a92af1059eb24-1b5568d7b42mr3368818c88.35.1795209702588;
        Fri, 20 Nov 2026 13:21:42 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm8842516c88.3.2026.11.20.13.21.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:21:42 -0800 (PST)
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
Subject: [PATCH net v3 4/4] ptp: ocp: correct the DCF output frequency
Date: Fri, 20 Nov 2026 13:21:40 -0800
Message-ID: <20261120-timecard-common-v3-33316bf475-4-ahmadexp@gmail.com>
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

The output selector table uses 77000 Hz for DCF, whereas the input table
and the DPLL supported frequency list use 77500 Hz. A request for the
advertised DCF77 frequency consequently fails on an output, and reading
that output reports a frequency outside its advertised set.

Use 77500 Hz for the DCF output selector as well.

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
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 653c3b1ca066..f4896f980ef5 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1373,7 +1373,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
