Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942580;
	b=asVmzxRpfbVK4lriCniN65F56N0D8ml95KUAj2FwUewRtDz7MK9s28e+iBvt1GpLONaR
	 0EW0SNcVv3ARn0eg4riFk5HCuIdA803VX5mjFgjbTbc3IfEnj5fkfwHZonTQSzfcwB0xO
	 3iaLbKJ3HzI8o5NhHL2+sp+GTNgTws+udy+mrttkHmnCCI8Uz14WoLscavYlavbRJYDKC
	 Gh65Yx9pyd6cbHla1HDAEHjrxtNLH4ZVb1Wb/fb2WkqmZscHstOFOwS+5MWIVP6JXMItX
	 y/CSGx70gSm8s5FtZs8Qxd1t8v5J/IkSX6XgqsgFplLF0Q+1U3L0A9hTj+MftgmP+xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+aYf8g41eVpT0waLNALL3a30OTIwyYVnd0XINX9JXbw=;
	b=fBJ0J2hBBY4aJ+Nh5ji4MKQ7dQdwo3qagfpzxXJplqW3Uv2ESEgayTLWd8/PItdsjk0F
	 /rb5cqhVqCgn2GhM+d3Fjyo59Kg4qXfcDhLgxzfbF+r0L1RnRfn3ENOdbWlxJ8sjoP4nd
	 uTLeSkySxBcIpe5p1q9gAg7cqfrNfSTKF10xt15phMvrR7teGQKsgLNqhCA4yIxZm0cGQ
	 wbeLLh+30q/nc1tHw6QU5/oeSwCXANafWDwM2xKVf/wZoMj/Vf5mWgDIYbjKDhv8xqzHH
	 Y+4yadsYrZCvcsupEE4Jf+lZg7+LmX8mmxcmTHIrzwT/dMLNKg4/cI+NALGHu4v+9TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTrFGvh2;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C89606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43C89606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTrFGvh2
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so131663a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942579; x=1795547379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aYf8g41eVpT0waLNALL3a30OTIwyYVnd0XINX9JXbw=;
        b=LTrFGvh2up8kjBogLk1ZtofYatncwr6QZ2sdT8/epET8mDeNGmKTb219caMjagOQ/R
         HqyRirJeJR1PjcUZDv0WZwz8DggWHkRljVrdRmNrb9YNTa1e9wUtlueBx/wQHStV5cXJ
         Lz6SfZzFF0XEF0bJt6sWWm+y2HO7w/sZwJr63eMgnPhFWMIl7VhhBQKxoOuy5AWrk7/V
         QS2tcp0a9MgB1Itek+FxYHoDJPV1QWg9IRPFx3X7VV0Z88EXxe7yMQYPD4vzVK+fD2GA
         VqNjnZKz9HSwvBEH84jktD7qXuUgxt0+soidstQT81bfcSVk8PCOyG/fHsAwGH3y1OKM
         /Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942579; x=1795547379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aYf8g41eVpT0waLNALL3a30OTIwyYVnd0XINX9JXbw=;
        b=BraqzcOEEBuSBfnj8WIVklDCjZ8fxgw6WlhuANhBqnY83Hm3HajUpBjx24R0/YoLHk
         smcIDsJyUH9N2xcAzSfWtOiPCpUAeL8z5dhY8bhHaTeQDgVWIOuuTlAxCKnOr0eNS5dJ
         99w1Da2xRN69F5Z5Qr72hHhv2hbDo4tHUugfQqT0A75ZshDY7/Vn+s1YpKwxS6k0IN6j
         ZKhL2Q2dNBtO9/9QNwVZnYaPyfEG5DEjzlCNX93lbqYFEUZ8e+i4m4clS7jcBcIYunQb
         H1Z0OoC212O3mg9eFAbvTh4ibO7ijP9MyI4ok4UFRN5K63vhQntgP7gH2rwmWQ/A1/rj
         R+lw==
X-Gm-Message-State: APuU4Z81mJYuzXtOkBY0uEIJkMqjRzHHCA4p6QMjYHf6c9RJEMZLRSjI
	ct8QBVXZuEcBAiODElJr6MbfdoP0CIFSPVvRcNw4tsQ3mFHKzlb9EmhONtFtsA==
X-Gm-Gg: AZFdTZd/ZsY9W7CitHBIHmhDd6F564dkDe1k/GYGXGZiwiPD+/gUP9Ao7fi//Jiz6wu
	P/pSUHBN9CzWfyeY/XgdFlzbNIzoZK/MKAUphm9Wuzx7nVhcHxsCbo/0oJIP17HcS2q9XBgavfv
	zKtJNVtQs1q6XDaStFKjbElSUFnwFwmQ10D1apQGiLwWNdyrbE1Jm1MbdIBuixLakzQGVkModdp
	b+unruwP9W13Bo/WAbq/vgogfdctgAmij7D4veNKaPCbaPGFQuAIzgWGzF25kCsCH9tQbu33A0R
	3Et4w4MzPxH1VFATCLEHrznDUvK+ijaN4/LlZWsuV2PemUfevuHQCTV3Vi5wi+M8wnnMq+guyYq
	H0N3Zz7yeQuERcElccYCamKPaEBh94ymCjXVtfr8nqAgs5jBt8benmzVZL8A4vXJjYRx1+sqMyq
	YQ/foWIOmzlMP3Clv9/Eo2gUmFuhOSaW9yyJSofoPEc231hFibPkg3SibjiFS/fVqDpZyIR+pP4
	Cz9MlZDmA6qLZNrtp8OCfPT1qrxsqKfzUm1ZSTi42LFu1dYILgoqFrtu+XwYCf64I7Yf1/bgbyB
	yz0bZoEQdICpGewKIBplW1+o8GoLx5xwmIOz3qAUUlHk3c3Xex9Zhi2d
X-Received: by 2002:a17:90a:d445:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b3d06873d0mr304059a91.2.1794942579422;
        Tue, 17 Nov 2026 11:09:39 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm5191801a91.17.2026.11.17.11.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:09:36 -0800 (PST)
Message-ID: <09116c63-4c6b-440d-914a-e75902dc36ae@gmail.com>
Date: Tue, 17 Nov 2026 11:09:33 -0800
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
Subject: Re: [PATCH net v2 04/12] net: au1000: report MDIO transaction
 timeouts
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-5-f.fainelli@gmail.com>
 <179483704272.3136.4869685253432664524@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704272.3136.4869685253432664524@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The patch adds a second timeout exit to au1000_mdio_write()
>    (drivers/net/ethernet/amd/au1000_eth.c), and both exits log the same…
> 
> --
> 
> net: au1000: report MDIO transaction timeouts
> 
> This commit makes au1000_mdio_write() return -ETIMEDOUT instead of
> reporting success when the MII controller stays busy. It also adds a
> readl_poll_timeout() check after the write so that a failed final
> transaction is reported to phylib. The read path now returns -ETIMEDOUT
> instead of -1.
> 
>> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
>> index 7063f9e5bc7c0..6b2e216a83618 100644
>> --- a/drivers/net/ethernet/amd/au1000_eth.c
>> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> 
> [ ... ]
> 
>> @@ -292,26 +293,27 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
> 
> [ ... ]
> 
>>   	while (readl(mii_control_reg) & MAC_MII_BUSY) {
>>   		mdelay(1);
>>   		if (--timedout == 0) {
>>   			netdev_err(dev, "mdio_write busy timeout!!\n");
>> -			return;
>> +			return -ETIMEDOUT;
>>   		}
>>   	}
>>   
>> @@ -320,6 +322,13 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
>>   
>>   	writel(value, mii_data_reg);
>>   	writel(mii_control, mii_control_reg);
>> +
>> +	ret = readl_poll_timeout(mii_control_reg, mii_control,
>> +				 !(mii_control & MAC_MII_BUSY), 20, 20000);
>> +	if (ret)
>> +		netdev_err(dev, "mdio_write busy timeout!!\n");
> 
> [Severity: Low]
> This isn't a bug, but could this message use different wording from the
> one in the busy wait loop above?
> 
> Both timeout paths in au1000_mdio_write() now print "mdio_write busy
> timeout!!". The first one fires before anything is written to the
> registers. The new one fires after writel() has already started the
> transaction, so the PHY register may or may not have been changed. From
> dmesg there is no way to tell which of the two happened.
> 
> au1000_mdio_read() already uses two separate messages ("read_MII busy
> timeout!!" and "mdio_read busy timeout!!"). Something like "mdio_write
> completion timeout" here would separate the two write cases the same way.

Sure, that can be improved to be clearer.

pw-bot: cr
-- 
Florian
