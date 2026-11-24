Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542132;
	b=t+LW1I4ZsBsgW8+bzFIYDRvBJFc3Y5MffwNIFjNyBsxHYBUFfFrhCAD2JhC+xjOb3y8P
	 nuRz8gPEqFWH+28NXKat6VHpXZlEOhlnG/mmp5/8cVqODq0BGvVC7K1FKuw2RZVm7eFSF
	 p1ADMg5ndFh7AsP9kNOZKo1ZRFCqVbaoLwwZwBMynsTmS20mat1riusbWPNVPpe6hWEP0
	 owSUJx7Mk1vyEq+qgBrzGhSTKVdaRTwAvL2Ze8qJMZho8YSHyA4S0X6YQDwpm242IOs53
	 HedTO7R9BaUMlUaVZkEyrJ48VcOh3wVA2eWw28C7R5QPetYiZe1v/d+4D6VAn1HLEiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s/lcQA/s9xHO7cX/SO8wHmLzwp+w6vb11tKVHN0S3os=;
	b=upNtC6K4fUgt391EYGvqzvC5kHCw+8exz6lzPSVIuPuZDACpJ5sAIM+ygbykyIQ3+7/Y
	 SW96ngjZQfN8r7jzzTrgcn5k8Y2b2maSnaFnzEMuejOb6ega6v51yFeZvQ1HHdU8yYntI
	 yD9UzWQyKNcKsLYO+rusuWJsjAXC7ddwYjL0pV9egTwnZ5YrfuNVnNkM4gF0SpNQwDreD
	 o24DVD0d+LrzV5YY/2kQRq5L7HhJC1pJkQtd9XcEZvYbwIZb50tWL4UGu5W5Lz0Z8TuWW
	 Gkl6aYhJMZKVeqDhlM1fp3ZdwDzGPk8r+UViOHDezOX9JqxfOb7GEsJ8mTJTRWpVzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uKhFLbF/";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA96606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA96606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uKhFLbF/
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38431138772so6200896eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795542131; x=1796146931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/lcQA/s9xHO7cX/SO8wHmLzwp+w6vb11tKVHN0S3os=;
        b=uKhFLbF/79pe20rqz6mUEvaVUGruQP8CL7mbCospCk0hnLdPQEaL5/d4fQ2hteXc90
         h+dQCWkrFAvaVjIaJ3ZvE56N2E2SywubTkrKmuw6oii450B8SBS1bL6IuiHrItc1fpZv
         iN4xrqUk+0BseqFnkLG+jKkKeODXaqd3zhGJiwyLrSyDe1fNRqA6G8scppBltg2Ca6tH
         2Wvk2FqbVnmtoL0DE1AihNFuIgJdK/bmysqdgcfphx7h38rVFYTg7/gUWAdBhGp4pswI
         JVxAF8ARrHhiNhaeiP5M9hFh1CEf0WQp4B+BzxQh7XgFSbQzEhflq5mNnEtxLZe+CM7T
         N+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542131; x=1796146931;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/lcQA/s9xHO7cX/SO8wHmLzwp+w6vb11tKVHN0S3os=;
        b=kcUHfjo71CT0SfqmtXNnK8UiGMmKpOZL0i93hunwF9yWlhWUnt4a1afqPGUr9Gn7fi
         vwR46Ed7mlv3o6V6u4aL6B0z64CPunX5G0DeUfOgwXybEW5yIhgjXv28kvM7G+IuBbMo
         rZLW7uUOzvoHLByWQJtdFs6k8aHrdTrvumhiq/hd5dGSfN8meetdKazhLxXaE6p3CTIN
         aQVEzrtgPMEubx29LjJzww8PHuUBzL6mN1RsMVqq7HZg6njhRYU9TJxNDiZOkLtK1MTu
         +qiOzVhhmoARknPkP46jYTBOPr+V4UW+UhZMm9yzRF21ZY5qUI93jaUB5CXYPIwf4Fzn
         Uyiw==
X-Forwarded-Encrypted: i=1; AL+hErG/S3tlJmRYcuV5fdAbodhG65w3rnUQlPH7EM0hZ3XVY/00QpAUXNSl/4JvzTVbAgrfGUVCrCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xxUtfzITWI+w3OsRmlXhwmoUP5o+PaI1axOBE3eq8sOnGQe9n
	yIFwdqZFY5zKdkhaDcclVwfaO4CYsQ9SqdnCDUHpdZxY+TpwXIoPuvww
X-Gm-Gg: AZFdTZcVcIZzCrxs3FSklVDYEydROqXNT++5B9VdUmvspLIN/FJ6c7fagU3Zu9YedRx
	rx3qdP6TAZibakw8S33QwPlmrTgrivuxd/tfloQnAwYsgTimVyMPskyRRg6lpVK/0xu3BEqBBnd
	FmX4Y7lS4NUFBMiDjaOgdVGb7GjTe8JIUM4jKGLZegwslz5qKoEMx8h07KIfvZcy5bduu9oYuK6
	DZm1Shxnu3ovjQ6pM+66CpKCljsxxrMlTiQUEOIYv2TugfWr7w7twhHhM4J0sH+IAPk/CVvsu34
	vo6L0DscJJLKseVAn9wsO0uDD/jsgRolNVoGl7cosnhnWa5bT/ghZu8RHVml1HqiedUkwnyE1dq
	3HxmkLxv6VlLgiGg/WisThhS9q5VlgM1+pVJsYuHs3ro4xreGYyyCGa/qDf7MzzL5evDbNakOOW
	1NBUMEm/xADcQ1ssz9T0sE6aJikoo3vOJ8F7ueb9QXtRzD6UISXf0RoEfXBpvXEMPMVIQChkWqN
	OUl0dY7dzSgn2dEzzLirCsNybXt1+3SEVQSnaWnMXZbgtN8uR+t3LDJ7/HqwlicKny/XoHK18GE
	Q/ztCpPKoyHl6Xtz6P1bhWuGzORO3AG35jzhjQXFEAaApNB3nXFUIBW4LXSJOww5RzWdJZrOY8+
	BbvigLwWDOpLyKX0T
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr12212592eec.17.1795542131349;
        Tue, 24 Nov 2026 09:42:11 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::4:a974])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm17577013eec.27.2026.11.24.09.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:42:10 -0800 (PST)
Message-ID: <8e5ec49c-2610-415e-bd92-c0be9727243c@gmail.com>
Date: Tue, 24 Nov 2026 09:42:09 -0800
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
Subject: Re: [PATCH net 1/4] eth: fbnic: restart queues in place when
 fbnic_queue_stop() fails
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, willemb@google.com, horms@kernel.org, bjorn@kernel.org,
 bobbyeshleman@meta.com, almasrymina@google.com, daskald@meta.com,
 netdev@vger.kernel.org
References: <20261121033215.1020506-2-dimitri.daskalakis1@gmail.com>
 <179552362260.3135.14543564146944003534@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179552362260.3135.14543564146944003534@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/24/26 4:33 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] fbnic_queue_stop()'s new error path relies on a hardware
>   guarantee that is never written down or checked.
> 
> --
> 
> eth: fbnic: restart queues in place when fbnic_queue_stop() fails
> 
> When the idle wait in fbnic_queue_stop() times out, this patch no longer
> runs fbnic_nv_enable() and fbnic_nv_fill() on the error path. A new
> helper, fbnic_nv_reenable(), sets the ring enable bits back without
> resetting anything, so the hardware and the driver's ring state resume
> in place. The fbnic_nv_enable()/fbnic_nv_fill() calls move from
> __fbnic_nv_restart() into fbnic_queue_start().
> 
>> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> index 381831b7e1080..c0fe89425430d 100644
>> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> @@ -2326,6 +2326,50 @@ fbnic_nv_disable(struct fbnic_net *fbn, struct fbnic_napi_vector *nv)
> 
> [ ... ]
> 
>> +static void
>> +fbnic_nv_reenable(struct fbnic_net *fbn, struct fbnic_napi_vector *nv)
>> +{
>> +	int j, t;
>> +
>> +	for (t = 0; t < nv->txt_count; t++) {
>> +		struct fbnic_q_triad *qt = &nv->qt[t];
>> +
>> +		if (qt->cmpl.size_mask) {
>> +			fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_TIM_MASK, 0);
>> +			fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_TCQ_CTL,
>> +					FBNIC_QUEUE_TCQ_CTL_ENABLE);
>> +		}
>> +		fbnic_reenable_twq(&qt->sub1, FBNIC_QUEUE_TWQ1_CTL);
>> +		fbnic_reenable_twq(&qt->sub0, FBNIC_QUEUE_TWQ0_CTL);
>> +	}
>> +
>> +	for (j = 0; j < nv->rxt_count; j++, t++) {
>> +		struct fbnic_q_triad *qt = &nv->qt[t];
>> +		u32 bdq_ctl;
>> +
>> +		fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_RIM_MASK, 0);
>> +		fbnic_ring_wr32(&qt->cmpl, FBNIC_QUEUE_RCQ_CTL,
>> +				FBNIC_QUEUE_RCQ_CTL_ENABLE);
> 
> [Severity: Medium]
> Does this in-place resume rely on hardware behavior that is not
> documented or checked anywhere?
> 
> The driver keeps all of its ring state across the disable/enable toggle.
> That includes head/tail, the TCQ deferred_head, the TWQ0 deferred_meta,
> and the partly built Rx frame in qt->cmpl.pkt.
> 
> For that state to stay correct, two things have to be true:
> 
>   - The device keeps its internal ring pointers and frame-assembly state
>     when ENABLE goes 1->0->1 with no RESET.
>   - Completion writes that were in flight when the CQ was disabled are
>     held back or finished, not dropped.
> 
> Nothing on the disable side seems to ensure the second point.
> __fbnic_nv_disable() turns off the CQs in the same burst as the
> WQs/BDQs, without waiting for the upstream queue to drain:
> 
> fbnic_disable_tcq():
> 	fbnic_ring_wr32(txr, FBNIC_QUEUE_TCQ_CTL, 0);
> 
> fbnic_disable_rcq():
> 	fbnic_ring_wr32(rxr, FBNIC_QUEUE_RCQ_CTL, 0);
> 
> Also, err_restart in fbnic_queue_stop() is only reached when an idle bit
> did not assert before fbnic_wait_queue_idle() timed out. That is when
> the device is most likely in the middle of a descriptor or a frame.
> 
> On Rx, fbnic_clean_rcq() picks up from pkt = rcq->pkt. Suppose the RDE
> had written the HDR_AL/PAY_AL completions for a frame, but its META
> completion was lost while the RCQ was disabled. Would the next frame's
> PAY_AL frags then be appended to the stale pkt?
> 
> The next frame's HDR_AL would also hit this check in fbnic_pkt_prepare():
> 
> 	WARN_ON_ONCE(pkt->buff.data_hard_start);
> 
> pkt would then be overwritten, leaking the old page references.
> 
> On Tx, the cumulative head in the TCDs makes this partly self-healing.
> Even so, could the Tx buffers, DMA mappings and BQL bytes stay stuck
> until another completion arrives?
> 
> The commit message says the HW "resumes from where it stopped". However,
> fbnic_csr.h only defines RESET and ENABLE for these CTL registers.
> 
> The injected tests cover "HW is idled, but waiting for queues to idle
> fails" and "HW never stops (rings left enabled, and wait skipped)".
> Neither covers a CQ that was disabled while a completion was actually in
> flight.
> 
> Could this behavior be confirmed against the hardware documentation and
> described in a comment? If that is not possible, other options would be
> to disable the CQs only after the WQs/BDQs have gone idle, or to drop
> the partial qt->cmpl.pkt state before resuming.
> 
> The later patches in this series ("net: add netif_disable_subqueue()",
> "eth: fbnic: wait for in-flight xmit in fbnic_queue_stop()" and "eth:
> fbnic: wait for both TWQs of a Tx queue to go idle") do not seem to
> change fbnic_nv_reenable() or the disable ordering.
> 

The device keeps its ring state when we disable the ring. Only a reset
clears the device state. The device will finish inflight completions,
and when the driver restarts the queue we fire the interrupt which
schedules the napi, so Rx/Tx does not get stuck waiting for a
new completion.

If for some reason the device truncates an Rx packet, then it will report
an error via a metadata descriptor. The driver will purge the pkt data
accordingly and move on.

I don't think it's worth a re-spin to document this behavior.

