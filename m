Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058511;
	b=WVyjzfKrtjsY/YvmOvIWyM6AcHC+pXopEhVkqYWFjLiI9Z2IbpoP7x7VycNvFKWiNzco
	 nUIiyOwDT//ptmPnKos0mj2OparEOo+LkQbqfWHwFRxAm8U/YXNKvElcfWxwBvRamGhiY
	 OmF+joCJ2Lf9sGcMnUha1TwTVlDmiE47IyskMU2mv190M4cGe2XUYUZN0QGz7xlJY8b2m
	 oRnudxksUlLNzcqZklO1pA37oQtncs0N0GaN9mTJHzcACBJvAkCyD5bznjuoPAVcYs9tm
	 p6+gXyM4uC+HCLqxADQM03d3MTiBKmiEnzI6PAAWsyGJLvSRTDf/AaBtcijffnxjYWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058511;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iDmQOr43QTF7igvrWWY0fOtv86OpvPLY2q1VhBvbwSM=;
	b=0UILzzJUuluJs0zR6NDSwqpTRX9j5O20mf4VjhWLAz6SKwgQzi6pwK6z7hDRK9ZOm4SP
	 9eOw9FE8XdWJ2IbmMhklKu9o27gQlGfKhW6xeaFfpW1adT2qIO53s9PrkaIs2/HkWhw5/
	 0c0jxUoFV2wrSqYbCKS2mUaQzBs3HPGMJvz4rtgat+XgyBYnv8vop29iQ75doQ9LAw9lK
	 UasH97Q4FQcqavOUql8pmqemRPdILVqPHkB5WitZT9M+a62jPOXgAHFoKiTGQLSfgvUeR
	 MA86VR2hHm/t6Ww3h3PbHbaDUz2169P/VnXIqEc2+F552bnF8oj+jRpymzdNitPMl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hJ/5ptYx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9710A606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJ/5ptYx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF411F000C4;
	Thu, 19 Nov 2026 03:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795058511;
	bh=iDmQOr43QTF7igvrWWY0fOtv86OpvPLY2q1VhBvbwSM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hJ/5ptYxGDUQxEW1FPtDFYsdmo7UOtOGQzylBH39HHfG4FZh9hv1xOKwGv4VuNcPN
	 m+2Lrlby1IDjCCXCREr/IiBS2VAl/hupBVZJujz1KtFU8J7s4+I2KP1lPLXR5adtBE
	 wDQIPIMRRcml/IQREpvxYeDIxmI/GR5obi3K0iBtEpq0fxbs1Pyb4urSTuE6Q3GIeU
	 FjqU0EnhUFIaaJPUUyIKa7Cgji18T9OPx5hhIdCDngysXeiHj8TmphFdkzUxC8amwg
	 qgzIqAV5QxH+sLyyAbFpORSoCj1bubr/Tn90cYZ/Z3IEfJ7pvQfQPEncSE1g0YkpS3
	 P74MP50OJRo2g==
Subject: Re: [PATCH net-next 1/6] eth: bnxt_en: order event data before
 setting the sp_event bit
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, pavan.chebbi@broadcom.com
Date: Thu, 19 Nov 2026 03:21:50 +0000
Message-ID: <179505851041.3136.8792625449105507971@kernel.org>
In-Reply-To: <20261118023905.3050661-2-kuba@kernel.org>
References: <20261118023905.3050661-2-kuba@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch fixes only some of the producers that publish data
  and then raise an sp_event bit.

--

eth: bnxt_en: order event data before setting the sp_event bit

This commit adds smp_mb__before_atomic() in bnxt_queue_sp_work() before
the set_bit() on bp->sp_event. Data that callers store for bnxt_sp_task()
then becomes visible before the event bit. The barrier pairs with the
fully ordered test_and_clear_bit() in bnxt_sp_task().

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 6846a27bfef4c..5ad2a3033505d 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -394,6 +394,10 @@ static void __bnxt_queue_sp_work(struct bnxt *bp)
>  
>  static void bnxt_queue_sp_work(struct bnxt *bp, unsigned int event)
>  {
> +	/* Make the data the event carries visible before the event bit,
> +	 * pairs with test_and_clear_bit() in bnxt_sp_task().
> +	 */
> +	smp_mb__before_atomic();
>  	set_bit(event, &bp->sp_event);
>  	__bnxt_queue_sp_work(bp);
>  }

[Severity: Medium]
Should the same ordering also cover the producers that set sp_event bits
directly and then call __bnxt_queue_sp_work()?

The new comment reads like an ordering contract for sp_event in general.
Several paths in bnxt.c do not go through bnxt_queue_sp_work(), so they
never reach the new barrier. Each of them stores the event data, does a
plain set_bit() on bp->sp_event, and then calls __bnxt_queue_sp_work(),
which has no barrier.

In bnxt_async_event_process(), the echo request case does this:

	if (fw_health) {
		fw_health->echo_req_data1 = data1;
		fw_health->echo_req_data2 = data2;
		set_bit(BNXT_FW_ECHO_REQUEST_SP_EVENT, &bp->sp_event);
		break;
	}
	...
	__bnxt_queue_sp_work(bp);

Could bnxt_fw_echo_reply() then copy stale echo_req_data1/2 into
HWRM_FUNC_ECHO_RESPONSE?

In the RESET_NOTIFY case, the code writes fw_reset_timestamp,
fw_reset_min_dsecs, fw_reset_max_dsecs and the BNXT_STATE_FW_FATAL_COND or
BNXT_STATE_FW_NON_FATAL_COND bit in bp->state, and then does:

	set_bit(BNXT_FW_RESET_NOTIFY_SP_EVENT, &bp->sp_event);

The state bits are also set with a relaxed set_bit(), on a different
word, so nothing orders them against the sp_event bit. bnxt_sp_task()
then checks them:

	if (test_and_clear_bit(BNXT_FW_RESET_NOTIFY_SP_EVENT, &bp->sp_event)) {
		if (test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state) ||
		    test_bit(BNXT_STATE_FW_NON_FATAL_COND, &bp->state))
			bnxt_devlink_health_fw_report(bp);
		else
			bnxt_fw_reset(bp);
	}

Can this take bnxt_fw_reset() instead of bnxt_devlink_health_fw_report(),
or start the reset with stale wait limits?

bnxt_event_error_report() does the same with bp->thermal_threshold_type:

	bp->thermal_threshold_type = type;
	set_bit(BNXT_THERMAL_THRESHOLD_SP_EVENT, &bp->sp_event);

and bnxt_hwmon_notify_event() switches on that value.

bnxt_sched_reset_rxr() follows the same pattern:

	rxr->bnapi->in_reset = true;
	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)
		set_bit(BNXT_RESET_TASK_SP_EVENT, &bp->sp_event);
	else
		set_bit(BNXT_RST_RING_SP_EVENT, &bp->sp_event);
	__bnxt_queue_sp_work(bp);

If bnxt_rx_ring_reset() sees a stale in_reset == false, it skips the ring:

	if (!rxr->bnapi->in_reset)
		continue;

in_reset then stays true, so bnxt_sched_reset_rxr() never schedules that
ring reset again. Would that ring stay stuck until a full reset?

These paths are still unchanged at the end of the series, as of the
"restart Rx queues when their IRQ moves to another NUMA node" patch.

Moving the barrier into __bnxt_queue_sp_work() would not cover these
paths, because the open-coded set_bit() calls run before it. Could
smp_mb__before_atomic() go before each open-coded set_bit() instead, or
could these producers use an ordered helper?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118023905.3050661-1-kuba%40kernel.org
