Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220762;
	b=Ry027UCwyD6CkT4M13qdqt3J44eFI72fz3uqk3wApjHsmui/NkQh2JUEDSMEkEKL6a3+
	 hcmQtn5leSeW1dUr4hhv1zBO3owqTxUdRSk5PpVJKi1HUBStEA0d29kUK8BmXDYSjSdHt
	 uViqOEL7FNuhgGZcw1VJAOU/0J7asFACZhUeh/U3Do+ehtjDdG2jp4OigtVqVhtEIkwe4
	 yRVfDy9jCvCznENMb8CROl423GnQSj3wk/UWkW4OSW74a1U63mNY/1+BJ89g2MenBrFNz
	 V6SGCNECsPil2U15zvFEyefez1tZ8Za261gHGCQr8CjTEgqs7s8szPh6vruKDgJFmOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b3NA8cLXZ81GRjj6C0GAUFj5xSIOEOnajxbqhcfZPOU=;
	b=abpymP1pCTCX/UF9BVbzV2Qg7JyherR+HhGNTjoWCDHc6q7OW8KT1t2VPho2sJWtt2ev
	 ElEl4KXLfuM1NpJ5bLUMiTt1hQgcrawop6Uy6JWUJn3Y/vIB5oIH6T009pGS2ocDgBK0S
	 D3csXNIJ4TQcrvXaBFqoW1Pj6aro9nI8W8wh+3rVQT/qq2OrIIv1u4PlA78EPDBnWizgr
	 10oNmWRWA2K4JYbpFLcRgWcuqHmHnMxs2uA+0Ombii5UqhkqkgoCcaINbMGsU3ttZ7xgj
	 jT6kfCZzkIBoBC+IHplVaxFepkshvF9Y3lo/FcBjeFRtCe2x8dry1eEHkshNZB8Me9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HX+MHYFs;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C35606A337
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C35606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HX+MHYFs
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-943e8d35f74so146877985a.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220757; x=1795825557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3NA8cLXZ81GRjj6C0GAUFj5xSIOEOnajxbqhcfZPOU=;
        b=HX+MHYFslrbdu5+COFc3VEa7BONOGoF7WofVMPVgeWkftDHObl/dhwHGIWQnv/K6/p
         FMUY5CtU0LTHrQoZdUbN8SEMfUZsQ735mItlNr5gdWIX73xEc//6W+FLDI7rwY5fEggO
         mbKoowY7E+20hq5A4wowe78vqdN/KEOkJtIKuBq5XbECHTVgL5p9mq+iz5l5JILoq7X+
         kR9OiPr+ZdAP7r0KHrcd9Uver0cLSwunH9A0bVYBBx2SoYVy4HyEMVi6uaiQGGVsjZFY
         rXhMQZBsWEA8pH1UbZCFz45NZWGUmlE48sVVyqEWvWs/GbpqqUxd/MegOF8HSQDRUJZA
         kKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220757; x=1795825557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3NA8cLXZ81GRjj6C0GAUFj5xSIOEOnajxbqhcfZPOU=;
        b=qg89jaYZqWsJVs4CjcG0g7tZQgybXsslL+YH5MQzMI7q0LU3xCGz4b/7MSqPrZjKmA
         C2e+o4/EFQcaD7AUw6wUVc8F8wG/iCOq+shZffy4UGJyzonCUfE8fLYADzqdJsrY/UwS
         3gDzVuR7v7ZfWTMxWrfjxROMbXNrf0Ps+95BkzOOYEZReNy25WfjO2M/MoOA8eRpJCrO
         wumCa/zEPfMuDgkrHLE3ZAH432kCAzipdWg51gGrn1BHenpOhXOjtdKiX7THa7HsVRO5
         bBncP00ItH0zF8tuYUn7f0+Msi0OB5oQszmuELy0L98a7W5mWZclRgIu0nTjND1yF3N5
         jgeg==
X-Gm-Message-State: APuU4Z+0sp2nJZdL708lMKzSk4d4QzP5vNwwJ+Pkge8nBYShld0krqen
	xS8ozu2SsVCe3KJhByssNudgEW/cBPKPjSBqRzfisXEAg6/m0DQyU1Fr
X-Gm-Gg: AYBFou3/c5hxqiDhjZ2TMOUnBc8KZGAgauE4HqYbGI5vrQBOMAPZ8aPZ31/nj5Q6VzX
	YVMP2y6hV0nPU0TU5MMf2dBCeC+XdhmGnMQJ5mTKBKK1gh43L21gsdekYbHAx2lBrdJuAazn1bH
	wHIMofOJi68iRsI7wBmMjv3TZX3CAYslq8SQa2GI3Oh03AXDll2rRovVoyQGOc8LNQB5/N5LqlO
	EgguaEBHbs7fpwfOYu+MmSzq8pVI801FEkaBsvFbkTjAf1C3ydlaxm/ROe18BYXxksHmROFAt+L
	VoBuoKOdrBMyYn7wBUYgkf3GTOH10HCDmwBlx238AEtljR1Pr8K1F6BYPq/X/WX0b6XmsdZoZBH
	J+hHywto3aeoFhVQBqmzMDskM09s6w0TDhHvXkutCE0db/5932JO8OCXr3cdltmVcAtc4P1FCE8
	WCzWrXwDGpAwwrJq8z+P03VJ89glqTHhNH2V2FX4ufQ6z9jqCGj0iCVwGvS3/Yto/1VUZfhy9Q/
	iNO33ISpRQUYeNjIYT16fW8eHVATou2K2LRfgfZB6sNHhv/4gOS+a7SGFu8faFaHrYSD/vBI+FL
	UOj1sNygdeTgFpgSMir30X2PzFhHx24oVi5Mcdb1pG9Oh9uwLKRVu6kp
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr744439985a.58.1795220756601;
        Fri, 20 Nov 2026 16:25:56 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm115177685a.20.2026.11.20.16.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:25:56 -0800 (PST)
Message-ID: <a3b7204f-8483-4fcb-9ff6-fe62c16d9592@gmail.com>
Date: Fri, 20 Nov 2026 16:25:53 -0800
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
Subject: Re: [PATCH net v3 08/10] net: phy: smsc: wait for LAN83C183
 power-down recovery
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261117193223.2795612-9-f.fainelli@gmail.com>
 <179517075993.3136.6152160672961651320@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179517075993.3136.6152160672961651320@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 02:32, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] The 500 ms recovery delay in lan83c183_resume() only runs if
>    drivers/net/phy/smsc.c is the driver bound to the PHY when au1000_eth…
> - [Low] The new smsc_phy_driver[] entry and smsc_tbl alias match phy_id
>    0x0016f840 with mask 0xfffffff0.
> 
> --
> 
> net: phy: smsc: wait for LAN83C183 power-down recovery
> 
> This adds a LAN83C183 entry to the smsc PHY driver. Its resume callback
> sleeps 500 ms after clearing BMCR_PDOWN, which is the power-down recovery
> time given in the datasheet. Together with a companion au1000 patch, it is
> meant to fix an interface reopen hang on the MTX-1 board.
> 
> Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
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
> Does this delay actually run on the MTX-1 board that the series targets?
> 
> lan83c183_resume() only runs if smsc.c is the driver bound to the PHY when
> au1000_eth attaches it. The attach happens at MAC probe time. That is
> still true after the companion patch, which only adds phy_resume() in
> au1000_open():
> 
> au1000_probe()
>    au1000_mii_probe()
>      phy_connect()
>        phy_attach_direct()
> 
> If no specific driver is bound yet, phy_attach_direct() falls back to
> genphy:
> 
> 	if (!d->driver) {
> 		if (phydev->is_c45)
> 			d->driver = &genphy_c45_driver.mdiodrv.driver;
> 		else
> 			d->driver = &genphy_driver.mdiodrv.driver;
> 
> arch/mips/configs/mtx1_defconfig sets CONFIG_SMSC_PHY=m and does not
> enable CONFIG_MIPS_AU1X00_ENET at all. Other Alchemy defconfigs, such as
> gpr_defconfig, set the MAC to =y alongside SMSC_PHY=m.
> 
> Take a built-in MAC with no initramfs. At probe time, the request_module()
> in phy_request_driver_module() can't load smsc.ko. genphy then stays
> bound until detach, and loading smsc.ko later does not rebind the PHY.
> 
> In that case resume goes through genphy_resume() with no wait, and the
> reopen hang would still be there.
> 
> Should the commit message or the series say that SMSC_PHY has to be built
> in (or included in the initramfs)? Or should mtx1_defconfig be updated to
> match?
> 
>> +
>> +	return 0;
>> +}
>> +
>>   static struct phy_driver smsc_phy_driver[] = {
>>   {
>> +	.phy_id		= 0x0016f840,
>> +	.phy_id_mask	= 0xfffffff0,
>> +	.name		= "SMSC LAN83C183",
> 
> [Severity: Low]
> Is 0x0016f840 specific enough to SMSC parts?
> 
> This ID does not carry SMSC's OUI, unlike the neighbouring entries.
> phy_id >> 10 gives 0x5be, which corresponds to SEEQ Technology's OUI
> 00:a0:7d. The existing SMSC entries give 0x1f0 (00:80:0f). The model
> number is 4.
> 
> The ID is correct for the LAN83C183. drivers/net/ethernet/smsc/smc91x.h
> defines:
> 
> #define PHY_LAN83C183	0x0016f840
> 
> That looks like a licensed SEEQ/LSI core inside the LAN91C111.
> 
> Any other SEEQ/LSI PHY that reports the same OUI and model 4 would now
> autoload smsc.ko through the new smsc_tbl entry. It would bind as
> "SMSC LAN83C183" instead of genphy. It would also get the 500 ms
> msleep() in lan83c183_resume() every time BMCR_PDOWN is cleared. The
> LSI 80227 may be one such part, though this tree does not confirm it.
> 
> Also, this isn't a bug, but the new entry has no OUI/Model# comment,
> while the other entries do.
> 
>> +
>> +	.get_features	= genphy_read_abilities,
>> +	.suspend	= genphy_suspend,
>> +	.resume		= lan83c183_resume,
>> +	.set_loopback	= genphy_loopback,
>> +}, {
> 
> [ ... ]
> 

Agreed on the binding prerequisite. Our MTX-1 tests used 
CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=y, and the boot logs 
confirmed attachment to the SMSC LAN83C183 driver.

I have updated the commit message to make this requirement explicit. For 
early boot with a built-in MAC, SMSC_PHY should also be built in. 
Modular configurations must ensure that smsc.ko is loaded before PHY 
attachment; merely including it in the initramfs or loading it after 
genphy has attached is insufficient.

Regarding the ID, the LAN83C183 and L80227 manuals both specify OUI 
00:a0:7d and model 4, so the overlap is real. I added a comment and 
documented that the match also applies the conservative 500 ms 
power-down recovery delay to the L80227. The entry otherwise uses 
generic PHY helpers and performs no SMSC-specific register programming. 
Hardware validation remains limited to the LAN83C183; I have not tested 
the L80227.

pw-bot: cr
-- 
Florian
