Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942723;
	b=4/seDuKMh9H/f+C/j7AX98hoRaxPJ2CmVvkZlN/LSJFwRmgllkMxddKcrqaqoPZ1MkuG
	 eb+kx8j/L/Pu/oWpnFl54AMDAa/sXz9Otb5c+TBNNKA0lrdDXJyoB33/AjZ4yYz9UJ8GU
	 txr6TeeAGnKwOXBWD+izujXMKloNZqPojl7k2twyDc5lC0S/9q/Qi07B1G5xtCdSwUJCo
	 nzTLxVMwqrHQ08uwXNFH7gaXjTlRwCWPfJ1Wmkq9Zcl2eCKOias7HZPWQs5Q/I9d7O6B9
	 vaphSaQmmFzMSjzpfEJcqJc//zJs2D1R09iDjoHuMBUR0bMr5CHjzHS0KaRHER0K9jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bT39nq+rkIX6hcx56sUqmxgqdg9Payqc0fsUYc8anSk=;
	b=GVfob3Ropq1JjNVvFB1klF1LwJVz89+P/4C//wmrWK0EXdPWtBM/Cmo5/HZSCbFgBKl3
	 L7iud4TWxAKSRW8cRNCjEX4MsFFWrUze+lVV+ZGXL0RpzNzQVMcdDLHLr/To3axco1PvN
	 Y7OsgbpPTbKqNiqRa+KIwFRbY+VOTDopskukzJV0aHqMyEEEmmafTcmr8r2gwZO0S58uR
	 wu6YeA00j428n5s5/hGfA5QE9W7lgB56Ef39jMPURSXp0oCQmZB88y3DMOL8lE+2ZGN3U
	 i5RV0KmJ8v0ByeTBz1kVnyFxcXUry8LrLCxX0eDnhhD45HaEnucLJslkz1gIA8rWorQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYkknru+;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC14606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC14606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYkknru+
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b3c9820789so35418a91.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942723; x=1795547523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bT39nq+rkIX6hcx56sUqmxgqdg9Payqc0fsUYc8anSk=;
        b=lYkknru+81p/+aoxpQJlfSE32fNy1p5tv+2ndWpsgBDwv7JlC1GbCRDEW+jD9yYASJ
         QlGeIGRn42P7sWsTepbKEU27k1VYkS+ap+qINxLXKoROS+quoR2WRwNXa42fxpO1j5uj
         I2dsObFGtJTRiHmmNX4J2q6rNX4D+uUzunj5kn1W6s8UJuawcsFN7eB1sC3Pr3gm9DMi
         7xz/Q6XrrJYJGj0DWQH5UJgNJZR8C8IpxPFrF9v0V2r+JXE1SZf0orc7MXqO6fk8+EnN
         0ht2KDONgU1gIc4t6YdCwtBdr6kCueAX+qpdlULF9VmLyaAbwVll/prLWCMrm4cOJM9q
         NIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942723; x=1795547523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT39nq+rkIX6hcx56sUqmxgqdg9Payqc0fsUYc8anSk=;
        b=C1zrHA71a1QPIXhYRSJ/MspymnvqgN5VpNiektfj/XU2sNSvPvcr3JQLzf8YVreFID
         vLbfF21Bs5UV79ThUq2gILp4zEEY54DmqMG8mW71RGkmjleDHphy86G/2xIm1tIvbciS
         HNNZK18Gt7J22524NsKsbOK+La7S7Vtm92d9dBHn+IbN/VnG09AuLX/+V67iIfLeG5Ky
         jtplSe0+9kV+ADh0X8ZUTPI3BB2UNOa4g6P1W4nNfBLVjL6v+XIoPpb1CnN1zgaU9JR8
         l6KDW4Q3fEtJlRq1/NWpaCva+Q0fZv8ctW/33o2rT5fhgIaAerckPso1oaRbOppxl04s
         aH8g==
X-Gm-Message-State: APuU4Z9oznrjMbDfcLGAr5XJUVtDlCudtAChEKb4nq8KyEjJ7e8NasuU
	Al8Lf1ebcqAbohuS6ZtbibK0FFmtpIbYXQfnsM3GJCUk6hRCyY/r1syy
X-Gm-Gg: AZFdTZdkJfH+d3d/xf8BGm4OsnLrChH7bRSf0CRFiI6/RlTawk5oQGhsYd/yxVZFePU
	P+kjkhZggXCB1fLamJjRiyMJmMQHGsNM1ENzoXhIF4F+rzEYYxnGjQnEtzQFvWJ2mucWG7+eaQx
	wF32Na1dqhdTUzuo4J1JGKU+icvLRLBxR7ILl2+d0vBk9BSLC3awzbKfRfZv6+RJhl6240wiTKz
	0IEBXRhSFKrwwVN6x5OlvR7gRv7BBJ7Ith3zIdyOTo+QlHbEjFJr1rIuVQCySt38ODKLwbPgd0k
	SVadeSoooItYDMBNQ1xUgZdw4fIed5L6rDMy/2WmyGZEHrOUDshDCJvLTQPmmE2f0Xf9bc1w4Ra
	0aUlz1JNSFngqRpVtT6tB4m/RwlpDR2eHAbkSZNJsxgok91XYs835oVHZxSlFi4B/KIEqCdWJXJ
	YpOSE10hSuy8LI8f5Slu4dlWQ8fqELobxHi8R5IFHt0Y8TKnZfaP3wL9Fdr6qwkOfZ4bl+217Os
	uYnJDdLToYfyCfcq7Y2LvHDnKGioM7g5WbK5N2Ye+Gi1+WJXpZElN3dSDO98HbaSv5uTNPXLlsQ
	tLGP4JfHz94YcHUTZJ+soq22svRkZY78PFVSM2dVGrZrnMGykWvIQO9U
X-Received: by 2002:a17:90b:3f4d:b0:3b3:8094:3228 with SMTP id 98e67ed59e1d1-3b3d07597b4mr329507a91.14.1794942722670;
        Tue, 17 Nov 2026 11:12:02 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm5413030a91.10.2026.11.17.11.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:11:57 -0800 (PST)
Message-ID: <d6c9b502-abc1-40c5-a3e6-9bebdcdd3933@gmail.com>
Date: Tue, 17 Nov 2026 11:11:54 -0800
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
Subject: Re: [PATCH net v2 06/12] net: au1000: assign a valid MAC address
 without platform data
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-7-f.fainelli@gmail.com>
 <179483704445.3136.5178913144882531268@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704445.3136.5178913144882531268@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message overstates how far the bug reaches, and it
>    carries a Fixes: tag.
> 
> --
> 
> net: au1000: assign a valid MAC address without platform data
> 
> When no platform data is passed, au1000_probe() now calls
> eth_hw_addr_random(). Before this, the device kept an all-zero dev_addr,
> and eth_validate_addr() rejected it at open time.
> 
>> The supported no-platform-data path leaves dev_addr as all zeroes. The
>> device can register but eth_validate_addr() prevents it from opening.
> 
> [Severity: Low]
> Can any in-tree configuration actually reach this path?
> 
> The only in-tree au1000-eth platform devices are au1xxx_eth0_device and
> au1xxx_eth1_device in arch/mips/alchemy/common/platform.c. Both always set
> platform_data:
> 
>      .platform_data          = &au1xxx_eth0_platform_data,
> 
> au1xxx_override_eth_cfg() is the board override path, used by
> board-mtx1.c. It copies into the same static structures, so the pointer
> stays non-NULL:
> 
> 	if (port == 0)
> 		memcpy(&au1xxx_eth0_platform_data, eth_data,
> 			sizeof(struct au1000_eth_platform_data));
> 
> au1000_eth_driver has no of_match_table or id_table. It can only bind by
> name to the platform devices above.
> 
> So dev_get_platdata() never seems to return NULL for an in-tree user. The
> failure described could only happen with out-of-tree board code that
> registers the device without platform data.
> 
> The code change itself looks correct. It restores what the !pd branch did
> before 7718f2c27dbd, which only added eth_hw_addr_random() to the
> invalid-MAC branch.
> 
>> Fixes: 7718f2c27dbd ("au1000_eth: use eth_hw_addr_random() instead of random_ether_addr()")
> 
> Could the commit message say that only out-of-tree platform code can hit
> this, or describe the change as hardening? As written, the Fixes: tag may
> lead to a stable backport for a failure no mainline configuration can hit.
> 

Yes this is more of a defensive change, I will drop it from this series.

pw-bot: not applicable
-- 
Florian
