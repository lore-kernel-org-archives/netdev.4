Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998474;
	b=ifEVC2Phf/WQo0Rzxzuv0Zv2qFTclA5DZ5w10GvYwFxBoCB8EvJgrfkPbMuS1fhAZRia
	 jmkzdx7y1negFBDNDW1iPItafjcYKHMz8lfQNbNjUpJzClU78DSbaB71Pr/yrZeK8s0+j
	 bk1Wzxy/gmAzqcN5uwDhgSLl3qtkLkSQrwC1jTC5OmGlzuZfrl1opSV0Ruyzt38BpMPq0
	 gfhFuqlkfDvgCA9T2jRaHw+a796V0xCq1/ce+2gOOpNvFNXiy+WQBvu3SPVkaamn248Mb
	 pKL5x0Av18c3aNn6jYPb4F0A8ZyRXIh9+Crn7QHSXyF/n2KWeAGunlXwpScd/hl7WJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
	b=0fqU4+Mze8Bf5f/XAVUy5tChxlPqFhank4Xd1a2PK/0R4uJN/45NtmKCvFvUullM1uEU
	 rsuJsXu97LJg6xjWezpS5z6GSFT4o9xB4y/p1NiUK2Iry061KmZvb0tgA4Y7ZC7+auaAS
	 Vk69pJgIgAtdmBLNdBWzC0bHU7iFln+0NP1RDAYqYTepWnzbdzASoRWYx8KGVD/g4CY+S
	 MSX2akGFbHrxZ71EGChDd94WkPMK6hu0UoBzYD9dETWVVwCmh3bdDaPfhXwHpcyNoMZAY
	 5MRtvioAG+lgZ90Dq3CHQOiCEbmcHvMG8JRLha2UF7id8W2qXbAsta2LKA6+YzNlY5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8pbIffx;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8438060A2620
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8438060A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8pbIffx
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so579625f8f.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998472; x=1795603272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=J8pbIffxRgGmshxEwJPmzPFxDB3z5yCpj+t9D3OPxNAWVcY87yyl3UWUtLLamAPDxC
         YOGXCO/lpomIOtOmttph0nOW9c8OZOHrMQL7AFmlGJY5R5pcMwIvV9JGckC7i1lNLt3m
         DT9Fq5YvJf1tzpXyy2a8mRpJhQbVXRHiUvvJ4jjgSBu070c91CLxn905lJdwY6XpYEnI
         pyiZKTwNKwFKl90TkNpeYutQ8bE8W5kC/6wIQ8g4yjU0PjveIgXWx8OKvV0i9vIevOBZ
         OjS5JJkMrQhK0hmLfNa2mzbQykOkeP4nA6UbD6nB0lsjVAALpsFAEGjqu7fejzgzNgyO
         TDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998472; x=1795603272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=nSzOpbLWd/yoK+ES9pQKFvi3jgNtlPzkqwlc2yWNA30bW+E8rL6dYjJGFC33IuG/Ff
         gXXaEcyIcX9Bb0WABnHLU620o5CKxVTHuRA+gd38230HHyeM5cZmOMCQgS+4EH7SEdpd
         XM0cGa2kSpdmMYfzGYxzRmrPYHikgcC+bFuCNOuDgr6PTUsgpU9Zf613Zm47NdS2MNvA
         LHcxbVsqQwv6UQadT7rDh59pXwipzqQIyLBwwg8FnRNj0u2TnNWRP0Nirvj2UQbJFioG
         3yZZQO8/C2CnFGs8j//zUYWG93nFt98RW3bXv4wBFLXDIay05PssmFWyHbNYyG3Sil1A
         wMsQ==
X-Forwarded-Encrypted: i=1; AL+hErFi4CwMhQNUQGzHPoSz60gr2eYtUVOa3MpiD8jFtndEmpKVBxnmK0oUDL/b6FV4CJ9thHfl5cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z89Wkj2r34lK2XWkkgOuty/iO5B52wX45WBiJoN9K3gF800mYjQ
	hvjEP4yGQ/1wMscJiIEFWpajOjmfUZNZO0Sprz/gnY5/aevziZWXEKam
X-Gm-Gg: AZFdTZdOQi2P0EBHOE411NwR8a3CPvz/wHf8NYVBJdQSGx9WfluxOhKfaygoe7oSl+P
	Q6ddJkhmQOaJ+2MQmG+062DuxUmlSM4vmiZx+hAr/jpam2pApJAO9rRazxFOmdHwYG0c39Ow4gZ
	V62NeGfRDsUiRzVN44S8iqDbblfbPxVnb88MpSOc9CnQEKcnS6rJHhQEQCmkqgGwRhGDGr3OXqv
	ykKo5RbP3HQOvMGU64dV5cL96EGzm338L0sSqKJqrqpzVsSjkcUQK1xOxul7d5AGzzq5dV9hBPL
	jaKIBdD6VwjsWO4Kuqyku06w5LWp1g8kF+X9qVQwej/+DjDxUn3o76NEfFmdQxPeaJgRgKHb5ql
	YYRbnKzz+nPwmovgocndSBhVvoPbcYjodmJs1yIxn4I/mKfGmjUo1sT6QhO6U5jaDudxrYjVb47
	Cf6toS8cMf9Q6oHVVSugJKOzzfB0O79sNVXvI7MG7MC0bAtveQLkXJKlwyGYtw2uE7sfmrcl6xc
	t51NxKJgGM6Zs80BA2PgmADFx0m1YNNfSKqRvog6au4uVrhdIaG3QJ14yfLelqGLvrCBRYKFxAR
	ufxS2m9+fWcFGnwbh5U3Us4fUOthOf5qe1oVP+1Cmdw5tzNoRMqassaKKnJmDjjJlVzFWNWwE69
	xOLp98q/jxe25otVinUctVsNExVJIajYzHh8=
X-Received: by 2002:a05:6000:2587:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-4a63de4db71mr4690064f8f.56.1794998471786;
        Wed, 18 Nov 2026 02:41:11 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-46-112-114-48.play-internet.pl. [46.112.114.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm4320525f8f.56.2026.11.18.02.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:41:11 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/4] net: dsa: qca8k: check the length of MIB autocast frames
Date: Wed, 18 Nov 2026 11:41:03 +0100
Message-ID: <20261118104104.26684-4-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118104104.26684-1-kuncy7@gmail.com>
References: <20261118104104.26684-1-kuncy7@gmail.com>
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

qca_tag_rcv() makes only the 2 byte tag linear before it hands a MIB
frame to qca8k_mib_autocast_handler(). The handler then reads the
counters that follow the Ethernet header, up to 164 bytes on QCA833x,
straight from skb->data, without checking the frame length. A short or
non-linear frame makes it read past the packet data.

Pull the counters into the linear area before reading them. A frame
that is too short is left uncounted, so the request times out and
the caller reads the counters from the registers instead.

An LLM assistant (Claude, claude-fable-5-1) helped write the change
and this description; I reviewed both and built them with W=1 on
arm64.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 4de7da9c8e..76c0f7c97b 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1669,6 +1669,7 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
 	struct mib_ethhdr *mib_ethhdr;
+	unsigned int len = 0;
 	__le32 *data2;
 	u8 port;
 	int i;
@@ -1691,6 +1692,16 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
+	/* Past the first 3, the counters follow the header. Leave a short
+	 * frame uncounted, so that the request times out and the caller
+	 * reads the registers instead.
+	 */
+	for (i = 3; i < priv->info->mib_count; i++)
+		len += ar8327_mib[i].size * sizeof(u32);
+	if (!pskb_may_pull(skb, len))
+		goto unlock;
+
+	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	data2 = (__le32 *)skb->data;
 
 	for (i = 0; i < priv->info->mib_count; i++) {
-- 
2.43.0

