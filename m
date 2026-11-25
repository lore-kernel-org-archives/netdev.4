Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626240;
	b=uzse1Z7D7GFLJ9DX2z78LeC/II3Tf5cF5QZpJtHyFZs6Mk0GUz09276nUl2EAFXnBCMy
	 K2mYUGk9DuYvPeoF1dZ4bDJCpzlhCS9WLwfYN2dXTNXzBIk302cXd6vT3lyAqPEvS6dyP
	 aG2qtijp06QvgIteaJiI6ShbbTICqpTgF2UrLyKhOgYk5w6velNdnrCJWVuCbv0yl7SZm
	 RyAsslVGhXHx1hebCds752LMoYR61OoEKbIq1NyyhI0xsHr9eTLFYe/+9OR+K8PLYPmFt
	 5qSdwwx4Yt5b3WVo4tyflrfSOCScRJAkt6Oyqf0tx8QvdN1IEJiwuN4HrkPdsZ/Dnhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HBeD8JVvNABlVHJdd1jgwf/A1df8y5iDUbNoPddh+Wg=;
	b=wDwgFeVGfefng3N0d3PZEHoVNWisTVu5//kgycea9A3UPVsmO8N/OIMQ3EqtJ0k5n2Vb
	 L8qe1C8RTkm6ej4YD8utjdM7lF564534OJbz78lsEBE+S6UmZ9f0bpt27kJLaX5SgMWiH
	 i5Yo3fCzqWvmUKzYIqKra4GwslcuZwr3QeIVsofOo8lLrTyXi7x2p1GBNJIA5d9Kqwged
	 GmNLbzs0BJ66MyWeTASXwG/FesFyTTUYixMDnXUW3XfvpevJKMrTwb4/SrjeWPp+xZK1W
	 FooK3sHKrlyEJ4LGq/gNTQUaI5pX3ufae+8oupoyj3C6yT7UMuvFE4bAh2RSbi1HVyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=eZgTF7xX;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541E606A684
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0541E606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=eZgTF7xX
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-862b3a39d0dso2971077a34.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1795626238; x=1796231038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBeD8JVvNABlVHJdd1jgwf/A1df8y5iDUbNoPddh+Wg=;
        b=eZgTF7xX4q/IeL6DLrAjPldP62eQLb+uKQpNB/NxRK9giyuns0UdDK7QydOs+KffBz
         8PaqyJCcmHH9E+XomKq8D+U7sp0/QGonf0fZ7LZbs+VbnSj8StnH8zW2ptCgNyUm9lwt
         2N0EPUSCrwzri3JxSvol90DyKK5QgDdc5G3GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626238; x=1796231038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBeD8JVvNABlVHJdd1jgwf/A1df8y5iDUbNoPddh+Wg=;
        b=DpBiZen4OY/gMZPeqPfSesmK5SIZrf5ZM2WMCWJ1ZV9G6+GDquZQtYaySLOH+ZFUaa
         4gEF/wBRkde91PluQ/f5Cz7mynuNHsEBMbg0mZCUctQvr94N76bmQscbhT0daoeBBOUm
         RRCyuD9QstHQywZIDE0VW7nJX/kl1naU9Mu1gDXpsZN3MXYCILWjpgd19xOuAM/1VZFC
         GKW646Kmekv1E8Xb0eiG4prisVZ6+78xVeTeZ6de6X0qycag1My6JEp9Mnyf55g8OrlG
         TCA03W6PEN28u+hdBPFsqL6ZWH0T4oh6MQeTDj3nqgWpC2ZsOMHQx8suDXF8qYMuvcjw
         YV8Q==
X-Forwarded-Encrypted: i=1; AL+hErE4N0Oylsawym4Xgxij5ClierUVm5CeTp4yo7As56I7238SU9ZpLO6cZ2touqn6vq6fEgL/ETA=@vger.kernel.org
X-Gm-Message-State: APuU4Z85UGiJUyNabs/EXJOpUyEeTppbB2yiP74ZjA07INeLCoKCJsff
	NXNLw/ZM3E9MYNd0oixxq96X3id7IHAOAUr35R4o6h7ocomEJ9Cgjvgt1LqylvNJvLmKlkmG3Fx
	gBor+9Q==
X-Gm-Gg: AZFdTZctTZIJzhB65cj6sbJLr8OLo3ghR9LqjEywYcs6o8OAWcZyalQalJZW6g55cMx
	Uk3yECIgBuRjVQLAdyZh5mQCof6lU4rJz9556vlrC/FSInBzjKS7OUuUWhUOONB1/KN57rLEEvD
	fx5WUq/ojETc0sdXpqbD+BXh0pFDSTgAvt0HtxMm7hdAcL+1dm+HVgphmZBCtN1DJZ4nV0CRmjQ
	+VehHPtKbw4SEjljpnhIfnDhU5Rs2JZyQuvNgC4zsnfJC/k3OGiYpdJ+jiPWxaZzTY1ke7T7Tc5
	vtSiyAxMeFmX8nIlUpIYvnpeYdkv44e5KcSUL92PsIOA9FwldXoqB7o2FcIcJ6WGdsB5XnY40Ev
	FmuEkYe/lWTzSgrJtJwUA22enEy6liSA8xRNf6+dTWs5QZp4UY/vkZAtQH1ihJxdn1vXQ59QqQD
	N5mabGtCoXkaR2f8X4nxKeEWRbthvOdQh6rMEucQH843CWNsGDeU3eRAQ8KfsKSa20WGdUG+hjy
	gA9L0sstnSCmeIMXxqzyPE6ql0WUj5+PBmXJA9rPyxoSXMhDY2qjXyRykNWd42ycD1rXCYN75Bz
	TCgB8RA7FQqXE+aAzDd5h1uq9SQ=
X-Received: by 2002:a05:6830:b14:b0:81e:a323:f3bc with SMTP id 46e09a7af769-86315963eaemr21347276a34.13.1795626237731;
        Wed, 25 Nov 2026 09:03:57 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-863168dcf38sm13129123a34.9.2026.11.25.09.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:03:56 -0800 (PST)
Message-ID: <ca743abb-5ab4-4157-bb9a-b5ed97f1faa4@ieee.org>
Date: Wed, 25 Nov 2026 11:03:55 -0600
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
To: Michael Auer <mick@yoxcu.de>, Alex Elder <elder@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
References: <20261120202930.345970-1-mick@yoxcu.de>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261120202930.345970-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 2:29 PM, Michael Auer wrote:
> Since commit 4b2274d3811a ("net: ipa: don't bother aborting system
> resume") the IPA driver reports no wakeup event. The IPA interrupt
> still wakes the system, but the wakeup source of the IPA device does
> not count it, so only /sys/power/pm_wakeup_irq shows the cause.

Did you bisect to determine this is where the problem started?
If so I suppose the wakeup event *did* get reported prior to that?

I ask because this was a specific scenario that I was never able
to actually test.  I didn't find a way to cause data to arrive
while my test device was suspended.

A lot has changed since that commit.

> User space that reads the wakeup sources cannot attribute a mobile
> data wakeup. Plasma's powerdevil, for example, turns the display on
> for every such wakeup.
> 
> Report a wakeup event when handling the TX_SUSPEND interrupt. This is
> pm_wakeup_event(), not a hard wakeup, so it does not abort a suspend
> in progress unless user space uses /sys/power/wakeup_count.
> 
> Found and tested on a OnePlus 6 (SDM845, IPA v3.5.1): a push message
> over LTE wakes the phone from s2idle, and the IPA wakeup source now
> counts it.
> 
> Signed-off-by: Michael Auer <mick@yoxcu.de>

I am still not able to test this.

There is some special handling for the specific hardware
you're working with, where a quirk on IPA v3.5.1 under
certain circumstances (suspended while an aggregation
frame is open) should generate an IPA SUSPEND interrupt,
but it does not.  That case is treated as if that interrupt
did fire.

I really don't think you're hitting this.  However the fact
that your hardware has special logic related to this makes
me want to have someone with a newer version of IPA confirm
this bug (no reported system wakeup event) occurs for them
as well, and also confirm that your fix makes that bug go away.

Do you think you can find anyone who could do this, and/or
help by explaining to someone how exactly to reproduce the
scenario?

> ---
> Tested on a OnePlus 6 with an sdm845-mainline 7.1-rc1 based kernel, in
> daily use since late September. On net-next it was only build tested
> (W=1, arm64 and x86_64 allmodconfig).
> 
> The event is also counted when TX_SUSPEND fires after a runtime
> suspend while the system is running. If that is not wanted, the call
> could be limited to system resume. I kept the version I tested.

Are you distinguishing between system suspend and IPA runtime
suspend here?

I do believe that the pm_wakeup_event() is meant to occur
only for system suspend, not "just" runtime suspend.  The
system normally does not need to be notified for runtime
resume.

Unfortunately, the flag that recorded whether we were
suspended as a result of system suspend was removed (right
after the commit that you say made wakeups no longer get
reported).  So unless I'm mistaken, we'll need to add some
of this logic back again.

I can help with implementing your fix if I am able to
reproduce the problem.

					-Alex


> Tool use: the analysis, the code and the commit messages were
> written with an LLM coding assistant (Claude Code). I reviewed all
> of it and tested it on my phone as described above.
> 
>   drivers/net/ipa/ipa_interrupt.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 766b094eb069..547ed67930d6 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -92,6 +92,11 @@ static void ipa_interrupt_process(struct ipa_interrupt *interrupt, u32 irq_id)
>   		break;
>   
>   	case IPA_IRQ_TX_SUSPEND:
> +		/* Data arrived for a suspended endpoint. Report it as a
> +		 * wakeup event, so user space can see what woke the system.
> +		 */
> +		pm_wakeup_event(ipa->dev, 0);
> +
>   		/* Clearing the SUSPEND_TX interrupt also clears the
>   		 * register that tells us which suspended endpoint(s)
>   		 * caused the interrupt, so defer clearing until after
> 
> base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e

