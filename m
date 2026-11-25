Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578378;
	b=JcsYjpvLPjrHzuTq1oUAI6Bp4RznceirFYannD0dH6hhBBQ8XpDTdvq9eGVY6NbYYMmG
	 Gptkl1MLo65gTRXj4EI/rTiIYTkweTKVDLMIEXWnfxDy3bWZ+EYrf5cv1fd5oF5t7pBOa
	 ruESiUQhEUrKe/Mw4+0tNPYXZMv1I5/PdlB+GCl6UodJrMIfO7Ko8PdM9BnDl+x3DSwwx
	 AoUah/wflvOgJW9kd/Y+JvUSoNvlBDj787GmlfxykL2Nf2eNm5jKiu/TZ3fsD2SElxFcQ
	 OSZX8b0uZ9dwYFrj8a6rCSuaQHyDeQvepFf38I4DwIbK16Kq6aCxwQhAi0tRJP9/r5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bQJJxCrofGpC23ygbnJv9Goz9D/r5cCIAV9NozCmzg8=;
	b=SG6FhBs8fvALgTSyF+fNHiVmxto60ojyKAzNchkXI465Dl8sebwO6+0YxcH4fe40EFpH
	 cXeRucfCIue11Y0YyucPYfzkWBA8rZZ+dXVNTpi4qS+XRHfsjCmW9K7nztA05345CZMXV
	 Egawrdqmgt2zmegcrEy0zWAH5XJpKmrg0i3VIHCkVIKPrhSlTOkiRjYtpY7mam1573CfZ
	 SjcwWLtNzuZ6cvjb4rglwQb55RxY+YWupBYCx39Fjo/dR01oQh9Oi1wjT7PfOPGLhBPlw
	 PobzWWjgyDfmLNs2iZQARNiRcps+iHMMQTMhJSVuDJc0GkvWYsy3vlUPngPp13WxtRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfBaCMbm;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63AA606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gfBaCMbm
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so4704888eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578377; x=1796183177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQJJxCrofGpC23ygbnJv9Goz9D/r5cCIAV9NozCmzg8=;
        b=gfBaCMbm/fp+9m40d4cUAG6gCVE+9Z9SUZjyO8wQi+XcTxBe5wkmO14W6dzexi4ZFs
         QV/zE80fsDhIXyknU+Lu7BEwNilJByhMtnXsSwrud5+UOPw9FV+bVC64BNUHN+diR1uz
         bj2o/F3stORePkwDn1gOsLNsPOdcss4BUcWQHnGr0TKUIS0MM1S0X/ARpiluD2Ulo9Sc
         pRjcLF69YCkFg4UvxrUS8neyxgUnbedNMwyZTHfnthBv5Os/ckOdSD8iib33IXiqebld
         HUuyHkC6V9Pi2uXQ0CKJt5N3hipm2xElyk68UJrwPsbkAAgZ2hf1Z4mlHhax2lNoRpQC
         Jg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578377; x=1796183177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQJJxCrofGpC23ygbnJv9Goz9D/r5cCIAV9NozCmzg8=;
        b=Om88YvvCzfYbK2GdLxnLetk/YMpkTJp7ZwqfxGhAGEsm0PfgeDU3OZvjT9jMeBi3mj
         vpqOLRkem8vUsr2Rg+9FVv/tCShTSJb3tIvdY9hKZ5rpupUu8aXiPaTGxaQI9Kye93pX
         lIctO06yKn5RdrTzardLFCEBbRYWubMcVfMa7tjqOtjcWJoPnBJI2MS0aP62SoxXzzVH
         F/5U+DfB2Im8G6BGkBjbcpL03G2V8TAtSMd/OVHXzP81TWv/KG3Kk3gWpz8OcSirHrHs
         pzcnJGcM2MbNT6u2DvyaSm9ItyD5i/zq2mMQ8UXF3va4YusfxVdFBk0l1++JUFlRs/3I
         uqKQ==
X-Gm-Message-State: APuU4Z+sY/TRZAczJf9qXKRMKK+2svrRq4VgwUYhc9rssIXlYmArfClc
	H9mmJKPkgnRivpRMufvpbMNBzk2MHbf+kXvrpC49unscF1qTli3a3tUS
X-Gm-Gg: AZFdTZeCSNPuPibITzEay7ZhsRoDJJRCpX+S1kEug3E19T6jXILeZsHscuYwJMU6cW5
	B+cKWaxC65ELfEkoy5QBPKshgs1MyyY/XLBysmOgTuQVLGVDQMm+7dlYBoeSWBxL9Uw1xat+Nb2
	npNI4bUE4fKsmdaovzcEYP4O3UL3SZKPKrLlSFnNB++pK7G311FcEz8YZb1fFxrYSDO5PpRwORN
	iFpImTIzn9D+uN49Kev+5WnQt53/Fb4tKzd+L+ZCVTo2C6XJkEBR1EXD0JZ94fsUV2EyW0IEk2T
	Jr+n0pkZ1HJPv32iz6m3u7OeG7DLt8JWlIuWksBVuyL6vFmdslXMsl5CSGa2wFxwm3Idgdu0/7K
	cjYsO3lDQmD5Fq6xlekMOg0Rj3brNzCbsSC/G348zsuuatmh8wSs3Wqp5N5oAA8RbQZjt94NZq8
	6WXYAQ/eT+XNhGrNUrfbr3zIB8g2Ivao5qaujev97q9KEbbPTlLh9nPb5OTGhJviTQqaTUQwLuT
	qqT4WjoS+tTMXD7rvDnM5/lHSrBuYOYpU41HSzMSduO4khozx+Cyb7QRqnv6pSJvvHPt6KERaBg
	M8LWozPESWL6n+QkORvHTm1ORtBUayHCHlKR0JCZA5nQUbNzSrKLLAS5bTKKNl+SBQ5qnoW7+BO
	8vkoRdBungYKDUFQp0rgbe+VL
X-Received: by 2002:a05:693c:41d4:20b0:386:cedf:5e51 with SMTP id 5a478bee46e88-386cedf61efmr1230294eec.26.1795578376678;
        Tue, 24 Nov 2026 19:46:16 -0800 (PST)
Received: from [192.168.10.126] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm59900962eec.11.2026.11.24.19.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:46:16 -0800 (PST)
Message-ID: <b14f881d-78e2-420f-8395-6f10028fe597@gmail.com>
Date: Tue, 24 Nov 2026 19:45:54 -0800
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
Subject: Re: [PATCH net v4 07/10] net: au1000: restore RX buffer addresses
 when restarting the MAC
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261121004809.1690280-8-f.fainelli@gmail.com>
 <179557011055.3135.6140198422373932770@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179557011055.3135.6140198422373932770@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/24/2026 5:28 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] In `au1000_init()`
>    (drivers/net/ethernet/amd/au1000_eth.c:727-728), the patch writes the…
> 
> --
> 
> net: au1000: restore RX buffer addresses when restarting the MAC
> 
> The commit changes au1000_init() to reload each RX descriptor's buffer
> address from rx_db_inuse[] before setting RX_DMA_ENABLE. Before this,
> it only OR-ed in the enable bit on whatever address the DMA engine had
> left behind. That could make a receive after close/reopen start partway
> into its buffer.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index ea2766343d518..ec28ed33bf698 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
>> @@ -724,7 +724,8 @@ static int au1000_init(struct net_device *dev)
>>   
>>   
>>   	for (i = 0; i < NUM_RX_DMA; i++)
>> -		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
>> +		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
>> +		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);
> 
> [Severity: Low]
> This isn't a bug, but should this be a plain store, like the other
> accesses to buff_stat?
> 
> The commit message says this matches the receive completion path.
> That path does a plain C assignment, not a writel():
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_rx() {
>      ...
> 	prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
>      ...
> }
> 
> au1000_probe() initializes the same field the same way:
> 
> 	aup->rx_dma_ring[i]->buff_stat = lower_32_bits(pDB->dma_addr);
> 
> au1000_reset_mac_unlocked() and the reads in au1000_init() and
> au1000_rx() also use plain loads and stores.
> 
> In au1000_eth.h, rx_dma_ring is declared without __iomem:
> 
> 	struct rx_dma *rx_dma_ring[NUM_RX_DMA];
> 
> Passing &aup->rx_dma_ring[i]->buff_stat to writel() therefore gives a
> sparse different-address-space warning. It also means this one
> register is now accessed in two different styles.
> 
> The driver already passes non-__iomem pointers to writel() for
> aup->mac and aup->enable. What this patch adds is the mixed accessor
> style on buff_stat.
> 
> There's no runtime difference. MIPS_AU1X00_ENET depends on
> MIPS_ALCHEMY, which only supports little-endian, so writel() and the
> plain store write the same bits.
> 
> Would a plain store match the surrounding code better, like this:
> 
> 	aup->rx_dma_ring[i]->buff_stat =
> 		lower_32_bits(aup->rx_db_inuse[i]->dma_addr) | RX_DMA_ENABLE;
> 
> The other option is to mark rx_dma_ring and tx_dma_ring as __iomem
> and convert every access to readl()/writel().

These are good suggestions as non bug fixes but for now, this will do.
-- 
Florian

