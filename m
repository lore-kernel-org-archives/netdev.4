Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942945;
	b=riLVf0d8Wzvyb0h9f5yHQsAZa4U1rdeQEet2nNlcqBKolzQplVerqMHgDPzVlb2/KrfS
	 CxKb8+IcZT7mvc/8eKgqleBnNjzz3z6o/2p485Y1T/r37eK1xXdzrS5z46Sqosl388u2X
	 DXa6C5xwKGH7X91fFZdjw/GcEMOXOc6fSsReI5iDqs8XCa98/qY2eBODX5RB+Ch8+YHnQ
	 +4q2qbZ0aKKzE1T3OQbcecZJNuPf2J37r3S2XZiIE3BhjtimsCHxF+hof2zl6DJ7cugE3
	 ZbCQ8gfa4LCDCJb49ErezCPVXW7PSK94ukFv/mCcyeYea7ktdD+Sh96qw+dZCpAysKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+EY5FGHkUS2GKudgKtDNmc8zOL4SuNcoCljHw2tyuC0=;
	b=nygadeg+g0Touns9mH4uHgPXYi0wcfqpuds3tIhdauGlt8qGSa/ewENA3+2B9Hr7czXi
	 pxGU2NYwapWZSzFq6FkFBFEdZdMMDe/SUGzDEOBZvR5sSaSwiGM6JMEDIulHeJoufb0Wh
	 E7/+DERzvR67XWCfURGnlPy35qSh6SbahzXle1iJN0uDc0HqXb1cyKyZXAPFjYSZsOjxJ
	 ak1esL8HfkoVA07O/Zbo/XmJvoXHto7XydHzfGKvnDTsNkKEfiOZF9ITylZNDbobpx2a5
	 ejTiWDzVRt+z23Jq5Q/+8nHfKq1XHAan4Grll1K0ObfAEV4I15q7PjDGO2VltDwd/SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so+zjMgu;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A4606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88A4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=so+zjMgu
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53634b8328eso1595631cf.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942944; x=1795547744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EY5FGHkUS2GKudgKtDNmc8zOL4SuNcoCljHw2tyuC0=;
        b=so+zjMguwhPGbUlWvGAWQPISVbrRCTszNezqQWlHIBT8Wdgxiz82POdB6izTNMzuzb
         V7aZva8UEqzxGOcwBZKD3uooNstbA0hYE46ACdjmmtbWG1mgGmNDmp7Pm5xna59j61pf
         qw5gblnNHuLG2KwaCiNLIucc5ooWsOKlO8Upb2vG3y4bzP368MwrLiccWs6aBoyEgEuy
         Y6y/2r4tspkuOj657PBMuMPOJPxv5nHuApMG0OdGNl67+Bo2v0g2kw7sPDDPYO2+c8n7
         KPMHHyvsXeTs5Vlc1uou3RkShXPtnmeLyIlR1m5zaWsQYrnsBw6gW5g82D4kvdx62vNf
         ZFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942944; x=1795547744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EY5FGHkUS2GKudgKtDNmc8zOL4SuNcoCljHw2tyuC0=;
        b=t3QDkpso6xjnX7Cb1ziytJfFf6Nmdivgs3z3RM1D5txTxoMFYFukpxcYvVAQHU/8+N
         6Chc4Gqt0r5zFrbskdKYX5fBsSaw8eSrmXdbXBpDF13nvG8TFchNuxyHGyctQiORDOMm
         6Fwf31StdlfARy/5r1GYM0ehOqs/elO8TUO/pOha6zO9iKTJ8Pvm7RsvU7hnkOSXbo8h
         uhR6K8nk41Iivj/HU5EbqNgPKeCusa+xH60yZsU0ho0W05SVlwTTOs46y1aZsYoC//H4
         8SYZ+s6l0Yqd0pZKMTP+kHGONk5qoqZHv+WyBG427HE7JbJ2LsWl7ay0hKZn8oInyH4a
         13sQ==
X-Gm-Message-State: APuU4Z8cJlPC8SKOQgLQDeP8hN+P95Yg0JZH/OP4/F1R4IpKkW7qM0q2
	NS3EdXo5WVVMk7nEXwvSGG3SjSUTzU885sVBYhhw+uXEbYrZLj7CCcIq
X-Gm-Gg: AYBFou2UgvC7HyU9fvzZfwStBm2D3VgmH/EZbKsNsEDqjijWKU5a0ooh1c129mfesyM
	sPFJVrDsL0Kr/OsTEWaJWTMade32kfC/YV5OvhjbRN8SuFVj7M8pQiH1H5BKGd1is104YpRsgjm
	Ovjz6WSMnRTgCfD8UrJmwoW6JXiIPvfCPJX9cTKJCWMurv8kR9e91UvyEhU8W9Ib5hcVZck7zma
	jS3rqb0z9zotdFSBmKkMMzlokrkeCAKPFJLhNIDStS3QLrbRRddLteyNm85zEUOk5k05Rt5wTsp
	WxahTrmTRmvhMlewKwFF5YUM1fUZTx1Wfo8Ys3vpC+actLlySWjfYQnMjblfuSoQCw03+VPvYx5
	wH4R4xdzo6F/xCx67R+Ei+1Yq3hA/iBctlL41a6LngoVxM5Ozjb1h0g3sKXsic1VTuFpA67lSBP
	qKt/P0GJZ7DkBjhARgfhdUbV8vencIeu7ua0+KUxTj9jR49CvCBij4wvlzoDNUo09Z5rdi5NKVb
	JHAZNbGGTiMcYr9CJBi+UZu7nQ/BXCg3O6/2jyA/Fso+ZVktD6DOh9i24qy8y3qLQ0jSu90Wvwz
	pGA3fYIO28BoV3TBX7/MbqGIxoQJq3LP1qCtwMsIitB1uwRHwW3eoIhS
X-Received: by 2002:a05:622a:1e0c:b0:535:9686:b9e9 with SMTP id d75a77b69052e-55d5a2d5840mr4863451cf.11.1794942943667;
        Tue, 17 Nov 2026 11:15:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58fea22dsm4007601cf.9.2026.11.17.11.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:15:40 -0800 (PST)
Message-ID: <d74816f4-d624-4cb4-8740-c5f8729d903c@gmail.com>
Date: Tue, 17 Nov 2026 11:15:36 -0800
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
Subject: Re: [PATCH net v2 10/12] net: phy: smsc: wait for LAN83C183
 power-down recovery
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 jeff@garzik.org, danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261112045301.3669532-11-f.fainelli@gmail.com>
 <179483704808.3136.15887744025770615688@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179483704808.3136.15887744025770615688@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/26 05:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In this commit, the new 500 ms wait in lan83c183_resume()
>    (drivers/net/phy/smsc.c) runs only after the Au1000 MAC has already…
> 
> Pre-existing issues:
> - [Low] After this patch, the SMSC_PHY Kconfig help text
>    (drivers/net/phy/Kconfig:424) reads "Currently supports the LAN83C183,…
> 
> --
> 
> net: phy: smsc: wait for LAN83C183 power-down recovery
> 
> This patch adds a LAN83C183 entry to the SMSC PHY driver. Its resume
> callback clears BMCR_PDOWN and sleeps for 500 ms, but only if the bit
> was actually set. The aim is to let the MII clocks recover before the
> Au1000 MAC starts when the MTX-1 interface is reopened.
> 
> Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
> 
>> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
>> index 30e9d22c8d1a3..10466b2574eb4 100644
>> --- a/drivers/net/phy/Kconfig
>> +++ b/drivers/net/phy/Kconfig
>> @@ -421,7 +421,7 @@ config SMSC_PHY
>>   	tristate "SMSC PHYs"
>>   	select CRC16
>>   	help
>> -	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
>> +	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs
> 
> [Severity: Low]
> This isn't a bug introduced by this patch, but the help text still
> names only some of the PHYs that smsc_tbl[] in drivers/net/phy/smsc.c
> binds. It leaves out the LAN911x internal PHY, the LAN8710/LAN8720,
> the LAN8740 and the LAN8741/LAN8742.
> 
> Could the list be completed while this line is being changed anyway?
> 
>> diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
>> index 48487149c2252..c3b51afd4b1e5 100644
>> --- a/drivers/net/phy/smsc.c
>> +++ b/drivers/net/phy/smsc.c
> 
> [ ... ]
> 
>> @@ -684,8 +685,32 @@ int smsc_phy_probe(struct phy_device *phydev)
>>   }
>>   EXPORT_SYMBOL_GPL(smsc_phy_probe);
>>   
>> +static int lan83c183_resume(struct phy_device *phydev)
>> +{
>> +	int ret;
>> +
>> +	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* The PHY needs up to 500 ms to restore operation after power-down. */
>> +	if (ret)
>> +		msleep(500);
> 
> [Severity: Medium]
> The commit message says:
> 
>    Starting the Au1000 MAC before the MII clocks recover can hang the
>    MTX-1 when reopening its interface.
> 
> Does this patch alone prevent that ordering? au1000_open() starts the
> MAC before it calls phy_start():
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_open() {
>      ...
> 	retval = au1000_init(dev);
>      ...
> 	if (dev->phydev)
> 		phy_start(dev->phydev);
> 
> 	netif_start_queue(dev);
>      ...
> }
> 
> and au1000_init() already sets the RX/TX enable bits:
> 
> drivers/net/ethernet/amd/au1000_eth.c:au1000_init() {
>      ...
> 	control = MAC_RX_ENABLE | MAC_TX_ENABLE;
>      ...
> 	writel(control, &aup->mac->control);
>      ...
> }
> 
> Suppose a close has run au1000_close()->phy_stop()->phy_suspend()->
> genphy_suspend(), which sets BMCR_PDOWN. The reopen then appears to go
> like this:
> 
> au1000_open()
>    au1000_init()          <- MAC RX/TX enabled, PHY still powered down
>    phy_start()
>      __phy_resume()
>        lan83c183_resume()
>          clear BMCR_PDOWN
>          msleep(500)
> 
> If so, the 500 ms wait only delays the PHY state machine and
> netif_start_queue(). The MAC has already started by then.
> 
> The close path has the same ordering in reverse. au1000_close() calls
> phy_stop() before au1000_reset_mac_unlocked(), so the PHY powers down
> while the MAC is still running.
> 
> The next patch in the series, "net: au1000: keep the MAC stopped until
> the PHY link is ready", seems to fix this. It calls phy_resume() before
> au1000_init() and enables RX/TX only after au1000_adjust_link() has
> seen link up. It also calls au1000_hard_stop() on link down. In the
> PHY_HALTED path, phy_link_down() runs before phy_suspend(), so the MAC
> stops before the PHY powers down.
> 
> Can the MTX-1 reopen hang still happen when bisecting to this commit
> alone? If so, could the commit message mention that it depends on the
> au1000 change, or could the two patches be reordered?

Agreed. The PHY patch alone does not fix the Au1000 startup/shutdown 
ordering, so the reopen hang remains at that intermediate commit. I have 
clarified that dependency in the commit message. The PHY patch stays 
first so its recovery delay is available when the following MAC 
sequencing fix is applied.

I will leave the pre-existing Kconfig help-text cleanup for a separate 
change.

pw-bot: cr
-- 
Florian
