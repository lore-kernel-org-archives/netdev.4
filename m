Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771347;
	b=3yKJQy15DLp5HXaN/AZSLnJ4S6PmKaj2JFs6fTdP98g2hNfYPahdOIdR7sV2i5lH5Mkn
	 CjcIdyCOojL3rvqaAQL6/F3QJYppdNtyXXew+xCEEY4VCQrFAbnijmGtKByc4A1LYaxOp
	 K3VyMw4EyQPlXX93HlPgQS1XZrRom6NCttSI/CLES/sXZa06e1GiERn1sjB6gyYZboSSl
	 hGLYk6S5K4h/BWiA9GxFjE1QObge+7LFSg/48p0R/j7GUuX8yi1YZVmY2nsjkYX5lcMFd
	 KTsT95ofi8Nttq/H6jEmKvIAMiosAacJW9NLWk+pY2ZUi97EFjLPHq/pZ/E5+CJVLAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A71Vxm6qPP+187+TkTcZc1nFho9ZnzIp6cYrVgpdGpg=;
	b=ztLPe2blghXSodv60n4y2HC0SOdo1rg5rEWZ7bt3/ny7qqdoK+ps0h1x3hnOpXNLqkjW
	 DYYPF+ErWAlMjzqlThxTiI4Hn2GNbEarPESj9nC3MZLSgP32EFqoaxsg34QaP+aHC1Zxr
	 HszA5FvJ5YgTzjB1WEPflN7YDv93ykEU0FqkXDRWV3vr9GaSd6Gf5saew0NtjnSmfOYz/
	 AvIYhXJA023OEXHPUo1IYpRwwO+peM80n03T7wEATvy++8estQXHnx8qCmAnr9SNKm1YT
	 lIhK4+f1fjl/aPO4YsD1mG51h4/V9Gr0hNu8ctOIh80S8oy3SJn09a/pbvaV/h4+CZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BnRr26k3;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D4A606A336
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D4A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=BnRr26k3
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d21051042so464937466b.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771345; x=1795376145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A71Vxm6qPP+187+TkTcZc1nFho9ZnzIp6cYrVgpdGpg=;
        b=BnRr26k399RsdMOHX5eH/Zxcr0/ZNWhSJ0dtvkwH/YUqVso17JVwuWk1gH0B4garbK
         CT4nnq3fpTI51stp3EpGM4ZB3aWoRlNcp61ZHTZN8jhjdzHyVYGEWmjPN6swd2ntHS1N
         IrvOiVM/qhoMax+IaloSB49L2W7FBrL5BKiv+3opc3jBBqBi1gHuJjX2PIrLzttChG5b
         Sbw5Mcq5pt4lIWRFGkV1T1UWIszVEz/BmZ16V8F8KDopQ86V/X1nR6fjdEoGmpCdiQGf
         aZm8HUU/D6yE0d/cvyGR7WzYuI2PEDBopzxMP3qw5vZW2z6gc+mjZcUnn+XHfU4lfsUn
         swyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771345; x=1795376145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A71Vxm6qPP+187+TkTcZc1nFho9ZnzIp6cYrVgpdGpg=;
        b=L5bxAdg+Ce3bVnlUflHRIFTN7Ku5rYfUSEKkvl4RtvVsxCg2J/X4sslLw+ER4hhtY+
         SomonUW36wiPiGaMZy0qRPRjllqtcevzuYhtCdps1SLJRWj8HISdCjkYXsgyshdX2Y97
         HJjhYtvmuVy/ojcnI4AwXVebYyvGjwQ3NVnoVgOKRCvY/+JQbGUE7YXgILEkTDxPkuOf
         S3mbxCBfGpYiK0832/BD0Gx4e8aKYZ6buu05mz8EtpnD1pncl+d8AVHsqfVd9ccaa5pJ
         pB/lg6+rDIe+2WFHn2Y3rBZdjISs+JhW/N9W94Sqa767PYZNsyHzoEyD/6qqEMsGQEXR
         Bcew==
X-Gm-Message-State: APuU4Z+Ym10OSFRZ+hwdkRmPmyk8rCAkvCPDI2P+O7i7wsm6n7neyH+p
	tYnmIhOZNjeQIFvE8KECWwuQVtKLSqJjuygLb1N1dQpVXHgOEzrJyCbVfY/1oqZCh0faGUiiZP8
	jxB9mw+w=
X-Gm-Gg: AYBFou2fS723MeVgEAsyappJIvvNG28JSe2y4htcxbSkijGxKc/heFGZT8i4FBm0WX1
	VAF7pJAbuY1FxAOur5SImLvb6UpzR+ZPe2xLUOuQb9gd/pZqxs9gVUlG2zkvRUPcv0NLBbpS4BO
	QGxf48omr4UQIbIy1lqKD0FjMKqwXKgfBtkL3xxq15VYIa/zUmiJZnQr27/p/J1kGfNNzKVldlf
	V1IZVhL3+8D33RUlE1qFc9VPeMb7dKGuyZohOPw+DBqOK+MkOxDsFooYzau80eQ74dMusJqyYHD
	ipdd6xGRkwfkoD8yHLiz9FxVwFw2Sdrdek7Vh1Rf/TrlmxorWKqkrioWzLizhFq/XOj4PaAGkzX
	AkD88u3dTGOkzfLngaG13c+W4w+QMxkVrS0W9P5iut4XWGccDmXTSy4MSYSqrXwzUTfL5ciBYOW
	ZZwVkZIMRJERVqmleTadm/0MSiJFneT6+RJ2t8Aaw2IYcd9D4HC5MXGv3ggSieZmpk48bUR3ym+
	5ToqRUQGOnlalYIyWLNNY6bk4G2WexA9Ra+CLxqHNRquVaw5lDzXu+cj2gDYl4j92z5b8SR4b6i
	MIiCwn+AbBOLcVkhWsxpOqcuEAyUvZ9FHX/taFsZg5RRPH5BBR7L5mraWw==
X-Received: by 2002:a17:906:9f8f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c50963cf771mr650243166b.42.1794771344781;
        Sun, 15 Nov 2026 11:35:44 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:44 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	joe@dama.to,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 4/5] veth: use persistent NAPI config
Date: Sun, 15 Nov 2026 19:35:30 +0000
Message-ID: <20261115193531.57679-5-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115193531.57679-1-tianyi@cloudflare.com>
References: <20261115193531.57679-1-tianyi@cloudflare.com>
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

veth deletes the NAPI instances on link down, when NAPI is no longer
needed for GRO or XDP, and when ethtool -L reduces the number of RX
queues. When veth adds them again, each queue gets a new NAPI ID and
loses its per-NAPI settings. An AF_XDP socket bound to the queue keeps
the old NAPI ID, so its busy polling stops.

Use netif_napi_add_config(), as Documentation/networking/napi.rst asks
drivers to do whenever possible. The queue then keeps its NAPI ID and
its settings. virtio_net made the same change in commit d5d715207e29
("virtio_net: Use persistent NAPI config").

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
New in v3, as Sashiko suggested on v2 [1].

[1] https://lore.kernel.org/all/179470883411.2199510.13825316417997386083@kernel.org/
---
 drivers/net/veth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 470c4f95e4a1..1c7ee3bf65f0 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1057,7 +1057,7 @@ static int veth_napi_enable_range(struct net_device *dev, int start, int end)
 	}
 
 	for (i = start; i < end; i++)
-		netif_napi_add(dev, &priv->rq[i].xdp_napi, veth_poll);
+		netif_napi_add_config(dev, &priv->rq[i].xdp_napi, veth_poll, i);
 
 	for (i = start; i < end; i++) {
 		struct veth_rq *rq = &priv->rq[i];
-- 
2.56.0

