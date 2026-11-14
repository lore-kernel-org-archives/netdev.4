Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663407;
	b=zuN5+SDFDN2dKrpXuGvPV0fT84z63QAzI0dP2xvHm98QH6iT9qzkaGr4ouBYjKCpv2y+
	 UdD4jJbPMej5LlV8gT6k50q5fbpWO0oVg841WwxITjaGd3TJs9wMbjJbrBM9mPCALg/IR
	 KSk76kBY+6EYIkqsFM2/0yTp76AshZ7Bu5PDElsoGjp0ygQrD8xrxj8lM+MiQ2vcdSZTe
	 DsQz1LLkgIHDZsrXFH7ptmqKvpIa9QzAQYqBKi32RzQ7nN1o4U727+urlCc52iz+R2yo9
	 c+poHa+rcAOUB4sMclCKNFRZE9U2ymY1hf7oyDBkbk+n4aAdGzflZa0viUh8owHYbBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
	b=nPGWLr5zoXE2kEX2LABvt6qUVpIj31T7V48hMlk28IrqdSrSmU4WtExyUpGCwYDqD1Un
	 7TE0xG0LiUDcV0jFoIlbIlu1Umbz+Dcdee7B+yRjWrjAgjoLRewo3f937yoiPrNputCPD
	 Rj6qD+0FQ+RQJOXd6a4WgBCbdSLrxl4J5KR+SEDErarh6udsYQ5D11vRO3ZV3Yk24ItpR
	 C7YeKjJxnZcq88gh1HRGutXMUypfHpWKpnhwfiNNRnBmwQIakuPr7/0S/6GJ9GElmJFcp
	 6mzttuLA7Q7S3V169a9MjvH4RfLiA/YOIexWwYkxYTEl7YitRxC4PxiR8XhltunEFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MNy13gTL;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C4606A891
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524C4606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=MNy13gTL
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so962692f8f.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663406; x=1795268206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=MNy13gTLmC76O2NwWxzMLq2bD2NcAS2Lmb+Fa3QAE5m3tgPQDQl/dmDgGSBdSkVSXM
         jo7SSTHv6JwLuKfNswjxK4G+NRrtPwxEFluwI1dZ1LCBs2oAjApsc2mI1Apv+ilRrROY
         K46icOMtrBYmvhpyDkK38wTxSxfIeRGUbx6Fr8v8CmvbnTTlM8I4Ou+0sEivLrrzS/8N
         R9OKZ31N8fOJ5RtReTqWfpVyjMlpwrkDQiCLrzuE1wjnedpYqztGKEPtAV62PUFHoTIB
         PPDQur2xPCsj+0uWGKSMxDXEpQRrgpdiiQMlO2m0nzR6hC9dpNppZyzFw9myK7+h01q5
         soAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663406; x=1795268206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxrZJxHUg2O9j8zi4wkVtSZmuc/DWB6+tE9tT3nYX8c=;
        b=KgxXE+G/8bJUqsFN1/P7pEUvWywul+cGtdoovuRQgzpOpZCnwNlPndkunrgRVUO7Fk
         TmQx5jzlfOm9RPJRf9gsAvfirVPley5zTxeXpxFeANJCrimiAe1eKkzCJh45Od/2mxvx
         j0v0TmKTzChS6LPXjneFT6Qx8IeNpqahos10Ewt6Bn+7N3mBInKgYCgiobf0xQ7LHDX7
         NhUmh94RTdW4LvwsYfCOOBjJzI8CIiaThOx57/IaZDS4Vs1Itwm6EIx2dbdlf5FmG6jL
         jtfhSHxpDDmKbqwv9xABdF5qgecgoAgYXHYuY1JWaBL786MDgEDQyERW5R5BJtUETOqO
         4xPw==
X-Gm-Message-State: APuU4Z+4Z+OkxsgS1PpDLR4rIhpdF1ycmctWchDgD3BDJfwNZgo0IOpe
	IOYIEJDOaCL3VjTZCegPPLs12bqNGP+PMQ5Khg5f4vQED00tMbec8V9SKKwxRNVVrqaY/n9u2OP
	tXP/Ff6nR7Q==
X-Gm-Gg: AYBFou3qeQ6AK54e6n3swVIjRMYnfGGx3qk4kKU0p0ehAOdg9hm1KUldKO0nkEGeYtq
	QXs0KpWWoNEHtzgqQbomQmERXo1mdLqvKsolwePxP6MapJk/PpOlri9r/1W5kS12rgYOYEPa5iw
	ic1Mu2QGQNmsCVCRFNBthM3iMsQCBN/ROzk93NzjHnK+0YqhT80KU7CQDH681hOd9d1MdEOuMD7
	LjiGqqaAYm+R19fyj9He+FPExhsW9k5IHA+XSU6GnlKw5NoaUE5RBA05IIlzNf3Kv30InJ5cFfx
	s+px2MVebne3VD6B7weH0ALO3vOjpR3c7dRriNZltglnKZbpsFC/dS+Vt41tOZKfm02Quiphv7u
	sYLcBaYn2OHeFvLHAD4KNKLGIW4vZ+gS6vJ2DbcaqqDK18BAWv4yoIKU/MQ4Y6b4IUx9kdTbIxP
	r6b3T20zLUZXGWhQAiwfpyvyKHGTHh9HASMm6TGkH8HlPTvha03zxSWqnNZ9qcQKcbam2Vu1YNF
	pv3KG/it/nU9IdouKWFI9upzxb0sVyh7eOXNVcqECn65WUDBA8qlgrzjBasMOwRNHY/Ayt3856i
	1h7iSRQJzIhUN9Afh/YOYwiqIw==
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr10850377f8f.42.1794663405564;
        Sat, 14 Nov 2026 05:36:45 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:45 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/3] net: stmmac: dwmac1000: don't discard frames with only a checksum error
Date: Sat, 14 Nov 2026 14:36:38 +0100
Message-ID: <20261114133640.3285413-3-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
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

On dwmac1000 with enhanced descriptors, the hardware sets the Error
Summary (ES) bit of the Rx descriptor not only for L2 errors but also
for an L3/L4 checksum error. enh_desc_get_rx_status() returns
discard_frame whenever ES is set, and since commit 1b746ce8b397 ("net:
stmmac: don't overwrite discard_frame status") the checksum status is
only evaluated for good frames.

Return discard_frame only when ES comes with one of the L2 error bits.
A frame with only a checksum error is then reported as csum_none and
reaches the stack as CHECKSUM_NONE, so the stack verifies the checksum
itself. This matches dwmac4, whose Error Summary bit does not cover
checksum errors.

RDES0 bit 7 is not in the mask, because depending on the core and on
Rx checksum offload it reports a timestamp, an IP header checksum error
or a giant frame, and enh_desc_get_rx_status() cannot tell which. In
threshold Rx mode, a giant frame that fits one buffer therefore reaches
the stack with a verified FCS.

Also remove the pr_err that enh_desc_get_rx_status() prints when bit 7
is set. Once the MAC stops dropping checksum-error frames, any host on
the link can flood the kernel log by sending frames with a bad IPv4
header checksum.

This prepares for setting DMA_CONTROL_DT, which makes the MAC deliver
checksum-error frames instead of dropping them in its Rx FIFO.

Fixes: 1b746ce8b397 ("net: stmmac: don't overwrite discard_frame status")
Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
Cc: <stable@vger.kernel.org> # 6.6.x
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
v2:
- Drop RDES0_LENGTH_ERROR from the mask of Error Summary bits. The
  length check further down already discards such a frame.
- Explain in the commit message why RDES0 bit 7 is not treated as an
  L2 error.
v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 7ece8d4157a8..d0622f2605aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -216,9 +216,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
 			x->rx_gmac_overflow++;
 
-		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
-			pr_err("\tIPC Csum Error/Giant frame\n");
-
 		if (unlikely(rdes0 & RDES0_COLLISION))
 			x->rx_collision++;
 		if (unlikely(rdes0 & RDES0_RECEIVE_WATCHDOG))
@@ -230,7 +227,10 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
 			x->rx_crc_errors++;
 		}
-		ret = discard_frame;
+		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
+			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
+			     RDES0_MII_ERROR | RDES0_CRC_ERROR))
+			ret = discard_frame;
 	}
 
 	/* After a payload csum error, the ES bit is set.
-- 
2.54.0

