Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760462;
	b=Yog4gOv29Sz1fzRJhMV+6XcSQ7lhptTNE61snnQzDN8WxBmOptZd5uMvrxF44P7Lz/ci
	 0+aGkwFRXiW7a5cY6lx4HAsg7YnPx/Y1zxkxLsgch9c/G5N9tD4XcHTAX6S0f5mTOurme
	 z9IsRPbF4MeIYTrUOYKt3qdWxv5M9J8pA0Xj8BO0SehVPs91mQjdbmNfHWNRaYZiFldfp
	 mBCSIESJF5NQEHrBgSPAt4KPl+9xAZIQjeJ0GpDSmt+t57kCZGUHGgNab4YOkFpVQufBm
	 v/TTrHJwN0FLBb0YPn6tI+dmW61bbfFPd12nLacq82HxP3xQ099oJF3eADBaKiCHh4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JNnhF0YCD46n78XblQSH3Mo4cJq4u4tqDo6kjUj/5PA=;
	b=XxzrdsC7MlkdMKvZK9OnbRq9j3gZvCPHtjui+08aKQE7lRQj97E/J7sZd7TODHhq/c+9
	 cdZC9+ur8XR6SbOuVNQK1NtGVn2vm7gdHZqAzS3IP3hwoMPqgNlg7fsRz34IBe2hw4bP0
	 H+qGUeRUTUvGl3fbWFWxwHD29QyQUZ5gyGh7PqqeOPQgcYULWXct/XfjaL2JWRt3PvjwZ
	 h6n33stXPJZE8C+YEDsK4sY7KpDpz9darfmidr7JYtXzM5QIP/Xkt42GmZPr+KOET6rJc
	 23hYl0T1Vn32RcmNzme2+7dbrmm1E41nEvWcDMLGXjiWp5Eq35/d/rqQG0sUa2kq1sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=Zumk8Zxm;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E99606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=Zumk8Zxm
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b402824d07so5130112a91.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795760461; x=1796365261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNnhF0YCD46n78XblQSH3Mo4cJq4u4tqDo6kjUj/5PA=;
        b=Zumk8ZxmpQaeOjEFXgeOtHZCVlx6FQ0H+jglU5T/51EUY1Uddh4TKtSSpgzb+zaUFJ
         x7cKHm0R7aSDNKSn/7u34YreD7+HbgBqDEkVg0nEV9ogyNSHUTZwYhaRj+a8dxoZFEtr
         S18Q+hGJy5rijsEOZRzSjsWbIME9/Rld9Ue8JXNXueZTNLzi2ubLs/yam0UJtypVfC40
         NsbUepkQSAj6gGUHhNV6K1e04k8Hb1HnhKX7nr6PG4itFou+ICizXaRLfAhkvoqvTmd/
         Z6uiqHiCzlTRuo5ek9ka+SUQ5kCw05qxbw0Fv141saTPYMhUIr7ldY9BNJftrZkO4MFF
         ImOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760461; x=1796365261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNnhF0YCD46n78XblQSH3Mo4cJq4u4tqDo6kjUj/5PA=;
        b=sxEcGHEdfMxkWM1R5iPP5mXY1RtS0aBOvvVFUtwXLTrxuh8aBmfn9rlEq/iLks4tGW
         gRcKWJf1SZews7KWtbybd5qi+zEy1T0FRcBQYXRLMbte/DTYkEl0KNPZZdD+bMCG6+kC
         mIi/2/aetU30v0Rvh3uALwVtW/LFV38lPOIlNo1EGiaKYXBLNeUhrMaXUAOWhUNnSRfO
         dUM8k4yYnUErdgiiVIeGHPOC6i5C6MoewhpXKpnGpODo5QpPJJBeqAXoXeL5clVYiFRL
         uBQCGz9iBRfrVRD1t/9BLgyy1vcp1ta5X+BMI6O52W9qD64Gn8f/bPGFZcRjsTmd+G6a
         bvSw==
X-Gm-Message-State: APuU4Z+Q59/ZSNBKSxu2EkLZn2084Tb2NDUE8L2J5PbDH8/jBH2meal1
	wwjHHuXam1hrrlf7GqPXWbsjbwIH/rj9uT8cDMzOtJOkRjhMzPS7sq2qdjWL3gDJELDS0pUQDId
	M9bZfIQ==
X-Gm-Gg: AZFdTZdE4u/FB7mxEVWkf0ykj0vtOtVYtxL3xoAjJCyK8qLrtOaA3QPjnv50gd4bICy
	/SIMbyIgK+qFMPJIeYOeYfcSXUdMBZNLl8B0qHZ9REttIASbzt/AJMmrXj2sBPUijSHi1vxUYv2
	fnHlRCJ8kjzfA6cT3e5OUOQSJu2n2n7ZPuJPkS9Jr/5oqBMdiNTAORDb92uu0YkcrxNL0viFfLq
	QzCaSdCYc+spGvr/L3UvaFOhPCWSVUEtBtw3xp/YHHOuFrK7oqsvIkHobHH6uEj/sfkTGmGoqWC
	bYNqHTRnSX5FXn0+llPqOWwThXoqWardyzqMfgPbayczs5XOONU8FNtABUpPY2t9abt/I+isOD7
	94EFGZh2qX6ZG/1UhftXCgDIXROpY9eA/wvIIbwejyimF0xu9H7/P3rEzfcMb0UW4YDR1BEvAJ4
	HJo0n/41NOofEIdA5kDBjhXXiK+cPumzRsggyxsYkSLc/inNRYRnlSQkFSlH5TLqIo98DTbM2JT
	mK5PussfqKqAM/4oKRgeyj8blRg6NCIU+Uu98HzIOJ5i/JhkwFo8Tt2px/6EinKlebTLrmrJ9Ak
	N3qHDsUFKkmE2efAku9rRLsGsoky0ZP71Sbxdxo=
X-Received: by 2002:a17:90b:390e:b0:3b4:fcba:8f7d with SMTP id 98e67ed59e1d1-3b4fcba9627mr7484402a91.29.1795760460924;
        Thu, 26 Nov 2026 22:21:00 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([174.136.206.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm36939740a91.2.2026.11.26.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:21:00 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	ivecera@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	chi.minghao@zte.com.cn,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH net 1/1] switchdev: fix deferred item flex-array allocation size
Date: Fri, 27 Nov 2026 14:20:51 +0800
Message-ID: <631cf02ac9643f0bba2bc05b260e30b8d0990cfe.1795576931.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795576931.git.caoruide123@gmail.com>
References: <cover.1795576931.git.caoruide123@gmail.com>
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

From: Ruide Cao <caoruide123@gmail.com>

switchdev_deferred_enqueue() passes data_len, a byte count, to
kmalloc_flex() for the flexible array in struct switchdev_deferred_item.
That array is declared as unsigned long data[], so the allocator treats
data_len as an element count and over-allocates every deferred attr or
object item by sizeof(unsigned long) (8x on 64-bit). The following
memcpy() copies only data_len bytes, so this is not an overflow; it
wastes GFP_ATOMIC memory and makes those atomic allocations more likely
to fail.

This was found with LLM assistance on the Vega platform and reproduced
with the platform PoC in QEMU. On that x86_64 6.12.94 guest, pahole
reported sizeof(struct switchdev_deferred_item) = 32 and
sizeof(struct switchdev_obj_port_mdb) = 56. A deferred HOST_MDB item
therefore requested 32 + 56 * sizeof(unsigned long) = 480 bytes instead
of 32 + 56 = 88. kmem:kmalloc traces from switchdev_deferred_enqueue
showed bytes_req=480 and bytes_alloc=1536 (CONFIG_SLUB_DEBUG=y). A
deferred attr item has the same class of error: 32 + 48 * 8 = 416 bytes
instead of 80.

Declare the payload as u8 data[] __aligned(sizeof(unsigned long)). The
members before data are all pointers, or an empty tracker, so the offset
of data is unchanged and the payload already has long alignment; the
attribute documents that contract. The old unsigned long[] array did not
provide 8-byte alignment on 32-bit either.

Fixes: d8c2858181cc ("net/switchdev: use struct_size over open coded arithmetic")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
 net/switchdev/switchdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/switchdev/switchdev.c b/net/switchdev/switchdev.c
index 474df25e96a0..fbfb25cdfa80 100644
--- a/net/switchdev/switchdev.c
+++ b/net/switchdev/switchdev.c
@@ -59,7 +59,7 @@ struct switchdev_deferred_item {
 	struct net_device *dev;
 	netdevice_tracker dev_tracker;
 	switchdev_deferred_func_t *func;
-	unsigned long data[];
+	u8 data[] __aligned(sizeof(unsigned long));
 };
 
 static struct switchdev_deferred_item *switchdev_deferred_dequeue(void)
-- 
2.47.3

