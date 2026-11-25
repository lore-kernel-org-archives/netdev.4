Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621131;
	b=Wahr2y1NeTA+iSCpXV9eNgnIoPSK7DOXM42N6gflXQqcbucusaxQmcp/g86llYe3tHbm
	 j2ArfuLO56/sl2EazJWGV7woGtW3srWYNxLXaHhVCEgKh81Z8k4Hj9xsemsg37O6blQLr
	 AXE/Um3tygkklxmkvmnoENIOJW/IgABbrF6kTNKlp9VcaVlNywZ1ZkVPvAwARk/J164pv
	 0jd8bGrl92C39/CDf/7vUBBW9ixdRl2QWYi7zONBaRp1f32TMAPJdCjK/3YOp3hw2Us43
	 qQv0CNTdkyIsLf9vQG+0hgy3d0VAU5UL7sfNwaoZ24wChh6S9mX8Wz6RsC09wkbX/yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621131;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=zZuLZqjytfrvG9VX0UeNTdq821Wj84uFOAI7JJsAe0Q=;
	b=G5UNupX5xPTedznpzW0eaCAtJSGUxoxPAO/M+g213Gl4SYNGxwDOJl/N/hsB9Ydrkbrj
	 FHpR1+b4GEjp3mn6uPT6ZhupHVMD/cO0+ukg9ggpXV2VmGHQ2wkJ0Z91WCW9tdCNcAR1m
	 AXl60spCNb15bonoXiwtYMy7GfDEXuzXYCWXdG2bCZxL/m3N3xz4fUDjMMLzmsi+Sbqzj
	 3SThisa25HTavNT8SzCg6UE/N3LQm08QA4/XVIXh30eqypL8fEe86soMcFE+wiNH4jPP8
	 jILBRKlGVDwVdbQztp2OpiMnasThVJ8CW+S69fdTrBy576TT0SrNsT1JMjnzfPtlLiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WuC5Uzt5;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4D606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WuC5Uzt5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795621129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZuLZqjytfrvG9VX0UeNTdq821Wj84uFOAI7JJsAe0Q=;
	b=WuC5Uzt5IkstS2AKojr6u/vR1xckWDqkeGJ69ckWMNyyulLB+fHmAYRl3PUkNlhBC2nV/o
	kvnfRWj2p6sE5dZmQdXx37pDefCWh+yioVbC6k/34kpXeT2tfUwBMVEaiekaePjtyJQBqw
	s8KXtP6g5p4Hm/m/8KT7QcTyHiVk/A4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-yOYWNvONOle1A_1BIFOwDQ-1; Wed,
 25 Nov 2026 15:38:44 +0000
X-MC-Unique: yOYWNvONOle1A_1BIFOwDQ-1
X-Mimecast-MFC-AGG-ID: yOYWNvONOle1A_1BIFOwDQ_1795621122
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBEAB1800640;
	Wed, 25 Nov 2026 15:38:41 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3AD24436;
	Wed, 25 Nov 2026 15:38:38 +0000 (UTC)
Message-ID: <e92ecbb8-3815-4816-99c6-e0ae62916e31@redhat.com>
Date: Wed, 25 Nov 2026 16:38:36 +0100
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
Subject: Re: [PATCH net] dpll: zl3073x: do not block DPLL callbacks while PTP
 ops wait
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, min.li@microchip.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, richardcochran@gmail.com,
 poros@redhat.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
References: <20261120171800.327855-1-ivecera@redhat.com>
 <179554330175.3135.16771863750850493127@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <179554330175.3135.16771863750850493127@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/24/26 19:01, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Concurrent mode change can leave a phase step half-applied
>    across synth groups.
> - [Low] zl3073x_dpll_ptp_adjphase() in drivers/dpll/zl3073x/dpll.c no
>    longer checks the TIE-capable mode before touching hardware.
> - [Low] The kernel-doc for struct zl3073x_dpll in
>    drivers/dpll/zl3073x/dpll.h says PTP clock operations take @ptp_lock…
> 
> --
> 
> dpll: zl3073x: do not block DPLL callbacks while PTP ops wait
> 
> This patch adds a per-channel ptp_lock to serialize the zl3073x PTP clock
> operations. The channel lock is now taken only to read the channel mode and
> the output pins, and to issue a TIE write or a phase step. The waits for a
> previous TIE write or phase step now run outside the channel lock, and the
> mode is checked again under that lock before the hardware operation is
> issued.
> 
>> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
>> index 1cdadb8e46fb2..0b605945ee618 100644
>> --- a/drivers/dpll/zl3073x/dpll.c
>> +++ b/drivers/dpll/zl3073x/dpll.c
> 
> [ ... ]
> 
>> +static int zl3073x_dpll_ptp_phase_step(struct zl3073x_dpll *zldpll,
>> +				       u16 out_mask, s32 step_cycles,
>> +				       bool tod_step)
>> +{
>> +	struct zl3073x_dev *zldev = zldpll->dev;
>> +	const struct zl3073x_chan *chan;
>> +	int rc;
>> +
>> +	rc = zl3073x_chan_phase_step_ready_wait(zldev);
>> +	if (rc)
>> +		return rc;
>> +
>> +	mutex_lock(&zldpll->lock);
>> +	chan = zl3073x_chan_state_get(zldev, zldpll->id);
>> +	if (zl3073x_chan_mode_is_nco(chan))
>> +		rc = zl3073x_chan_phase_step(zldev, zldpll->id, out_mask,
>> +					     step_cycles, tod_step);
>> +	else
>> +		rc = -EOPNOTSUPP;
>> +	mutex_unlock(&zldpll->lock);
>> +
>> +	return rc;
>> +}
> 
> [ ... ]
> 
>> @@ -2560,33 +2607,74 @@ static int zl3073x_dpll_ptp_adjtime_phase_step(struct zl3073x_dpll *zldpll,
>>   		/* Safe for s32: max synth freq is 750 MHz */
>>   		step_cycles = div_s64(delta * synth_freq, NSEC_PER_SEC);
>>   
>> -		rc = zl3073x_chan_phase_step(zldev, zldpll->id,
>> -					     synth_mask[i], step_cycles,
>> -					     !tod_stepped);
>> +		rc = zl3073x_dpll_ptp_phase_step(zldpll, synth_mask[i],
>> +						 step_cycles, !tod_stepped);
>>   		if (rc) {
>>   			if (tod_stepped) {
>>   				dev_warn(zldev->dev,
>>   					 "Partial phase step failure\n");
>> -				return 0;
>> +				rc = 0;
>>   			}
>> -			return rc;
>> +			goto unlock;
>>   		}
>>   		tod_stepped = true;
>>   	}
> 
> [Severity: Medium]
> Can a concurrent mode change leave the phase step applied to only some of
> the synth groups?

Right. I reproduced it on a board with stepped outputs of DPLL0 on two
synthesizers. Disconnecting the NCO pin while adjtime() waits between
the two phase steps logs "Partial phase step failure", and the outputs
of the second synthesizer are left unstepped.

In v2 only the phase step that also steps the ToD requires NCO mode,
the datasheet expects the ToD step bit to be set only there. The steps
for the other synthesizers move only the outputs and are issued in any
mode, so all outputs get the same step.

> [ ... ]
> 
>> @@ -2747,20 +2845,13 @@ static int zl3073x_dpll_ptp_adjphase(struct ptp_clock_info *info, s32 delta)
>>   {
>>   	struct zl3073x_dpll *zldpll = container_of(info, struct zl3073x_dpll,
>>   						   ptp_info);
>> -	struct zl3073x_dev *zldev = zldpll->dev;
>> -	const struct zl3073x_chan *chan;
>>   
>>   	if (!delta)
>>   		return 0;
>>   
>> -	guard(mutex)(&zldpll->lock);
>> -
>> -	chan = zl3073x_chan_state_get(zldev, zldpll->id);
>> -
>> -	if (!zl3073x_chan_mode_supports_tie(chan))
>> -		return -EOPNOTSUPP;
>> +	guard(mutex)(&zldpll->ptp_lock);
>>   
>> -	return zl3073x_chan_tie_write(zldev, zldpll->id, delta);
>> +	return zl3073x_dpll_ptp_tie_write(zldpll, delta);
>>   }
> 
> [Severity: Low]
> Is it intended that adjphase now accesses the hardware before it reports
> -EOPNOTSUPP for a mode that does not support TIE?

Right, v2 checks the mode before it waits for the device, as adjtime()
does.

> [ ... ]
> 
>> diff --git a/drivers/dpll/zl3073x/dpll.h b/drivers/dpll/zl3073x/dpll.h
>> index 993221dc63249..eda37239ef1e3 100644
>> --- a/drivers/dpll/zl3073x/dpll.h
>> +++ b/drivers/dpll/zl3073x/dpll.h
>> @@ -19,10 +19,12 @@
>>    * @ops: DPLL device operations for this instance
>>    * @dpll_dev: pointer to registered DPLL device
>>    * @tracker: tracking object for the acquired reference
>> - * @lock: per-DPLL mutex serializing all operations
>> + * @lock: per-DPLL mutex serializing DPLL operations and channel state access
>>    * @type: DPLL type (PPS or EEC)
>>    * @lock_status: last saved DPLL lock status
>>    * @pins: list of pins
>> + * @ptp_lock: serializes PTP clock operations, taken before @lock, which they
>> + *	      hold only while they use the channel state
> 
> [Severity: Low]
> This isn't a bug, but the comment looks incomplete. The PTP ops also hold
> @lock for more than the channel state.
> zl3073x_dpll_ptp_adjtime_phase_step() holds it while it walks zldpll->pins
> and reads the output state through zl3073x_dev_out_is_stepped() and
> zl3073x_dev_out_synth_get():
> 
> 	mutex_lock(&zldpll->lock);
> 	list_for_each_entry(pin, &zldpll->pins, list) {
> 
> The commit message says the PTP ops need the channel lock "only for the
> channel mode and the list of output pins". Should the @ptp_lock comment
> mention the pins list too?

Will mention the pins list there in v2.

Thanks,
Ivan

---pw-bot: cr

