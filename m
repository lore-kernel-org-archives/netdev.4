Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570736;
	b=zgBf49vz+u4+JzWQeBdjLyiViADfaYFf/wRJru3Vet3F6ikXavvKyyxAi9TSFxvVrTlv
	 CNaOk5ZOQ6DGK9577Vm4GZc7IINeOq/syiD8S+U6QICv2CX2H11QRWdw9iQzHJNuO6QnX
	 g7irIqIJUnBvqAVbTT9IS44iBA53pK6iAWFfYMDK0Fzs4THFnFLRtJXfvPbd7qShuMdyy
	 cWlQR2Q1FihPQiCDshON32YiGTYQ8rkd9iETjU1p0LNZfaW26CpxhQnuA/8vox977W1QI
	 KJ0VasNRC12NDbU4dBkVcKGrtls9aL2dISHKCTbVgPb/fnK6Kxd9sMmzElw9dY1gVzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YDIcmu9gZok4T9RCCwjzEyzCUipWYiC3bM6Ft7AoXiQ=;
	b=CXoSBclILzy0KXNnIkMTSJtx2mmvwsotss5qSLdqPsT6YVUyJXH214qaH8tDb2C59UUQ
	 uKTVMt9j6Q6MUavYIYVjKAJMxj8pR6w9E8RVzuA3UD81JCVhD/yl/tW5gLhCeH78pcWGD
	 Fq/2FUZKsiKXWTTTA/1ZNpY9uxYGNcGxO6RhZTRW+fzAvxv9nwLxYViMLJSzCFHDrxMeC
	 AxmjKX9mHNkCRPHL3FYPLs+aZcUg7E1ZNCRlSY2UrHfWYJOzIb2JCMFpdfpn5c5CgEYV9
	 NipLle8w1dZ/TdXvDcnGGIjN6BJu/fjBl2QaE6gCtmeC92ngTgvEzMRt2bBgrPnicaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nQ3cYOFl;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374D606A330
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6374D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nQ3cYOFl
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a05b210703so2438547b3a.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795570736; x=1796175536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDIcmu9gZok4T9RCCwjzEyzCUipWYiC3bM6Ft7AoXiQ=;
        b=nQ3cYOFlTRFhcuSLIWlwOPuC2LQzGSEZw3kz3m3DYrwBMqvQH5vLebKCVtGmpzqd8j
         VwFvgPv+Qt5BK6J7fGTGjiLqAW3WgA8fQXWviz+3ekMnlQ8vJU1tRVCjP7zSds6sne67
         7ZljZ/RCRZ7lrmaEIq2tDJNR1LvUeupfzTHD2EGted1iHScyX8uiPSluADAdJsVYE/Ri
         fCRdU7t/vJF4aNTmF4m/BUbaob2qqKTKaX/Kx1YGhKxzRgbxNB7NQUIxsRBlKYaPglqF
         8e42LJFvRXkxoTXx6jtCSVL8p4Pu+5/BDZ05mA1TSO9lfp4RYzMHusEuJnnwlcigTNjc
         in0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570736; x=1796175536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDIcmu9gZok4T9RCCwjzEyzCUipWYiC3bM6Ft7AoXiQ=;
        b=joChPaw98K8RiSE2T+H3MwIT87f+i9MmuDk9krOthtxkul68AF5gdQw1MEsidCp+MQ
         yEsazV9BWhFtmzIS+okMRGl/BLb6DyzRMJySrCInn69iYXdOkP7b/oYjBcpyQ85jcVCQ
         KOpF2HDOtSppu+wstWPiWrt0NiYROmgxXoa3DTqI8zCF6QQiBNuhpuegBiDhc9q8+cc1
         T1T60FEOr9ItxXpZrrQxO3nxmgGl2JpE2qbc0NKyrl6F1AXupVs3zpDNylIsiVEdaNsN
         4rHOYHEbCKeoslxq5qHJ9MvsaifYTd1ggcPOtqCxEZHXsTLpDYwxn3EGhkpUMc4iq/1C
         yi1w==
X-Gm-Message-State: APuU4Z+zQ5mDfPlsPV1AUYg7E8ZH4lQgw3JNQtCH5d6qygk5XO9208Oo
	LM3DT2LDeuRDO25X4E++mbJDVXOarT7jWTyW09/CVyvVIXoHuQoec1h8Y4Evb9/o9D7bCFkxYvI
	81c0m
X-Gm-Gg: AZFdTZfg8q7dgSNVUhZgq6ibqwQRfu13PNEedzMTYXIXB0zhNSZ8lgo5O6pkL94ojxm
	bu66N/E6yeb1/yK+b0owfP2RQj9m7t4sFC1fKnFHwgrK48F7JOZmU8Ers2DJM5rv+bR7CojyYAj
	fS4Ap7ErJdgWPeyeT7mOZob38qjgTY4SoCqRUzpiCsjrMKK+elg6tRwfMKwapHJODruZuJfg7yy
	w4gduTvw0aVw3tgN56ZOFpquaOkEkxYJf3YtWiMh5wOoFw/RPXHnbhM4h+25JFHOc1LfjNOdVIG
	TrQCI56D8Or5dU7fs8lXi0eYFWXYKs0OHX/74ha5wxLsv3s7DPESs7eAL8OZ+CygVfcGVMP1FZ3
	tbn9daMgpTsZsqJ5O88BHip1LfpoohMpFRNN71lT8BaV1bcgF+q+M06rr6pv26qhCHXpLPEmUKQ
	kOzF3H7WxyRzChZnluKWuXK28NtLLHfjVkZfQxrOEgV9/RIpXya4GYUjIPm/0JTMPxsQ7s2LlFI
	P0l++JHDTmdhqXftaBubEiJFwdaAAVLkANki6GrHCz3KrSqfMViN3VMAZtZG0yUXuCWqSd77XKu
	VybBHvOuZfRZWG8jmdfeeZ4T1VDJvyAzPueyKJlgBPetxe1BubEXglPL1edJDC9/
X-Received: by 2002:a05:6300:8095:b0:3e2:83d5:191b with SMTP id adf61e73a8af0-4014c25610dmr14554528637.63.1795570735677;
        Tue, 24 Nov 2026 17:38:55 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm8133696b3a.1.2026.11.24.17.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:38:55 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: edumazet@google.com,
	horms@kernel.org,
	narcisav.kernel@gmail.com,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/2] selftests: drv-net: uso: add small MSS variants
Date: Tue, 24 Nov 2026 17:38:36 -0800
Message-ID: <20261125013838.3823834-3-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125013838.3823834-1-joe@dama.to>
References: <20261125013838.3823834-1-joe@dama.to>
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

Add small MSS variations to test paths in drivers where small frames are
sent through different TX paths.

Signed-off-by: Joe Damato <joe@dama.to>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/hw/uso.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/hw/uso.py b/tools/testing/selftests/drivers/net/hw/uso.py
index b0936b6b2161..be152d36cf3e 100755
--- a/tools/testing/selftests/drivers/net/hw/uso.py
+++ b/tools/testing/selftests/drivers/net/hw/uso.py
@@ -92,6 +92,8 @@ def _uso_variants():
     for ipver in ["4", "6"]:
         yield KsftNamedVariant(f"v{ipver}_partial", ipver, 1400, 1400 * 10 + 500)
         yield KsftNamedVariant(f"v{ipver}_exact", ipver, 1400, 1400 * 5)
+        yield KsftNamedVariant(f"v{ipver}_small_partial", ipver, 8, 8 * 10 + 4)
+        yield KsftNamedVariant(f"v{ipver}_small_exact", ipver, 32, 32 * 3)
 
 
 @ksft_variants(_uso_variants())
-- 
2.53.1-Meta

