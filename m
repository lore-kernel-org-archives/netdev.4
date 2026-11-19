Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099384;
	b=0KSNfjcE87ux9jqcT/oE9SKRbAvObLUfxBamReuFnVzOE/tiCJUeCu/F/S+Vp/lBYL/B
	 a8mTzNU7kt0YqCDmg4X0OcQoW9lbo0dwRs9WoMoUAA1t6Ue0j0Q6HYcOty8yK7tGI0y8W
	 VJ9Afr/wZ09KcXj+RpTq5x3qMWA3GbeshX8J3TK2qqpvNvRbkFjbGBItEllVeXGcVWfsT
	 glywqFwg42Mz7IO/ViTNaY17xylUsM8HUkAfZ3GprcpkrhVdl3ZV3seDIx6Bya0+Kehor
	 QWTRttDsZ/kVwGXZTJrJq2du02qEaNMuqBSw9b9fdXxaG7/mtYEmKqNQI2JR8LVv2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
	b=n3Rsd92JfZ6NHoO7rZbW4VMjJ75faxpchBmNAIUYQqVsCbZhu6tTgKMhlLfsKVqWIwjH
	 j0JFwP/AeP16kE6HKbUOZ4UjVGSrj/QSwU36hmRNeGVwlv8JXb9INsJj/6VKBKn8x6OkA
	 npWfx9ZqQMZrQvi7cMJVfWEBOF5ByJMy9i9tSbga6fm97uZZ1SnK6KGuCUbxo5B9/TwU2
	 ddwV9bHancUTgd7/o246GjWi38lewtLQF2+0yhAm1NaCXe6Rx2ZG/MB8vZDX71yCsPb5l
	 3//4F6CL0s7fGQyOElOi+3/AF8Qkb/6dsjEleZb8ChBhSGfz1gl8mzH3oOXPInG46Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvLP2+8Y;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AEA606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6AEA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvLP2+8Y
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so3971090eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099383; x=1795704183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
        b=cvLP2+8YSQPyvgyp72ru7K5jomnG3ckow53vlYIopcr1w8uivHenFD5EQkKokdAiOe
         M2PCTTJaxuckK5644Q3s9KKxruSHxV/63pQmXLhv5AWtnvzJn8dWUi9xyIXL0ocRakwg
         NCRXPscmKacvufThd9DoLwTEG8Z7+Zx7mtoMWA1Q9ftXkUCHVXTvWYuAwily2x2PNub+
         IjgilAoZj8X+SuMWG0s4CQTFA+McmPArwRlrCC6erNxHnS7IypnzGPEhbIe85lEkNCyx
         t+q7GMLcYHYr4WLaq8e0dmXFKGqYQPusYU5uipHES82vnlYQv3BEaRAMQ193t2S7eqCI
         5Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099383; x=1795704183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMnm3lNFGLXAd5e5gWSUcJSwva9ZjNGfsEDi2TEd7zA=;
        b=q+P7Zx1qsttwNqhGx4tpUmz00gIRDG8poGDxEb23fjcs3kU+SSiNmRTNcTUJVqkolj
         oyaudGnRUYbKbZDNQvEbgLs/gXbFcXHZh0ob6UkEnf8BqGGdaJTXK74ADuaEeviEJkws
         7M4PuJ+HG+keb9qc7kUUk3VOZA8ziUvefy2TS+E0nlqUOFTSDcQeqg4kymFDNU+UUpQ0
         xavREOfwu71RiE4UwGDQJp/dmJI4+gbLwi3Y+rDJI1/sQ/7IDVsv4bgwlzd0O+5FunPY
         20a2g8CeHJsLmRrE8cswJIiJhKTN7KinZ/Qbz1gErLeKCMUXLBb+Hh/awrshOiXu1gP7
         t0XA==
X-Forwarded-Encrypted: i=1; AL+hErGb7cATEPS2LYeTBn+416p6IaKGsvsqJAMltIOqvFo0gBws+fX2c+XfEfoe9HstH+9ku/Lwvag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DUfTRN70ZV9lTYtS0VVVtsdprzc+SKaZNR6Jt6jS41nER/Pqm
	FVUq3XK3EXXjcodAGEF2ewzia2GhAmf4UJG5v8wU7NQSM5ZVPY3JKHGa
X-Gm-Gg: AZFdTZeBkBOyyQr6Rn5Dc5DeWKMGbgtTHMlpY4QkmtxqJNnrY2HU2wROsYkpvli1wuY
	MgTMK1vw0NXfORQdOkFDe1hSoidgp9XnbfPjVb0B1fhhzEzp7sPs8WscNGCHukqd0xZH0InVVDr
	bikOntEMmGZcgOPoxVKnk/v7ZJ6v9rFRYPBubuyxOG/kz1i5RNpSjvmGIRAETNOZ73/N9mlhfP0
	AQGHRMhn5+WSByy8jpk9orN3WnMlXh7OaUqnpnhyBw4KqeI3T1/SDpOR5Ahu5SMyDZXcvmTmjyb
	N1Z9kSsP0YkC3iP4zMoTBc1kDCTrUyWrlcp1cTwR1q8LmoVWqykNi4rO5hRha36Z4pmzheq/Te0
	VQnT6HTGGdKl2OTPRHMG25BJYgwM1xsrtu/4qXHLEjuRhtjQG3Ir2rbKrMdQoD/hGUQ0e0ZoL82
	ceVfREJKDXVLYqPCxldTMAMyZ25mhzeRz8bo2txj4uz6uok8THC1bqflWSk9DGTfE0WK9zei4Se
	m1g1pXZSYdg93jTi7ZwW5fBkOSGewUjHWTFNz3GNF0GE+UTnsUKHR73tQ/3RFphZRcsesQRapqW
	rlHqZTEt3coo6ZFbqQctemESMz3F37PO5wOnWycL5P90X+t4dw==
X-Received: by 2002:a05:7300:7314:b0:375:c5e1:931d with SMTP id 5a478bee46e88-38280c2e5fbmr7589924eec.25.1795099382820;
        Thu, 19 Nov 2026 06:43:02 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:43:02 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 3/4] tun: clamp zero-copy copylen to remaining payload length
Date: Thu, 19 Nov 2026 23:42:38 +0900
Message-ID: <20261119144241.360238-4-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

tun_get_user() also derives copylen from hdr_len or GOODCOPY_LEN
without bounding it to len after removing the virtio header. A
padded header can make a short frame cross vhost-net's zero-copy
threshold. tun_alloc_skb() then reserves more linear packet data than
zerocopy_sg_from_iter() copies, and the uncopied tail can be delivered
to the network stack.

Limit copylen to len before the NAPI fragments and skb allocation
branches. The requested copy length then cannot exceed the supplied
payload. The normal skb-building path is unchanged.

This matching tun issue was noted during review of the tap zero-copy
fix. An AI coding assistant helped prepare the /dev/net/tun
reproducer. In x86-64 QEMU/vhost-net, a 14-byte input produced a
128-byte frame with a nonzero uncopied tail. The patched kernel
delivered 14 bytes, completed 300 repeated short sends, and still
selected zero-copy for a later 400-byte frame.

Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Fixes: 0690899b4d45 ("tun: experimental zero copy tx support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tun.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e601..76486cde21e4 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1850,6 +1850,7 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
 		 * The rest of the buffer is mapped from userspace.
 		 */
 		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
+		copylen = min_t(size_t, copylen, len);
 		linear = copylen;
 		iov_iter_advance(&i, copylen);
 		if (iov_iter_npages(&i, INT_MAX) <= MAX_SKB_FRAGS)
-- 
2.43.0

