Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621722;
	b=j6G+3oGEToPP01zr8F9Q76wQoRcxW6rr7hytIQRkhgYvmdyJtUJK7Ut0lVkn93wo+X+1
	 /Hlnbm0qLiHHUHxLDIV5T7YDFEY5hF2pwgab8UQPTc3nQzo1HpWxtNLTweQXpx8j4FssW
	 JbHCsvENPUl0txesoTWi2Hg7frl1lsD7kEzN52iCORUDzZyqMxJ25S0ziuPz1wKei+YFd
	 QXKvbPg0NBp4i0ApE3Sl+8lT8V1fRnkjeVmnx4ZLLJy2LeOzrD1PCYGL/2GdXJRGbzTrI
	 4oZtMHyMtRlGqeP6ZO201ow598VJswXKH1B5qVqrwYqs69YbRZoWrQdLtc9b25owNrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621722;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
	b=mtUo44kqnhp2ucLGSfkgUYsVm3g338zgjf5P/qsEaimds9p0grlL3UPoNfIoqiKq7afv
	 VWScVKJ71EScHtp1Ibqvk6J3PjgwWRRJPxqexHw9srLzmLUpV4BBetKR/bOjaPCY0T61C
	 XvQ0spwj1duE2+6TErlp/2avYsQp1txLc3l94MSCs+Uqi5/9GVq5IbQV7vjYvjotdcXlf
	 5C9J6UBNghvBAf8WOcGnlXmUT4KeSIpuK1dED7ti5fw8zrCzvTfaDDF7GT1+sLh3spd0s
	 vwlpP0PdePhN/avVM+bZabVptT5Jkltcc9h1il58QYDIosWJcCcOLapLTHQKLznlPbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nmep5Zxi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gLHHS+Fv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F332606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F332606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nmep5Zxi;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gLHHS+Fv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795621721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
	b=Nmep5ZxiA356MmdZh/F+FnCO5DUcWucQaKTQMfWh+jwh2ss4Vvt365J+ud6lrRXOTMi2eZ
	QfTSRnBp3Sugjn8qgOIBC+oRLT4Z/t3DQQrYsLEWeYAGy3vWdO0SJExiHqxNAEZQrdmPGT
	7ePeITzGS56D564iMeEixEyWlrjuYF8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-o7laOhMzMvidQK-Ca1hYBg-1; Wed, 25 Nov 2026 15:48:39 +0000
X-MC-Unique: o7laOhMzMvidQK-Ca1hYBg-1
X-Mimecast-MFC-AGG-ID: o7laOhMzMvidQK-Ca1hYBg_1795621718
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e011829easo3598429f8f.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795621718; x=1796226518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
        b=gLHHS+Fv1RbxSf8Dzzd7I4sRIeioXwhbo0vdNSA25I/oyZU2TS5G7uH5jmlJa/f0BD
         nQP6ScNpXk5GMW2cvt321N5XZlHJf5EqckTBlalO/Dn9Wk2t/To2hny106zdknzoEtNV
         BJwOQFCHOkzL/MOCqyQbSVw35whFOtHGYW43P1uoK7hQhWClTR0CacHmuTC9O3oMXjw2
         bED1hnj+6oGeQfabHavy5TnVYiKx1oHbyV6jzPRDDCTTft2OAzyt+G24WOBrcbRixJYE
         F1784m+o4eEL0ocnUHWabYK84SywzPlB5Z+QdQ0CCDblpGVam//QvIwOojSIn34/er8n
         nGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621718; x=1796226518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
        b=1yiiwBSNuiWY97RYmcEeqUs/nqr62pqSGFufdsR+qKxsV9pHQbtrMit0JUdb6wv66v
         zZYcloD0+PZw6aq0Z4yUUuzP11l7qADFEDCr0H4c0n1GW0wcp5j/q7bgA5QOuKIu0P2Q
         r/5j2kg8KqUlHnlnMW+F4H8WB6SC3lXXfS5B+bzbQjxXvoQhLlbmxK5iKBlWxT1o8eDl
         Bhy0ZeELcBYD/f/WmW5UMt93s4d1Tg6+iNMQ6K1Ln/RJu35Wf6oG9+PhOkHBAROj8CHE
         eygIQ1BbWHzaoGIzH+KjO+kKKJ45yazSZsorNS9pt5l0cqgTKRC83kt2cI3Qckooxm4d
         XdoQ==
X-Forwarded-Encrypted: i=1; AL+hErHQL51DQUXfBZ0o7m8YX8o1OYzP5QEiKP84zumgjBrwyrtsdThTx+6xnrjb0UZ2Wn3axxEeVDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bbRShp+e8LU641/6UEyPFWxiDfMiXOQx21YjwrAyGlkma1vmZ
	QvnZHY6tFXYSPFYGrTLNpqik2eeUMe2P+zHLTG/wctYwuAPpDMwT9AcA5vGhpuY1/Vf+ZGIHUqD
	oxqR0dkz52HEd3U9yXZP0+cxA0IpA/b3rl0YA6Z/yvKjmbsVcVYbeqy+oSg==
X-Gm-Gg: AZFdTZelwjH8PxZmF2w3hh572DH9pCMTeFTWpK6FC2iEMwjphAXLejr0vRS7vUXl1fO
	FstQgbGlfP1rn1cITI7Ze5fwICikvfa0CuTNDeZ5y1lux4bUUgBU+ZhQv5QuOOQ/9t6rfz8MGpm
	cChBcZf8mXc0AmobJNUW7Gni7l6fRJOpHQtJlKl8doy1hyexuupAjMS5d+Xk++1Ny7i1RLisGH2
	IaQI5spO1lU5jIY34eUKIE/n3hPYy1J2sb+8DvahR91wQ2MfaSrmBZ0Gr61qhqYyoB8HcPLDh8j
	1KT8r5AgwBew/RWUEWtkLoHDtO10eV1U9HyR8zgXWkrsEXQntd7v5ChVhu1sl/QUw+uYV7PqCTG
	4j1HKlVlB11CFBlBIvrCboNia234x1E4+rqXPxJqUD+2faB3dXe156JYMCYzo/x1XGQR5FAFzXN
	QnVDJqqEiNIbhNmEMkcNHzXo8hCylu8EGNarKGUP/FkuTj
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-4abb7f3e149mr34479768f8f.50.1795621718026;
        Wed, 25 Nov 2026 07:48:38 -0800 (PST)
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-4abb7f3e149mr34479706f8f.50.1795621717500;
        Wed, 25 Nov 2026 07:48:37 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm28780389f8f.45.2026.11.25.07.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:48:37 -0800 (PST)
Message-ID: <3b3939f1-fa7e-42ed-ac74-c96c0bc930cb@redhat.com>
Date: Wed, 25 Nov 2026 16:48:36 +0100
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
Subject: Re: [PATCH net] eth: funeth: Include FEC stats in
 fun_free_stats_area() DMA free size
To: Daniel Machon <daniel.machon@microchip.com>,
 Ian Rogers <irogers@google.com>
Cc: Dimitris Michailidis <dmichail@fungible.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Elkin Cruz <elkin@google.com>
References: <20261119170613.1519353-1-irogers@google.com>
 <20261123090722.z5xcxwwdelnnjifq@DEN-DL-M70577>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123090722.z5xcxwwdelnnjifq@DEN-DL-M70577>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 10:07, Daniel Machon wrote:
>> fun_init_stats_area() allocates coherent DMA memory for
>> (PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
>> 64-bit counters (632 bytes), whereas fun_free_stats_area() omits
>> PORT_MAC_FEC_STATS_MAX and passes 616 bytes to dma_free_coherent(),
>> triggering DMA-API debug size-mismatch warnings on teardown.
>>
>> Extract a shared fun_stats_area_size() helper used by both allocation and
>> deallocation paths, and cast the leading enum constant to unsigned int to
>> avoid cross-enum arithmetic.
>>
>> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
>> -Wenum-enum-conversion enabled; fix and changelog drafted with an AI
>> coding assistant. Build-tested under LLVM=1 W=1 and
>> -Wenum-enum-conversion; not tested on Fungible Ethernet hardware.
>>
>> Fixes: ee6373ddf3a9 ("net/funeth: probing and netdev ops")
>> Signed-off-by: Ian Rogers <irogers@google.com>
>> ---
>>   .../ethernet/fungible/funeth/funeth_main.c    | 20 +++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> index bad8276d26b0..e0d4e69abfa4 100644
>> --- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> +++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> @@ -1457,17 +1457,20 @@ void fun_set_ring_count(struct net_device *netdev, unsigned int ntx,
>>   	}
>>   }
>>   
>> -static int fun_init_stats_area(struct funeth_priv *fp)
>> +static size_t fun_stats_area_size(void)
>>   {
>> -	unsigned int nstats;
>> +	unsigned int nstats = (unsigned int)PORT_MAC_RX_STATS_MAX +
>> +			      PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX;
>> +
>> +	return nstats * sizeof(u64);
>> +}
>>   
>> +static int fun_init_stats_area(struct funeth_priv *fp)
>> +{
>>   	if (!(fp->port_caps & FUN_PORT_CAP_STATS))
>>   		return 0;
>>   
>> -	nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX +
>> -		 PORT_MAC_FEC_STATS_MAX;
>> -
>> -	fp->stats = dma_alloc_coherent(&fp->pdev->dev, nstats * sizeof(u64),
>> +	fp->stats = dma_alloc_coherent(&fp->pdev->dev, fun_stats_area_size(),
>>   				       &fp->stats_dma_addr, GFP_KERNEL);
>>   	if (!fp->stats)
>>   		return -ENOMEM;
>> @@ -1476,11 +1479,8 @@ static int fun_init_stats_area(struct funeth_priv *fp)
>>   
>>   static void fun_free_stats_area(struct funeth_priv *fp)
>>   {
>> -	unsigned int nstats;
>> -
>>   	if (fp->stats) {
>> -		nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX;
>> -		dma_free_coherent(&fp->pdev->dev, nstats * sizeof(u64),
>> +		dma_free_coherent(&fp->pdev->dev, fun_stats_area_size(),
>>   				  fp->stats, fp->stats_dma_addr);
>>   		fp->stats = NULL;
>>   	}
>> -- 
>> 2.56.1.708.g77570a6a1d-goog
>>
> 
> Fix looks good to me.
> 
> Although, I think it's more common with a compile time constant for a fixed size
> used for alloc and free. Something like:
> 
> #define FUN_PORT_NSTATS ((unsigned int)PORT_MAC_RX_STATS_MAX + \
>                           PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
> 
>          fp->stats = dma_alloc_coherent(&fp->pdev->dev,
>                                         FUN_PORT_NSTATS * sizeof(u64),
>                                         &fp->stats_dma_addr, GFP_KERNEL);
> 
> Not a big deal though.

Please use the macro, as suggested by Daniel. Also please wait a few
days before resubmitting.

/P

