Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110981;
	b=RwHqpd77cIa1FpDl0IVzR84XqSXlTinUdc9nSJvoYrIoilzaZY7V5tqluC5cEHFtW3Yj
	 n2m9KOz2YAEq9qizE0t0fhKiz525rCUDOVCeqFgKTCwveRnG7xjyHCVw49mqFdFn3oc9v
	 gaBVMl+JoRyL0Nxu0WS98/au7VGdFNIfCTPMDPmHigzAzyxQ1qLRPDWvQf9d/0QWzdPof
	 XenglD29sMlEcjx72ic+q1n0sM1Vc4vaaT/INWQ1w6KdgJKDWey1T0K4Hi3dP+FCxZYET
	 cnIo0wjA0D0WE/8cKGXzzPRJUyK1aZ91Y+hhoGMpkSifnqlI8piOpyspIx11NlMBKZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1zvf1Vt6Wlu8Jafv7/Nxh5FyeaGX2OkkjqPuvdXfMmk=;
	b=plevL+5ozpvJvqK0CumfGc26uGYR5JdNHsx3VjFYNI795D1DrJyF1/WyILSIPNE+eeoy
	 gZi921PWML+HtKdOmcT7TT7FGzUIpc5oV+TqfQqYFun7s2Mahcuby8lZSbb9FPcHAQaml
	 vud+lgIiQ8yFhDsvGP0FgShDUqnW2z7cGVSiTTBreNBC3061uqdM6Gjp3YPq/UefaxcE/
	 nDrH1aiPBRPAvxP5O86CRvjXYjU2S6xpxxxvf9aKHZwpN31BCa5FGU/gCLQoZOXGnOqZz
	 XB/T33YSGTtx7kg+KbRIs4q0aX27VojeEBkSMXt+Wo1FYS6FVqEph2Qkvc99PQmsoBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ee9AK2C+;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9531606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9531606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ee9AK2C+
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3acec6677so3642993c88.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110980; x=1795715780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zvf1Vt6Wlu8Jafv7/Nxh5FyeaGX2OkkjqPuvdXfMmk=;
        b=Ee9AK2C+S3qeJOi6maQz+7AlWazVG+ohhMcXX9mAY6d8njr+vRKJUaxKWZiijoAX6s
         N/AaSlo0a9nSNaB2IaD5fbR7YymAv+sgEfgMqgYviN4llAYi4w+DsGjv3WkCfjXVlQEB
         7Qp1Ua8EhPp8GYHByv9OTUetHNas4MbBGXPj9f5ERkuLvPfAG1DHt2t1rPKLz+ChkoDS
         rvxPNZ6QT1lKDA2O0cLI/7BNB8otlMPK1FLnBuHX3L6AhoRXwuL2JupNKbhTZ5z7Omh8
         gjpGP8fJIdD8p83ByCnvro+uOT7Udzm7f9NjOFBV4xIBA2zr55CPjhMRTQb5sEyzvW+5
         exww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110980; x=1795715780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zvf1Vt6Wlu8Jafv7/Nxh5FyeaGX2OkkjqPuvdXfMmk=;
        b=P52Zc0H9tXsN4s5AVh/CF8JBe//In5AKzPVKBJOIxCm+d/gDEJw29uUZAReRay0NmU
         +hLsGwki03TduwvjckkPrAgl2Fz9HHi8deAiBTPH9JU5LWcq0ZO8pC4Z994RGD8GxqgK
         ZK7bLBQw3pwges9RKCFibXeEpZolddtcvR2QJACUW/Ac+ytqjyEKPlIOp5m8C5spsdb4
         x/zPTt2AKzV/Z9rSTQ2kjaXwo9pffX2u5rVWoXWyXeFvHzQ33izMqAqsLlWzyORL8P4p
         5Cis9N+bRADP7iclJbM7UuEskghiJ3Kq5NlrHOGJAFSZyiuKUG7EqXnCnfBCLHsdLXb6
         RAcg==
X-Forwarded-Encrypted: i=1; AL+hErG8pquhZhjdojZKjrf0l72pYhh2Lmmu8MNbnPd0wLo/nNocVmI9F2qw+bsYHf6bXMJDb6yGr5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J5KcsjtjJdsM8DySDBDs47q+GzvL6p+GuUzapGWAeDXaOPVPw
	KqJAjVQSHmV7OK191iwEFmg2Gd7mMFdv2FDDJ6qJsQ/mgrqYvUVvfYja
X-Gm-Gg: AYBFou2ee8BLYa1qmgj78Qv/gG+CPiZefbw95nUkdkUth7V89jMpI/UQQu7NfreYq0o
	SZ9AMYhvIWFV7C1M6PekgDM/u5f0Dp+XxK25+c68jAZeu6+Xuit+PVJ0eTytc25pvWua1w8mSUK
	CpcjCh+jgJ8Aa8J0AhKawubgu3Z4mbkzh4Rstd8ipnIGfOkGugjEBaLspxwCEmp44IKEUyA8gLi
	WhDAKhuLu6e+EhbeMd/+8BmA76kTaKFCg6NJ7z9a1woRnmUGpXlb0RDSrfmO7WIZyXkSe9wXc2l
	VLadndnKnCx2yBLsVZN6XkWXuQLnBi9epzNz9o7zMo1TIyIyPHZeU7ui32E0DLbfMnovUod0+Dn
	1mL4XzcRL7M+jF5yqZueYqeQwVAS6JL8zrtcM4qOhoasyKLmn4PkXmUAxKz1CM5cI3uHENODenD
	eAmQMBafnG7MHC2UBdGv3/dusIGUVYhz5tGkh4bh1ngqMms3sFuO4hdmt/VlwUf/q3x2MNuB57M
	S8VpVrHDE4T6IT9jNtHOyH0nzup/sniku/bTY8+6kmgNWHXBz4J//HDjhFtCRIzBcyszn3hKP/K
	1YGsv0qb8ABY1ipx3zgWOFYSaDujC8y3im/bBQMgAnPl0ZFiVberg3ZTPzRKjJR0MfM5PizR9nr
	SUzLQUj/QrXegVAv3
X-Received: by 2002:a05:7022:b909:b0:1b4:f3af:355e with SMTP id a92af1059eb24-1b5568a660emr304415c88.13.1795110979829;
        Thu, 19 Nov 2026 09:56:19 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::7:3ffc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm670954c88.7.2026.11.19.09.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:56:19 -0800 (PST)
Message-ID: <e2f61cf2-f5d1-4509-aad8-ef7db1dde81c@gmail.com>
Date: Thu, 19 Nov 2026 09:56:17 -0800
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
Subject: Re: [PATCH net v2 1/5] eth: fbnic: wait on the correct queues in
 fbnic_queue_stop()
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org,
 almasrymina@google.com, vadim.fedorenko@linux.dev, daskald@meta.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
 <179508206173.3136.15402623456535892800@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179508206173.3136.15402623456535892800@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/19/26 1:54 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] After this patch, fbnic_queue_stop() passes
>   nv->qt[t].cmpl.q_idx to fbnic_wait_queue_idle().
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but
>   fbnic_queue_stop() stops the vector's netdev Tx queues with a bare…
> 
> --
> 
> eth: fbnic: wait on the correct queues in fbnic_queue_stop()
> 
> This patch sets q_idx on Tx completion rings. fbnic_queue_stop() now
> passes cmpl.q_idx to fbnic_wait_queue_idle(), so Rx queues no longer
> wait on queue 0. It also skips stop and wake of Tx rings that are
> marked FBNIC_RING_F_DISABLED.
> 
>> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> index 07d4b2e923627..5efed21e59329 100644
>> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> 
> [ ... ]
> 
>> @@ -3089,13 +3092,16 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
>>  	napi_disable_locked(&nv->napi);
>>  	fbnic_nv_irq_disable(nv);
>>  
>> -	for (i = 0; i < nv->txt_count; i++)
>> +	for (i = 0; i < nv->txt_count; i++) {
>> +		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
>> +			continue;
>>  		netif_stop_subqueue(dev, nv->qt[i].sub0.q_idx);
>> +	}
>>  	fbnic_nv_disable(fbn, nv);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does anything here wait
> for an fbnic_xmit_frame() call that is already running on another CPU?
> 
> netif_stop_subqueue() only sets __QUEUE_STATE_DRV_XOFF. Nothing calls
> __netif_tx_lock() or synchronize_net() before fbnic_nv_disable(),
> fbnic_wait_queue_idle() and fbnic_nv_flush() run. Only the full-down
> path in fbnic_pci.c uses netif_tx_disable().
> 
> A sender may pass the netif_xmit_frozen_or_stopped() check before the
> bit is set. It can then still be inside fbnic_tx_map(), writing
> tx_buf[], ring->tail and the BQL state, and ringing the doorbell.
> 
> Suppose it sets ring->tail after fbnic_nv_flush() has run:
> 
> fbnic_nv_flush()
>     fbnic_clean_twq0(nv, 0, &qt->sub0, true, qt->sub0.tail);
>     ...
>     netdev_tx_reset_queue(tx_queue);
> 
> Is the skb and its DMA mapping then leaked once __fbnic_nv_restart()
> re-enables the ring and fbnic_enable_twq0() resets head/tail to 0? BQL
> would also keep in-flight bytes that never complete, and that can
> stall the Tx queue.
> 
> Now suppose the sender is delayed until after fbnic_enable_twq0() has
> done this:
> 
> 	twq->tail = 0;
> 	twq->head = 0;
> 
> It would then write a stale ring->tail and ring the doorbell, and the
> hardware would fetch old descriptors whose buffers are already
> unmapped. Could those completions make fbnic_clean_twq0() read a NULL
> ring->tx_buf[] entry and dereference FBNIC_XMIT_CB(skb)->desc_count on
> it?
> 
> To hit this, a queue restart (netdev bind-rx devmem, io_uring zcrx) has
> to run on an Rx queue whose NAPI vector also serves a combined Tx queue,
> while another CPU is sending on that Tx queue.
> 
>>  
>>  	for (t = 0; t < nv->txt_count + nv->rxt_count; t++) {
>>  		err = fbnic_wait_queue_idle(fbn, t >= nv->txt_count,
>> -					    nv->qt[t].sub0.q_idx);
>> +					    nv->qt[t].cmpl.q_idx);
> 

This finding looks legit. I'd prefer to submit a fix for this separately,
and I can try to repro on HW in the meantime.

> [Severity: Medium]
> On an Rx-only vector the Tx triad has sub0 disabled and carries only the
> XDP TWQ1 ring, so this call becomes fbnic_wait_queue_idle(fbn, false,
> txq_idx). Does fbnic_wait_queue_idle() actually cover TWQ1 of that
> queue?
> 
> It builds a single bit from the queue index and tests that bit in all
> four Tx idle arrays:
> 
> fbnic_wait_queue_idle() {
>     ...
> 	off = idx / 32;
> 	mask = BIT(idx % 32);
>     ...
> }
> 
> The TWQ, TQS and TDE idle arrays are twice as wide as the TCQ one:
> 
> #define FBNIC_QM_TWQ_IDLE_CNT			8
> #define FBNIC_QM_TCQ_IDLE_CNT			4
> #define FBNIC_QM_TQS_IDLE_CNT			8
> #define FBNIC_QM_TDE_IDLE_CNT			8
> 
> There are 128 queues with two work queues each (TWQ0 and TWQ1), so this
> looks like one bit per TWQ. fbnic_wait_all_queues_idle() reads all 8
> registers, but fbnic_wait_queue_idle() only reads registers 0 to 3.
> 
> If bit idx maps to TWQ0, it is always idle here, because TWQ0 is
> FBNIC_RING_F_DISABLED on this triad. The TWQ1 ring that carries XDP_TX
> traffic would then never be polled.
> 
> Next, fbnic_queue_stop() calls fbnic_nv_flush(), which runs
> fbnic_clean_twq1() and unmaps the XDP buffers. Could the hardware still
> be fetching TWQ1 descriptors at that point?
> 
> The bit layout isn't documented in-tree, so the answer depends on the
> hardware. The commit message gives "fbnic_wait_queue_idle(tx, 39)" as
> the wait on the vector's XDP Tx queue. Is that wait enough to cover
> TWQ1?
> 
>>  		if (err)
>>  			goto err_restart;
>>  	}
> 

This also looks legit, and I can submit a fix in a subsequent series.

