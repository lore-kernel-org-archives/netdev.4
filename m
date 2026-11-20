Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185841;
	b=NwvEVehRBV/jx0TtS9QW3aFePsIBOA+VRCkB4HqkKcs12IpQ9AzZOzxzKGEoQMDxHK9k
	 214ybyQpuWc7gSk6vMISfQEyohwN+FF2skLro2dBFwJRqbWVIxf0Oj661adTgYKgtzBB8
	 urBr+DRuGQ1A/HzVOaZXHJhOiUmtm127oepFwhY7ijwWn2P2xLhrtMJcyHA8mVq4XVdAh
	 XaIGpTLREC4rZb4R4kr7Jj+Q8+4Nu4nnhsuLi8z7RbAfS/kINCF5ABMXLCAdvg6jbynQL
	 XmLgJNlTn4+f0qmYZQf3Wd868TiBn2vAVBXcnAwWh5dXqnro6TzxJTtGfcV00+IiTCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
	b=z1JEfsaiGuKHg56HzYrrv8k9kg0bCQrCi0xMplUPNJEHcDIk/YKnytn2FjKG+YU/m2Zq
	 1RJjfK+1J5rKZ2gjg0MLM7jzy6IX3pou5jRx9fBPDwpzAGy2aoRYGQTlrYdFBo/V3jfoP
	 oCbwariblpl+F1bFVgI//qZxxbM1bGmJxNw9Dx9jU6uMnuJY4L/+dQa1e/X1PktF5MC1L
	 wipSoxT2YUvPbfUh7LT59LrBDdYyW1RpknpNrJ0FXRG+U/86dYo0vo6Ws0cOlz5qaCOgs
	 pein22OLPMjFzC+Egda1C38+zAd5RpPqZXqwLuqlRrfyLKip5xNn4o5RhCL05RM/NkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYQ5tBef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478A1606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478A1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYQ5tBef
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so9744985e9.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185840; cv=none;
        d=google.com; s=arc-20260327;
        b=jmYodv1VWFHjMb5St7tpOny1N4vvtHn/lUYiMiAzruVH0950NUX5zUf/Q5iQNLnvRB
         AZVT9PrmKeCLKrXGGdRnXS1Jq/ZXrNjkaW4JBohwGfdDyhknFHJ+eYrwTNK4CgOCUicn
         OX1cd/q9WRNc1Q4YhMQWzt8E1rpoeoH6ioZtJR35ZN4GJgLPaxQtDWZyu/rO7tUmzF6u
         JhsLQIZhhiEOb99PBQCRqqjd3QhyKp6LvdQPOYzjRh+Y7y1wPMn4Qr20+OE9K6x2FB5g
         JUAbL9HoSMzkYn2zzkJCAf8SpMmKzrwFwNH98AKCuP4LDXDvcQpcbD16CHsp4mcnwlSH
         cP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        fh=JvnWmTDk2CqVy22O1u1+MxfLT/ZXX+OuMoad7lt3Te4=;
        b=M1Lm23/8M0q0mVjfQkAcZ4nd1bzYAZ45Y3lpQvrrUNNd5ldDefyFpQMCHpSQEcFZmR
         +nFgvkhDyrBtHARQk+gnjtFhHwWxfut3mx3bGDFZDJAxS/qWA2Xi0vWLS9XwZQ3gF+pj
         RFUCSYXF1lt/qy8G2HiHtNQfOytjYVh8KmQWpbd+tqL7xuDCGY5oG/qE4Ly1LaogPYcW
         bkj+CXoCOQ49t00Z1uX9AQAZ8Ddhmil+OThdFY5g0ia/fUOC4kqysN3awQyNxiirarkw
         3S/vyo4bA9V/MYiSvtIegldOl+zq+YZnocaia6+hYqNRoQA1L18ErTC2w1CjP9SNQvCm
         v4Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185840; x=1795790640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        b=QYQ5tBefbybLAahWX1T5jVNJjZMBPRgTJcbKw9SACiCbwwSstGz9QZ6ob5fsto/bXE
         +VmKIKxLJ/kCzeAH+ZPIBRboifpiXTNqwlsZ1wHrk/YUtr8sINXI8KJ6H09oUVftbhTn
         3kCHtT+5pz1P92H0uCuSAWGowRv4dYGficTGkvLioFE7xDeWNMAL1pveel1tNwqpB3hG
         3PZ83BtYlHO4v3/+OKTiFFPAwQTZt9IqSUQ4gslXE37h2Ua9/EcuyE2thspfPFV05n4v
         CXKA37NNEfw09vb/vw8SVg3kWl1qpPvnNrZA3m183s6nJWG6iPrIwCbkHM3cH0MtpDs3
         abLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185840; x=1795790640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IX7N1kFKFZuWON6FMO3tvSVP9QWmOoz3uHAxAV0zQc=;
        b=MMXKYb6Xgy6s+wmMz9C9tNlVOcIq7JC/SGZAFFHR9kCF/6kYbR3vLUZWbQnC0tbT/b
         72rDB1kMzFa6urm6r8pzu2S3TXnaC0IGtdOrrzIHQJypzVnYyD6a3pPBFm9uTYLvk8Ga
         eDBU+Hlg3zvDnHdQm4U5XWZ4tywsNDP4i0kVv55ifbR/adTefBsG9WUutjL7f5IpFNv3
         kk2FnLCeD8zMXMa20sVf9+qfZUsH6YQ/faRvzibuxKcn/MNevvoUvwd2eiQ2hd8E62Av
         jhQjjRtp69dFKWbzwUGv3t3JkkVhIdDBZqHryPVcyb8ehySENvXJ/E+xaYMMAfwFbyCk
         ehpw==
X-Forwarded-Encrypted: i=1; AL+hErHX5VPORqHlJu8Fefjwz7lj9VsFHEmAb3LDz1qpjdTGyzjjE8zMAgxsbhrAY0sMP5PUQL0ve1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t0oAzoRn8wFVDjq6q7kCUNySqAculXjocDKJ+FJI5n/As3fID
	7ekL5WCXCyF8LkORLSbwNBIZ/A6U9hWj9W6oCbkk6CHdAoGmT4vDRym5n1eDzUikCyLZHc7rmzP
	hZpo8n2ZDOaWYZoRukKXtU+Z8HkRG/DM=
X-Gm-Gg: AYBFou1CjsiyJVSCFGr8MMYBpin9cePP2rNRswJ7JIBme55Wy7QmsDkcdw6RJvW3Au7
	vp53brsUqog6q/Ka/CvDku9cuPZ7nPmMeIZQNbGHA3xY8w8JPLWn3U2M412WSIKb9MT/93cGBSn
	wYSyQconhFtWE7Ehjkhx9pc1q8Y4KRd76c8lyVffWzlgknJ9UqPei0XyeMbwFcZeJa4HpmdPCNb
	qe8GpGBbkZhE7KiKvzqpwuK/Zin9wao98h1p16LXAnYQNtseGqQi6qi2GCaW/6isUoS5QNk//1H
	EQMo/0GvomPEfsRS4Qcl05iPGiyU8zVizlLnt7Cy3v+kLuumQPt1Hs9d08o6ehiofiP7mieZMli
	/iCu13u4973hYIbKbIGtuUvMEYX5u985zNmUFnwAjMLIYEHaDuOP2NxAqAAK/mLVC22pkFX+l5/
	tQBo9vXmGuN2JAwPIgojj38LxdnnxJhD8c/eehH3xKnHqxCKNtTpHy1/mdhS62De1STPIRbUUrG
	/DmEZehF6PSDHXtUPiz
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id
 5b1f17b1804b1-4bb8880f2d8mr64314205e9.6.1795185839556; Fri, 20 Nov 2026
 06:43:59 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179513453453.3291.8493509332739817258@kernel.org>
In-Reply-To: <179513453453.3291.8493509332739817258@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 14:43:32 +0000
X-Gm-Features: Aa3M54p4ZaVOj21rOraLFop2-l4thT3tsd33lr6hbx18b-7slzJ7KmqEF1KOtNk
Message-ID: <CA+V-a8vCCZy6TSDt8aSDA74GxbdFBP11DCmKB7+T_6+TU08mhA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
To: netdev-bot+sinfo@kernel.org
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 20, 2026 at 12:28=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
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
The issues were found while manually comparing the hardware manuals
for RZ/N1 and RZ/T2H SoCs.

Cheers,
Prabhakar

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
