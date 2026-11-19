Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113700;
	b=jtqGPw7GueqngWvGwLzoNWnTpMVfd0eOgiBG/cwz0J66FcQAICz05LYuWohdbqh2YiVC
	 WmtfTKqwPBcanBi2aRtdUDYaXiKXogZ48QjJ2hldA1eH2eLPeLNDOZz12TQ/VNp348+gd
	 liKfkUMPhE0P+cVjdEOhcWv17zpC08v5QjGx7rxluR+kpYjqfjvz09+/gg6cf4ieRL74P
	 l8q4V3fI4+w3A1U5PQFqkv15OGEK08e/+1mEVIo/pKN+gHm8HJQ8RMxAu61cQLkHWsNuZ
	 Z4FrdkfAH5NvebrqzUKgTy9UfsMbBTlqOkwCQfMN8hgsbqLu7uvKs1oJhVtF1TlLRFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3oqzFwD+s0Nl69O1Eok31JQqbm3bISsPDHuFAF54jKQ=;
	b=lGAUnY1jQuV/ntTXa7WBOMUruGpVcjFsR0l2IVasbubuBaR5jJ5c2l8ytW/Rp1zmJ9sj
	 aQGq5pIpZWNwqgdHXXkuVO0gYv+PxrdxHXP5v3CSeV0+60QTUpefdKYi3iHsJEqiKul5t
	 K382D/xe9hIgWHWWk8LJwQpzesF7eYqSndBAeSxykYgeLGe26ZRVZsOEIOrPcEEUJI/gk
	 EvGYszSA8Y2u9x7sYlhfiqALN5QR8sZMGBxStfH2fmbVpA+lbMaFFcOHcx8MvSO2KIyUe
	 m16Yo2PX/o1xMvM6wafdwOaTgrnWYSVQzcdtMv2jxTGh6IgbGkHTnqe/8QP2EqdkO4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9BYHoq3;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC917606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC917606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9BYHoq3
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e7af9a67fso916136d6.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113699; x=1795718499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oqzFwD+s0Nl69O1Eok31JQqbm3bISsPDHuFAF54jKQ=;
        b=b9BYHoq3rFIfb4HQCB/3roUBAWgn8WMpS2EUyTYs+06XnbPDNe2j8sBH0NDiGzb4j4
         h7ewlCp7TyzGEvZycrmALIMQymRxe/zSVLdRbJDloZs1qbZbjHN+EHFbdbElzNmOm9oy
         R6xsybTh4tOVlZ5Z/Y6iv07a3IkybcxgX7blSOtnvX16ifzYixB9A9iY37RbTwiGrPen
         m8efDmKZvv2k2zYD/ZnFWmJn4dtHpWQRqt7XBJXqnvioTrJM2HnZYsuHZWlT6kijCIZl
         KZ+oiwNdyReL9EG1wCWBb0jsHOV7x1j6ZXbN2KHlxY6GJcWigcBjFhffBstcKb9u3/6J
         pBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113699; x=1795718499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oqzFwD+s0Nl69O1Eok31JQqbm3bISsPDHuFAF54jKQ=;
        b=jpv4i04t7wpURslDNG3TVcaIqS4DVX+Df9fYTiDPvrTWpn+tgRlsvzPa0i6AyFIWcr
         s7t3lSqs9n7kVTEhsUDx8XpgC5dOpTXruPDFGnPjcO/f+8VqC2yLt3cMOcoAJ2tEJAi/
         iIMn397wO2auDq08fymr9f+V7Ljo+9ONXZwD24z+1mqqOsgb5opXFPwcjWAbKi69gKxU
         7uluA96usxlTcBpyg2k9rzncHVd+W8FQ1mrnEyBixDr6vh/HuQ04xmXsP5p71nuZ/ocz
         5cv435xmO08nF2KxmsHCm3NDN4An7HGD1TuAmNbZkoutUUXsk21e4NXVJIJ74oa3jYzH
         TmnA==
X-Forwarded-Encrypted: i=1; AL+hErGVi0Oz4uePl4OvLf36OxYnehTwaS9v6ob0IdFv6VdddeXA+8vNQsXCGhtlJjSzmxEtUwvn7F8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HKN1gwd63yU3gASkNHB47gfleGTBZCXJjVz+AJBiMmtyX50+W
	9FNzk6V7Ef1igpF8d1dXONPIWD2pBfJI2ykdDSwbXAC0ihiR9qLrYSnJ
X-Gm-Gg: AZFdTZemc0Dm798BPN8bWrYecZSHD5wEgcKACs4S5+A3jYuogFCFsmdvrnyAESewD6h
	KaudYpqRtokiZmac75J5s8nqeh4RZbVgHND1R3wdLDBV/7jQ4Mj1cVad/+t8tdMbV0Qp0wNJ0VM
	LpxAr39/wrj8PjGggh3YE5ptfchJo5f5tlnrQeHhLCfMNYqMxMy1m4vd9t+9C1TP7v3BPyg4xO5
	vV0Xm8p0ftnovZfRPyZJZYOGod1SEi8iqVIXN2letrwptGQW8+DeZc/0aF2T5pOVqnqkaWZUjRb
	BRUXKfDmqBQC0siESvMuzMEfTwFu3KITZpLbruQ35MN20OT1xILHHtKNlIO80+ItQWaZdIpr9WW
	ofUZPvO4gG6wgsusuSLWR/Q2HCc6o2QhjLx009O/VjUMgaFyZMFhdudNfqUNoQgYYwfA19/HSLY
	SLPWbgEdGahe1u9I+/Apb03aNRkjMaL6UOyQBaWyIetKrtaGTjxJw3SZHDDyZoh41uyJ+KK1yRp
	4J1QouQ1G1+H1I/pkeiwFKm0FmZqowQJUKQ0F2o4tIagJGXEsIvGM/ADmBObwOmbR1iZ9a1a7uR
	+BKujOfbQnJS9KqzYuo677YFBnEkue+N/0+qxw9/kukGkP4RQ907mxmsEwI38u0FcJsoNyU7CEJ
	20z4vY/m97GvgdlvLIEKYaiwD5pGldzTQpAL15XIVsUQDUb8B2pluQ/ppxIHbmtRjQlwTd0WOOp
	IRevGtNR83VwSWm3Z+VpB+F/vi5QI=
X-Received: by 2002:a05:6214:458b:b0:921:318b:2ddc with SMTP id 6a1803df08f44-92134a9fee9mr8196576d6.24.1795113698650;
        Thu, 19 Nov 2026 10:41:38 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c935:f347:a919:9f78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm4226386d6.44.2026.11.19.10.41.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 10:41:38 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tipc: zero the pad bytes between bundled messages
Date: Thu, 19 Nov 2026 13:41:27 -0500
Message-ID: <20261119184127.24931-1-astellman@stellman-greene.com>
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

tipc_msg_bundle() places each message in a bundle at a 4-byte aligned
offset. It extends the bundle with skb_put() to cover both the padding
and the message, but copies only the message, so the 0 to 3 pad bytes
before it keep whatever was in the skb's tailroom, and they are sent to
the peer node.

Zero the pad bytes. Commit 81c600c26302 ("tipc: Dont send random pad
bytes in RESET/ACTIVATE messages") fixed the same kind of leak in link
protocol messages.

Reproduced on v7.4-rc3 with two QEMU guests as TIPC nodes, booted with
slub_debug=P, which fills free slab objects with 0x6b. One guest sends
60,000 SOCK_RDM messages with 41, 45 and 37 bytes of data to the other.
That fills the link window, so some are bundled, and a packet socket on
the sender captures the outgoing frames. Without this patch every
captured pad byte was 0x6b; with it they are all zero and every message
is still delivered. No other kernel changes, debug code or error
injection were needed, and there is no TIPC selftest to run.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 net/tipc/msg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tipc/msg.c b/net/tipc/msg.c
index 39dfd33c8eec..b0d52609b03d 100644
--- a/net/tipc/msg.c
+++ b/net/tipc/msg.c
@@ -509,7 +509,8 @@ static bool tipc_msg_bundle(struct sk_buff *bskb, struct tipc_msg *msg,
 	if (unlikely(max < (offset + msz)))
 		return false;
 
-	skb_put(bskb, pad + msz);
+	skb_put_zero(bskb, pad);
+	skb_put(bskb, msz);
 	skb_copy_to_linear_data_offset(bskb, offset, msg, msz);
 	msg_set_size(bmsg, offset + msz);
 	msg_set_msgcnt(bmsg, msg_msgcnt(bmsg) + 1);

base-commit: 1e575bda30acc0bf01f799cee798d4a1c100d538
-- 
2.43.0

