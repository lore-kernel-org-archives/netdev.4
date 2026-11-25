Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639948;
	b=MHL686msQgEn0r+4dzL//MwbfPR1ggHozsg/XHIIUoOWzpAy9fBsSDV6NZGKzqRV5JtJ
	 bUZwMXRnJq2yFbRSifmY7xSS86mO7kLBvGwhlCHdYG9yR6SNpcpQScKz3P4Od4zGd/t1u
	 kF89Tyn0emoqba6ufc6dpzASVzJWsssByOTQIU+aZlDJFFT3KUZAY+ZhVUoYDdrdCH8dT
	 epCQ7WJHr1IBWxqx78v+Zr+CGH9eSWTtot1z+8+Fkq6F3oYH35Lfbe4vSWfU+O+R7ZC5O
	 EX8+SP2Hkzb7P3txqRm2zc1kwwAkSTF44TDMHPshUUNJdXeYI10OqzKGD7Oyc5nh95w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639948;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=SllRgyq7wiAXP35EjVVmEDLceHJ1/9Hx1EXp/YDsNQs=;
	b=VNSVF/oElHccRvP9suVxDK2Tt5CS/9LzyhdSpma2mbbNr+JoJiZ2o3pcCK6TRFOFEdjt
	 Q3F0JU6Bl/2btaSqeJtaQsOQQ3psGGUcVk08g81Mx+0SRHBV28J71Sklst7c6BxNhkN3X
	 paEJWckq/TKbqEvm1yqE46USm2kn053dcuGFJT2gdhmj8Vg2LAI3kPADzZfQ2QAgWi2sk
	 fMlKsgOK3QWUhJaSBsErwBE9Ex2hD3v9R92dhu/ri44HFLAqLK8vCPQdIdBHtcSOpl/ou
	 kMAtDCtVzsB70je3BlLw+11QCy2pLzZToQ/yANVr2Byfyz+D3EmTBdjkipXe4lyJwcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=SQ9tfKJL;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B3606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=SQ9tfKJL
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 171681D873D9;
	Wed, 25 Nov 2026 21:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795639938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=SllRgyq7wiAXP35EjVVmEDLceHJ1/9Hx1EXp/YDsNQs=;
	b=SQ9tfKJLlOLTVq18Qli5LYIyx6MBUe19M7tDd8cQM6OUptx78LIZVR5wLwPDQtM0AKxjzj
	0LPcAoS9metNO9Mj7HUox0mgr2KbhKdcguChleWuQSZwY0ywL4tFmCh2ehY0JP0OwMIiPV
	g7IV2wMzzuQW/NJgmQpvO5WBhx3QlLjOR6Br9+quWNHjwI+UkGxRyU/1BuEO/sSGGrenj/
	JqxFXn9gr3NLQ3mDkLA2dF0uGmcwyZlUYLYy8qTt1KeEgwBtN8YjE85AJa2FCHG06b1nAm
	2Wv67xh4tuVRRPGC8l1jTWWoMERqLNgLT9dgYj+ftJHZ64GmtJxMV1pIeXTGrA==
Message-ID: <e5f9b9d5-2000-49b0-9f57-da433fd65193@yoxcu.de>
Date: Wed, 25 Nov 2026 21:52:10 +0100
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
Subject: Re: [PATCH net-next] net: ipa: report TX_SUSPEND wakeups to the PM
 core
To: Alex Elder <elder@ieee.org>, Alex Elder <elder@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
References: <20261120202930.345970-1-mick@yoxcu.de>
 <ca743abb-5ab4-4157-bb9a-b5ed97f1faa4@ieee.org>
From: Michael Auer <mick@yoxcu.de>
Content-Language: en-US
Autocrypt: addr=mick@yoxcu.de; keydata=
 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
 ShbHn51QMVl4y3nkTQ==
In-Reply-To: <ca743abb-5ab4-4157-bb9a-b5ed97f1faa4@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 11/25/26 6:03 PM, Alex Elder wrote:
 > On 11/20/26 2:29 PM, Michael Auer wrote:
 >> Since commit 4b2274d3811a ("net: ipa: don't bother aborting system
 >> resume") the IPA driver reports no wakeup event. [...]
 >
 > Did you bisect to determine this is where the problem started?
 > If so I suppose the wakeup event *did* get reported prior to that?

No, I did not bisect. I thought i found it by reading the code, and looking
again, my commit message is wrong.

Since 9ec9b2a30853 ("net: ipa: disable ipa interrupt during suspend")
ipa_suspend() disables the IRQ, and ipa_resume() clears
IPA_POWER_FLAG_SYSTEM before it enables the IRQ again. So for data
that arrives while the system is suspended, the handler runs after
the flag is cleared, and pm_wakeup_dev_event() was not called. As
far as I can tell, the only case left that saw the flag set was the
simulated TX_SUSPEND of the v3.5.1 aggregation workaround, from
inside ipa_suspend(). So 4b2274d3811a did not change what gets
reported for a real wakeup. I will fix the commit message.

 > I really don't think you're hitting this.  However the fact
 > that your hardware has special logic related to this makes
 > me want to have someone with a newer version of IPA confirm
 > this bug (no reported system wakeup event) occurs for them
 > as well, and also confirm that your fix makes that bug go away.

Agreed, the wakeups I see come from the real interrupt. My kernel
has no PM_SLEEP_DEBUG, so I traced the wake IRQ instead: LTE
wakeups show the IPA IRQ, and without the patch the IPA wakeup
source stays at 0. But v1 also counts TX_SUSPEND outside of a
system resume: after a runtime suspend, and the simulated one (the
sashiko review pointed this out). On one boot with v1 the wakeup
source counted 102 events for 83 wakeups by the IPA IRQ.

 > Do you think you can find anyone who could do this, and/or
 > help by explaining to someone how exactly to reproduce the
 > scenario?

I only have SDM845 phones. I will ask around for a device with a
newer IPA.


 > Are you distinguishing between system suspend and IPA runtime
 > suspend here?

No, v1 does not.

 > I do believe that the pm_wakeup_event() is meant to occur
 > only for system suspend, not "just" runtime suspend. [...]
 > So unless I'm mistaken, we'll need to add some
 > of this logic back again.

Agreed. But because of 9ec9b2a30853, a flag set in ipa_suspend() and
cleared in ipa_resume() is not enough, since the handler runs only
after ipa_resume(). I see two ways:

a) In ipa_resume(), before enabling the IRQ, check whether the IPA
    IRQ woke the system and report the event there. The PM core
    records the wake IRQ (pm_system_irq_wakeup()), but a driver
    cannot read it today.

b) Do it in the PM core instead: for a wake IRQ set with
    dev_pm_set_wake_irq(), report a wakeup event for the device when
    that IRQ woke the system, e.g. in dev_pm_disarm_wake_irq(). Then
    IPA needs no change, and other drivers that use
    dev_pm_set_wake_irq() would get the same. That would be a
    linux-pm patch.

I tried b) on my phone, with the IPA change dropped: a wake IRQ that
matches the recorded wakeup IRQ of a non-dedicated wake IRQ gets a
pm_wakeup_ws_event(). In the first hour, 3 of 26 resumes were woken
by the IPA IRQ, and the IPA wakeup source counted exactly 3. Nothing
was counted while the system was awake.

Would you be fine with b)? Then I would send that to linux-pm, with
you on Cc, and drop this patch.

 > I can help with implementing your fix if I am able to
 > reproduce the problem.

Thanks!

pw-bot: cr

Michael

On 11/25/26 18:03, Alex Elder wrote:
> On 11/20/26 2:29 PM, Michael Auer wrote:
>> Since commit 4b2274d3811a ("net: ipa: don't bother aborting system
>> resume") the IPA driver reports no wakeup event. The IPA interrupt
>> still wakes the system, but the wakeup source of the IPA device does
>> not count it, so only /sys/power/pm_wakeup_irq shows the cause.
>
> Did you bisect to determine this is where the problem started?
> If so I suppose the wakeup event *did* get reported prior to that?
>
> I ask because this was a specific scenario that I was never able
> to actually test.  I didn't find a way to cause data to arrive
> while my test device was suspended.
>
> A lot has changed since that commit.
>
>> User space that reads the wakeup sources cannot attribute a mobile
>> data wakeup. Plasma's powerdevil, for example, turns the display on
>> for every such wakeup.
>>
>> Report a wakeup event when handling the TX_SUSPEND interrupt. This is
>> pm_wakeup_event(), not a hard wakeup, so it does not abort a suspend
>> in progress unless user space uses /sys/power/wakeup_count.
>>
>> Found and tested on a OnePlus 6 (SDM845, IPA v3.5.1): a push message
>> over LTE wakes the phone from s2idle, and the IPA wakeup source now
>> counts it.
>>
>> Signed-off-by: Michael Auer <mick@yoxcu.de>
>
> I am still not able to test this.
>
> There is some special handling for the specific hardware
> you're working with, where a quirk on IPA v3.5.1 under
> certain circumstances (suspended while an aggregation
> frame is open) should generate an IPA SUSPEND interrupt,
> but it does not.  That case is treated as if that interrupt
> did fire.
>
> I really don't think you're hitting this.  However the fact
> that your hardware has special logic related to this makes
> me want to have someone with a newer version of IPA confirm
> this bug (no reported system wakeup event) occurs for them
> as well, and also confirm that your fix makes that bug go away.
>
> Do you think you can find anyone who could do this, and/or
> help by explaining to someone how exactly to reproduce the
> scenario?
>
>> ---
>> Tested on a OnePlus 6 with an sdm845-mainline 7.1-rc1 based kernel, in
>> daily use since late September. On net-next it was only build tested
>> (W=1, arm64 and x86_64 allmodconfig).
>>
>> The event is also counted when TX_SUSPEND fires after a runtime
>> suspend while the system is running. If that is not wanted, the call
>> could be limited to system resume. I kept the version I tested.
>
> Are you distinguishing between system suspend and IPA runtime
> suspend here?
>
> I do believe that the pm_wakeup_event() is meant to occur
> only for system suspend, not "just" runtime suspend.  The
> system normally does not need to be notified for runtime
> resume.
>
> Unfortunately, the flag that recorded whether we were
> suspended as a result of system suspend was removed (right
> after the commit that you say made wakeups no longer get
> reported).  So unless I'm mistaken, we'll need to add some
> of this logic back again.
>
> I can help with implementing your fix if I am able to
> reproduce the problem.
>
>                     -Alex
>
>
>> Tool use: the analysis, the code and the commit messages were
>> written with an LLM coding assistant (Claude Code). I reviewed all
>> of it and tested it on my phone as described above.
>>
>>   drivers/net/ipa/ipa_interrupt.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/net/ipa/ipa_interrupt.c 
>> b/drivers/net/ipa/ipa_interrupt.c
>> index 766b094eb069..547ed67930d6 100644
>> --- a/drivers/net/ipa/ipa_interrupt.c
>> +++ b/drivers/net/ipa/ipa_interrupt.c
>> @@ -92,6 +92,11 @@ static void ipa_interrupt_process(struct 
>> ipa_interrupt *interrupt, u32 irq_id)
>>           break;
>>         case IPA_IRQ_TX_SUSPEND:
>> +        /* Data arrived for a suspended endpoint. Report it as a
>> +         * wakeup event, so user space can see what woke the system.
>> +         */
>> +        pm_wakeup_event(ipa->dev, 0);
>> +
>>           /* Clearing the SUSPEND_TX interrupt also clears the
>>            * register that tells us which suspended endpoint(s)
>>            * caused the interrupt, so defer clearing until after
>>
>> base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
>
