Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794639400;
	b=kvT41R3hLfHyyYPbATifIUuFnNslSw1J6rpy/2DJwo7vYD5bu65cXJuGG3vVZaEaSuGL
	 8pxqwVuQFA6JFvvnnP28XziP74Ct6Lb0YIdPeMEpmnlY+SmZ2vUJaVBVXjDaFoq+e1iYA
	 OYIjXCP2IFiVYOy/nhtN0RKhmfE2FpkWHV9kcw33XbtF416RnG9xMp8IWPp5KvwHz8aF2
	 oNFaM6ZFu4LBmlT11B9efWwvS8MKxmP6iw3b6PiJlYLjS8SGMPrMvGAalUby1iAeC9vX/
	 tBQhiWdHP+RvlXFYrCUlWJJydgs0bN/nmcI/qk/Dm8L6BQeb2JHD2Uaeo08kGDFoVfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PlniPGYdODpOyA7WCNg/z2NIsnk5cnSmd8ivjObyeow=;
	b=ahi88LQ8aXkFNCgkj3/51/4dDAVFa0IQHlngcUD3bs7mlOPSFMcIYXsvTfeebb/22e5T
	 nxYEZJZ2I0wT3IkIxw6zP3fw9gtXI5yqs+6lP1xGFjrNU1DuqJwq8p0bZIbZHbvZ8fEmV
	 0dQsNFjQQeqi9okGJDFKAmVkEIzl/GS0pMHS75lY6SkgNk8poAEVgZUhHQoKzfr15Tb9e
	 gX9JPHCycSoGpvP8uUMr0q9PzXtslkdix/OWrRt95OLZhBHzES53uzVA02r6UXXGB6H5A
	 dj50hDo25Wutm1TRLxJg9xsk/XXlzPI7oXFljUVZUp2OkA9vhfDtXaBR7774GIBIZbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/CYU5sc";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F6606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B10F6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/CYU5sc
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49465892f7bso1551965f8f.1
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 22:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794639398; x=1795244198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlniPGYdODpOyA7WCNg/z2NIsnk5cnSmd8ivjObyeow=;
        b=D/CYU5sckFNWJtk9pOfgY+Ua5rQ9OFU+e7T7prulCVrpqJHZIDS0AX4JXkeH1mYhZx
         PmK5djHG80hLRahbd/s8M1loRI96PIO0DZqZr8pY9l+c/xHhyFlO6sCHup48H5aeVHIx
         QIvZF6GwCRPUXby3wyDotmzqteqTWfA3fP/zA0TesOdUhE3XMqhlTGUDpFRwVcTuNMYu
         cpZtRn4R4L8Tj2bxckZkzzWzM8g/JpTFF5+61Bm4srlN+EKFX0QrMkTfLIQCp6PUE24C
         fhMPZvWf7talVW0jGgPiykhPfxgkous2PD0lhANEBupci2gxz+OC2PoIbBhBAF0Ec1SG
         YI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794639398; x=1795244198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlniPGYdODpOyA7WCNg/z2NIsnk5cnSmd8ivjObyeow=;
        b=SbRipz/HEeBl/lJKk4Kp12wZHGN1SWpoN3lOVWdvlyvuZKiMerdrNUqiK1+8SK+FiG
         +R8TuU54V7kyDqfJslCPlL2fCp13SMU3dehq7R0sTzDleBIGKiCE/Fan711GlTCBNRIw
         J/FO9FhQvngU3VrajTdfI39aLfY2TTGOqBH3aXcIxEzvhnw4Dcv9qxuhHveZKIS5rbQd
         shhv1wqZg84XiTz8veHCnLW0/+3SYiYGxtxByOZq6DSjM2Ee740wG6DVk/AzGRisndDx
         5aUXcRqbICrp7BmDSVkRGaR6NVyBqUWB4WJNr8inuybRKT0ugi74NQX6DgZK4CmMXEgF
         m1rw==
X-Gm-Message-State: APuU4Z+RsE2uFYNXAQwSH613SrXKR9r6oOyC1aZFrygiENzD2HdZQyEK
	KbFmrSWfgHFncJkbJzgvJFpyK9RDVR6o7qxUR/Vy48c1MUsC7B8JnP0IOcPnWg==
X-Gm-Gg: AYBFou2OL2MRTevGrkO811TOTYqCd2LFsDc4gB23pRafZmQpQmoRyP9e5Yoln3TKYyX
	KTXe1VQSAtFBtrjDzW+1Cjjt+Qq7YMMrzncdlRdgWIK+zaeNQO0rBKteblGEpPgJB1V3Gk29aQV
	DyrxokAUc5Cx2n4elnXWO/YTFClbQkDSjTHLbjttwa18n9m8IR7IDA7mfDxcWLbNJUT0aKau+Go
	JgPtq1Gpe2QQRXXtmljzPyLC74fRh+SWPYGgKe76BgFT5YSCPLR6KtcfNIW5Y/CrAkcM/eanUAY
	pUBIodoy0rvwzrD+u5bmV13VHpLQC0lBpaD0FDh2EQvI3dpxqYdfTUuj2wLugH/NxkszA4k4qnq
	jXSLCx68xdzrVX8Z/ZJLOqY1oSJKBtbFk419hpvufPCQdEe33RIML0ytecjTZEtNyZql8M4AIqH
	tlNXNTanCpn5hExm6Cc0UDfKqSGw+xtWXKow3DlOpw2mRNDQpDwRLar8kTi58anxeLHZcQJhdZd
	+zZa73ukiCpess5Ibi7asB4GnlBBdgpoDNL6e/DU18AuhQ00AQW8xV8qqXbMvyLeZ3krHHaB/GX
	EReEp+zZp4j0lCX2M8Av+hF8ClOpx1sJK1aO
X-Received: by 2002:a05:6000:1a88:b0:493:8704:ad42 with SMTP id ffacd0b85a97d-49c6d63fbecmr10525488f8f.7.1794639397831;
        Fri, 13 Nov 2026 22:56:37 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:54bd:4677:5a7f:ed2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm8941965f8f.15.2026.11.13.22.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:56:37 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: netdev@vger.kernel.org
Cc: akiyano@amazon.com,
	darinzon@amazon.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	evostrov@amazon.com,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH net v2] net: ena: avoid double-counting TX DMA mappings on failure
Date: Sat, 14 Nov 2026 08:56:35 +0200
Message-ID: <20261114065634.488832-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ena_tx_map_skb() increments tx_info->num_of_bufs after each successful
DMA mapping. If a later fragment mapping fails, the error path adds the
fragment index to this count before calling ena_unmap_tx_buff(). This
can cause DMA unmapping of buffers that were never mapped and
out-of-bounds access to the buffer array.

Remove the extra increment so that cleanup uses only the number of
successfully mapped buffers.

Discovered by comparing the in-tree ENA driver with Amazon's standalone
ENA driver.

Compiled with W=1 under x86_64 defconfig and allmodconfig configurations.
Fixes: 38005ca816a7 ("net: ena: add functions for handling Low Latency Queues in ena_netdev")
Signed-off-by: Evgeny Ostrovsky <evostrov@amazon.com>
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
v2:
  - add Evgeny Ostrovsky's Signed-off-by

 drivers/net/ethernet/amazon/ena/ena_netdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index 7eb6456ed0d5..e0df628e1df6 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -2608,7 +2608,6 @@ static int ena_tx_map_skb(struct ena_ring *tx_ring,
 
 	tx_info->skb = NULL;
 
-	tx_info->num_of_bufs += i;
 	ena_unmap_tx_buff(tx_ring, tx_info);
 
 	return -EINVAL;

base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.43.0

