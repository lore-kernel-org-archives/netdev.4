Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772674;
	b=F6B+Vb/U+ozST7zbgjQtVBVcNd17zGxNBPmA4uEJ7sE0rVdMBZ5OaZIuI47Wm7u7FkkF
	 APcKePCrTrqZorBrBxMNTWAYLctpeEVXDsJgPOUaLUpI7ChubTPqI/qXZqn1FoD16WW02
	 /vfCN399lzq7q8Qeh5wEJGAFC9Q6odB8ISWBnH8LuvtlnSKhny0lp8KGtf7OgJuhRL7Up
	 1/+YcFpTlrekCo3cMnIzWPFP39jdAos0AM/e5hTtRT3rm4cTtHPsYWtgzumVblKWSoX1w
	 YtbpyJP+brpMwQIi/5XtMdoCIdC6lLdOgrYjKqHtpDfLh2yVb9nLgNNSKc8+gFnw98g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zaR40rZn8yPO10crw6SvlKKbSvr6UbmTuLHfOgeH+mk=;
	b=Cac4XlyTLPy/7yWsmt8Utbagk2pgyIOGWnJMqg7szIcPxOfUMkn1KTrqj8TskBDp3J1n
	 JDV2ezsoukj7zzzv5gDlvkyBLINAIhJyGPbJEbAdWY8KM4ZkeWxTB3E9HlUdfFPJVHXjx
	 gZGbv5trKQos1BAy75F3bwX+her46RtBu0nHQBaqlR7hxEd6KZ3OoKmNmTsJRY8P/r0ol
	 oAsTq0X+IWzwExTOmdDitLsuOLCyq8++pm1HSKxdQH/oidi5601N/ZF3qx2Cz+BMPkZkU
	 cY/mp2gycFo1Np3xU5u5nmZaAlU5AZWmWZ7rH2i8dyoIIMWOxOd73MvQsY5QWne0yqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=OQMiwSvo;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413EE606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 413EE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=OQMiwSvo
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38431138772so10249460eec.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772673; x=1796377473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaR40rZn8yPO10crw6SvlKKbSvr6UbmTuLHfOgeH+mk=;
        b=OQMiwSvoRS0arb+/iKbLrljP+Gyej0yR6IaG/GtROOzm6oTeupbSBCD/gbfjEglxm1
         hHBByGoc4FAzy3GME5EHq/S2+ZZoTfEAKpmdk4ediSvl1m4gG0FDpKkBAY4wXIIuBGJo
         XokYV7t7UW/JO87gjGHETnG8I2gh2JXDWj22c41S/Fu9NyR3cSNHkJUhjKUAvXKXrNO0
         9cBqxhnGqTHzcbANyvAMDPW40XSM7BHk3FfNiHVA0spG9kUBj46Njr3ZVJBjD/1ccZ67
         BM18/e90f07CBsRBXvpPYwNQV0HKh8BH3APk/DICV4DpfFVRCmA6woVY/jkW06vqpDPQ
         fO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772673; x=1796377473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaR40rZn8yPO10crw6SvlKKbSvr6UbmTuLHfOgeH+mk=;
        b=tgnxGYt6vqIGJROwt4XhVmu4WY/LQMYqcTFCJXgUOTvF1FoMcmEY21fIQ5Xa3VRd32
         iI3Z5AZH5q7r2RBjPBkDLwQ8nI1dgrfR4B4tHvwgxlXy/daxhD0gsNJ6F48ecmt8k6GN
         71OJkyKozfvOtI/3o6lDEH5Xd81ANCBqHlew1SkmVTY+3kJWe5sR8IEnOwScPLcms55O
         kx1tTuFj8YbYXJ2REmSrazVLhm1Qtl9kbaKUEki81cDEeKbthX8DsdrBdo7AMvsu6z1R
         SLHbhYiLaDQl+8801AW25a73dbFomWb/5cbgKI2bt7GXIpLFbJEGFvZQgqkN2J0UG9Co
         51yA==
X-Forwarded-Encrypted: i=1; AL+hErFTm3RBq6oLhNqtLd7UT1qQPyMIWNqNXRN0Q6se/G9x9CuguhDxa18Nf2LRZB9ZSAXvU9XGQ4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BLhdF+TkWPHTeow0BQsZJiPsBDm+2a9dkA31dsWy18vkUui0q
	mn4cgaBFNSFYbJbpRqz3lVIP7mjt3uOUj72yRTeQuDb4jcbRPx23FVxdv5I/NghC7+Y=
X-Gm-Gg: AZFdTZftgf8yPchOzpUdF2Wa8vZXMF/+Kh6C3jcSBbmGD4oDUt9yAL//W+KiLgpoYbJ
	FFsf8T5O2D0ZqoE+7FtGaIlFfu07X+xCT34fExmNsl/o2S90t5iBni9ZbeKDV/ViSbHEugnu2CO
	tHFqr2jK676acE5dwg/OOHEX3zciJaWFCcjxgQOn8pD5lVOIgtygapOV5HN2DEEnoK/DAIXDtzv
	t0a6+db2V5fwF9jJxV2T77WpLsJz4Jnkfogu1mp4Htc0vATH8ntNrKSith01f/kUyTAms82nX8H
	/mQwXqD95DVaqxySBncl4hqnR4AoNGeQmbCwJLkdbYDdsxWVDT7SuiXEgplINOlRvqpQYts4Tyu
	0WnFijnodgRNpBpjXcoKOhfOoSdYcZRVJ/wSEf21q71lqh3egz0uCLr+Y29yvktKfaT+lt6sDH7
	OB7yb3ZEpYO1ZwVHJCmg7XduMV4S+s/Xl3dfj4WYWb3mwyPTQaxTNGiNj3GXnhmJ+b053Qbm9HC
	RCTbQQBu+1hfqqMyeX4zGWHlEwqWrn5lJy3gJJd9iGqPHZt/3jU+csGafFQQewaHUxAp6JISjig
	/kYplIPz8dQ6JvODSYfCS5NVvECnaxp20dkqk2CdWI6zOzP2VDqkM5ucT3zHzeuGV1LAoR8+hC/
	SnAodfU/Zr+OIuAmRZUDjgIEe3wM=
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr18277624eec.24.1795772673373;
        Fri, 27 Nov 2026 01:44:33 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm42027457eec.18.2026.11.27.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:32 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v2 5/12] amt: forward multicast data over IPv6
Date: Fri, 27 Nov 2026 09:44:30 +0000
Message-ID: <20261127094431.2963861-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572061952.3135.14503580379845323397@kernel.org>
References: <20261125191450.2497936-6-omar@blockcast.net> <179572061952.3135.14503580379845323397@kernel.org>
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

On Thu, 26 Nov 2026 19:17:00 +0000, netdev-bot+sashiko@kernel.org wrote:
> Is the transport header reliable at this point for an inner IPv6 GSO
> skb that carries extension headers?

No, as you describe: ipv6_mc_check_mld() leaves the transport header
just past the fixed header for every data packet, so
skb_gso_validate_network_len() under-counts each segment by the length
of the extension headers.

v3 saves the transport header offset before ipv6_mc_check_mld() in
amt_dev_xmit() and puts it back afterwards, if it was set, so the
per-segment length counts the extension headers and the check sees the
segment that will be sent. Only a data packet reaches that path; an MLD
packet keeps what the check set. I have no runtime test for the GSO
case: it needs an inner UDP_SEGMENT socket with a hop-by-hop or
destination option, which amt_v6.sh does not have, and v3 does not add
one. The kit has a textual check that the restore is still there.

> Can this u32 subtraction wrap when dst_mtu(dst) is below 50?

Yes. v3's amt_tmtu() returns zero when the route MTU is below the outer
headers, so amt_tmtu_exceeded() is true and the copy is dropped before
it is made.

-- 
Omar
