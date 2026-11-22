Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378264;
	b=lF7jyGvpy74Zwi8yNZJkm1RdXzsK6apJhvs2ABcpuhRHaonlO3CMcdXzmqeFea/aEsU/
	 3ZZsDBQan/6wMATPZ86W0YDTubAlLrHyX030x0T8szs4zwnC/G5bccquSaUmkGVd46Y2d
	 H/7uRuRl0+9TJCnio1C3SRfyBa/DWmQOelCxFvvAt/x8G0D+/77kvyGH3EwET1Gm7jeE7
	 H2vVeKhp5EgxN55DNkqU9qDmRKrBCAAG+1hOQOAUkVEVMimHweoBqJBB6f9dRJb6skxX3
	 0IvJGvQ2t5qwz/gxLqJVxEt+QsUZ2F9iqZKa7SddU8PdqYBHqUTw0au3vsgMDM8QpKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378264;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sEFmpJ+5haC2V3cGEPxvQ+66RUItPjqbpYIsDv8CYnA=;
	b=WoT9xMjik4Wf/n0FZjzkJ1TQw9lUEpvx/9vNSzLW699TZ8gY2NI7vlqalw9ebGUKljQj
	 Azuytx3+jEp08e2VYiPE0AvKuQHQtuuG6qyg2PxWzLAUEwpD+WYiJNVu5fBt8H1RvOkqx
	 HH/LCC9O9xctqhydzF7PTDjoFmdV4WtpicreKLjtjPhDRDUdH2CmZ9QvoIejriXozfhge
	 HwFgDk3ACiYQdbK58PVlD/x53rp7Ke/NUAgyRg7Ejo2cwrYClDcvrbTTw1m7OOgkXm8Hw
	 N1ZBX//Sn5BzgH6D72amSxf9DG4mOAYlany7s2psTpUvk+6U7UCbwP6SOCPs3/98hLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F0l8kK+k;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37C6606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D37C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F0l8kK+k
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9xtLg+QL7UEJ3bDGk+v/3GEK098qo7k52kt3WPUoKNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795378260; v=1; x=1795983060;
 b=F0l8kK+kv72h2/HbqRI7XHIIoPefYiB60U7zeKcJZGqFo5ygmQWKmzOoZKO9VLEyuv6YJFUI
 2bj4lpQfwSkboXgtX7pWVKZv+sGIPwhfismp1eEkWXLOBHS3TNc142ojtumYbdsNCGQfDXYJSFd
 /xknEbg3dqQSoXfC/ala4Fxo=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d133a507dbe3a231;
	Sun, 22 Nov 2026 20:11:00 +0000
X-Mizu-Trace-ID: d133a507dbe3a231
X-Migadu-Flow: FLOW_OUT
Message-ID: <08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev>
Date: Sun, 22 Nov 2026 20:10:55 +0000
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
Subject: Re: [PATCH net v3 1/4] ptp: disable all timestamp channels after
 removing the user interfaces
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, arkadiusz.kubalewski@intel.com,
 davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us, kuba@kernel.org,
 pabeni@redhat.com, richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vladimir.oltean@nxp.com
References: <20261120-timecard-common-v3-33316bf475-0-ahmadexp@gmail.com>
 <20261120-timecard-common-v3-33316bf475-1-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261120-timecard-common-v3-33316bf475-1-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.2026 21:21, Ahmad Byagowi wrote:
> PTP_EXTTS_REQUEST and extts_enable can enable channels without assigning
> a PTP_PF_EXTTS pin. ptp_disable_all_events() only visits assigned pins,
> so those channels can still generate events after the clock is released.
> ptp_ocp exposes six timestamp channels but only four SMA pin descriptors;
> the internal GNSS and PHC timestamp sources do not need an SMA assignment.
> 
> Disable each advertised external timestamp channel, followed by the
> existing PPS disable, after posix_clock_unregister() has removed sysfs
> and drained active ioctls. Keep the pin configuration unchanged.
> 
> Remove ptp_ocp's preliminary timestamp-disable loop. It runs before the
> user interfaces are removed and can race with an enable: the enable sets
> pps_req_map, detach clears it and disables the source, then the enable
> rearms the source. Both later subscription disables can consequently see
> an empty map and skip the hardware shutdown. With shutdown delegated to
> the core, requests finish before the final disables and IRQ drains.
> Keep the existing resource cleanup for probe failures without a clock.
> 
> Do not skip the shared PPS source's register disable when the final
> subscription map is empty. An overlapping extts_enable sysfs request and
> ioctl can leave an empty map with the source enabled. Once both interfaces
> are drained, the core's final disables must still mask and drain the IRQ.
> Preserve the shortcut while another PPS or EXTTS subscription remains.
> 
> The source-derived ASan/UBSan tests exercise late and in-flight enables,
> the early-disable/map race, concurrent sysfs/ioctl requests, active IRQ
> draining and shared PPS users.
> KUnit tests exercise real PTP registration and unregistration in QEMU
> with KASAN and lockdep, using a test callback without physical hardware.
> 
> The original teardown issue was reported by the netdev Sashiko AI review.
> Codex revised the code, tests and changelog when asked to test Vadim's
> cleanup approach, including unassigned channels and shared PPS behavior.
> 
> Fixes: a60fc3294a37 ("ptp: rework ptp_clock_unregister() to disable events")
> Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
> Link: https://lore.kernel.org/r/4e42134b-b017-4836-9772-9c1915b16e77@linux.dev
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>   drivers/ptp/ptp_chardev.c |  8 +++-----
>   drivers/ptp/ptp_ocp.c     | 17 ++---------------
>   2 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index f63b45f5ee6a..193e6baf2b47 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -53,11 +53,9 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
>   	unsigned int i;
>   
>   	mutex_lock(&ptp->pincfg_mux);
> -	/* Disable any pins that may raise EXTTS events */
> -	for (i = 0; i < info->n_pins; i++)
> -		if (info->pin_config[i].func == PTP_PF_EXTTS)
> -			ptp_disable_pinfunc(info, info->pin_config[i].func,
> -					    info->pin_config[i].chan);
> +	/* EXTTS requests do not require a pin assignment. */
> +	for (i = 0; i < info->n_ext_ts; i++)
> +		ptp_disable_pinfunc(info, PTP_PF_EXTTS, i);
I thought we have agreed that time stampers and pins are different beasties.
Still you provide time stamper index to pin function...

--
pw-bot: cr

