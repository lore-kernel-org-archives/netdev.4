Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806452;
	b=Oa9jbkuDkAfDrrUGik9b1Foz0ifT8m85EBwYTVU5VxJICXJbO1zOSOO3oh+QRIUtkk5y
	 3OjVoQXYoP9o8dJNypdsP7GSavnXFA329nsOw2MCkPvQjlJrN+hiBoj9JJFnJDOh5Mbnu
	 5CVHZVZZQFyJx6UxL5y8b2J2ew1eJf7+jAlU+8uTXHm9yopdIRGsZOqZNj2DifXgnTgTF
	 PbBeNspOXI7C4HdSuNx6kILBsBPZ5gMcS+lRljUQBbMJW1SiRHYjOc3+A9Z8o0rbQ1VTs
	 BLLVrV3PCV7eZk2Tex8pMTc8bchxP1SGAhkmZlwK7531bR5cdueb7zluUEjKmacopWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=2DnA9FyioBX1izGwnKZE2FTp6qN+nSrZYIJ+DgRwFAE=;
	b=qj4QG0VmhwS4+yGjSph9eaoJixGzHd7yMlR4kuLa5kqbXrulBcjdx9cUoxh8ydSj6z4g
	 DDUP5ziLwACZCVWiCnH6/6hV/M7QrWKuIGra5uAM9ZLQQTQpLZ0YFiI+NoUGS5wr2eX49
	 GAN4xBREp7cWvJSStb0F0cN5XJIUIHnkVNDnpLy9jBxknuDtGjB+Hh1cL8iOgov5p4ido
	 l5COesz4Au9g7bTqZs1o2XDZcpSbXJiPQuhUK95N0VdJjr4helPeNacLrBr+OniAMUzic
	 KZgB8PrLgKiP9bOTW/yzbYnQCFcWR8apccDb8m2ru9ElDa4raGJGOcDMFvI3Wsbo2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXJVV+Q3;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2F6606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D2F6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXJVV+Q3
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso3293098a12.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795806452; x=1796411252; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2DnA9FyioBX1izGwnKZE2FTp6qN+nSrZYIJ+DgRwFAE=;
        b=gXJVV+Q3PQJaOF4dULReR2P68Cx28RzPYNXaVaJsIQYGyQ228xA6UEXOBaPEIkF+BA
         iBRhS4FjYcpC3oLFLOrUxsnfKvzN07SjTcq/HCHVXE+dCjhycftd7cj0gmOs9f8TWSuV
         eGZ5ctV7lnpDpsVcdpRZqR8TD1KOfykUAjVPmgTa1BdleiZLrQOuW3c5uTSPPrvmHsqN
         znDtAQZVBwJmZcYJ8hV2EpwE63sIcHztNRXl9hfvk1c2D10NQ0KlrpFMyz7JhHQf28PD
         1V2esWPg01UwXRKFGmuG6FxjBr+DDWG5k3TdcWsZdODnkBNXzxcV64LybvSkmT4QdNsN
         KmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806452; x=1796411252;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2DnA9FyioBX1izGwnKZE2FTp6qN+nSrZYIJ+DgRwFAE=;
        b=2GsJMlAhAjGtiT4lDqF6dN6eGXxThQSnIBKU3XqJvja+e0hEafBuqzWfH5a0ixPk4M
         pn+wCNWEL3omshNrGEkpyc/f7AN23SDztbXMzITZCQcF41GeoRlTzog5O2U689Bd3Rky
         wvekChIWUUqZ61ZTgyle3u4ZN4d3AJ+XUoPzzJmBFA6WxwjC4FgTgnd1IGG7TXgAxXt0
         kfadzio4Yz5HBZykylX5A2G33g7fVTaDoCwMdZIDgHHF/9UQ/a6SGl8RoNcZw0HEj/5+
         d12xke8db1GowYxB4KmsE3lBhMXlF8URu7ZixKzSO9lgZy/jTPCADKMFF3trjGydpihm
         atSg==
X-Gm-Message-State: APuU4Z9D25UzYjWexdX59ETqzrb43YkY+HyOK53jjZEoZ9rCF51Qz/My
	KSPeV6b+Bpp+GyNpuve+Qonl8Q/AXBsgebOjbGWmNIKWsiMTLU/gqSl4
X-Gm-Gg: AZFdTZdn4rGxtbWvRvolQ2asc/oTLFXgFiaCqcb/fnv9CuhYG2EXzV8vJLUS4kVZIhZ
	ZzCNuybULy3+YO2zwfiNg+C5kTMXsaNrRw6bhR5cicBb7IhKs066QX5av7Rry74Ac1xUN6d3n/l
	SaDiHRuEVmCdwNwaeyzEMQb55Dpx+F0374gMo/yq3msO5mBuO5E1OdHr+BR94Sl+wmolNF+NoqM
	D0zBdetCfM2KMivav0hTgRl7qeGHqcUvzrxEg1+MPZUwc2q2n5ch3dKYV+eBwiWBu+zizK4+wsL
	ZbYSG2gXwNZp1VtVifoEcG7/21kckmJc26oJzIp7mTwiQJDS3hTzdYbSwUfs2AC2G8ztD4c9sWJ
	L1LuP3najLSOJrXcGJgGkRCR79nqv1Po0aPavZkF5WX+kZleWa2cLHs6OhklhDrHN2bCdTKYlCj
	BGd6mrhhHpEVRg4ybLs/K15AVHru1/lZI+sZZfFvk2hp1oxQrL78DwUp/RchWrs/EPbzqNKlGiY
	RV6GpPxnkdi68LwUqRh1eX5IkkJArz/TijksmUS2Q8klG3LGCFM6g8zALiQ7R4r822b1R3B1ut+
	ILQrTeOBHuwggg==
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b915:2c03 with SMTP id 98e67ed59e1d1-3b41c92ce36mr25174271a91.31.1795806451738;
        Fri, 27 Nov 2026 11:07:31 -0800 (PST)
Received: from localhost ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7a8c64sm17802538a91.3.2026.11.27.11.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 11:07:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 11:07:30 -0800
Message-Id: <DN689A6BNJ7W.1R8QXBRJO3TXA@gmail.com>
Subject: Re: [PATCH net v2 3/3] net: wwan: iosm: always send the host sleep
 message on suspend
From: "David Westen" <davidlwesten@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <davidlwesten@gmail.com>
Cc: <netdev@vger.kernel.org>, <mail@maciej.szmigiero.name>,
 <loic.poulain@oss.qualcomm.com>, <ryazanov.s.a@gmail.com>,
 <johannes@sipsolutions.net>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <nihaal@cse.iitm.ac.in>, <m.chetan.kumar@intel.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261124172627.41847-4-davidlwesten@gmail.com>
 <179575732446.3135.7320223889201656739@kernel.org>
In-Reply-To: <179575732446.3135.7320223889201656739@kernel.org>

> [Severity: Medium]
>
> The reported case is a BIOS with no WWAN _DSM, where acpi_evaluate_dsm()
> returns NULL.
[...]
> Could the change be limited to the case where the _DSM is missing?

The driver only ever acted on the value 3 (D3L2). No value means
"D0L1.2 requested", so anything else, including a missing _DSM, fell
through to the doorbell default, and that default is what this patch
replaces. Platforms whose _DSM returns 3 already use the handshake and
see no change.

The reports I know of from platforms on the doorbell path are all
failures. On this ThinkPad the modem doesn't survive the doorbells even
when it is kept in D0, a similar report on another laptop was fixed by
the same change, and f4dd5174e273 tried to fix spurious wakeups on that
path and was reverted. If a platform turns up that does need the
doorbells, a DMI quirk list could bring them back for it. The v1 thread
has more on this:
https://lore.kernel.org/r/20261122050039.861287-1-davidlwesten@gmail.com

> The replacement path doesn't reliably wait either. ipc_protocol_msg_send(=
)
> returns 0 when the completion times out:

It waits up to the message timeout for the reply, which the doorbells
don't do. That an unacknowledged ENTER_SLEEP still counts as success is
true, but it predates this series and is the same on D3L2 platforms.

> The Fixes: tag points at the driver entry point. That means stable would
> pick up this platform-wide change based on testing on one machine.

There is no Cc: stable. If the series is backported, it should be all
three patches or none, since 3/3 sends every platform through the
handshake that 1/3 and 2/3 fix.

> [Severity: Medium]
>
> Without the FORCE_SLEEP doorbell, the host sleep handshake is now the onl=
y
> way the modem learns about system suspend. Is its result checked anywhere=
?
[...]
> Should the callback fall back to the doorbell, or return an error to abor=
t
> suspend, when the handshake fails?

Neither, I think. Falling back to the doorbell is what leaves the modem
in CD_READY here. Returning an error would keep the whole system from
suspending whenever the modem doesn't answer, for example after it has
crashed. D3L2 platforms have always continued the suspend after a failed
handshake, and with 1/3 the driver at least no longer gets stuck
afterwards.

> [Severity: Medium]
>
> Both callbacks now always send ENTER_SLEEP / EXIT_SLEEP over the IPC
> message ring. None of ipc_imem_pm_suspend(), ipc_imem_pm_resume(),
> ipc_protocol_suspend(), ipc_protocol_resume() or ipc_protocol_msg_send()
> checks ipc_imem->phase or the exec stage.
[...]
> After about 63 such cycles (IPC_MEM_MSG_ENTRIES is 128), could
> ipc_protocol_free_msg_get() start failing with "message ring is full"?

Yes, but D3L2 platforms already behave this way today. In CRASH and
CD_READY the modem is unusable whatever the driver does, and only a
reset recovers it, which probes the driver again and allocates a new
ring. In the boot stages the cost is the timeouts. Skipping the
handshake when the phase isn't IPC_P_RUN would avoid all of this,
though it wouldn't catch a crash the driver hasn't noticed yet, where
the phase still reads RUN. I can send that as a follow-up, or add it to
this series if that's preferred.

Thanks,
David
