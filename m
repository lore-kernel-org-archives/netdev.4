Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792612;
	b=y7/mZ96zSSU9Tcw6FEZ7cuaBsTWoaTzYnysaewr6S4SyIbCq8va/AlorhO/mkH8tsVXk
	 Z6LmFMML8Z06RXIwJM4jHKK4U8Opaml9V2s2M7NRXXLDs6MSLBisPHd9BbKL0XKWDDHgQ
	 /mJDSRKz69J4jnO64fVKnFcaAOtNiglKoANGGKG4cjo3cgD3MBL1lr/4TYBelsRJ2f7tE
	 3kQRQu1k7fNx0WDcc+XT30J/pZkZmV3mXW6mA2vAGEDdp3SqC2tdAQMV22asTlBd9v2eA
	 dfbrMIFn38ibHpHSllTT7gk9T7MkJg6HsR2qZry2MKda7xYNU0CUqI4HgVcguEfKBIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792612;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=22pq0D0UozYz0ULJwz3jmouBNRzl0Chq+OShaylnwfo=;
	b=qppxGdxMv3zkq5Rp+0R86meSou8hoi1siDk5NmJ3/mwXP9WjkPqCulANZNJ51k19EtaR
	 kMrxgGSDSFkDUrT6f8YtyG7/biNPp/uWUPvLdcKOyK+kjhwCQgM6lgL8bb7KVS7WTssKf
	 nEQ6hUxTpdmQW1DPRYVb8WUVHtsMSZUblGUUNUkfHAstcwHwETL+ajXVNM6E3ufzIFs9A
	 Yd1R4DIDUd4OrcO9QngQguqPGjEkt+I2PxOTbN4mswd8LZ454MzRLjX6dh0Bcv7tbK95v
	 vpxsGwFaw8IE4o8645juL6be/F5yF42Pr8+sdGt7xLIPx3T4seVB53De5ZBxjGVQvLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=d0B6Rh3W;
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B04606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B04606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=d0B6Rh3W
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jbcTD2WJ1zX4;
	Fri, 27 Nov 2026 16:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795792608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22pq0D0UozYz0ULJwz3jmouBNRzl0Chq+OShaylnwfo=;
	b=d0B6Rh3WM4oRos+wUaTfYXY1NFP5Iv9e2wS3DE70oj2JPrPpODCCsqdzwDqGL6xb5cTCIJ
	1TCYbtdIsyuBuT16r3PvCiEuPue60FDhAkOhP/Ld21KetiKz1oi7g2BzXdMjMGix4vX1b5
	7gs8LZQIF/4fJW3Um/EiujmZ+c7SFJyTQkf6KEFtGNiJ4FjayGsq9yxTsFh7rdnDTehkNj
	MazxjURET0VDj28wRaH3Qnf3gEHxItrlXrsfpbF9ytevhyZjOdOi13BtA0YnZOJayYgWNp
	BVbk5KkCA2s+PJTDQFyf7bbWErLUtZULTDW2/XqxMTIw/N9fcHoDSudOBDiN0g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
Message-ID: <68fe9e35-1968-4a2b-9405-bb86ddb16583@mandelbit.com>
Date: Fri, 27 Nov 2026 16:16:46 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/3] net: qualcomm: rmnet: fix TX aggregation
 bugs
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
 Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
 Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Daniele Palmas <dnlplm@gmail.com>,
 Koen Vandeputte <koen.vandeputte@citymesh.com>,
 =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
References: <20261127150827.785753-1-antonio@mandelbit.com>
 <179579246331.3294.12257658118316701172@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Organization: Mandelbit SRL
In-Reply-To: <179579246331.3294.12257658118316701172@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4jbcTD2WJ1zX4

On 27/11/2026 16:14, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.

Bugs were identified while reviewing [1].
They were then reproduced with AI assistance and fixed.

[1] 
https://lore.kernel.org/netdev/20261002143529.3217189-1-koen.vandeputte@citymesh.com/


-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com

