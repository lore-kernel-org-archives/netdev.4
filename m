Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307198;
	b=g6XU38ERV3g1G2MOe9WkPFnVu7r6gxQAmHloTtUppDx6TySYoPiKMHM3NymUocVrTb+X
	 EXi2ckBJ9NjHtJdTLLdA/AuVZ4QiLkbfjGM4siPY/45jvcGKfeAuIGECBa+ViQS3sguT6
	 qABWCOairZJ28w9Fd8GtktNW62m4C7DKEX7qiT3ds1Bdz9yuxHwRadDctn5sP9wPWgdlw
	 RdG1RJ5/15gJIDx5Y1qZVskz9vyY6wqWjnbBGHH/FVgWT/q7Qy+mzO2pghwv+fEPwepv5
	 gcmnIf9cONGX/d8nlHG4a9cTfIzSrUWBJoga/sNZUiFcU0kbjA8k2k8sfvjoQ1dJPqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=O3NiZ/2RGCF1twRZ3giU0DZRtcdHTLMMtOMA5mvfxfA=;
	b=UUGQYe4AvbuYnO6ZtFWOjlygTo/+j5L8F2cUNj7Uaq/0bbG+QdIkvCtIGTRiHF0yFksk
	 x081aLRn9j/nDhvp4ysh8ZlQgjnTHG7MajxKGc9gy/0zqKvVrl0jk10D7hplU2Uj/FJN0
	 yo9ItM//LjekXBV4/1JjIl6xl/o+USlbNQVr8yKdqU47gPWpZZ4eClAFsjS1pglKZ7nTg
	 C5NYzw3NgJG+Dv1yIltYieF6TBBF2ayc6dCzTwvJEzWVyMim0KgrouzPdNsnB2HZsljGD
	 QnNVOu3bHsvTjo5/vQiIOyBn/kZmf6jJfAicSe2b0CKqP2gbDdQMXcAveoacNL2agbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dq61qiUM;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76771606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76771606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dq61qiUM
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso1609245a91.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 16:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795307198; x=1795911998; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3NiZ/2RGCF1twRZ3giU0DZRtcdHTLMMtOMA5mvfxfA=;
        b=dq61qiUMQwT7RgQmHA5ZnRyaex2oo7wkUWwXNeIrR0plpxOxWtP9wnOeuXImt1Ixpw
         xji72+Dco/AsiJ0QCKyu8qoolyjjWW/RIsLtA6xK8Bev9oMxL79fffbN8Q5vzQkrFoRI
         7AFyn2xydgAO9vBkkVfn1SANlmG7DRP7XL9GSMdbkAsvIbaiMjNxxWBdwDFUepa6A79g
         AZ12Dl3Eby6xYfxb3gm9X2v79hkl/9UDLEO0pl/lyjXwOZBOrKz7uAY9KLHLkIepF5m6
         EX36H6dC8lyo8A0n4ehUzqFPsLnPBl0lSyihCanKCyg7BD0GBTQVhjcFA1O1ORUyf+7h
         0JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307198; x=1795911998;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3NiZ/2RGCF1twRZ3giU0DZRtcdHTLMMtOMA5mvfxfA=;
        b=HAPfNBCag54W0ip9bw653zUHoYJ2sHHTB9WBhaPVFS6hasjffulC3d/N3fH9YdQH/0
         Qs7icj/25OTfxHhmLuW0g3U61mBNoV+tB3ZMt9/7ZGLQDswkmdRGtVYSkJMXT3jNtA1o
         VdNFH0VIEq0N6LiS+XSFubV+22cIFDwUOZoRKYy2ORA9XCqsqsf4NLonCgbaHXz6gNZP
         2KTewycqzXUMnUVVIb4Ni9S4yw416TuS4PqcB+fk/sOg99I88isLAIgXU30H85bNqyaL
         AkP9VWT4JIJvd5Q+RbNL8dBqQsJZ6EYX8aWreppFFr5WxdZ8h1TrjmpfxP5rOslT4BIL
         o1Ww==
X-Forwarded-Encrypted: i=1; AL+hErEhsbdfCbS/33Z9nj4nM5D/YA2RH6klW+Mjdg6uXjRvCzIQY4Y56DGfAkPgi6T78RPYHFyLcDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r6mjtXUw4TcDFHWBLTG/CubY83+PcYAKm0flxi9YklAhCeAI4
	xokZgD0VJnM5YQ83ev/lvjhfYIOMq/93Th0ObI4hhzF4I7LKjp3Bh2YGMPNc9o2cO8zGEf5M5uj
	CjcL15iTUGstqJ0JSg6NKKR8xIQ==
X-Received: from pgfv34-n2.prod.google.com ([2002:a05:6a02:8762:20b0:cdd:aaa7:beae])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e8c:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3b41c8e105bmr6290195a91.17.1795307197459;
 Sat, 21 Nov 2026 16:26:37 -0800 (PST)
Date: Sun, 22 Nov 2026 09:26:33 +0900
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122002633.584362-1-yuyanghuang@google.com>
Subject: [PATCH net-next] net: zero hw address entries on allocation
From: Yuyang Huang <yuyanghuang@google.com>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

__hw_addr_create() allocates struct netdev_hw_addr with kmalloc() and
copies only addr_len bytes into ha->addr[MAX_ADDR_LEN], leaving the
rest uninitialized.

If dev->addr_len later grows while entries remain (e.g., adding a
multicast address to a down TAP device with SIOCADDMULTI and then
switching it to ARPHRD_TUNNEL6 via TUNSETLINK), readers using
dev->addr_len such as /proc/net/dev_mcast and AF_PACKET
RTM_GETMULTICAST expose the uninitialized trailing slab bytes, and
__hw_addr_add_ex() reads them in memcmp().

Switch __hw_addr_create() to kzalloc() so the unused tail of ha->addr
is always zero.

Link: https://lore.kernel.org/netdev/179012275175.2160803.16091441325063775173@kernel.org/
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---
 net/core/dev_addr_lists.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index b6f25e487984..ff0815d8f6a8 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -100,7 +100,7 @@ __hw_addr_create(const unsigned char *addr, int addr_len,
 	alloc_size = sizeof(*ha);
 	if (alloc_size < L1_CACHE_BYTES)
 		alloc_size = L1_CACHE_BYTES;
-	ha = kmalloc(alloc_size, GFP_ATOMIC);
+	ha = kzalloc(alloc_size, GFP_ATOMIC);
 	if (!ha)
 		return NULL;
 	memcpy(ha->addr, addr, addr_len);
-- 
2.56.1.750.gf70dc682cf-goog

