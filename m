Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127010;
	b=jDzasTO7uGtLu0EN+B5gj4YhpIc0zTV8McizAPVJMbAnaTJoEU8SZ6D4SefNzMtI/hKB
	 NeyJkC0L2B8rgs4mIJzh0CAdBGbZyPm5jFiMr0KO16bpRLaFSAEgcCvBaLATwHHEGat/j
	 fDhbhC8wAChm67Y+9gnzk3ZsYySpL1eUXzzRqtWCa6z4vAmVmrd0n+zNluiA3PnvBMaf1
	 ndeTta48gjHwnG93/c2BXSUEf0kK7Mm1vI3zs2VRTU30IZAYK4gTEwpxUdQFdOfc0CCOG
	 wDzxlOeTB2BDrUJWtaeFJClQheCu02flQEU4oid+fpfyhbqEZfYoc6UZ9JeAdyPydNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127010;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dEyEykb8A4eT9ASK+0tjHM4tyfrXGycezZEOpc2wRFo=;
	b=YYXcH3Goe7h3j96jmSuCAH4Neaep8V0iJgaMMx/Pwp0P4WR3yYljoi8Xhi/diup71DpY
	 WGZTsSjRKKD/Py4PvMxUaSAHMK72Pbj360tKFEKph6l/Ayd2PdfiHGtvAy9V3SAcEy8cT
	 DSgQ+BosCqSGRgDd92RrLTbJU24t+SHOmeAfnzJJ4mSKdfobhCioed+BEWlt4BWQf5ZaK
	 CbaW/s+jApuKbdfx8K8WQqLgGIEtO7EOv7S0Xo0J1tKzfKdh4HTmEO6/a8bWNxx+09mD+
	 gH7wYHOt75NXnDrn7BF62NmkwyOU6lNk+q1GxdJ8HiNtZty5bqLh9ukMHY61cs7JMBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PCo7+q9m;
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F553606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F553606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PCo7+q9m
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Eeyl014gkOjAgkFG1m7QbKJnoVtHYBWzIvgaUqC2g/w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795127008; v=1; x=1795731808;
 b=PCo7+q9mQX1P3pFB+ik7VO1IoiCQLXi9I6N7++rVU0W18yyE/ZDdxnKmapc9FGr2Jm5zTsMV
 pCo4aGTQ+2dBG36/1+q33dpp+/l11scvXDqo8jkpnYSFkHFkWHwEoxtmbPIxbyMshu1VyTVaH62
 74A/j6lWC0E/wO8eTI7AtKYc=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dfb6ee13888e2f3d;
	Thu, 19 Nov 2026 22:23:27 +0000
X-Mizu-Trace-ID: dfb6ee13888e2f3d
X-Migadu-Flow: FLOW_OUT
Message-ID: <9124e525-82ef-4d65-ae30-6676f257d8e1@linux.dev>
Date: Thu, 19 Nov 2026 22:23:27 +0000
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
Subject: Re: [PATCH net v2 2/4] ptp: ocp: use hardware selectors in DPLL
 frequency operations
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org,
 richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch, arkadiusz.kubalewski@intel.com,
 davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us, kuba@kernel.org,
 pabeni@redhat.com
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
 <20261119-timecard-common-v2-078fe69f33-2-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-2-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 21:19, Ahmad Byagowi wrote:
> The selector table index is not the hardware selector value. Passing the
> index to the SMA setter can select unrelated signals, or fail on ART.
> Use the table value, as the sysfs path already does.
> 
> Mask the direction enable bit before the frequency lookup. Otherwise an
> enabled, direction-configurable pin has no matching table entry and its
> DPLL get or dump fails. Apply both corrections to all board variants.
> 
> Reported by the netdev Sashiko AI review and confirmed by code
> inspection. Source-derived C regression tests pass with ASan/UBSan;
> restoring the faulty selector, mask, disabled-state or DCF value makes
> the corresponding regression fail. Tests use stubbed MMIO, not hardware.
> The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
> physical card was tested.
> 
> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.
> 
> Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 4c98558e96..f1f97c1fa0 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -5903,7 +5903,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
>   	tbl = bp->sma_op->tbl[sma->mode];
>   	for (i = 0; tbl[i].name; i++)
>   		if (tbl[i].frequency == frequency)
> -			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
> +			return ptp_ocp_sma_store_val(bp, tbl[i].value,
> +						     sma->mode, sma_nr + 1);
>   	return -EINVAL;
>   }
>   
> @@ -5921,6 +5922,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>   	int i;
>   
>   	val = bp->sma_op->get(bp, sma_nr + 1);
> +	val &= SMA_SELECT_MASK;
>   	tbl = bp->sma_op->tbl[sma->mode];
>   	for (i = 0; tbl[i].name; i++)
>   		if (val == tbl[i].value) {

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
