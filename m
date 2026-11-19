Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126517;
	b=5EcE843wTghiG2nA79IMX1YNvlef5uDA8k+OEQrRSOuY2ryYCqIeBSkI+XAGhy4fJg5Q
	 5udZgAT2EDi6fLw9E8eg+PMO+J6Ks6pohU8qz+Urh6DTa64QcUX39JaTYXGGa+OF8sgBp
	 JRDK3qk8OgrNFgqd5MH7JSNPd3Us5NPv29FhhbFVWbwahRlF2r9QntqZtakOToi3KIuVz
	 msv6eZBbrj7i0JF5oEWYKKxayZ/waWKdYwAED4ol5mdqGK8R0NFwEhenVa8qKpSXWECya
	 fsJ30/1oPDA7fAQhzIC0btH6uIPal+jUZxQX0G3wtJsgIu4rCZcsR0hGFwQQIaFdAiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8l8XHyNayBAlJsP3xEji+LFlUpnRVNoG1UJ97c+xgzk=;
	b=Dw6zuAPkoU4FYZMFyaLep23gDcqCYkgkvptSeJl9wpsAA6CiVNImqkifVSlvwNLT0vWx
	 JH94+asoxaXhNVmRsQSe+dQn6mL5oUt6iK4eOZWkzl7snEMCp0YQCKKraav+SPKdYFXZb
	 VM1+MWrkFuLKRwMrbeUErNNTWBjHXy6D4IT5vM9NIYCD9jccKCILi0uU54cLTmXmQF3QU
	 e90TZJ60aW0SjaIV/SKkk9NPiNnqfAeOcqHeB7yXACnM5v47u/NmvR5T/H8dHgO54HRRz
	 pSY8fX7d2sO2rD3/9hUlefH9Ujih+SDQrP5tFVEmPt+uEYo4EFUNHh5mkE60Uk38CJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZM+cwE3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B1606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0B1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZM+cwE3
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4af81963f35so214896b6e.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795126515; cv=none;
        d=google.com; s=arc-20260327;
        b=Xb7yJV8rufYPLIOcwgLUqY9s2IJ/f43XMV6Vmhy8ZbcRfCGfkv+UDVUcq5snAIfE9B
         UKd4hbGcVSoJmmnDKKTArUOq30yru62gI4KLSK9y+8VYv5NPaJ4gNZHoFNVOyuFNp4wm
         uqtqsJDqPuvPr4HYhQ2oC+OzEnR1HU4xwNeOXKFroYv6p5RpeZf8idHMKmkO57RzYqUb
         jxlMji6JHGdFSPKoV4cca9ZGVzzARkTPNWlaO5XkM+5TragSKqjKTaU3LoTw/6y/0mcW
         5M0o4qBaEb31h3Nrm2LaCpgr1spWZKyVjzsjEgfhxh1rAjxNC7PzFffAJRp4c2ThO9AK
         HH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8l8XHyNayBAlJsP3xEji+LFlUpnRVNoG1UJ97c+xgzk=;
        fh=O16QCut573K8eSWrpwva3b2QxqPQsx4MS0slYCS7b34=;
        b=LIUs7WamFr1jLqcEc80KqKXwBpmO1/XsR60dWp7VR8FZFAGN2C5zsTMmDsNrm4jNGi
         uj3xFUBVJQ2tYdtXB3pptA18rjhm1cqmoW7bYAYfvUFhhiSg8uWxnDL6I4JNy6FCzB4e
         ZsWeQNU3A2HVqOm3bCCiEuMy6D9UwcapIiiWtu0OAdL3SPOhK5BagP9OYLMo0CpWdYC2
         ZNwebQ9tZh2MErXEYtaZbvVvqkvFhAEom7tRlNMo1P/miSA6gDLFSc0pdwFrT8+JeArs
         D0hmSQHEhxBFiQSPcMQsJ6+nlxdN/IUsUE1HXqXGTq8DAmN/2P0d5voH91vNpfeXVmf8
         sjUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126515; x=1795731315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8l8XHyNayBAlJsP3xEji+LFlUpnRVNoG1UJ97c+xgzk=;
        b=TZM+cwE3SeQWyq5M/HERyZiG9VcMIlqLKFNeyqphKMa+l8lfv+/2luYwqYm4XWp794
         W2myme57djc8K3qfFrR0PX1Jh9W08aV113XF6qC8HxK1hHVtrZIq2cbAQkB6tL0Axswg
         uhwPRLDx16+8m3LNIm54ALsjOwc9216ZelbKRpNgixV0XFolGlb7gzl1F4MG31H8+L9W
         ODzh9GNudWPmLZt3LJN+BuW1qA+VUdnNLu3Bip7Sg0YE/kglQsmJqgN5HNIUj/FTWVC9
         PM6GsTI0UngsjO3vBfQ9yU+Jw7n7bB+9VIxobtS476/UjgQjZh8C3gPvUIPgYrYUsCx2
         Nbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126515; x=1795731315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8l8XHyNayBAlJsP3xEji+LFlUpnRVNoG1UJ97c+xgzk=;
        b=jUfuP6Yj1g5Vt3cWLsAqyHBIlem2I++uCoypVhPTlqj57/mcZyOm3BbrHWEh3a3biV
         znTOnxgyIMEaFcUdp1u01iKy2x6mdhkArdka+xqGMCmVE017RD3qXI1QBrM11aEpbJdK
         O559bl6Gsgmz+VI8kSxNViRLLJyyD6dUIihvb4G3NpccQTjoVMEo1dx3V6SGlofVTXfY
         lQyJB+Tp+51NID6w/DotzZqS90slJ2rue2RpO8UlUwAU/DhYY9P0xZ15wAhScyrtD3L2
         VlqM7m1S8R4fq3U0cNC7XItTUGKQkTYVjZdVVnvHH65Ol0n+WBorScvkmDJDlzzu9pt6
         ce6Q==
X-Gm-Message-State: APuU4Z+NAz+FtjcCXkzvU01oNfhJzY3/R4lzqjmMOnS+BU6uCpGN14pE
	l8OPCTHXh0DuXs8uMsx87xWtC3Lw4JbiWTDJ84TpyaPuSL3Jq6m2AG6JDT+84jByBqp54ItZfxO
	GGjMD49NMg/F3GFFo7pR23dk7+W7oAQoaBfYpApFyhg==
X-Gm-Gg: AYBFou3nbOE7OkEgAEB+JS1c+1c7sBf8AV+CYCSdIpOpB8kFVGAxRvwhTHmPLCXe5jL
	QmG25j75fAiuP2l99lN9FN90AmEdCVI3ZXE47TCZjKy2ZQneUR/rQvoL3Fjpkv6Xw4iM/+L5Ebq
	IAhcCCEFAEbkZ6+N3ICNnaLXIJNklFFSqhr3xpTjg+R1pwmfeniEdM4rxBiZnDPU190cyFYbGwy
	t+G+UaVsfjFRY+CTNLbWzI/YdX3gwwBZPT24SrpMrz/XW+xN4oYfu7WY9bCWH8cTGG63I5U1yd5
	F0y6foiGJ/moLnuq9cApknLocTOHot7d0D9DdP3hbhrlfU/NDrYKcayLtO8SB7lKc7Gi3d11pPi
	Gl72YvhwYodElCgwC8icplYkPj6eRWGX7OsyCOPSDFUs3ASiCbBpTy7d/HwlZey05FFzfqhtctu
	IBbtP6XA==
X-Received: by 2002:a05:6808:c236:b0:539:4d53:170e with SMTP id
 5614622812f47-57a0bb79445mr1617066b6e.43.1795126515353; Thu, 19 Nov 2026
 14:15:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119220949.1123168-1-mmyangfl@gmail.com> <179512636063.3291.8215181491669422818@kernel.org>
In-Reply-To: <179512636063.3291.8215181491669422818@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 20 Nov 2026 06:14:39 +0800
X-Gm-Features: AclHuK8FrmxyBDW2Qx0-1Un82cpLJ2A8ElXh25KupnrPMkwZrCZU2Ew0q7N_3kE
Message-ID: <CAAXyoMP6_+Z56qj0MVh8KosbCLb_3sOPROgv2jOsDKvHjy6+gw@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Read the port PVID instead of bridge's
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:12=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Assisted by LLM and verified on the hardware.
