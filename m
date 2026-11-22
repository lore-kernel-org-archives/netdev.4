Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343056;
	b=LBrI5cBh0HamqLvuhnY8aZhCaqNoXRiC2jYxiFMfdMc6rrnakUsZBotpTIumNc9+v+0I
	 T2WVs9wMRd+2Z99Tss4FKDWFetb1WglnApwDZu+MSXSjrqenxN6eLkeBlxHijorGZ7rme
	 FMB1UIfjDkVrgLV8A63oD5uuznRZ5WtgrO1CoO9voLY8M/99hOQ1IGq8ERQdPCeDZ/gj7
	 xa+zIlyulyEHnL+vk5bf5YHkwk4S4wBh0awxHNOwA5Y6wQqlO5ZYzINmZA2NpdZN3TIwD
	 IUMDZdNy6922DopINSWErjmoX+sza8pzYYEUj0LEdrpbjGYjlRe0sSNUGRXmAxdCjSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CURJOIW8YVhRngaiR7g8++OMuLl8NziGeTmfa7BjCfk=;
	b=BX5MOjUGXl3+d7zYf7VRNIcPfiY1KVlOP7FeLDdaFTzyysnH1iokqV+w8BX6oNFZc4zN
	 +UJUqt2RleXjv5oNNR7W0fO4S2fA72e3mVFW8OftS5nVway7OZGpI+ogEqR4+DTqiv0eV
	 kvZiOBgBWFWikre1yh1APvJm5P6RHWzS/ItLL050Fdq5Dxv8VmgwsluJtisJ3Kw+oF69k
	 LbtwXSrTWXsFa+hEzcF/Z1Jc/gKDqRXCLrdUSHOz+4tJN95u92hH/+FezrUlyzbhQW/uP
	 dLI87ydPq+ypufHTRHk+r7BsvH3XDG8sHymcd1+RMnuwgwLOx3dhQioIXfo+oWNPOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5t5Iv+G;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81DC606A336
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 10:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D81DC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5t5Iv+G
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1075341b3a.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 02:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343055; x=1795947855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CURJOIW8YVhRngaiR7g8++OMuLl8NziGeTmfa7BjCfk=;
        b=Y5t5Iv+GxHIVRNL1hLMtJTy9/LL0TrrHPci4ClCUB3ON6bWZf0BKwNKmVhRtHY6rtK
         oaRLDzJCuChOaHdbRHchOk6WMH++YIgoXQjAN8pe2AG5yVoD91wRVqGVL2xLdjSks/4R
         7QQQrlngy9WwxzcBKZRakEMG4x8VhBxlarpfkXDL+Ow+5IykNNQx4dcdiTRYIDW1Btma
         K+pZLL6rfliv2dHbgaQXhe79NIE4SdUGenZV3r0KX8TRE6ZIvRIW484ccwaIgsIfAOjc
         lmI4CmkJNqGyNMTuATUjrRYsWhXY4S92omZgMdLxn8TIoPXgH2Z7NYrbTa4LZq5XMYIk
         MD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343055; x=1795947855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CURJOIW8YVhRngaiR7g8++OMuLl8NziGeTmfa7BjCfk=;
        b=HPkOGbCD2GqNmNKgRma7fk3fajTT1PMQIvQOPSCwaO/5NFzmyoAi5JMM7czL8mRHyq
         IC84cYqs7ahd7LVH3sIwM3oK98wDYUTVOfwiV+lKi9qJSK9uNsNXn8PA3zf7mBZiXQ5U
         SIE4LHUjvqzPqhZkygDMHnFb49e8wOWfeLksVH2ZaqfCJ5HJmbXjU8hqvEq4/07bVwpF
         apT4lpBUFFcbslY6zBxWy8HhiFndRtJXtVr+l6iUW2PzasHFRjwYP60IaSrIQ7i32dle
         riqc950bl3q6K0X4LklHiNNOH1T1ECOC/o2Gah2UwB21fVdKY5hz03RWivacX1WmLY6C
         xZ+Q==
X-Forwarded-Encrypted: i=1; AL+hErEYZGCdJ2GX6NQTDfuCixdwFWHEuSnmy9IHFoIoCjogPVB4J5x8vf+07YOMX3hJiZeUdHwYkd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z8BdhWvxHAB8MoZPyVSGQtQEAklhtoiCWAh+ry5qlaZbwT78H
	0ldlTog93F/wB4yaVl8jBoUHdutYEKvgS0rCFMi0VbXe853pcgWiZqS/
X-Gm-Gg: AZFdTZdMEPRFc76mfRa/JZSp44v5gRO5rZKs1fSSxu13gumPEo+VMf0XM76KamyZbpi
	kraYEnBjwn0nsbAArSKzheG7XABhOy0H4TFlZTfBvIK3x67kyQ0+T5oYFYNJt93SoFbp3YJTrJU
	PdGDKdV6faaARCpuVYOWR/3nbktBST22JcztZ08yLBGbkbfHbdp5v4Q3l9I8imq1k0WZDkEcNUz
	Mlq7MQ+De5HSQBywbF6FqqVHMUHdn0lBa1zZ6eJCGAt+o9pvUJtGvdTnweqrcANg1hOQFAb0ZtN
	+vO84ymbVNwJ0ZRQ1D+Z/O7VCvF0fmDrE8BBNnASAPXY6ksgOzJ1cQk3cyZSgleBiPVK1ju7r/t
	HbdGmAZ+FcdEOhOKSYyeIitvbwNjkhPIsOe6IH0IuamEei2MNsZRKIQJCrZevS1dJaJwoFpjcv/
	3sTp6K4ItiFY/dhEDbs+gAyOzXFr7XW0SVBkIpkLDzl+qVgoMpjLgMl6a1cvzMRJwXWFwbsoXW1
	5Y6/Rp28y0v+jB+8Hx2cMveWCQOxwAx3Rugj3MRyyjktFc3SM1RMMs8q837CwGjVBacHXRtDvWn
	eUF0/XlRbGlCifkDATiEqOMdJS46Kq2ijS/0Ogn4uBgq3Bnarv0Q5w3OLzE15iLKULc=
X-Received: by 2002:a05:6a21:4cc7:b0:3dd:85aa:4524 with SMTP id adf61e73a8af0-4014b56547dmr8506160637.31.1795343055176;
        Sun, 22 Nov 2026 02:24:15 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3968398b3a.36.2026.11.22.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:24:14 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/1] ipv6: fix MSG_SPLICE_PAGES with a dst trailer in __ip6_append_data()
Date: Sun, 22 Nov 2026 19:24:07 +0900
Message-ID: <179534083350.2499182.16621119046570934510@gmail.com>
In-Reply-To: <179534083350.2499182.16169984227830330896@gmail.com>
References: <179534083350.2499182.16169984227830330896@gmail.com>
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

When __ip6_append_data() starts a new skb for a fragment that is not
the last one, it adds the dst's trailer_len to datalen. On the paged
path pagedlen was computed before that, so with an xfrm dst

	copy = datalen - transhdrlen - fraggap - pagedlen;

is trailer_len instead of 0. getfrag() copies those bytes from the
message iterator, but the MSG_SPLICE_PAGES branch right after it also
runs when getfrag() succeeds and resets copy to 0, so length is not
reduced by the bytes just copied. On the next pass the splice branch
finds copy larger than what is left in the iterator, warns and returns
-EIO, so sendfile() of a UDPv6 datagram that needs fragmentation over
an xfrm tunnel fails:

  WARNING: net/ipv6/ip6_output.c:1796 at __ip6_append_data+0x17ed/0x4b70
  RIP: 0010:__ip6_append_data (net/ipv6/ip6_output.c:1796)
  Call Trace:
   <TASK>
   ip6_make_skb (net/ipv6/ip6_output.c:2097)
   udpv6_sendmsg (net/ipv6/udp.c:1717)
   sock_sendmsg (net/socket.c:841)
   splice_to_socket (fs/splice.c:811)
   direct_splice_actor (fs/splice.c:863 fs/splice.c:1114)
   splice_direct_to_actor (fs/splice.c:1023)
   do_splice_direct (fs/splice.c:1157 fs/splice.c:1183)
   do_sendfile (fs/read_write.c:1351)

IPv4 is not affected: __ip_append_data() does not add trailer_len to
datalen.

The branch was added by commit ce650a166335 ("udp6: Fix
__ip6_append_data()'s handling of MSG_SPLICE_PAGES"), when copy could
be negative on this path. Since commit 736b380e28d0 ("ipv6: account for
fraggap on the paged allocation path") a negative copy returns -EINVAL
before this point, so remove the branch.

Fixes: ce650a166335 ("udp6: Fix __ip6_append_data()'s handling of MSG_SPLICE_PAGES")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/ipv6/ip6_output.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index cb648c839431..5887e537f662 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1742,8 +1742,6 @@ static int __ip6_append_data(struct sock *sk,
 				err = -EFAULT;
 				kfree_skb(skb);
 				goto error;
-			} else if (flags & MSG_SPLICE_PAGES) {
-				copy = 0;
 			}
 
 			offset += copy;
-- 
2.43.0

