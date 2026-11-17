Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952467;
	b=HzWVLkZeQMSASS5GOV0Paw6Rqa4GwoLyoo6/nvwhZdWQZTunqy4UtAQ2eWwMQno6+khk
	 msVvHAyC4Eqje2VpaYFEHGYn5E5WHJpXplbY3AREXRBEF8rAUVfXK6MVde6BA2XE22bFj
	 hOVpNgvioPBPH317+a5S59LPAqLDe7p31CR25Z3zPO+kfAfeu2nRoHfesar9gLqSsaMFf
	 EGkO7jMdIJZypF6Vk9pXkcadVV3f+TENhq2xhVrbhLCDrmlySxT+Hj1hmi6XI4U83lSrY
	 lZvdRKIpYCJh1iDf5D3QQltug8eFxGZG7EDWRQ7Pqc1095nBxp4fWBISYas7qJX2M2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unHyNeWX8PX1jyirARf+iKrxDFRYbbmelnAqb9Mc0co=;
	b=E7pOUog2fYQRx2X2qGWvxFgc8GNeD6nbzYuaswbIPy1uJhC7neDa54Nr0YqS6erme8g5
	 DtZgzwasddWfpqVx+PVUbRUQvLWsfkvp23w3DExRzvOpwn5imztiPjAQaniZbHTLRlmJk
	 e2IVYfM8KwBraBbJ7HOgFrRrw/l4EdRy4VunGF82Z4n+9pLFIpAGP3S/cEqAO7+Cor33Z
	 6umtIOLqM4ZXdkx3UO7JYKJLYC9jrEF4epP2cRv5TB22G0getttxT6EPO/sRBQtWTEU9q
	 zEm8iH0X9PeEieU0tMNfyR9ZOcGNHj6+XSWM++b3NwvxVbDZ+OYR0OlidyptfbVJ7cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riBjzB5M;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2D606A331
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F2D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=riBjzB5M
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso268600a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952466; x=1795557266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unHyNeWX8PX1jyirARf+iKrxDFRYbbmelnAqb9Mc0co=;
        b=riBjzB5MVLmRh3b1aBuzUIyK3vQW1es77xK0z8CytPctKTSIfvXk0K/rNw9u+Hgzr+
         kVuDVQ/19TWUs2FWaWGrF/RmBLI6do4qWvlV71Pi+omw9UZavtXCuQbDW7pO6ZbsxKqp
         aZ2mA2arpJrAum4A6WZy3AeittLsfQqAc3q1YFvL8fdME14wF+eYBcWOwXm/+ovmf9/S
         ZDwnz84QSnb1/0EaY7/2OIGDQ9PyCVdEiHYk1cQq06H2TnjS7pOGMPnrmG/xGuXy/WXo
         UJIDHDD0P6RpqkRymrW9yEStG05syQGCwKxSfQ0IOJoZMLTqBEtUVXqVC2MKoAdG5xNY
         m+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952466; x=1795557266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unHyNeWX8PX1jyirARf+iKrxDFRYbbmelnAqb9Mc0co=;
        b=sRP6L4qryF9uy0cHwJ9I4AdyP/zcSs52X1DJoHnDZGYaE10pbb9iBloXeH0KyNLpmU
         rPjxlU/AuvJ9xhyl2cPq9Qi/5Nj21yaXragkxEqKNsHfL6b3W+3i50pFCZwvl2vDA92k
         hOZkFcz0NQpGrpq86nhWNToA3+s8fSyRctJv7+xN0gT1H7bITEv66WZCnVwO4N5KDSHC
         8KWQU/BI6ihR6SmFdxP849Q9oHDVTugxH9hCFf1U10F6lSJa4Ch7Z3eDOu8jeo+DyP53
         biRSf1jYmh+eXskAEQ5oGyrcNsrciMN42Fu5JUGSqVRVeqPssDXVIvgu64OYvIE20ToC
         O04Q==
X-Forwarded-Encrypted: i=1; AL+hErFUK2kC7XgXNe5QhYDPTN6jpoxmyGWKN8GgRqdUP67yQZ9FavuevkKvcW97Oxz5d2dBs52FNfo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8udXjXB/MW9dA63aB39cM183BlGKyTxWJsn00S3Cr4mB2zBfYI
	A/rMeg2ehdKzIDexPzlKaasE2nZ7oOTftVprSC3B72LAUb9gfzZm0A6k
X-Gm-Gg: AZFdTZdj5XcFbyctFdK/Og04VS0oXfEDkkDZ7meqWBz1QDUAIugT0kRwFihho7syI+H
	lgBBgEgHvOh3ACKmdpKPzTZJScc+Y596tL2sXtpXP6z/zUhYFpeReyB8BXozu9HXfXxZSlJysr0
	7bJuALpWvd42GLnSYuZO/DGRsl6DEwGKzjn3MUV4/3QZZZUwV7UKy4oImm7TPgHkd1nQ9ExKiSL
	usCxBeKOoqsDu/SQUvFiSvykympeGOE3033RGlz7UigfYInHNQpjHefMkeDeApz+X5je4c4Cx51
	6bG4dyvequuJb0WJoaRZ1wcTfkBRGet5EbA9czSC3fqB99OKl2oLFqvYHlPQCMTEKt3JtBPghhc
	2/n2lMp4nMqTu+4KxAhAaEpYu9G73ijzOHmVEsMbs+TsJILi+50mavtKxprmyxAXastxvCfz6fh
	ZFANUtu0AF76Yse5SWI3JE+OXCPjrJO5PUGkG39LAdrnJQ8AwNg9wuHu5X34/2WVc026GgX4qXM
	BVR6TvyRwmLW5snHuDfogG7A172ad4jL/TY3ky2hOK9n10HHi9xyRe/Pr0THXqap8KV6SM19qvE
	KZrE+khnz7r5rVDU4PkDfnnON3VXSl9tl6g=
X-Received: by 2002:a17:90b:4b0d:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b3d0759d9amr653141a91.14.1794952466153;
        Tue, 17 Nov 2026 13:54:26 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm732056a91.10.2026.11.17.13.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:25 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 4/5] netdevsim: report fake timestamping stats
Date: Tue, 17 Nov 2026 13:54:15 -0800
Message-ID: <20261117215416.1901246-5-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

drivers/net selftests can't skip on netdevsim. Implement get_ts_stats
with fixed counters so the stats test can read timestamping statistics.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/netdevsim/ethtool.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/netdevsim/ethtool.c b/drivers/net/netdevsim/ethtool.c
index c3d2bc783d55..e0c4c96209c4 100644
--- a/drivers/net/netdevsim/ethtool.c
+++ b/drivers/net/netdevsim/ethtool.c
@@ -205,6 +205,14 @@ static int nsim_get_ts_info(struct net_device *dev,
 	return 0;
 }
 
+static void nsim_get_ts_stats(struct net_device *dev,
+			      struct ethtool_ts_stats *ts_stats)
+{
+	ts_stats->pkts = 3;
+	ts_stats->lost = 1;
+	ts_stats->err = 0;
+}
+
 static u32 nsim_get_rxfh_key_size(struct net_device *dev)
 {
 	return NETDEV_RSS_KEY_LEN;
@@ -275,6 +283,7 @@ static const struct ethtool_ops nsim_ethtool_ops = {
 	.set_fecparam			= nsim_set_fecparam,
 	.get_fec_stats			= nsim_get_fec_stats,
 	.get_ts_info			= nsim_get_ts_info,
+	.get_ts_stats			= nsim_get_ts_stats,
 };
 
 static void nsim_ethtool_ring_init(struct netdevsim *ns)
-- 
2.52.1

