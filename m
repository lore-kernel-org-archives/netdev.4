Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099380;
	b=ANd2yYi+ykAI+l0J3uyutnoCnlq05H4kK7T0ttTvaHiCB1SuFThDvt7OjoF+Far2ZZrP
	 WKebnCWLc2vsj8jtIs8TGNCuQAD3fjM9MytPWbIheHlj7+wpoSmzuK8/kwrTfebzoaxeG
	 E94rWajnYbzD43+qfVDKJ/KItfPodyEuNDkpcPjqF/2WNZqjUpkVWCWytjevjkBeL0qGw
	 wwxo9c0XNUMhANtHqgX4eA6xIbCgM24vdjIVa9PgjPETUeL+tJtLkwQTfxAvheqy127G0
	 fHII4FQvoadvEicIkODqWa3eKUZQMc3HCe/IFHHXIRdA4C4MOwNeP0teYEPLzdUcuuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
	b=TE2tc5pnAnDmDE+1ge73vKhZS2F/2LPJktEwfhr+SiK4qTFXbWEg9Zfmf7HM42fU99wJ
	 5m0M7qOFzFtBdDz1bBHVOsCBBa9ksPhTNNPOoRc7YG+cT/cpoqbOMnOjKXpNdLA8AQMEZ
	 gJMFdgdTMip8vPjGxix+muS7713VHk7m89thkeke5RD+uQrVyovhV22Gl1vGwcMv8saYu
	 LjQPVPXj8ud2HW04TScnT/AwI07CUiViAwAjAq1IYEeIP9zMx7zYyj0V+TBu8KeaCDF97
	 WRtxiV0uGlg6B9YKshJmKYYFznn7gOzKMe+C57bkpPMK8rcWYew2vBjVald+JYkxS4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfBrjJsg;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A660A261A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A43A660A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SfBrjJsg
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so6311468eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099379; x=1795704179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
        b=SfBrjJsgaM3SfnXmFkL//WeotaIyiccErOHnwP8Op/+jtmiZhZt6O/HPsaaXcSFv58
         XxhWTZrcYmWyzJ/G2dJ+bGuC/UAhDwuUWst8aT1V7pLd83JCfkGHLGLgPwXRWFTZtqaq
         yEntDwwWtY0r0BUaD5jcTHiuAO3+nfvr29+V6Ar++8T+/I8Wl/FrpMeva3Hz8rnj/c6Y
         IfaVNb41jSu276kHot/6XCbZVDNqJPRKTm7GNItXWAtih3Hy+fz5flJhnJVSTzrWFg8H
         oC96LLfAymtcgUYh42f5EPApHu9KXz5H1NumNZkj9BuIan//sKREg+/jXBGm+f+cr3e9
         QkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099379; x=1795704179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpxuYon9V61W9GAwJOVwMIhDSfl3FlFyTaxEoWjwIyE=;
        b=aNAicLiFu891RlY+QyVCJX0m7gYLuPwdPRprPScxKRA08mOcGSMhceJ9DNobmmwNPB
         WwhrCTx86Sul/mRGgj1Xbi0o5QqiBnW7Bt6LelTeUB7qHEyl0z7s6aKPGFQAfFNJ8ASP
         R79nIRCLZpeZOAg8ojyBpbC6k9I4yn2arEBtQxwavqH2Exiy0wAaDWq2jNSQa8cZuJfc
         RM6KRa0McOaoTGaqFxlCFjbGEQgJOPMw3d/RHbfCe0m/6iYUskOGzKyu6zf6RhRveDVn
         pe+MTD4ifkTEljzMjSWKhtLfv9lOX86QmZRkve6+yOUIDbJ2QOK78K9Sz1raUw8qufie
         /55Q==
X-Forwarded-Encrypted: i=1; AL+hErG/Lf7fEYyg1VRoAY3pUCpfzGDYozQf8vzdmuhdnTPP16YAGuGsFZb+p6ocg2LMBgFdcG+H+Eo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rA7UknDPXi2Fw8PzZt2jPb9PMQYxcJjNvM65f7gDF2CC9teA2
	M2mSukISOkGxELlJqNZFzS54R0hiYpLZkCKw1sJhlHExib122iSw5EQh
X-Gm-Gg: AZFdTZcZRFzmzwJuG5Gl1Ik3aRv6vMJWpN9vj4G9xkgMF07KQiCbsNoXsSi3K34GDj2
	1uTMAg5+RAX6+X6hYIOnFtGbAfQrFnRsM24xsK33GPBp+9J4s73tpLfHu731e8PRuj7V2OWloAr
	KPmo/VQlujsr1W923qcU1erH7lNuQ43z8PiC55mrKATgZICmD90b+33ou1SDw97ON64ju6sSlM1
	96M36lLxYQxiKc7kstwXbT3XMnGX9aa2YR9G69Maoz9FwGmwA19JuLLNEPuFlIHU0PZ6uhTArGp
	SZ/tn20e3+4Z7+Zha2JR8Js1mfgzHKgU+9GgcnkDEXIjeIUddKQjphIAmiizbQhqvwzGxEM/wWp
	Z2xJ2/TNMZPW5CKsjmasNE3yz6XSVNe/Euck2kbI0pim/nVsbS9wYooFWBD6WHCHoouGXP+0NDo
	+Xy2Wtvo4nfh6vGd0n67VMh0yCbCfx0fqM/6XrJiLDSDXChk+wBMQ1l5iXyytD7E2JQst4I78Gj
	xS6nq7lobtVZfXwUZEfyEwfkM0uygz04GUShp15VlmZL/KiQbjjfoaFwCCzeHH/R9vCamqYfhs5
	RFxdkNXkOZNF8KTBYSCqXmk3onCbswFHfQDjfj+ihDqXPWGc2JqhQbDEYeOqIAnws+B+V0E=
X-Received: by 2002:a05:7301:5f87:b0:381:9593:9984 with SMTP id 5a478bee46e88-38281626937mr5510080eec.37.1795099378702;
        Thu, 19 Nov 2026 06:42:58 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:58 -0800 (PST)
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
Subject: [PATCH net v3 2/4] tap: clamp zero-copy copylen to remaining payload length
Date: Thu, 19 Nov 2026 23:42:37 +0900
Message-ID: <20261119144241.360238-3-graypanda.inzag@gmail.com>
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

tap_get_user() chooses GOODCOPY_LEN when the virtio hdr_len is zero,
without limiting it to the payload remaining after the virtio header.
A 246-byte padded header and a 14-byte Ethernet frame give vhost-net a
260-byte TX descriptor, above its 256-byte zero-copy threshold. The
128-byte skb head then contains only 14 copied bytes; the rest can be
transmitted as stale kernel heap contents.

The original macvtap zero-copy support introduced the copylen choice.
Commit bab632d69ee4 ("vhost: vhost TX zero-copy support") connected
the in-tree vhost-net caller, so this case predates the v6.15 header
validation regression.

Clamp copylen to the remaining payload before allocating the skb. This
also covers cases where the entire frame fits in the skb's linear area.

An AI-assisted code review found this issue. An x86-64 QEMU/vhost-net
reproducer observed a 128-byte frame from 14 input bytes, including a
114-byte uncopied tail. The patched kernel delivered 14 bytes in the
same test and in 400 repeated short-frame sends.

Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..f25c58d6e986 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		struct iov_iter i;
 
 		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
+		/* The remaining payload may be shorter than copylen. */
+		copylen = min_t(unsigned long, copylen, len);
 		linear = copylen;
 		i = *from;
 		iov_iter_advance(&i, copylen);
-- 
2.43.0

