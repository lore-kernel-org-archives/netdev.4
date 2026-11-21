Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219588;
	b=XpIPJqjHrBhuj7qL0opZM++Zun0x2NO9VnUoRb9FxhbXMVJ+aAhHxqZ9yHqJ+tKEuuvW
	 8Ia9dMGsI8jMF1AydnrdWoZ+jb1xOkQoWqh3k2cmwj8mLgAPCKXOfsWe1Wce5uWELw2KD
	 67jHnubv4o5GRBtGjngzWUaZvwWB7AFLtWaWRGcgIvCbRl2K2ltG9Oj2sRLRMUdo+oN2l
	 PMAMSDZSIR8GisX8jtC4R3qasUtFZdPfWnCim9+WErlClm8sO8roYBoxlcsofJoVhAiGi
	 RcKzvLSUK5nR3SxEo01i8zhzgVZTHeDmU1Bm6z+qid+q1crG8MJ5xhAWNEUgEFmMORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=y9hC8BO0Mp4YVy4aHAIBzwFHt+H9i/iWRCKp/FODzSc=;
	b=PUJjsrVxdlWhZQqlyStnLfzYQYA+AwOAYp7cdVHbAkDL1YbzRFid6YiJVUdvGpRLCi11
	 UfqUr3XHyJsT51pLFlF2K3FVr5VAKM/mL/CGIcXz4j43RJe2xYOQRcRMesqPmzcELA/SP
	 yBp9cVRxRsy9kgxZS0LfNkYSKx1vopTBs6pVY3vm8Zf4LnpC88Vm8Jp/zD6fw4MN4hFGX
	 BlJtRx5HsbCkUIF7gM42ntzo74ga2h5zHyb0XLOggy7Fw/EXOpY1oNSBtDRNrnn6/OOkA
	 nNE/QxzB23BpzMRjvdFjUf8v56qt8J6pt0VeXY0lDUlPLcGq8u2wSFz2/TzQ7np3aKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaadUWo2;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD5606A6AA
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FAD5606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaadUWo2
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so2147834c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219577; x=1795824377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9hC8BO0Mp4YVy4aHAIBzwFHt+H9i/iWRCKp/FODzSc=;
        b=JaadUWo2BmS24mgyyOvhRl/74/Q15imQqv1UnbHQrkWb3nuNIAOoacmTmtqOyf9khn
         G7Qzcb67VMbDIlrmxjAJ1zAj/gt06pvWVi3jQpmuFzFdNC1zUw1yZF/iezgWniKkTThZ
         Hzjs0bEo/8vobfK9Siebh+iuMrVc8wgIxi2qg/tTFdxI9QJ/gz+J/Wqa9AflbQgwOg+8
         Y4Cdk3wcBRQkxGjkhEgLxX4u1uVqsTkQrXbQ++iW7ZtGhR/noEz1riZ3GAOcEkZ0hWBv
         5IxyirtUebsNywLZEwGl7WcuUsB2neRcXlxzmpyLOazwyIidSwFGGYQXG0IY0mSUmflE
         I+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219577; x=1795824377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9hC8BO0Mp4YVy4aHAIBzwFHt+H9i/iWRCKp/FODzSc=;
        b=Qhn999EKK/Ej/EiIsmieyLtmP9XJeSnoEYWKs54Mjzl8bwirdnfEsxOVBTFpmU42Jt
         kTarsqZPwoODD+A+nKNDCsvY/EpfL770//oVWydZY/O1IS/Y27kBX0cGvwbeJu5BWlG+
         4hxHv3Xi3QW169/OosG0LNUj43sPFW9yzE2/c1yBBtGVKdcLtJizFZydX7sIl5DsUJ59
         irJgxYz2SAQHKT/9QzTP8XoQCZoZWB41OPRM2Ve1SciJZNeDeRp5ELUjYjyjo8RByqEy
         t9xK1YNKp7b7/tJJD7xmbrJHdt/vvr5cPLV1THT4TSC4pmFsS+gDShrtHHsgpmu0izeL
         PtHA==
X-Gm-Message-State: APuU4Z85PSVsOu3sojgr3FhlHiuyTQKeBsPhGNl6q+EbGb/CVBCB6GRZ
	MMHmVBbNPfmWb/zsc2kf1rgvsGObCM4QyR9h4xDwzY6V/Xo6CggNRNkM
X-Gm-Gg: AYBFou3smTf0bY/u6DmC3cSaW337XFKHILpdbOR5LhdfQNHkDnyA1TBl2Ly+ZTLYFLB
	gFTTrfhHdg9Hh76GKZbItxrd7XBi4BbTQVrqynr9wROBT1e10MeBvSh5wSiKNtr0whMrrE2F0e1
	/GZFu2+BEaRv3byTdtEAwbbEp6sdDgLxyA/SCrVJaEGQOm/Vo+TnF7NhfM5wJ++NKu0pdsqPk3x
	D5XD59HQzM/qLPmK829wwgQtWRJ18P1Jct6gqi5dwxOGRUwEQKnQLUXDhIY9kiomtthCvGj9T37
	3y7BWAdGPBKI55y1Z3i4YwjihHqw/AIqXbZznDx3R6IiITFa5yTbGlw256vwQGVkESTV2tY5pKW
	pq+UpayQ1yWHtYUotgOR+w1IGJ5sw0EYUu80nmG72WPEMIEzSGyYsyfPosOtt6Ar9e1lU0+7xOo
	hm07tRpAC4L4fPV3XhTVIduspDRFHaoT5XsgFlY6guQ5ycDmElKca6NAKpd9N4+2pd/frePaQEk
	nKFWNHE/Pp3ulOSaMqBYBoVfUM4Oc5amvFMZLux5ENjxFH1Ee24VJDmDLUXdkhbW9MpINwdjIVL
	RCVGKUvNG3S5bIcCE2rgB7Z+s5GwMsyLKJRQt5G95HCSJniKtcQTe4mT
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr3767017c88.1.1795219577218;
        Fri, 20 Nov 2026 16:06:17 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm9946452c88.12.2026.11.20.16.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:06:16 -0800 (PST)
Message-ID: <3f4424da-9244-483c-8662-2ba2d3b5eb94@gmail.com>
Date: Fri, 20 Nov 2026 16:06:15 -0800
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
Subject: Re: [PATCH net v3 05/10] net: au1000: serialize TX completion with
 packet submission
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261117193223.2795612-6-f.fainelli@gmail.com>
 <179517075632.3136.4816970691265925776@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179517075632.3136.4816970691265925776@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 02:32, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] au1000_tx() (drivers/net/ethernet/amd/au1000_eth.c) now holds
>    spin_lock_irqsave(&aup->lock) for the whole transmit path.
> 
> --
> 
> net: au1000: serialize TX completion with packet submission
> 
> This patch takes the IRQ-safe aup->lock in both au1000_tx_ack() and
> au1000_tx(), so TX descriptor reclamation and queue state changes are
> serialized. When au1000_tx() reclaims a completed descriptor at tx_head,
> it now also advances tx_tail. The skb is now freed with
> dev_consume_skb_any() after the lock is released.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 1935b1d4b1738..805aabc6721b8 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -972,21 +976,25 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
>>   	u32 buff_stat;
>>   	struct db_dest *pDB;
>>   	int i;
>> +	unsigned long flags;
>>   
>>   	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
>>   				(unsigned)aup, skb->len,
>>   				skb->data, aup->tx_head);
>>   
>> +	spin_lock_irqsave(&aup->lock, flags);
> 
> [Severity: Medium]
> With this lock taken here, the rest of au1000_tx() runs with local hard
> IRQs disabled until the spin_unlock_irqrestore() at the end. That
> includes the packet copy and the zero padding loop:
> 
> 	pDB = aup->tx_db_inuse[aup->tx_head];
> 	skb_copy_from_linear_data(skb, (void *)pDB->vaddr, skb->len);
> 	if (skb->len < ETH_ZLEN) {
> 		for (i = skb->len; i < ETH_ZLEN; i++)
> 			((char *)pDB->vaddr)[i] = 0;
> 	...
> 
> On Au1000/Au1500/Au1100, MIPS_ALCHEMY selects DMA_NONCOHERENT. That
> makes the dma_alloc_coherent() buffer uncached, so every store into
> pDB->vaddr is an uncached bus write. A full frame is up to about 1514
> bytes.
> 
> The RX side has only NUM_RX_DMA (4) hardware buffers, and they are
> serviced only from au1000_interrupt()->au1000_rx(). Before this patch,
> the RX interrupt could preempt the copy.
> 
> Could this longer IRQ-off window on every transmit lead to more RX
> overruns (RX_MISSED_FRAME) under combined TX/RX load? It would also add
> interrupt latency for the rest of the system on these single-core
> parts.
> 
> The copy does not appear to need the lock. Suppose au1000_tx() has
> checked, under the lock, that TX_DMA_ENABLE and TX_T_DONE are clear at
> tx_head:
> 
>    - au1000_tx_ack() stops at the first descriptor without TX_T_DONE.
>    - It never touches the tx_db_inuse[] buffers or tx_head.
>    - ndo_start_xmit is already serialized by the TX queue lock.
> 
> Would it be enough to hold aup->lock only for the descriptor state
> check, the tx_tail/tx_full handling, and the final len, buff_stat and
> tx_head updates, and do the copy and padding outside it?
> 
>>   	ptxd = aup->tx_dma_ring[aup->tx_head];
>>   	buff_stat = ptxd->buff_stat;
>>   	if (buff_stat & TX_DMA_ENABLE) {
> 
> [ ... ]
> 

Agreed. I have narrowed aup->lock to descriptor reservation and final 
publication, moving the packet copy and padding outside the IRQ-disabled 
critical sections.

When submission reclaims a completed descriptor, it now clears TX_T_DONE 
and advances tx_tail before dropping the lock. The TX queue lock 
reserves that idle descriptor during the copy, while au1000_tx_ack() 
stops at it because TX_T_DONE is clear.

pw-bot: cr
-- 
Florian
