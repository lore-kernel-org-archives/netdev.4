Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500773;
	b=gUZ0KclnTsqtBCU6eiliYSLC833JX6mrRPMic/YP9yb+Lwp2Dtg2EEchhS/yWMa34814
	 YBZjyfqE3+L683m9fE1L5/pDM4WfDYnuFdNRlWL4CnPPD/siy8IUVUlVr/7xlZWAxW5xe
	 dNOQeDLVCEtIWbubD3oNjuYLh6h0PSIvJb4WyiQ2Esesx82Jt1anQ5IPo7YYnPXOZQg2U
	 4cL9lM6sgNA4dr4j2EDDk05Bny4I1SH37SrNf7CtynZB2y5awOVgRCvoYoMTZ50vtnebO
	 2n0OPSP4sf3WCW0XA9tXP5MI16LXXOV9OdxXo4aNXxts5txrk348kpZCAnqc7X7EF3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500773;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=bivwD7dHlqSpJW2NL3hME59nxpMUaH80jJVziWDQ6JI=;
	b=JDtesApNwYywE4P3Kk+j+8chRUU7cqNbmm7btgLYFU8xmF+mMPPeNkrn6JaP8Sps0XOp
	 tNk6vcn5h+A3pgcPIG4QS/Nw+6NBKxPyj8b7QHtLSttUz1x6bpTMhuKIF+3N2P69iAkEh
	 tz+VaMvarUAtSsDUmXNPnADUYfgpPJsmUTqmluq/O8erHV0vK5LhjRrgUnkNlfmyAwSE/
	 Rs2OyPymtl571PVN1WRWXZFsv222sbEa1ewICrWUhgsMDfBs1xp1Jmx2fSMyAIKXfBU3G
	 ZzZ1cbu+qliJkltmzpxbjbFbMcDdvnPjNoq3bc2/d124vgzbkbLTqYJkqGKI4NbpNGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Y8c8Hdmw;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35D606A32E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F35D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Y8c8Hdmw
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF841A05A6;
	Tue, 24 Nov 2026 07:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795500770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bivwD7dHlqSpJW2NL3hME59nxpMUaH80jJVziWDQ6JI=;
	b=Y8c8Hdmw+fIP4NrNkb93ZHjJjrmBVXz3k2w/FUU7gqwAfumKmt0kO9OkHfZUMv0YogC/x6
	tc4kKCpQCKgxY+dLQD4tM8R9WNnXWdWkZVcD0sWt0tG5iVTqc1xHj1vfUNrFnq5WeVTLjJ
	t8hWC9M8xpz+PAQGdznVYotnZL6uLXWe8QFjxsk0UlNUrTFQSDxzgx6F/KCqGlTOdHsyxc
	zd7nLqIb8DQ1uZY8EhXIb1+50ZoD7Ncyrdl1NlvVnJl03Za8FtaiS9vuYMXUBCFAd88SkB
	1maHWFGJcUtwY4rK9xgJuvqTeVRVpKl5VPtRozVuUm+bI+A+LLzs9Wne/qepGQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 07:12:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Conor Dooley
 <conor.dooley@microchip.com>, Sergio Prado <sergio.prado@e-labworks.com>,
 netdev@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
Subject: Re: [PATCH net] net: macb: don't disable an IRQ wake that was never
 enabled
In-Reply-To: <DN2R8R6SGV27.DU4IEVFTHBC0@bootlin.com>
References: <20261123-nb-macb-irq-wake-net-v1-1-ccdd60a9a1bc@tipi-net.de>
 <DN2R8R6SGV27.DU4IEVFTHBC0@bootlin.com>
Message-ID: <36b47d8ba8e6c52ac3ccdeea0f057e06@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Théo

On 23.11.2026 18:09, Théo Lebrun wrote:
> Hello Nicolai & Dom,
> 
> On Mon Nov 23, 2026 at 4:38 PM CET, Nicolai Buchwitz wrote:
>> @@ -6589,7 +6590,11 @@ static int __maybe_unused macb_suspend(struct 
>> device *dev)
>>  		}
>>  		spin_unlock_irqrestore(&bp->lock, flags);
>> 
>> -		enable_irq_wake(bp->queues[0].irq);
>> +		err = enable_irq_wake(bp->queues[0].irq);
>> +		if (err)
>> +			netdev_warn(netdev, "Unable to enable IRQ %d as a wake source 
>> (error %d)\n",
>> +				    bp->queues[0].irq, err);
>> +		bp->pm_data.irq_wake_enabled = !err;
>>  	}
> 
> Your error handling is surprising to me: if we get asked to be a wakeup
> source and fail doing so, we should refuse and error out. This will in
> turn abort the system-wide suspend.
> 
> The risk is that we might be the only wakeup source. We'd sleep for a
> really long time.

Agreed. This also would match the WAKE_ARP check, which already aborts
suspend. We could arm the IRQ before touching the hardware and return 
the
error, so the flag goes away too?

> 
> What's the behavior on the platform you noticed the issue? I can think
> of two reasons that still make it work:
>  - you have another wakeup source or

Yes, the bootloader / rtc alarm / power button. The GIC is off as it is 
on
rp1 too, which is in reset I guess. This makes WoL IMHO impoissible.

>  - some other interrupt (PCI related) is your wakeup path.
> 
> In my mind, we should instead propagate the enable_irq_wake() error in
> macb_suspend().
> 
> To go even further, we could move the enable_irq_wake() into
> macb_set_wol() to report early to userspace that WoL isn't supported.

There is another downstream patch I plan to upstream, which sets 
MACB_CAPS_NO_WOL
for rp1. As this in kinda feature I planned for net-next and just fix 
the bug in net

> 
> Lastly, if this is indeed a PCI related topic, then we need to
> special-case the enable_irq_wake() call. From my LLM report, many PCI
> MAC drivers only call device_set_wakeup_enable() at the set_wol
> request. Then everything is handled at the bus level at suspend: a
> pci_enable_wake() call made if the device is on the wakeup path.

macb is a platform device behind rp1, which is a mfd. PCIe is down in S3 
anyway?

> [...]

Thanks,
Nicolai
