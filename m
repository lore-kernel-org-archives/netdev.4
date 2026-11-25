Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593428;
	b=s+UAoWZhjysDZgCwJ+neV5IbPjw8qGVJXMx0ZiF8bCo3uveWYI4CdwQtAiin3v02T9X6
	 X7vyyQhlXM7xNbjtXjraG5qvavAscBbHdP7Ztvb/mg8waHf5zQSDDV/nsE4LZY+bDfCGW
	 SCz1PwSwE73C3HyOVpkRQqrAQgGdi/w4w/TtxsOQULzibWJ24OKwrIdEno/RZIFps853u
	 idHtgULoTV0KWzDtJt5HSS5sV3b94VbmtdOTOdnZLEIixsDcgUY3qEuh9AHE4ATa5Wo3a
	 Xgl3EKtmvq4ZXEfhj3CwlqHPVeOm/Rrv9xHCMCk1fvzPB51a+2rf3HTKwNt9yTFYPIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593428;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=km4/fIaJYD6/GnsGaA7EN0rJ86cW+MGAZJBT/seIDdE=;
	b=3yne5rToSqHrEdK5nTdFDkNt4fNqvlUKDUVJROySVbzBQjBUUMLRGnK5tuFQ26IIOMTF
	 enFe+kkHZ5pjKKo/7Tuq6eZrctEVp8RJQcjIBynVYoY3XDPWgZAyTlV6751UwueiPjJbQ
	 l+2TZMvgVi5eS5eGbp3HwGcgp/2MegxbQNtHUCxBUpz1b7GhJIS4DcWQOQoUwTRUK6NzM
	 tVlsRDCJ88iCD79lIC88CxaGtJ12Gh2mFYxTza61003/S5CJknnpEj5XG0N9co8oDvhKm
	 T96LrDpHvubHFWRQBIAw9gG+QiO5+WRi5f+5CXwZnMx/dWGnfW/HVbaouhjudOFDMvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CqmsujWm;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2773606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2773606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CqmsujWm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=km4/fIaJYD6/GnsGaA7EN0rJ86cW+MGAZJBT/seIDdE=;
	b=CqmsujWmMXhutGQ3iIMp6LBplLavhsyykFIL30YO2oNQ7HUJqbeSnq+XJmEMP3
	hJ5QA4CQlMGfaH3JNOmaZDKb2w9Y/5e1U5aH8Tn9LVoHULNasXj8N08pIKbj8fpm
	tlkuIL1uZq8q9vuVOCH2lSGOaTZf1aEypPt0UpfYSrEjw=
Message-ID: <0437f8be-41ca-4fb8-b775-ed02413ea16d@163.com>
Date: Wed, 25 Nov 2026 15:55:44 +0800
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
Subject: Re: [PATCH] net: phy: avoid synchronous module request in async probe
 context
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org
References: <20261124070753.25972-1-18255117159@163.com>
 <179559227928.3135.10596298102368144827@kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <179559227928.3135.10596298102368144827@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXz6KFlAZrZ+5FJw--.49798S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFyrZF4UWF4rGF18GF4Uurg_yoWxCry3pF
	45JFWYyrZ8Xrs3Za1xJr4DuFy8u3yxJa1agr15Jw1Sga90yF9rAF9rKw15WrW7Zr4rG3W0
	9Fs8X3s3WFyqvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U53kNUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6waiRmsGlIZh6AAA3-



On 11/25/26 15:37, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] In async context, phy_request_driver_module()
>    (drivers/net/phy/phy_device.c:643-648) now calls…
> - [Low] The commit message presents the fix as letting the module load be
>    'requested without blocking the async worker'.
> - [Low] The patch fixes a user-visible boot-time WARN_ON_ONCE in
>    __request_module() (kernel/module/kmod.c:145), and the underlying path…
> 
> --
> 
> net: phy: avoid synchronous module request in async probe context
> 
> When phy_request_driver_module() runs from an async worker, it now calls
> request_module_nowait() instead of request_module(). This avoids the
> WARN_ON_ONCE(wait && current_is_async()) in __request_module(). The warning
> was hit when probing an RTL8126A behind a PCIe host controller that uses
> PROBE_PREFER_ASYNCHRONOUS.
> 
>> Use request_module_nowait() when current_is_async() is true so that the
>> PHY driver module load is requested without blocking the async worker.
> 
> [Severity: Low]
> Could the commit message describe the actual hazard behind the warning?
> 
> The comment above the WARN in __request_module() describes a deadlock, not
> just blocking:
> 
> 	/*
> 	 * We don't allow synchronous module loading from async.  Module
> 	 * init may invoke async_synchronize_full() which will end up
> 	 * waiting for this task which already is waiting for the module
> 	 * loading to complete, leading to a deadlock.
> 	 */
> 
> do_init_module() calls async_synchronize_full() when the module has not
> requested async probe. Before this patch, a PHY module that actually needed
> loading could therefore hang the boot, not only warn.
> 
> The message also doesn't mention that the change drops the guarantee that
> the PHY driver is loaded before phy_device_create() returns. Nothing else
> makes up for this. mdio_uevent() only emits an OF-style MODALIAS, not a
> PHY-ID based mdio: alias.
> 
>> Signed-off-by: Hans Zhang <18255117159@163.com>
> 
> [Severity: Low]
> This fixes a user-visible WARN_ON_ONCE() in __request_module() and a
> possible deadlock. Should it carry a Fixes: tag so backporters can tell
> which kernels are affected?
> 
>> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
>> index b39e945cebd73..a634b8b0c5b2d 100644
>> --- a/drivers/net/phy/phy_device.c
>> +++ b/drivers/net/phy/phy_device.c
> 
> [ ... ]
> 
>> @@ -639,8 +640,12 @@ static int phy_request_driver_module(struct phy_device *dev, u32 phy_id)
>>   {
>>   	int ret;
>>   
>> -	ret = request_module(MDIO_MODULE_PREFIX MDIO_ID_FMT,
>> -			     MDIO_ID_ARGS(phy_id));
>> +	if (current_is_async())
>> +		ret = request_module_nowait(MDIO_MODULE_PREFIX MDIO_ID_FMT,
>> +					    MDIO_ID_ARGS(phy_id));
> 
> [Severity: High]
> Can this leave the PHY device registered without its dedicated driver?
> 
> request_module_nowait() is __request_module(false, ...), which only waits
> for modprobe to be exec'd:
> 
> kernel/module/kmod.c:__request_module() {
>      ...
> 	ret = call_modprobe(module_name, wait ? UMH_WAIT_PROC : UMH_WAIT_EXEC);
>      ...
> }
> 
> phy_device_create() therefore returns before the PHY module has loaded and
> registered its phy_driver. The async worker then continues into
> mdiobus_scan()->phy_device_register()->device_add() with no driver bound.
> 
> The comment in phy_device_create() explains why this request is
> synchronous:
> 
> 	 * We don't do normal hotplug because it won't work for MDIO
> 	 * -- because it relies on the device staying around for long
> 	 * enough for the driver to get loaded. With MDIO, the NIC
> 	 * driver will get bored and give up as soon as it finds that
> 	 * there's no driver _already_ loaded.
> 
> Take the RTL8126A from the commit message. r8169_mdio_register() checks for
> the driver right after devm_mdiobus_register():
> 
> 	} else if (!tp->phydev->drv) {
> 		...
> 		return -EUNATCH;
> 	}
> 
> If modprobe hasn't finished by then, wouldn't rtl_init_one() fail, so that
> the NIC is never probed again? tg3_mdio_init() has a similar
> !phydev->drv check and returns -ENODEV.
> 
> Some MACs attach the PHY before modprobe completes. For those,
> phy_attach_direct() falls back to genphy:
> 
> 	if (!d->driver) {
> 		if (phydev->is_c45)
> 			d->driver = &genphy_c45_driver.mdiodrv.driver;
> 		else
> 			d->driver = &genphy_driver.mdiodrv.driver;
> 
> 		phydev->is_genphy_driven = 1;
> 	}
> 
> Once genphy is bound, driver_attach() skips this device when the dedicated
> driver registers later. Doesn't that contradict this part of the commit
> message?
> 
>      The PHY driver will still bind later, when it registers and the driver
>      core attaches it to the already-created PHY device.
> 
> r8169 is partly covered by MODULE_SOFTDEP("pre: realtek"), so realtek is
> usually loaded already on the reporter's board. Other MACs have no such
> protection.
> 
> Before this patch, with module.async_probe=1 or a per-module async_probe
> option, the PHY module was loaded correctly and only the warning fired. With
> this change, that case races instead.
> 
> Would it be better to keep the module load ordered before the PHY device is
> registered? For example, the probe could be deferred, or the NIC could avoid
> probing from async context. Either would avoid making the request
> fire-and-forget.

Hello,

Thank you for the review.

The High issue is correct: request_module_nowait() would make the PHY
module load fire-and-forget and could race with phy_device_register()
and the MAC's !phydev->drv check. I dropped that approach in v2.

v2 changes phy_request_driver_module() to return -EPROBE_DEFER when
current_is_async() is true. The parent device probe is then retried on
the deferred probe workqueue, where synchronous request_module() is safe,
and the existing guarantee that the PHY driver is loaded before
phy_device_create() returns is preserved.

The commit message now also describes the deadlock hazard behind the
WARN and carries a Fixes tag:

   Fixes: 0fdff3ec6d87 ("async, kmod: warn on synchronous 
request_module() from async workers")

Best regards,
Hans
> 
>> +	else
>> +		ret = request_module(MDIO_MODULE_PREFIX MDIO_ID_FMT,
>> +				     MDIO_ID_ARGS(phy_id));
> 
> [ ... ]
> 

