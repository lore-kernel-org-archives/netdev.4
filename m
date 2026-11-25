Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616821;
	b=fdI/8toeYrAvXdGBTzxMLR2y6/GtZw+zrr/zFCJka84oHWTR4NMpeid1gkQI9pxkR4e+
	 0Sfv/5U7Sj9Z+5xUX0PS9T3JWQMvUrgHWy6dgtAeQAAabbP+HBsmb/2trUWhBZ3oO6L8q
	 gq1teC2u31tJj2Oi28MoCcqmzRx7PJIfqXIBE1TioD0N9GKh89uoE1ekM3AzDN5aJj+Ow
	 XmW0lmUvfnGw4YQKlKCQXh8b6x0y65yzKgioLbvh95iFFQRIe7oQd42HS4XgAoxSMtlNF
	 PyPPgbuBAv7xkHnpIVxh9BHdxP1M1SJLrjgE/aApcYw8ABNO8RdWzcHFM4umL8LhAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nOfL+FVZ2BrVGbwc52XxXvSw2wKru+ljcM16VUgsDSY=;
	b=j8umCm9kPl8yhMgIHzSxH+277RiDG2eRd69L6jME1P/gx/CwNmcZ3ZjOJFH1QE/UQ4pf
	 525Mx7EsLxJ9RIXmWnqsV1C0aKEsZZ3fJeGjH/LRRzzO3xMbPjpPGvYttagpm2zpGboDg
	 EsYLH7uPAQ0fUwrpl4jWDyb/pt4FuyVcy4QyYUox9/R/AzmcO59+SSzayM8DQI7b8fGz9
	 5wtTKYwTcv6Q5t6EMjneJ3yBgzC7JC55iDXUUTDlV3MdmzmWMnT8xKly1WtvhSbcRLJVX
	 8uC5iG82Cz2d0RQIHTVkmt4YPBiJGmbzR2SHjOueR7ifgp9PKHBxXITGKgJjY1xzTjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+KYL0ej;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B267606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B267606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+KYL0ej
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so3052185f8f.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616819; x=1796221619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOfL+FVZ2BrVGbwc52XxXvSw2wKru+ljcM16VUgsDSY=;
        b=E+KYL0ej5L8NVJgoZU9STxOaqN5SOEr3DBlsqsFwlMlHgkqo4kNPwC3SOOlMIQASAr
         Vcf2oyZx31L7Mmsp57zAecqrOoxcpMpJwtn0UkmT24kKH54YaSnhaairutIqbvrdKbZ9
         +H6p2rs7yrNghlql3ztopmaf3+RaWFUt/N+g5Rwy6uKGLkfsAjew6zBZPY5zCrYHV1d0
         MGn0l8EKrFt3q9TUTSNCYWScLUTeYnKIzAOJ+mg8eF9I5inPBo2GUtByJ7ntI+8izJlr
         /mJ/eylFfZJ6qQPdWk2fuhRgnTI23jtUyVST3Ywxy/ZvhVu2iFhKMG5e70UUnDBeX+Xp
         uHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616819; x=1796221619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOfL+FVZ2BrVGbwc52XxXvSw2wKru+ljcM16VUgsDSY=;
        b=eVuyDIDO5yC74O8Tf3Et0ZiCtPvUHeN9s1iJSjRz9neSJkWoeG8Mc8Fy26SRTSjISj
         CwtrVxMK9qoV6rr7prneI8VUvYYUFicRAO3kM/tXYnlHTJwjUeHK/u6soYRCp7AiVO25
         5mBeVv9+Cxg9HKnOoiJABaG8lhzBBBNxotCaWSfX4dan11MMNHPxgru4dIeX1YCqN55q
         kQSs/l972QdHaLxS5UUy9CCcU+dPI5DMBJeqYf+ErNkPAIjiXcpcNqq+0ExP/Lhd9sYk
         9Qtjr60KFOcbEJICS/Q1yAgA1DIdUSSA0RnZA6STzWgVoVxCjFdPEMq3KBEm05fFtkSp
         Zjkg==
X-Forwarded-Encrypted: i=1; AL+hErG09IGx6//dsGtHQMZnSJ3M3px5KL59FyWTMEPgp7OJTAPoWwvdSrz6yl9NW6NyGLPU8IcI4MA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eOWCIjfEWesPPGaXttyUy8Mi0yaj9KEVczQG7dcz4gIbzJKS3
	7UVBPlqfUeDQeaz74zub2ZdOaA4SMEez45RmFs22trDr4ohjsoV2PEMH
X-Gm-Gg: AZFdTZeHlipV0l3m/zCesWZjxNZkJb+E+0RcHuiV64/u2ur48eal5+YINIvJSDxWFbq
	114zPDbjwwR2q1isl/Fp6wRYXls79ou391NJrjdfxsp+aAfAnJpv2gxezzYhidVNqtDzCqEgxc+
	elpIF13G4hBaFMzoVvEqnsouTHWhegWA7KvGoZo9TXTmQ8iI2aYgU/trVetNu5OYEFJKtJkNg2V
	b10+Ntlwlop4m2WDaggIOK4uYlichZetvVQzFeP6E37FN12v/Cyl2iPoq2a2+QoiTx9yhOgpEQe
	88Cj4VaXFV1J2W62/FDRt8fqPAdUfFvflfS9V71bjEytk+2ZGX2kFKSDfNrfdv1fkoIyNP5qNHF
	LbHJ1QbUmAjJdIHWTOFMLInFP5AWLhvU9WuExX8hCdfBC7aGXDc/XsPf37kgs2McVoUzWis28w0
	VtJ2ytaBdVH5YqAQ/ASOo3Eir8lQH56/FcpM1NaUZLNa7tJ6Ph+eNH+RCan4yxrUiy/gvn+yrzb
	jwmGeiHtB0qZMYhB96JVTZkqCKk0l3YOpaj2fNcXohgqKa2aX/JNrKMaiatT+W87xctKvg7Mezs
	96PIlQPUvAp3w7nFu4UQTT5sCHtkXtN/zIFHilEIH/Hx9ewwydJOyll34cUJfR1o7w==
X-Received: by 2002:a05:6000:2310:b0:4a2:ee0f:4fa3 with SMTP id ffacd0b85a97d-4abad6a4224mr39050556f8f.8.1795616818830;
        Wed, 25 Nov 2026 06:26:58 -0800 (PST)
Received: from [192.168.0.61] (firewall-214-232.seh.ox.ac.uk. [163.1.214.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm31695107f8f.23.2026.11.25.06.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:26:58 -0800 (PST)
Message-ID: <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
Date: Wed, 25 Nov 2026 14:26:56 +0000
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
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Sukhdeep Singh <sukhdeeps@marvell.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
Content-Language: en-US
From: Tobias Heath <heathtobias@gmail.com>
In-Reply-To: <20261125132228.GE191152@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Many thanks for your reply.


On this hardware the dock-side host router is pinned in D0 by active 
USB4 tunnels and has not runtime-suspended since boot (active_time=515s, 
suspended_time=0). The quiet host router does go to D3cold exactly as 
the spec describes. The s2idle_preserve=1 path keeps the state that 
runtime-PM would have kept anyway — it prevents the system-suspend path 
from forcing a D3cold transition that tears down tunnels users still 
have open. Would you be open to a v2 that scopes to 'suspend target is 
s2idle AND domain has active tunnels' rather than a global module parameter?


On 25/11/2026 13:22, Mika Westerberg wrote:
> Hi,
>
> On Wed, Nov 25, 2026 at 12:45:36PM +0000, Tobias Heath wrote:
>> The current implementation of tb_switch_suspend() / tb_switch_resume()
>> writes ROUTER_CS_5 SLP into each USB4 switch on entry to s2idle and
>> rebuilds the tunnel on resume, independently of whether the host router
>> and connected switches actually need that teardown.
> Well after router sleep is set and acked and the implementation specific
> method is run (typically ACPI power resource is turned off) the routers
> reset their config spaces to default except certain fields that are
> mentioned in the spec.
>
>> On AMD USB4 host
>> controllers (verified on Ryzen AI 9 HX 370; same expected on Phoenix /
>> Strix generation hardware), the switch config survives D3hot intact,
>> and the mandatory rebuild produces an entirely avoidable re-enumeration
>> cascade on wake:
> It is expected to go into D3cold and at that point you lose everything.
>
>>    * Every downstream USB device goes through USB disconnect + fresh add,
>>      device numbers increment, open file descriptors onto those devices
>>      are invalidated (audio streams interrupted, filesystem mounts
>>      unmounted-and-remounted by udisks, etc.).
>>    * PCIe hot-plug fires for the dock-side bridges.
>>    * The dock's PD controller is reset, producing a 1 - 2 s
>>      ADP1 ONLINE=0 blip that interferes with any userspace relying on
>>      AC state at wake time (for instance systemd's HibernateOnACPower=
>>      policy).
>>    * resume_devices takes ~2 - 5 s of avoidable work.
>>
>> Add a module parameter, thunderbolt.s2idle_preserve (default: off), which
>> skips both the tb_switch_suspend() teardown on suspend_noirq and the
>> tb_switch_resume() + tb_tunnel_activate() rebuild on resume_noirq, when
>> the sleep target is PM_SUSPEND_TO_IDLE. S3 and hibernate paths are
>> unaffected.
> Adding new module parameters should be avoided.
>
>> Measured on GPD Win Max 2 with CalDigit TS5 Plus dock:
>>
>>    Default upstream:  resume_devices = 2.6 s; USB storm per wake; AC blip.
>>    s2idle_preserve=1: resume_devices = 0.2 s; zero re-enumeration events;
>>                       AC stable; downstream connections (audio, storage,
>>                       keyboard) survive unchanged.
>>
>> The opt-in gate is deliberate. Where the TB tree is not preserved by
>> hardware across s2idle (e.g. some Intel generations under specific
>> firmware configurations), enabling this would leave the kernel with
>> stale state at wake; users are expected to test on their own hardware
>> before enabling.
> That's actually everything except your system according to the USB4 spec at
> least and I would also assume AMD follows that too. Why it does not enter
> D3cold is not clear at this point. Do you disable it via sysfs?
>
> There is also the power problem if you keep them alive.
>
> What we can do is to avoid the unnecessary runtime resume if the domain is
> already runtime suspended when entering s2idle but that's USB stack that
> does the wake up.
