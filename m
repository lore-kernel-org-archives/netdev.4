Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599835;
	b=ARQpNwnJN1OZ3AW7XLFg3OJSH36G5jmFzmVlava0vBVxTnZibPlt0f2ANrP3TYJ86POb
	 VA+5rT0A/4/FyVLuE30tTqDGEx5HvtTlOfLCsstq+ULRJHJOHkfh2AR1RHbsRN+bv16D5
	 KwDvXEovCejOgPfr+pETjFJK8mmNgzxwGXBBHIeR/XdZcVyUGEWaZVey8TTg2XZ5hh4X/
	 pqM+UoU8kx5s57UhArWVZC95QcvsdiGCIczmChMfHS4HYS5X+3Uo5A1Igx1veYVLnvXkR
	 zm9CUOuv5KQRxgmLtAkyIk9ixCwpGd/LAC7n/6QTp0gwBvxZO/5b/uQEjsBJyvIHzRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599835;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1OTNmmlRFI4IiW7oTjJxi+qqQOpcconks9Ec5b83YZk=;
	b=H0cJFBmzGQJ9nnC7yZNvqqoss3kdxNRVXawsiL19FGSI6/VI5/HtA/XZa16314H4avXp
	 XWzszNS9Q6MXH20EwOc1e6L6AdHSwfr8y8dx5P6+Uokp/M8RpTphFtSn2amCJfoJH5MJD
	 0iSLOUIaM3peJJz41ISEHDfa9lwqrAwp8zEuRkCEKwG+S+b2T3psqSRYpifAdr21c6cLO
	 jNkQ0QeW7Svkx1VnoP+Sjxlmc56fJ8aM3y+isJr007am+LD78M9J/dglN1n0+J50KzhPJ
	 dMh61aKLwJ2ZC3BP58CrbgM525iVADMMyK8Wehq6hCMNjm2G2DukR06IaGNpZ20ilzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vHDa0fDQ;
	arc=none smtp.remote-ip=95.215.58.142
Received: from mta1.migadu.com (out-142.mta1.migadu.com [95.215.58.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C116606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C116606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vHDa0fDQ
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1EhSj1j2PP/s+IY3mJwWKcW0LKLzpZQAbwBrk+amRLA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795599832; v=1; x=1796204632;
 b=vHDa0fDQ9HIy80majcW9gtFgYFLAwV2XVHz0BXsjBZ6d7MlwMj9uHgtejMhmj8AfKgqZxExJ
 9ZS8OKyESKk8kyDxCcS3+PYy7aukI25cBv/8zsGIVSwCzh8Sr0zdI3nbCSR+bN0q3iny5jxxt06
 grEEyE0NyN94ZjBWakgluZO8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 356b86b2f565593b;
	Wed, 25 Nov 2026 09:43:52 +0000
X-Mizu-Trace-ID: 356b86b2f565593b
X-Migadu-Flow: FLOW_OUT
Message-ID: <5d6416ea-d927-40ac-9424-dade40191373@linux.dev>
Date: Wed, 25 Nov 2026 09:43:50 +0000
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
Subject: Re: [PATCH net v5 3/8] ptp: disable all timestamp channels after
 removing the user interfaces
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, arkadiusz.kubalewski@intel.com, arnd@arndb.de,
 davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us,
 john.stultz@linaro.org, jonathan.lemon@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
 <20261123-timecard-common-v5-d669cfa034-3-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-3-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 04:42, Ahmad Byagowi wrote:
> PTP_EXTTS_REQUEST and extts_enable can enable channels without assigning
> a PTP_PF_EXTTS pin. ptp_disable_all_events() only visits assigned pins,
> so those channels can still generate events after the clock is released.
> ptp_ocp exposes six timestamp channels but only four SMA pin descriptors;
> the internal GNSS and PHC timestamp sources do not need an SMA assignment.
> 
> Disable each advertised external timestamp channel, followed by the
> existing PPS disable, after posix_clock_unregister() has removed sysfs
> and drained active ioctls. Issue PTP_CLK_REQ_EXTTS requests directly for
> timestamp channel indices. Do not use the pin-function helper or require
> a pin assignment. Keep that helper for changes to actual pin configuration.
> 
> Remove ptp_ocp's preliminary timestamp-disable loop. It runs before the
> user interfaces are removed and can race with an enable: the enable sets
> pps_req_map, detach clears it and disables the source, then the enable
> rearms the source. With shutdown delegated to the core, requests finish
> before the final disables and IRQ drains. Keep the existing resource
> cleanup for probe failures without a clock.
> 
> Do not skip the shared PPS source's register disable when the final
> subscription map is empty. The map tracks software subscriptions, not
> the hardware's initial state: ptp_ocp_register_ext() requests the IRQ
> without resetting the source. An already active source must also be
> masked and drained before releasing the clock. Preserve the shortcut
> while another PPS or EXTTS subscription remains. The preceding sysfs
> serialization fix prevents runtime enables from overlapping disables;
> the SJA1105 prerequisite prevents an EXTTS disable from changing its pin.
> 
> Source-derived tests with stubbed MMIO and IRQ operations reproduce the
> early-disable/map race and exercise an empty-map prearmed source. Core
> unregister tests pass in QEMU with KASAN and lockdep. These are software
> tests, not observations of a prearmed physical card.
> 
> The issue was reported by the Sashiko review. Codex assisted with the
> code, tests and changelog in response to that report and Vadim's review.
> 
> Fixes: a60fc3294a37 ("ptp: rework ptp_clock_unregister() to disable events")
> Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
> Link: https://lore.kernel.org/r/4e42134b-b017-4836-9772-9c1915b16e77@linux.dev
> Link: https://lore.kernel.org/r/08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev
> Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
> Changes in v5:
>   - Keep the v4 code and Vadim's direct channel-disable approach unchanged.
>   - Add sysfs serialization and SJA1105 prerequisites before this patch.
>   - Explain the empty-map shutdown independently of the now-fixed runtime
>     race, and distinguish modeled prearmed hardware from a physical test.
> 
> Testing: 100 removal/shared-PPS suite runs and all eight local PTP KUnit
> cases passed. Seven cleanup mutations fail at runtime. No physical card
> was used; the review-only fixture is not part of this patch.
> 
>   drivers/ptp/ptp_chardev.c | 14 +++++++++-----
>   drivers/ptp/ptp_ocp.c     | 17 ++---------------
>   2 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index f63b45f5ee6a..5835c01cddb4 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -53,11 +53,15 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
>   	unsigned int i;
>   
>   	mutex_lock(&ptp->pincfg_mux);
> -	/* Disable any pins that may raise EXTTS events */
> -	for (i = 0; i < info->n_pins; i++)
> -		if (info->pin_config[i].func == PTP_PF_EXTTS)
> -			ptp_disable_pinfunc(info, info->pin_config[i].func,
> -					    info->pin_config[i].chan);
> +	/* EXTTS requests do not require a pin assignment. */
> +	for (i = 0; i < info->n_ext_ts; i++) {
> +		struct ptp_clock_request req = {
> +			.type = PTP_CLK_REQ_EXTTS,
> +			.extts.index = i,
> +		};
> +
> +		info->enable(info, &req, 0);
> +	}
>   
>   	/* Disable the PPS event if the driver has PPS support */
>   	if (info->pps) {
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 625a85b2dc7e..b16d36c3305f 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2559,8 +2559,8 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>   		else
>   			bp->pps_req_map &= ~req;
>   
> -		/* if no state change, just return */
> -		if ((!!old_map ^ !!bp->pps_req_map) == 0)
> +		/* Skip the register update while a subscription remains. */
> +		if (old_map && bp->pps_req_map)
>   			return 0;
>   	}

Please, don't mix changes to the core and a single driver in the same
patch. More of it - the chunk above changes behavior, it was explained
previously, why do you still keep it??

>   
> @@ -5755,19 +5755,6 @@ ptp_ocp_detach(struct ptp_ocp *bp)
>   	ptp_ocp_detach_sysfs(bp);
>   	ptp_ocp_attr_group_del(bp);
>   	timer_delete_sync(&bp->watchdog);
> -	/* Disable interrupts on all timestampers */
> -	if (bp->ts0)
> -		ptp_ocp_ts_enable(bp->ts0, 0, false);
> -	if (bp->ts1)
> -		ptp_ocp_ts_enable(bp->ts1, 0, false);
> -	if (bp->ts2)
> -		ptp_ocp_ts_enable(bp->ts2, 0, false);
> -	if (bp->ts3)
> -		ptp_ocp_ts_enable(bp->ts3, 0, false);
> -	if (bp->ts4)
> -		ptp_ocp_ts_enable(bp->ts4, 0, false);
> -	if (bp->pps)
> -		ptp_ocp_ts_enable(bp->pps, ~0, false);
>   	if (bp->ptp)
>   		ptp_clock_unregister(bp->ptp);
>   	kfree(bp->ptp_info.pin_config);

