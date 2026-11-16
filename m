Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865406;
	b=agkwISIgnkmeglbs6JZpB9xepqm58j9u9hq+4fxyLMyRtUTyPn0ZvpKxHRiwTAtQ83G4
	 /6GQ8e2avEmpP9pxloRB+IEoUVeimzWKnGo0AxxQMt5GsmA3Gbw1iwMnMgpmwR0JpFSb+
	 Q22z/7GlVIUHsCY3BSBoBxYa3HE+r9InOiQaM+M9DJ64YKo+j48YNg33YM+JyPt4dC0n1
	 35uA9KYpCrPLYc17S0gVhMHPh2NdcrM4/x+obgdl4JKpc6ZhkGFXQKZ00TyYWnj6rOpP1
	 4m/ErNlvSyEaZcZaawHHLB3y/R01S/0drQQVblT/c0YzrzH9V2dTNn9qlhFsPhmIqKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ZrcB0rgeeVB+3BFPCNaFCPdBkKpzWvhrG8Ntzjy0ltA=;
	b=KTphcJRyHvkrlELNndRK9ekexpithk17n0guiYQzhWmCRdGF4TnZFrBhEvoIRACTKU7+
	 NchPX3TQ5n4D4lGA2f3CQuS0N8g458CZAU1w/ULObIpEUSUx0YjybzC+nEGagulxjCFmW
	 ODV+RbLm0Yw/eEjXTCczQ6tZ47vikFFTjVQV797bW0GgQbWirf+AgXyFpUgokoPxVBd7B
	 J1LjlI/w9k2sFvbhN0hggYh9ZvF/zkbEV4PvZJ+cyf6oQG6kWar4/VXETEdGuKRSQfniy
	 yDbP+rFS6+r0Su2CctBUaEYc/JnM0suc6i1lj7YG7HIwrDzA8t7ksaeoAIOSB/Mj13w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGT83oNM;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91EE606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91EE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SGT83oNM
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so15188535e9.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794865404; x=1795470204; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrcB0rgeeVB+3BFPCNaFCPdBkKpzWvhrG8Ntzjy0ltA=;
        b=SGT83oNMPaSWmbN8kB43XYA2l7Gx0Zoh5XE8726L0a0uF4yORuIKc0fKmsDvtrrEY4
         oHOZ7evPFMxjaPYIvSfzAfNhyTS8Yurd6qO0bICNhVFOHiJuQTiEs+nIMU3HPg2acB0A
         h5hreRzE8OsJvQWYm5IBuW86mZDd3k1LAMazE+q3TDae0+/mlUI8dCu/++MLhswzMT+I
         JlHRUBT8LZveeEH4rFyfLzMm2bi7FWYkVMy7S0D2Z72ZijcvZfECfqhE3rO4jyPajzSe
         80XRXGtphkwjEaUbPgJkRktrVAHCAB8rAUb5VHCS/KxsNAxEzZKXuEGPlyf8OGVwZ/AL
         L1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865404; x=1795470204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZrcB0rgeeVB+3BFPCNaFCPdBkKpzWvhrG8Ntzjy0ltA=;
        b=1GnQY49CJfz1//qXBPL77Ge8FlaMZoL28VgK/oHvSVFHI3FCxpaTvDMTFmGl61Jy2q
         4I8nbZtR+OYsmlx0X6OE1lkQBXdnrJgG3SIYhemDRKKSjorRj8O3iBjeuHeNVAru/BwO
         9lRQo49ru/hq6mR4Rus8K3TDdAkr8tsOyzvpQn+0dVmP6moXh3NrX/MrCYj5ztEZt/o/
         d6Dfb1hkICYErgYT6txYmBkxO5f9n3CW1aOa4QyMQ+WEon6cyCs5B8C2KSFKYiKOddJf
         IUWdLHIZat+y25KcP67raT40gKxQ874JFsh4Bim0RM+q5MWx92uM8WwMzfSo0+XUJlhj
         ayRw==
X-Gm-Message-State: APuU4Z/O+dNqEw8qsAIhCrGSj2Jjd503IrdBRLPaqhhVo4B5o7d0Iczt
	owG11h7ug4x88o7ROKadVZDUYfXynaOIKNMN455e73PNZBHN+0nlPJOr
X-Gm-Gg: AYBFou3KxnxNgYFy7OHQRWmDQTG9U4fUdjwPZ1YZ/scP6vEDywXKTOVHcHSeSbFhZif
	so6nqP2ssaeViHJZIQZMzOF6Xz34Qn5Isw+EO5TJ9AOzhEY8Z6J3jBP3+7k9mpGLsoRiVjJuPi0
	D5/VRxPZ97gdLQf3L4xgxeyDIwylICm9vcosc2/qryOZzy9GOneV45vjB56k20TT/ajsPZuz5al
	xpInRH02rc8r1jPCBmulboTEghobPqrFuCwPp2uLq3dB9FxEdKrdDq6RXXREifmCn82f+fL5nwI
	Tajnm2DKYYkaodb6Ipiap6703TthqEvyKPJNgfK3FyqIxGO1TVrT3EpKRthUZNcAo84h6Zijv00
	MaF1QdguGDzkVQ/JwbiiYkre8jkHgGKKT8CNH2DBTAJz6SLaDpSO/xckfKlFkSO+S74QliJSym2
	Pi9pdox3dXVAf0WJ88BxKrKz0POLq//KXlFA2im8IznGFui5PukCku/T6XN0UMPdk7eMG9fcSw/
	+QMvOkvoqoStpTDrUn55QpHtj2lK3JmPGFlTT8Z4TzXeO5yM6Iz6S2ecwuGrAYHjpsmQpAdi6ed
	mSKT4hS4wprjPfX2dKCDXW1TNCqQEqfWjp92eA/HPMYRLnT6IA3nIS4isHi3kErk2dsNZ5RsEjo
	9KVdvM7CQ8HLqJFMf0gss0k6dRhiX+LdVWI0=
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr243466415e9.2.1794865403930;
        Mon, 16 Nov 2026 13:43:23 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm18136285e9.4.2026.11.16.13.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:43:23 -0800 (PST)
Date: Mon, 16 Nov 2026 23:43:22 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <vj5f2zj4fpqp7qaztfp3e5elec44pih3pjqsnkmyhv4js3vxid@naaggpvburqc>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <179479577764.3136.18033299607451586926@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179479577764.3136.18033299607451586926@kernel.org>

On 16 Nov 02:22, netdev-bot+sashiko@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential
>issue(s) to consider.
>
>Critical: 0 · High: 0 (2) · Medium: 1 · Low: 1
>
>If you believe none of the issues are legitimate, please reply to each
>issue of Medium severity or higher and explain why the AI is wrong.
>If any of them are legitimate and you plan to respin, please let patchwork
>know by including "pw-bot: cr" as a separate line at the end of your reply
>(one such reply per series is enough).
>
>- [Medium] The patch uses `budget_left > 0` in spl2sw_rx_poll() as the
>  only sign that all work is done.
>- [Low] The commit message says what changes but not what goes wrong
>  today.
>
>Pre-existing issues:
>- [High] This problem wasn't introduced by this patch, but
>  spl2sw_remove() frees the descriptor rings and buffers before it…
>- [High] This problem wasn't introduced by this patch, but
>  spl2sw_rx_poll() leaves a broken ring slot behind when it fails to…
>
>--
>
>net: ethernet: sunplus: check budget before calling napi_complete_done()
>
>This commit replaces napi_complete() with napi_complete_done() in the
>spl2sw RX and TX poll functions. NAPI is only completed when budget_left
>is greater than zero. The RX/TX interrupt is only unmasked when
>napi_complete_done() returns true.
>
>> Sunplus drivers currently do napi_complete() after each rx/tx poll is
>> done without checking whether budget was exhausted or not. Interrupts
>> are also unmasked before the call to napi_complete().
>
>[Severity: Low]
>Can the budget actually be exhausted here in normal operation?
>
>spl2sw_probe() registers both NAPI instances with netif_napi_add(), so
>they use NAPI_POLL_WEIGHT (64). spl2sw_rx_poll() handles at most
>rx_desc_num[0] + rx_desc_num[1] = 32 descriptors per call, because the
>inner loop is bounded by num < rx_count. spl2sw_tx_poll() holds tx_lock
>and reclaims at most TX_DESC_NUM = 16 descriptors.
>
>That means budget_left is always > 0 for polls from net_rx_action(). The
>new check only changes anything for budget 0 (netpoll's poll_one_napi())
>or a small busy-poll budget.
>
>In those cases the old napi_complete() already did nothing, because
>napi_complete_done() returns false right away when NAPIF_STATE_NPSVC or
>NAPIF_STATE_IN_BUSY_POLL is set. The only visible effect of the old code
>was that MAC_INT_RX/MAC_INT_TX got unmasked while netpoll or busy-poll
>owned the instance.

Netpoll can invoke napi->poll() with budget = 0. In that case,
napi_complete() already returns false because NAPI_STATE_NPSVC is set.
However, the old code ignores its return value and unconditionally
unmasks interrupts.

This patch avoids calling completion with a zero budget and moves
interrupt unmasking after napi_complete_done(), making it conditional
on successful completion, as documented.

>
>Could the commit message describe that actual impact, so the Fixes: tag
>and a stable backport can be judged?
>
>> I do not have the hardware necessary, this patch is not tested on real
>> hardware.
>
>This note is in the commit body rather than below the --- line, so it
>would end up in git history.

Shouldn't it? Documentation/process/maintainer-netdev.rst, under “Bug fixes”, 
requires describing how the fix was tested. I included the lack of hardware
testing in the commit message to make it explicit that it has not been
tested on hardware.

>
>> diff --git a/drivers/net/ethernet/sunplus/spl2sw_int.c b/drivers/net/ethernet/sunplus/spl2sw_int.c
>> index a37c9a4c281f0..1aada11429d4d 100644
>> --- a/drivers/net/ethernet/sunplus/spl2sw_int.c
>> +++ b/drivers/net/ethernet/sunplus/spl2sw_int.c
>> @@ -125,13 +125,14 @@ int spl2sw_rx_poll(struct napi_struct *napi, int budget)
>>  			h_desc = comm->rx_desc[queue] + rx_pos;
>>  	}
>>
>> -	spin_lock_irqsave(&comm->int_mask_lock, flags);
>> -	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
>> -	mask &= ~MAC_INT_RX;
>> -	writel(mask, comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
>> -	spin_unlock_irqrestore(&comm->int_mask_lock, flags);
>> +	if (budget_left > 0 && napi_complete_done(napi, budget - budget_left)) {
>
>[Severity: Medium]
>Is budget_left > 0 enough to show that all RX work is done? Normal polls
>never bring it to 0, but spl2sw_rx_poll() can still stop while completed
>descriptors are pending.
>
>The first case is the high-priority early break in the low-priority loop:
>
>			if (queue == 1 && !(h_desc->cmd1 & RXD_OWN))
>				break;
>
>queue 1 is the last queue (RX_DESC_QUEUE_NUM == 2), so this goes straight
>to the completion check while new high-priority packets are waiting.
>
>The second case is a queue's inner loop stopping at the ring limit:
>
>		for (num = 0; num < rx_count && budget_left; num++) {
>
>Descriptors given back with RXD_OWN earlier in the loop may already have
>been refilled by the hardware.
>
>In both cases the poll returns less than budget, calls
>napi_complete_done() and clears MAC_INT_RX in L2SW_SW_INT_MASK_0 while
>work is still pending. Documentation/networking/napi.rst says a poll with
>outstanding work should return exactly budget and not complete.
>
>The cost depends on whether L2SW_SW_INT_STATUS_0 latches RX events while
>masked. If it does, this costs an extra interrupt round-trip. If it
>doesn't, the pending packets wait for the next RX event.
>
>Would it work better to track these more-work conditions explicitly and
>return budget in those cases, instead of relying on budget_left alone?

Agreed. This seems to be a separate issue, the old version also did call
the napi_complete(), even if the work was not 'done'. To fix this, the
solution could be to iterate while budget_left > 0 and one of the queues
has packets to process, but this does seem like a big change that should
not be done by me as I can't test it properly.

>Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114222744.535158-1-janislacis06%40gmail.com
