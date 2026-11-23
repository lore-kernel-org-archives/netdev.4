Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434533;
	b=z9R1ybOzJ/c68eI6Rcr4IwkpEqlvdKyC/dKf5bYx0kHGh2ZCzaJe+DYWejh1XWeQ3JH9
	 iyqLlAzE8uVfcirRZ7Qo/sPD3O6EWlPPODZWAT/R3EisGhKY7v3bKsv7j+wwhG0LtYJzu
	 UR8biUuGfrLCfUx8mmjn1U4td9njndPri+fc50gpuiOfTgmvCfpoVYqik7ITG2dK7CqvT
	 wXCNAy+0UBDnFlFwRztg2ygqL+lmSYh64XzOB3H8yYNt7uywcTkULxUyDui3yOmYf5EQA
	 o99wWnEd+gq93SpR4UWHBJPrQkufO+YuTjFNQvWZmam933XosljnmKHBpM1kAm581Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
	b=5Z7HTprd+7cOHoRYnx9B+OLnFPQu6NZRfgIgYpvbmom56RLKdiXkBvKRu9fIi1Jkg2CX
	 YovaiLfIrrq7tY3nHlWOhN5lB4HiSWzCn+KVJhYfbh98UI0Fn4fnSOJmaCSEdPA7yyExL
	 DMFM56crqgTqcDG0Z7GDuwDPG/yyEj76SEVCH0aXlawL5xGGR+gyt2DBEdIstDOLIgdwu
	 lqBiH4fJgL4qqmizOkSvFrMGuIUp75cDB+5s7SyaX7lFkWhg94qTupARjYslybADstBiN
	 p8MVaz6PgSjI6od26AWwF5Z/nXnsG+ZK+lk8fj1qoBx+F5i5VHoW1ZNjO1lxbE6LyUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81345606A32E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81345606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99e0b1ee864so1144059241.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434532; x=1796039332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=PtBRx4f0zHMPWrKCeYo4jmRaJQ1LN5JSKPTl8SuaDwwGOylL4gwkeWZuRFAir8i0Oc
         XB5k0mzLRktyLJg+vl6aem4aZ3S0217Q3kedU2XJ6a+Rx8VhSCyQSgIcPtDw+IP9ceJx
         J7XQA7M2DQ9QOU9CoOt65NNP+M3zGNqHutwCOtJDBV4E2sybFUpiotdRZ3ia/0Br1aW+
         VZ6Kom8GTYEPap127qiISr/1UNfo3AcD6EfhKm7hnT7W26Ny4mS5A50oLqj7OTJQAqFu
         fZ9Is/5bx67lwhC+m4nxemqFdjv14gTMpbZYwWIzCosqHuaHMYyuL2c09z6O+3MlbY/5
         9DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434532; x=1796039332;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=ORNXxK+vnWOyDfY5tZmhGcl76HaaVCXz6C3ogbDBINHalstyLt39dWqC7VtsFgAPtc
         1pOfE/Zv5opyWe6c91HQRuh8U1hoU88S1NjnQBtBzRX943RSPbr9oqZtjg803ZCGrJJa
         tB9TdyaSvgNe/2z6hYl9d+eCghsyIju+TZHC5F8otaIcWQJfyfYpOv8d5gz0VHR2ikG7
         eGXb+rGBcAhgrZFHkujnyziNYb9ICDlRXm1rLV996+xGICdf8FCdLDs3xJZlcTsBoXA2
         H9mN9JBW6SDfVRbbbjjKldQKVt5AgOlj8C8K/mJOBGURpSJ+AVn96KkJ3bIQJcgYAulP
         S97g==
X-Forwarded-Encrypted: i=1; AL+hErG5yQQpib3abKbhsCqYfsqBwiDNW8/MdrpxT40byRJBFWw217kxpZmIIEJ2aH+dA1UTQhlNWVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FuliTBbCViUMkoFx0R/HHEuxM1wmVJ4V7F5jQT/nOY1K5+Q26
	5aLFHH5Pg/NMOiBf+bWLv8JwpMidC344EqtmoPb6Mvy2VMbj1j5445uq
X-Gm-Gg: AZFdTZeTVGfZR7JcU/FbCbZdkBTkqgh1VOBQPpYG58vv1ZTnrxtrxdm5BVImgL3B+5g
	4Vkhqt7Bw0s6XrVMcnygX3woFaSmd0OHNDpWReNSvT37XK4xAgRrdUb3FmB/OVOsIaXG1kTdjX/
	1Z5VqJ6dmIzMNlySbx41Aepe1qkeSy7EqEcxyafHEty8EknU+QaH2JGAhrkjIjZtNfQ65KDLevl
	AgjtoC0TsS4MDYRTk9zCD+5GT0OaFfp0izbuLrccFsKnzPb26z8TNLP9OXwzVAlTCGMkiTQILEx
	kBs5ERG+HpgkwP6pi73Us07Gisl9YKH3Z5SPVD/ekvOp2cflJT+AOWIEk0vBFJmvyJOZ5RZOzj9
	IKXW6O9QQ5PmgKPOevLrLUVU/ZTk6UCbko9DtSgziCYuRHMBS1XJ9AZbv9HEGcWMpI9PAKcdBtZ
	3NWaahAQkqQIMIhMNBPraNzWGxncZEg1r+u9NpR0FvgS5MKWeiNkMUwd+mC5CcUXKq1VbY22bBY
	NjlEJNMCbg/+SfsjTxOqkTyaSdJ1OE/4afcjqcwvGOCXbBU8dgifyArH19GfZqlY36qzpQ5VJ9c
	CekfnHFxdkTUJ4XW/kH1jMk5Ju0Q+tw1Vsc=
X-Received: by 2002:a05:6102:374d:b0:7cc:971a:61ee with SMTP id ada2fe7eead31-7d7393ff678mr5339224137.10.1795434532277;
        Mon, 23 Nov 2026 03:48:52 -0800 (PST)
Received: from ehlo.thunderbird.net ([179.181.85.100])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f92680sm11676646137.5.2026.11.23.03.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:48:51 -0800 (PST)
Date: Mon, 23 Nov 2026 08:46:43 -0300
From: Felipe Stival <v0idpwn@gmail.com>
To: netdev-bot+sashiko@kernel.org
CC: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
User-Agent: Thunderbird for Android
In-Reply-To: <179538279534.3135.17423952957860887247@kernel.org>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com> <179538279534.3135.17423952957860887247@kernel.org>
Message-ID: <B373FE61-88E2-4F2B-9796-01B39ACF7635@gmail.com>
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
Content-Transfer-Encoding: quoted-printable

> Can a poller that is already waiting still miss the KeyUpdate here?

Yes, any record tls_sw_recvmsg() puts on rx_list has no wakeup for
concurrent polls=2E This predates this patch, and I'd say it belongs in a
separate discussion=2E
