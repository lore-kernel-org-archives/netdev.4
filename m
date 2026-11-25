Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632405;
	b=BPpwZJ6O+HRoS7dGtRvP4reFs7Eyh0bd9VgO5yqebp5aFr+ZUsUdBmcBnteV/lYF+6gq
	 t73o6qDCWb4+xm23C2Wa/7eBv+lbi7OaxGdAb5Tkero+z2X2Mxtr8zNDW1ULrignyD1ep
	 pcoBntJ8eWpqUUZYfukh/eF+rJWYXOBzZ+hexLI++6WUUjZ7VRbGVueMSpI+JCjIb+gnb
	 ohm43B1aS6J6T3++mC7HNsd0nNC1Ti0HOKAv7InDbrOmabejP62D1rvK8eSbut4qgdg07
	 /wh+WUZBbF9FFVSHbcx32fktjfaWiVxFXeQD3C7nXYfCSMfEVsjVxT1yDyqJ6PmzKDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nlXgo9XIqJkHCFxu94kRbXHgwwOM/0hHr2hEt1w28IQ=;
	b=1qW1d2A1bnnr0IZ9wdltzclZajK9/BbbFc9pWinUOmKN2LHfxLrCVawicSEZlVZFZjs0
	 h+oNln4VO7KX00tDlA7Ps609w5m5/EcOJ40MaPuuJma25gAvAovoPyiYkaQtEQmljvC91
	 aKsWU5KvAnzcInsc61Yr9a8IpAlIz486DAQoU3HDOQBECid1rqGIGmb3Bx/ng1uGoFUT9
	 caOmhgnqGlAuP1f9jjI4ZScjVxAhZ+7VP1+K8LfdAwTi6t6zWb0Khaptr3E2Udr5t/jXh
	 IUG6y/PXsKoO6mgy3sZTIoqe/MACb/WjgdWG/kUdGpUMS5tUgYyDF94GGOtiaJpSh1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1SqUFdg;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC3606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FCC3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1SqUFdg
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38692f62b22so7278797eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632404; x=1796237204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nlXgo9XIqJkHCFxu94kRbXHgwwOM/0hHr2hEt1w28IQ=;
        b=r1SqUFdgtywlp6NtGK87jQIKzVZWl4F4rhmtw2lFuyqtW5LN80z0HdqMFC4lFxtzfc
         sPv4eFs6n8T7bTK/Y9uNNqWqxK1mnqOMLd1ofQxA88TSPdSpJqY5atzRQPqsV3Cnu0Kz
         xdMkDPd65NMvuX/yI/s9lxRKvbzxjxrz7nCG67nKPjfnov/so2vKenfxWXzXJV41RrRa
         /UQeQ5Fv0/CXsdcVZmci8NcFbJ1Q7asEHy8hTzkq+/+C8o+U3P2KSgycADkqraemK6x/
         eYiiJmsP4dj36xpRNEgKFxe3w2joSwKqW128/Cmjv43sSkRH0jqUBIVyHKkny1z9/9Xw
         qG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632404; x=1796237204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlXgo9XIqJkHCFxu94kRbXHgwwOM/0hHr2hEt1w28IQ=;
        b=IVZzGxRwWRpO18bA9EhaKXS9Ud5Cdbe08YvkxZ73HmfT0LW8BCXxkKHnxLyuZjsBYF
         agrfKpYRE2YAS4xumZWsam0C1JiHTy7NIC7GrH9PVGAB2+C1PRylPlWs9ibsRvE77PF/
         9kK8H62OIzvnzK30yIYGFw5xCoVlH5/pDdq2F8AmoCdH9NFWr25n6sqyimISohECflJR
         gu899T3QqE1nesSonEDpucrREUE0yjCIzox18HEZIWlNewMunUf4LmWXFnsl7nKA0fy3
         L4zLIrW1wEXUb4hdQ1KP6scanwWmMBtwWnuWLvkPBcix/aafgnQaHGt9V6ZX/zzehDg0
         /zVg==
X-Forwarded-Encrypted: i=1; AL+hErFzer7ANpvSp4qgGoW8nqC4fZiYcW2Rvp0p7LdP4FDR2hJL1VAA96Ie+w7wtLjlYq/EZKwfD8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+woF2m5bA2aRcnrxAdBF0ZWNr8EAfe/nB/4U3DP1NrXgzfkGzO
	QWbAeQMg+6U2Jr81yb0McWT/pSfc/HF+vP9zF3QRf4+RBnPeheEjjvJnduprVc5M
X-Gm-Gg: AZFdTZfb3U8VxwwO0k2KyBgtwjLCvI7kxLrJS0CJRCrnXyPgoNdjSEvR8raBh1D9vjc
	Q4yZfFig8sVTElvwnjy8msSOZ6Nsx01qV49iAQm0WclGgGWQio7J28KmdrcL20pMV8HdFPlPrHJ
	zm40QNJwVzEpldwOzg+xQlLcLB5QPTCZxC9CgdA1rOF+YPxOZN7mGAVTK04ftM6xcp2ZKdt5atJ
	iHgogGjq0GwJHpJa8Hv3MAv2CETg1gdGfwOz/6CZkDHkbUJAdESBOscXCjDO/IbxM7mD2rSHEfu
	wVfbhFBbYnK8Mau+07TWPd6/uvs7t+XlEEhojIIkok+TtsnTI5+hMEOUjce4w6WrFaHt7Vhubwc
	b4DdxHDfLLdyvofMwaQa0RPJlDOPD2ksef4t7b5xKHHF+8mPArcFufN95ekCljWZN38fE8FUpX1
	XkivR+dyFN52Vagj8kwoToBneaD15wsS839LRSTF5CEvC13+T3IygL9u3HTtWp10MTT4L+k/v1e
	gLkKNCOuWvLxD3ZpzPaSFRqHGE5YuFioyeSEblthYz+8G5Q2Welj8wOllvlOnmPKpJmiHD5jJqN
	lZarYCMz+tZu93sFB+nzumLeXFo8upAJTLUHPOsqhQ==
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr16448894eec.20.1795632404041;
        Wed, 25 Nov 2026 10:46:44 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm57691480eec.12.2026.11.25.10.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:46:43 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] net: page_pool: Drop fast and slow from the params kernel-doc
Date: Wed, 25 Nov 2026 18:46:40 +0000
Message-ID: <20261125184640.2407270-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

struct page_pool_params groups its members with struct_group_tagged(),
so fast and slow are group names, not members.  kernel-doc does not
expand the group, and reports both as excess:

  Warning: include/net/page_pool/types.h:105 Excess struct member 'fast'
  description in 'page_pool_params' (did you mean one of: 'flags',
  'offset')
  Warning: include/net/page_pool/types.h:105 Excess struct member 'slow'
  description in 'page_pool_params'

Each one is reported twice.  Drop the two @-lines and say in the
description which members are read on the hotpath, where a reader of
the rendered page looks for it.

Verification: kernel-doc -none include/net/page_pool/types.h prints the
four warnings before the change and nothing after it.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 include/net/page_pool/types.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 6d543076a0c0..5306e34105eb 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -69,7 +69,10 @@ struct pp_alloc_cache {
 
 /**
  * struct page_pool_params - page pool parameters
- * @fast:	params accessed frequently on hotpath
+ *
+ * The members in the fast group are read on the hotpath; the ones in the
+ * slow group are read during initialization and by Netlink only.
+ *
  * @order:	2^order pages on allocation
  * @pool_size:	size of the ptr_ring
  * @nid:	NUMA node id to allocate from pages from
@@ -78,7 +81,6 @@ struct pp_alloc_cache {
  * @dma_dir:	DMA mapping direction
  * @max_len:	max DMA sync memory size for PP_FLAG_DMA_SYNC_DEV
  * @offset:	DMA sync address offset for PP_FLAG_DMA_SYNC_DEV
- * @slow:	params with slowpath access only (initialization and Netlink)
  * @netdev:	netdev this pool will serve (leave as NULL if none or multiple)
  * @queue_idx:	queue idx this page_pool is being created for.
  * @flags:	PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV, PP_FLAG_SYSTEM_POOL,

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

