Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=145.239.82.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787371;
	b=QE13bEDv5obU7B35npNYzgjY0usXLS+sfFzL9hDZ9wKuOVA2ES8fvSX6ND77QTWilWdH
	 1WflK0p7j2N9dUFGHYQfZK2QxC7/HgJ88SnjPOFThqYqd52mTh1rl3AzigtVFbA1WJ7zN
	 XxWr6QJe0MVRByNfKWLCXPXz2FOBd/nelx6qhwYCeujX2EvNb/ZDmqdhcIZQVP9EHAF1Z
	 2mzGvJ28YZZWHw9mFYfvj0VmUI4eeO8DaWBgnS+Q32ar7diQ8g/wPHFjc7k/h6lYzcL86
	 Krh3BVsVMQal//y+AMN8m1zOGj4IHFWA4qkWCbEb78kz4DMFCyMsJ7xFuwKMzRV3X1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787371;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 Disposition-Notification-To:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=wIGkj9xWNIJpo3wz8l8CHX7mkckIFA19cjA63uz2fAM=;
	b=s0vOSVMjWx+PrQtdnV0VMAdhcxDFmZL8+9VEDmOnni0M4LdsYwHqTEbXtXJIcESCKSoS
	 icc6oGMfINzN+8+vzKu8EokIN3LtEpNThR1W+YPUwYH/+d0Rsh0REhz0rQuRClnJCQGed
	 rdgcCLVfp3NRkomjjCBJm4vKc+rR7z1wUarqdehwONm+29XNa/BKcVCk5AsjIfk8NFUuG
	 opyFBT+LLWKGAcB5rmca7tFvEBe24vqkNVXebYlhYOHIyPHJPxZShGhEMYq1E2SgRvdz8
	 aR/SY6KNZ62Qn44mG04ArSOONKRtbCWfz+nKSfVAjXcHIvSouPywa/GIlJdItKJzUNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=maciej.szmigiero.name;
	spf=pass smtp.mailfrom=vps-ovh.mhejs.net;
	arc=none smtp.remote-ip=145.239.82.108
Received: from vps-ovh.mhejs.net (vps-ovh.mhejs.net [145.239.82.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C1606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vps-ovh.mhejs.net
Received: from MUA
	by vps-ovh.mhejs.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <mhej@vps-ovh.mhejs.net>)
	id 1xWwKD-00000001Hdi-0sCn;
	Fri, 27 Nov 2026 14:49:17 +0100
Message-ID: <fd2a9a0a-106e-467b-acd0-7045410305e3@maciej.szmigiero.name>
Date: Fri, 27 Nov 2026 14:49:11 +0100
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
Subject: Re: [PATCH net v3 2/2] net: wwan: iosm: re-bind the driver when the
 modem rebooted during S3
To: David Westen <davidlwesten@gmail.com>
Cc: netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20261126194143.32283-1-davidlwesten@gmail.com>
 <20261126194143.32283-3-davidlwesten@gmail.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Content-Language: en-US, pl-PL
Autocrypt: addr=mail@maciej.szmigiero.name; keydata=
 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
In-Reply-To: <20261126194143.32283-3-davidlwesten@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: mhej@vps-ovh.mhejs.net

On 26.11.2026 20:41, David Westen wrote:
> On platforms where S3 cuts power to the WWAN card, the modem boots
> again while the driver still treats it as running, and the first port
> open after resume fails:
> 
>    iosm 0000:03:00.0: PORT open refused, phase A-CD_READY
> 
> The driver takes this from a stale stage in the shared memory: on an
> XMM7360, the modem writes CD_READY there before it loses power. The
> modem itself is fine.
> 
> On resume, read the stage from the MMIO area. If the modem booted
> again, mark it as gone: the driver then neither talks to it nor waits
> for it, and the cleanup only releases memory. Once the modem has
> reached the run stage, re-bind the driver, so that probe finds it as
> after a cold boot. Nothing changes where the card keeps power, and a
> crashed modem is left alone.
> 
> Tested with S3 on an XMM7360 in a ThinkPad X1 Carbon 6th gen, with
> KASAN, lockdep and a strict IOMMU: five cycles, also with wwan0 up
> through the suspend.
> 
> Fixes: 7e98d785ae61 ("net: iosm: entry point")
> Signed-off-by: David Westen <davidlwesten@gmail.com>
> ---
>   drivers/net/wwan/iosm/iosm_ipc_imem.c      | 47 +++++++++++++++++++++-
>   drivers/net/wwan/iosm/iosm_ipc_imem.h      | 18 +++++++++
>   drivers/net/wwan/iosm/iosm_ipc_imem_ops.c  |  4 ++
>   drivers/net/wwan/iosm/iosm_ipc_irq.c       |  3 ++
>   drivers/net/wwan/iosm/iosm_ipc_mux_codec.c |  6 +++
>   drivers/net/wwan/iosm/iosm_ipc_pcie.c      | 37 +++++++++++++++++
>   drivers/net/wwan/iosm/iosm_ipc_protocol.c  |  3 ++
>   7 files changed, 117 insertions(+), 1 deletion(-)
> 

That's a much more intrusive change than simply re-binding the driver
and to be honest, feels like a hack around various paths in the iosm
driver that may be touching a modem that lost its power and then crashed.

Also, wouldn't the problematic things that you describe in your cover
letter as happening at modem unbind during suspend also happen without
any power transition if the iosm module is simply unloaded from the
kernel (presumably with modem still connected)?

If yes, then this new approach is simply papering over bugs in the
iosm module cleanup that really should be fixed at some point
independently from any suspend/resume transition issues.

If no, then we should see what makes the okay/buggy difference there.

Thanks,
Maciej

