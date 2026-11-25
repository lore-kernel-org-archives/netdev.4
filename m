Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578341;
	b=qmBXFsFFSnK7HuNot6CyNeLOgkudUxNHyhhswif51pARPCbNcO4dQ9fGSewxaFewCNWb
	 BQbZN/Ut/65kM9H26n8edmXK2y8fEEJLBo1Lmo4sXb5wq634VCrNd2vO9VlwV7ZnE1EA5
	 YWvxr4rSDkbg+dadNKPkeI6QuQrBst9EgmgceKS0mQDmHvboo0nucmem6QP131xBIem3n
	 f4gaDHiO7GFTYiVvD9dfN+adheDksQbNBusjnASGqWwRhNIIYCC9PbQpjOQejISuQJ60b
	 SV/YndoouLaRmI7HcMMqh1GB5CHjbyaJXDUxWxiOiCxJf1hasdkEmKE3rw3VbC8ml3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2ohJ/yRwCSsqX+AfknXQHeI95bmqyiUW2Z4qRuVtpKo=;
	b=tKrieIPJnSLsVEEG6N9blEFvzprYzzPh9zvIXT+i/yhSu2M6xmGGEm7PiNGqC8vkM7rh
	 e829LMq8/S9B7fWGxtPa2xxraVzUPwTuqc9az+7zFwiiTvAiLBdpsu92v4PW69Ca/0zoK
	 GMU4eAsJ8ZJExxCtHG/perAbn+8C9sx0zlv4wk0AELO34hYbbnnxlz+b2phYGiazNiypG
	 3TNSUp748/raeyoL8lpXYbzAFHb+uIgBduqWBUjfI/OLVP5Ye0FVIUdslqGV+0Rqw+l91
	 Uw2wFdbBuBQkSDBr4rl84WNi3JSnvrAedKcnkoUkcLIrqGTMt2lwHh4yrfZZvddMgSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAQhBe0H;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4F606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAQhBe0H
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386cf1041cdso641493eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578340; x=1796183140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ohJ/yRwCSsqX+AfknXQHeI95bmqyiUW2Z4qRuVtpKo=;
        b=sAQhBe0HlfJZHkRCnhgfPgDLIPCC7CmNbypB0n8CUzhh8YbUkuNjInH6XC6uYbINXf
         edSCQlERVlWt1PqTL4VUP0sp2ldjCzHVx5pfsSeYei7QXgPMYNfUwaIx6qg9G6sOPid9
         IyA6pkseXOxpoEaAUzl3IqHRZy7Yzgq5+Js0QSG7z0EjiEQPbr6m86QU2+zUjj7dBa2W
         OeO6xiUU3h4QqNvNQAObbQezuhqDlGIx0puJ1AY16D+Vxvjdk//R/ocMtm4q7zM0KP8L
         +3lFzPDh8QWBRdpcSUGYsJeiJnBQMgOx9qHBJDTo8gmb+CGiS8DR6eyJ/SAE9NqXJyAt
         u2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578340; x=1796183140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ohJ/yRwCSsqX+AfknXQHeI95bmqyiUW2Z4qRuVtpKo=;
        b=Wzb2tobDTaYnCbAMHIGd3484Q0vbJQOfaBGwzA3M7T3Eclbs3YBLqcM1KwFhOEgOox
         mzfjH1a90ZrMR9+JZAvdHT+aIlzum0t7nZP32brusxT3cw53xpqCpxaYJ9+Ws6OF9fvs
         li1zCLxGaMJHe7OhhjdlB1ZVGsklhYLbW2EJ6DUuJIGcli5uBzJR53J3o//pTcz7yxhW
         x6SdayD8bzB1AkMXLpMDs46d2hcYboiNVBRIMSQ8yTOJMfRQGwSa3inUYGQxm5Nhy9Hk
         iFtiMOr+06w1SYn71+QFeXP51Kztv2soE30Fe9iWR/wcBQz5Kl+AGzMHRxqywvg6XEc/
         tf0g==
X-Gm-Message-State: APuU4Z/NVcCgsmTVSZ622f8awSI6xmReTnoRRf3GksZwRI79ctHemJog
	Iib+Oim7AtQe9sZ4o4J8Rdktm2JlgxzkmcUnx6SvSp9YkyWOurWArGbV
X-Gm-Gg: AZFdTZdwn7rj1lEfTRYYzWolK4RBxNhpuy7bvIkGX3W4pBq9xCuG9aKniCsaTvUI7zA
	3/sX0nKw7PqZHQxeZWXD6wxUi826OUdOJNMHpNtO33pDcMAuHI4Yi4skegM7LazJ6Gh5c9u6M5+
	SKCB17s7WOnzBgokNaa6Cduirc6+HZB/dp1ScPLXCtQifhdAVtIT1gptDo+LppyKE6PzhYOQg4F
	0CAPAc5KEl/S6UfZa0FLGTDEuDE+512Gk8pV1x+vJqbNJdM6V6LbST0kuGfd+XJwTe6+CJjEpIy
	gByqYXto+QM0R2xAcnn+ZoRvS7yG2VYDCvB7SBH8c490/6aKp2GxdSQ4dmlh31PThliE2D92Plg
	3FQaGo5tSZfmlKNb+KHK/ugoUfbowJIMecfVh/2iwqQbj+wCS9TFgBr36sJ6V1lyd7IcNGHcQq3
	adfl9IDC3dVsnaQeG7pCfFNUA28xjiKKJqbBFJJDQylzUAbaXft9BZ8ac9JRFYwQ09GaOWvorLr
	Dn93QhbRRi1FET2HNULxwl3XLnssfapnQ/st1TF6m/VOkBqUkL1l9cpNsHNVVRAp1JYXdGvvqQS
	cfG4v4oZiRc6cGuVgInvWX3TvPpXoa29c83psASv2l0MpM0fmBbezr/gEYbHYhvitVNP4LdopPC
	Fnfc=
X-Received: by 2002:a05:693c:8955:10b0:386:9cae:abef with SMTP id 5a478bee46e88-386bf39f8b9mr4512973eec.36.1795578339467;
        Tue, 24 Nov 2026 19:45:39 -0800 (PST)
Received: from [192.168.10.126] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm54437849eec.21.2026.11.24.19.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:45:38 -0800 (PST)
Message-ID: <609904cc-0d66-498a-bf83-54ad0da6cc0c@gmail.com>
Date: Tue, 24 Nov 2026 19:45:17 -0800
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
Subject: Re: [PATCH net v4 08/10] net: phy: smsc: wait for LAN83C183
 power-down recovery
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261121004809.1690280-9-f.fainelli@gmail.com>
 <179557011237.3135.15846967917791186180@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179557011237.3135.15846967917791186180@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/24/2026 5:28 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new 500 ms recovery delay in lan83c183_resume()
>    (drivers/net/phy/smsc.c) only runs if the smsc PHY driver is already…
> - [Low] This patch rewrites the SMSC_PHY Kconfig help line to 'Currently
>    supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs'…
> 
> --
> 
> net: phy: smsc: wait for LAN83C183 power-down recovery
> 
> This adds a LAN83C183 entry to the smsc PHY driver. Its resume callback
> sleeps 500 ms after clearing BMCR_PDOWN, so the PHY has time to recover
> before the Au1000 MAC is started on MTX-1. The ID match also covers the
> LSI L80227, which has the same OUI and model number.
> 
> Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
> Link: https://datasheet.octopart.com/L80223-LSI-datasheet-11757091.pdf#page=73
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
> This isn't a bug, but should the help text also mention the LSI L80227?
> 
> The new 0x0016f840/0xfffffff0 entry in smsc_phy_driver[] and smsc_tbl[]
> also binds L80227 PHYs. The code comment says "shared with L80227". Those
> PHYs now also get the 500 ms delay when they leave power-down. The
> rewritten help line does not say this.
> 
> Separately, the help text also leaves out the LAN911x internal,
> LAN8710/8720, LAN8740 and LAN8741/8742 PHYs that are already in
> smsc_tbl[]. That gap is pre-existing and was not introduced by this patch.

The driver was not tested on the LSI L80227 due to lack of availability, 
so no, it does not make sense to be listing that in the PHY driver 
Kconfig text unless it gets eventually tested.

> 
>> diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
>> index 48487149c2252..c0713017e54b0 100644
>> --- a/drivers/net/phy/smsc.c
>> +++ b/drivers/net/phy/smsc.c
> 
> [ ... ]
> 
>> @@ -684,8 +685,33 @@ int smsc_phy_probe(struct phy_device *phydev)
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
>> +
>> +	return 0;
>> +}
>> +
>>   static struct phy_driver smsc_phy_driver[] = {
>>   {
>> +	/* LSI/SEEQ OUI 00:a0:7d, model 4; shared with L80227. */
>> +	.phy_id		= 0x0016f840,
>> +	.phy_id_mask	= 0xfffffff0,
>> +	.name		= "SMSC LAN83C183",
>> +
>> +	.get_features	= genphy_read_abilities,
>> +	.suspend	= genphy_suspend,
>> +	.resume		= lan83c183_resume,
>> +	.set_loopback	= genphy_loopback,
>> +}, {
> 
> [Severity: Medium]
> Will lan83c183_resume() actually run with the in-tree MTX-1 config?
> 
> The commit message says SMSC_PHY must be built in when the au1000 MAC is
> built in. Nothing in Kconfig or the defconfig enforces that.
> arch/mips/configs/mtx1_defconfig has:
> 
> CONFIG_MIPS_MTX1=y
> CONFIG_SMSC_PHY=m
> 
> It does not set CONFIG_MIPS_AU1X00_ENET at all.
> 
> With CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=m, the PHY is attached
> during the MAC probe:
> 
> au1000_probe()
>    mdiobus_register()
>    au1000_mii_probe()
>      phy_connect()
>        phy_attach_direct()
> 
> No driver is bound yet at that point, so phy_attach_direct() falls back
> to genphy:
> 
> 	if (!d->driver) {
> 		if (phydev->is_c45)
> 			d->driver = &genphy_c45_driver.mdiodrv.driver;
> 		else
> 			d->driver = &genphy_driver.mdiodrv.driver;
> 
>>From then on, genphy_resume() runs on reopen with no delay. Loading
> smsc.ko later does not rebind the PHY. So the reopen hang can still
> happen even with both patches in the series applied.
> 
> Neither this patch nor the companion au1000 patch touches arch/mips/ or
> drivers/net/ethernet/amd/Kconfig.
> 
> Could "imply SMSC_PHY" be added under MIPS_AU1X00_ENET or MIPS_MTX1, as
> drivers/net/dsa/Kconfig already does? Another option is to update
> mtx1_defconfig to CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=y.
> 
> When both drivers are modules, request_module() in phy_device_create()
> normally loads smsc.ko before attach, so that case looks fine.

mtx1_defconfig is outdated and it can serve as a reference but it would 
need to be re-generated, this is separate from the scope of this patch.
-- 
Florian

