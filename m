Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122804;
	b=ABXgJnOmmOfHP+/IF1Evif95tHFyi6sI+73DjIjRVLsXTnrfvv34ZxZaVYQd5YaYjPdS
	 CcLuxs8WFB/4XSxNU9gVVUV9W8QdxjXsWP43DDsRQAnw0vC52isKy9qk07jB66veU6Uwz
	 KluF8Bs8MJlGtAHR9W1bFJiFSFv86FnQ3S0fAfHg8KMqq/QSCawN9lex6iK2Spb5gQUWA
	 XuSG3qmxpU9zcgkSe+O+BUXwJg+B3A6YH4xzWa72OU+eOzrZFpeYqxZHZgMsPjUnCNZdr
	 3YmOiJzTkm9NKemG+rEKTgVOCLdL35FR5Uh5tkuiCyZxfuU8iuxj3cVD6nVVKjh1/uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
	b=P2/Xly/XWz9XJPI7kJDLTw4JOQlAcBFyCexpJSOLBTpDR++DuqE2yACxigMI41d8khMr
	 IQAOeMOqcGkPerZjhO5t3lBquyUrkTQGGCKJY8N/Nm5rGeb8+sDHNIClV2D7qsyluvnyz
	 ILmXv8od+pI2g0bOTlcB9avEnPXGY3JtmE0nz3jsYgV6essHc0Np0MuSk68DdFNmcpPQc
	 nO4CuNT2tjpzGdvgkTt1HU9kmAnzQ1gduJk789pqoAT8V2m1rLegFz/ttXsA2bk/6BAnN
	 bV1c+KVJxxKUDJhadKj4IOzI2eBN42M+A4hUh9XtTc5yOObNJCRQpcGkJ6M/2Kaeyrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWExxlHe;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF4560A2628
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF4560A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWExxlHe
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94959217274so30318885a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122803; x=1795727603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
        b=uWExxlHej4/g5IMBDYKhLOiKScIXVgK7/fzcH6uPm4B7PWN6GBFYe8hLUAyEn/NR/D
         yWcZtnkEjJ0B8q4SuHNDLDzaH58ZES6SCWCQz3EtIbIU57241Vop9zAETRC7e6LQ3ZuV
         GF+4KVNXMFPHAXcHx0kX8ysOznPl1EvWT9/s9gNB5ipWmFBgsNkdKIZnUP851RUyZCW4
         kIPK6Lzz1uETDrMf5HGJ3fBJpQ3RjWFS+k4qDmvFEItO41oRuGxzP8ToDnNKyGeaGyRL
         4HSoVGTPB0wHZ6o1DvkxzqkBZmEmmbYNTXgolxI6URnoVyGnEoZNDh+N9ssbSozCj5dm
         19Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122803; x=1795727603;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
        b=Zt8mawOdrYeadGU30KyBPzQDrgZEXx+eM1bgWE+N7RzEaPdqP/H6gOfECljhWGCBal
         jrcMcF9gT6kpSx793KooqKorXUBCUlEgRy7XtiWjkLSL9paLKeTK4efnQ9NGDG78t5rE
         vkpGZlG5+jx0J4s2dNCYNzeHLIRnEmZwroW13/0U3S52qO8ACiF/Fr4HAlSEDj4NuUd4
         GvEGPtt14TUYVugA/Q1Dsd0pN04tBWXFihu9ctO41agWBAbps8zsNshl0f/C4sERM52L
         Y9CzvFHLtTcBDg7WFhMedWo1fmYOub2tNLNMFACGr4hBW5LAKdFwdwkNd8+j+ZSKoyB3
         3Yfw==
X-Forwarded-Encrypted: i=1; AL+hErGEZ2cbUAsWOcRbQAhVRiRGOnlsQy8QNRYnNGub2OZJbBOfn5Rs8IasnOjkq9oeUpssH1/V6Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x/nJSTXyg6kpeDNdwBv7MJ/m+sxEImG9UPv+J7VfYzPOHJePn
	L9yagKzDi0eWXNl2TnkWs7zo9th5FMfrE7DWKlD4s8+F85voFqJJccdw
X-Gm-Gg: AYBFou1WD4T6OwWblB2UpPm2t1mt01cBch1S8zi49YlH9i6Uo2k30ozrgAVqRomT9c2
	r+BOQj0fPBIjSupGCQV7gtGmGcpzjM0Y4NiLdriQcwchpJ8hMKKDy9EZfgxMn/LxxTLkdi3S3zW
	SIgaFu2dttNaLyWQIZC/u+bT+Fpp4s9CZTYEFrCeQGSZ2deSgXVob7NFYvmK9+7lWeXjQF4Ovnf
	VAE/Tp2977ZNcDGjfJf2j5EtABv9CoEOr9/EzVaI4WfpmEviHJwskbiWcNMPD3plRxmcZS+y6+z
	hXumcJ3o5hfx/4lstxPLJOYrpTqu78cFD4X55mjFmEC2nzGOQH6fpkDYJD9/RV+d4Wnc6GGbpeW
	QEFnOC5GGao1nXWmDEE0HjEFMS5kFbwcdIdHmRgRCPGcNyoC9qyn/+b2VNhdMnT9BqkQ4MnKygC
	KRi5kux+52RcNCFtOVCVfdwCDjb+VarvbZmeWTgn2wIVo6IFWpqvZ2ksA4AjIT5cgZFD89Lzdlh
	ZgpvzlyR53ZVLUTTR8K7Ht6nAjWGW4UjHxTXi72HjrGI5tN2mmQM+RdG6YhUt+KpPYsJV/N40ue
	OWVtzp03Xkqx/lfyBR8n+ZotHhQ9DBjPKhDx3bDQESy1PH80mb1d7PcVU3jx7I9zRID3Mki1pOA
	NeErqSFv+xO0LSJ1lmU2W2zLSPi9eNHAKk0hs/DGyz2D0+WPrCKOOBfIdbtR6uM4=
X-Received: by 2002:a05:620a:460b:b0:93e:fa30:f1da with SMTP id af79cd13be357-949ba9e95f8mr157198485a.45.1795122802898;
        Thu, 19 Nov 2026 13:13:22 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a38bsm47654385a.13.2026.11.19.13.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:13:22 -0800 (PST)
Date: Thu, 19 Nov 2026 16:13:22 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
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
Message-ID: <willemdebruijn.kernel.10e4a96974af5@gmail.com>
In-Reply-To: <20261119144241.360238-4-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-4-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 3/4] tun: clamp zero-copy copylen to remaining
 payload length
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> tun_get_user() also derives copylen from hdr_len or GOODCOPY_LEN
> without bounding it to len after removing the virtio header. A
> padded header can make a short frame cross vhost-net's zero-copy
> threshold. tun_alloc_skb() then reserves more linear packet data than
> zerocopy_sg_from_iter() copies, and the uncopied tail can be delivered
> to the network stack.
> 
> Limit copylen to len before the NAPI fragments and skb allocation
> branches. The requested copy length then cannot exceed the supplied
> payload. The normal skb-building path is unchanged.
> 
> This matching tun issue was noted during review of the tap zero-copy
> fix. An AI coding assistant helped prepare the /dev/net/tun
> reproducer. In x86-64 QEMU/vhost-net, a 14-byte input produced a
> 128-byte frame with a nonzero uncopied tail. The patched kernel
> delivered 14 bytes, completed 300 repeated short sends, and still
> selected zero-copy for a later 400-byte frame.
> 
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Fixes: 0690899b4d45 ("tun: experimental zero copy tx support")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Thanks for converting the original patch into this more complete
series.
