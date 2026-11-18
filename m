Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999086;
	b=kAxhWpPkPuDEPaLilwxUR3wJEbyXR3ydyaKqRAA1hXg/k8tzdhf3bLQFV7uIrfTireHI
	 J1xQa/9VB9zUIaKsEgh/7mkHpXYNF34rhc0bPubeb8mQ+pR5365HG2mW5mtpOkeGoLvyP
	 zGeOJlM+qnVkoo8wmpV71UT0UwEA/ASvynndZ3OrUzu/cOA+ABpcPOCDxB55FHY3uEl6D
	 60X19cwyhcs+VLCPZOGv5qwK2DHg+fNguklsVOGU0ESqKThphk3Ig0YrY5BLsv6ersDIR
	 pfISRALxQRHAUsL6TiTx7j35ieF47/cuB9Syz+v9EySXB3uucxWkhiLRBHISnuElymQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999086;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=dJebYUd8pyS8Z+2CVSNXS7zJ6v/TxgKHnB9NFofUJ3w=;
	b=rD4/7dSgjUIK1Z/1Xdmttmb8DIQ7ijffwBTv6Z/x+1DihRMWnzD71RcAiYKNW+tk2gqV
	 EmkRF0+in2TKTCHpo3dDn2K6hn+Jt1v3GLjKUhA2027zgRgnC52NctIV+vTcbby7+PsMg
	 kZ+E3fTXBPipmWhLAwQiliaxazfTX5oOFi7XXlmdVoJ6idwpgYIBGWOtOF0MBBKrZBVuO
	 HtHkyU48GsAkDuW6sbWcpspIocVhTRiqwLYJBoO7ZarN+NSt9u0PPZNOueQGBwMDqWr4X
	 lWWMENhwPnk9xZ5VegPJQMDIS/nf8wu9W5WwmwlbvE9glsWMEZ50JIVmKRWN9oyGhKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F2b5pKeV;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129FD606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 129FD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F2b5pKeV
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc758830601so703602a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999085; x=1795603885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJebYUd8pyS8Z+2CVSNXS7zJ6v/TxgKHnB9NFofUJ3w=;
        b=At8QqofXUDSGKg/wifjxnX7OiraYp/mZNV2PGx+ODw+1fwmsOrW7n4aigPnXY9ppkY
         3jaq9ISu8/DuI20v+Q4aGuOqPcRzUSizw483cLfzxNzfOrLJqj7+8DCQuouSYvupDrU3
         SuryQM/UiZFckQuQePRh+4MYS0/FxAFIc2EHh7FU9bxfH3i40zdS6KHpAMiFaBMlmfyV
         nk502TSt4naHaVhZ0f/lGtE9AN404Y7bCu5eAw9GFd94kMfpoZ5XrT9Jj7nT78wLDyvW
         GSBmQLa2NonHotAg5mDpSIdrLj9KSIg5gq00iEaXrRXD11aM2wGkSlHbN2phx7EQCgnj
         8poA==
X-Forwarded-Encrypted: i=1; AL+hErGFvzskq7a8NHCHTaUuyjTcr62Q+Z1g25C3zdtAplepnnVdp35ob1beW7zUndKpMBEe3/Be9k8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8muQmoG5Qj5KbzMelmTbzRfe13Yi7bLW1fzuRrtkNM9zNzxiIn
	ULuCrgKMvgXecNoCEw+DxTuFIndezeNvi4/EBGrWr8Mr8sMdCs4Bz+uKvlBz1btA0IcUPAzRgvv
	8PUxSQGVVu6YOXGUgoBrpTQlyH3IoA0vMo+7Gpl+oeOjO3naK7Wx7CLLFSn4jONQqXAUGpqMMhB
	BZH2/ZujllsBH70yq7sU4JbQGC/ZqUgk0K/GdMD9W+x2elmnUK6jcxjIDjrnPWpz+EsBPLCOLI4
	pJPUkmGQVg=
X-Gm-Gg: AZFdTZcrT2owG0VZPrTbAMU5JMO29Lx99haqSOB/2dfsRljYNiReEikjbokR4qICmH8
	YjA/vCzd84XuQh+x/0DzsvywK54iVd6SO//V7oiENMImnT2xvREUb8aFtE7J+h/TfgM2WcjsJ61
	2cP9BIM60nw0GDhNoziwGM3cOzqpTFSsVX9J/RjbRfykaRopItoudQnzQNR8NSG0kYciH0HO/h2
	lg+ixIGRtDXzPwRQFwrmFQd4emCMq1HttFBBJVf/RNWT5mZIEBLItA6mqZ4E51MAvt31qZ6YNGd
	K/ZC0mBF7lhCC1PhytG/r+DC+wQ1dUT7PwFaBsV4780efmfZ1HZQiAMrJlMjtCmtZEsmLy3VHTm
	InzDTDsTYww7aqwT+a756ALGf4kVZDZ+aCooQKY0HrSYS96oXrGGstpc701AJduW70IWdcVWJeA
	cTYtXu0/t+SmmKYIF80LsXQcTYXjYtQ3jRrn8=
X-Received: by 2002:a17:90b:2e83:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b3d07d929amr2601962a91.51.1794999085280;
        Wed, 18 Nov 2026 02:51:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d1d8dc62sm720247a91.1.2026.11.18.02.51.24
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:51:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso3316730eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999084; x=1795603884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJebYUd8pyS8Z+2CVSNXS7zJ6v/TxgKHnB9NFofUJ3w=;
        b=F2b5pKeVfqVAHipk98AJw4f2dkJApnPlCHdL/dQ2gMO8NyP8uXfMco//2FrGlV4Q0f
         6j/wIP3GbWetLEcifDhQ1AZ92u/BTJbXpB+ECqFGte/zTP/YuHooTHZ3v3ydRK391JTV
         q4GflqkLliERn/GWMHNinx7zwx7UAWKJMZQ8U=
X-Forwarded-Encrypted: i=1; AL+hErFpC9Wem7wcn17XTu13acvvBcyvt4JkYNs5sqIBA9tUP4DeSnwGr4i3LHeRDj2b1lQd62CnnZ4=@vger.kernel.org
X-Received: by 2002:a05:7300:50ca:b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-382803787demr2206756eec.23.1794999082594;
        Wed, 18 Nov 2026 02:51:22 -0800 (PST)
X-Received: by 2002:a05:7300:50ca:b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-382803787demr2206717eec.23.1794999081763;
        Wed, 18 Nov 2026 02:51:21 -0800 (PST)
Received: from pc-hpe-top-git-sendmail-server.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d401fsm6609311eec.20.2026.11.18.02.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:51:21 -0800 (PST)
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
To: michael.chan@broadcom.com,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Rui Salvaterra <rsalvaterra@gmail.com>
Subject: [PATCH net v3 1/3] tg3: Don't fail probe if 31-bit coherent DMA mask is unsupported
Date: Wed, 18 Nov 2026 16:24:06 +0530
Message-ID: <20261118105408.1076095-2-pavan.chebbi@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
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

Commit 614f4d166eee ("tg3: Set coherent DMA mask bits to 31 for
BCM57766 chipsets") lowered the coherent DMA mask to 31 bits as a
workaround for a spurious address overflow error in the hardware.
The result of dma_set_coherent_mask() is fatal to probe, so on
platforms that cannot satisfy such a mask the device fails to probe:

  tg3 0000:01:00.0: Unable to obtain 64 bit DMA for consistent allocations
  tg3 0000:01:00.0: probe with driver tg3 failed with error -5

This was reported on a Mac mini (Macmini6,2, BCM57766) running a
kernel built without CONFIG_ZONE_DMA and with IOMMU passthrough as
the default. Without CONFIG_ZONE_DMA, dma_direct_supported() only
accepts a mask narrower than 32 bits if it covers the highest
physical memory address, so with direct mapping a 31-bit coherent
mask is rejected whenever memory extends above 2GB.

Treat the 31-bit mask as best effort.  If it is refused, warn and fall
back to the mask used before 614f4d166eee, so that the device still
probes.  Platforms that accept the mask are unaffected.  Where it is
refused, 614f4d166eee never protected the device, it only stopped it
from probing, so this restores the behaviour of kernels before that
commit.  Warn when a status block lands at an address matching the
pattern described in 614f4d166eee, so that a resulting TX timeout can
be identified.

Fixes: 614f4d166eee ("tg3: Set coherent DMA mask bits to 31 for BCM57766 chipsets")
Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
Link: https://lore.kernel.org/netdev/CALjTZvYKHWrD5m+RXimjxODvpFPw7Cq_EOEuzRi1PZT9_JxF+g@mail.gmail.com/
Signed-off-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..2cf9d2ea069b 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -8867,6 +8867,13 @@ static int tg3_alloc_consistent(struct tg3 *tp)
 		if (!tnapi->hw_status)
 			goto err_out;
 
+		if (tg3_asic_rev(tp) == ASIC_REV_57766 &&
+		    (lower_32_bits(tnapi->status_mapping) & 0xffff0000) ==
+		    0xffff0000)
+			dev_warn(&tp->pdev->dev,
+				 "Status block at DMA address %pad may cause TX timeouts on this device\n",
+				 &tnapi->status_mapping);
+
 		sblk = tnapi->hw_status;
 
 		if (tg3_flag(tp, ENABLE_RSS)) {
@@ -17756,6 +17763,7 @@ static int tg3_init_one(struct pci_dev *pdev,
 	u64 dma_mask, persist_dma_mask;
 	netdev_features_t features = 0;
 	u8 addr[ETH_ALEN] __aligned(2);
+	u64 test_dma_mask = 0;
 
 	err = pci_enable_device(pdev);
 	if (err) {
@@ -17895,15 +17903,22 @@ static int tg3_init_one(struct pci_dev *pdev,
 		persist_dma_mask = dma_mask = DMA_BIT_MASK(64);
 
 	if (tg3_asic_rev(tp) == ASIC_REV_57766)
-		persist_dma_mask = DMA_BIT_MASK(31);
+		test_dma_mask = DMA_BIT_MASK(31);
 
 	/* Configure DMA attributes. */
 	if (dma_mask > DMA_BIT_MASK(32)) {
 		err = dma_set_mask(&pdev->dev, dma_mask);
 		if (!err) {
 			features |= NETIF_F_HIGHDMA;
-			err = dma_set_coherent_mask(&pdev->dev,
-						    persist_dma_mask);
+			if (!test_dma_mask ||
+			    dma_set_coherent_mask(&pdev->dev,
+						  test_dma_mask)) {
+				if (test_dma_mask)
+					dev_warn(&pdev->dev,
+						 "Unable to set 31 bit coherent DMA mask, workaround not applied\n");
+				err = dma_set_coherent_mask(&pdev->dev,
+							    persist_dma_mask);
+			}
 			if (err < 0) {
 				dev_err(&pdev->dev, "Unable to obtain 64 bit "
 					"DMA for consistent allocations\n");
-- 
2.52.0

