Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794694413;
	b=cyCFL90VTXMKgPod5SyofaK3JPw/vXacGEOkN9vLuwZMPHQkRyzghCkOmFHZydh0AEUX
	 oom/KYSh7OjFyDkXdyMdfdT+j/25X/ykISDgtCG6o/orGNXphV4tOpQHkiNFCBXJmLlIf
	 GlHyS7z6755J3kHHKHlFm0Yo8OxmS5pgRjCSvFYaggPL8SDpUcSiZ41OP6XrhDdywql+s
	 4nqF5UEufWz+X5xTqRE/An55/tTI7yU4Mfx/UlCUHFRCyYeSAuJ6CMGYcUTzRyBZo318B
	 I7MV+6jCtppVbWJQjK1rCpDR7alk0d9agHbEPcbnUziduyZbnrO+R5jx7UaXYU79iGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
	b=aQNsOOFanc7RfSGLk9JKi+WSaN9rNo6SWtZmRYMtnJH3IJ6RFzhqkc71LTKxyke+CCUJ
	 XJhtR60Tm9KxKhdDIerUFzQJyzmqEaZj8ujMZxTqi2MrNjVGjwltWNLckPAKgjw+JMeoG
	 m8t34V9gFebx5vDPinSeV+ZNqSMEAaINXaKUncD9h1tz7E9FtLQInV9upOZG+sbYEvORV
	 F5awr+sTeZXuBUgesHuSAUyeR9UwKzubClt/xHzsSK2HE0J8jRm6js24xVo6mUSTu6QAF
	 Klg9Azy8T/iPKNRkRvpVSECTBYifnftP8ewbyln0BN7TlAgKJ1DPPxKUXqn4t0n0ylw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE6tqWNZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94A606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F94A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE6tqWNZ
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53c4b82919fso44003511cf.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794694412; cv=none;
        d=google.com; s=arc-20260327;
        b=sF+OnmniNSBE2nxY0t5COBsbmAsjlrB169en7vLyo5o4rGT531m4PYpIYcwsRH+rKO
         dWADsIkQkCIiuKfv4+ZUuyrL4t5cWxV8YamYg08JBQl9CKQI0yDJq/kvR1vmY94PvPe9
         RG8qTpu8D+abGVAYb1y5fNB+o86BnCLMO6w66kkUvfxS5+Zo+eSI3GjBFcTKq9g/ooAv
         f+VhVML7BjpZnY3EPudLEZaFZiPwW+fP4r+6uay3a/mINsIxWjBDphILjokMUIUmjzfF
         RZ4bFnYIWwh4bT4BlAUFoyy9BsOhGyIBg0VMRiEHxjDBrPsHBhN0aYzAmEi/rKx9/wCv
         5Hng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
        fh=DgpAhV9xu+H+NTivRh3LVNGSfakOp5ZPFCk2RU7Hchs=;
        b=Jxqfc73t/MZyMvJYodBU78cS18B9Ie4ClTiMGbM32DoeYK7UkHiMKmTSbBHrrigO53
         G6WpOf1+mUsVvCtUVHynoBw1y0hBUU/DHifVbEweBxvfS+OCKotNSVmEFUy2R4T+zSD3
         4Zbtjtwt/G6tYKiarnP/lRjjovncGV2cCDsoLNohyUeSqPmlbgtahYZ3MQZah9GAQuES
         coy1d+iWgulRqsIUisdj3kMlCdH+1jiuHNNnzChUgKzoDiozX1/MAhs175HL8gc5w2zw
         Lsr50rJvAS5rtHPnlkTXN2n6hNXX4TTmH4jCSx+7U/p/CzqyFlQyNRm1cudhDEmScMpA
         OYgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694412; x=1795299212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
        b=yE6tqWNZpdQ0ChZDmQFufjOo+1BS6L5ma3KV02rOqXgw2VyK1gvMXYYGCnLMayKpn/
         u4rryftyTb8Q6aQCxgw4qk57RdFjnxCBnGmOE/afJrhk5bFer/Ico/2lRELxzXT01K3e
         sUt7byQ4WsK6rMRhrq2moJ6I/f9+kY8GtldDNB1uw35ZLR7TnhxyrkdHlCzDYWJwflor
         86YQm+Zj9CWN4XrWmvxxkwoEsyFfUV/F3dK8G3RQPgWtDxiM/j1y1VSBVI9V0ReNS+33
         AQEGq2R119KD8ev9eynBjH86/X3r9oTSkASeyMH1wxKXlWVOzE7w7YBf4ZLuZPBueJ6t
         i9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694412; x=1795299212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3g4M4BjGhy7rHyh3nTZclDx7LvROFXp4qSX7b0zXGQ=;
        b=zes5EQjVaQgUy+J1EuLgF2QI6TnjXeH0rxq/Ah5/Q3fwHjbOvdBH48tedvzJNx1Lsw
         RbExURy+LHVoqYzZBcZmxZjbnOL4fFbf0Y+0jrqAEefrYv4zScm3RNMdikMv1w9SKL/C
         /PCcz49HCdsuSWyTtr+1MHDP4lEejmqcFp38CVD0xWqv8KpO5JJ+d/Zrb4rnokrvN1k4
         ZfUoiPbTpkAWjPgiCG/MRjkNOg7Cw9ga3OnW8t0sg+9tyIqRSdH6mK6/QVqI+gXPD1P4
         MIw0OsGPvHLmoZUQEHUgtYVkmaE0r+D9HTIHApj1Chg47XBi1ztiGEs+H1K0O8ppiT0t
         X/bQ==
X-Forwarded-Encrypted: i=1; AL+hErFunXPE4FfF2AsJSTkBhaQhL6hlEN0j9ccmucIMzBTMtOyeVVJac0RJc4vkH8LMSVoLqpoC1+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+HYpnfo3hy6/zxciGBuWwSuiQdC7LEBOr57OWVQoMG8MajJsT
	SAcmqkcuVwlf9bkLS6EkKC10DlWWkrewSA7LWocag47n4FrvcRgSDTEzY3eLz7FFNR0qNjigohW
	Se9t7Kv+gF+ZGAiPuKanbCRvbdpcH0Sk=
X-Gm-Gg: AYBFou058aaxwNVuV5OHAswHhb9hqtT/8yhPyzFOs371qe/6XDI9Bho/ZvVrteZG444
	8wGqN7EclnTZVu9ibxO5P43CvneTd+dw5rjVs7Pcn2QLEZdvL4p1QkwTxG6MQVQalmnNbAlSC+Q
	zl2CHV1gv0PhEWc0g3TPC51Q+6bH3wdhrjP7yX/4CLkVJwZ6J+tJBn1zERaDAISNK1X+w+MolKV
	6aeHNHeSxU8iYJp9VTgCAycA0CGiVFaJsWqDVjKu2qlAlZvMYK33AbH/YJ8ahBmsB9JHXquKsmL
	0RUWi0xQ3fWZ0MZ8pbsS/v7Q6tnFMAKFt3mDhkVw+bj7Uvx23UfmSr9zXPX9OW9+jQXldFTRzdU
	oReNpgRQlyH5NzTSJ1K+b7phr8CmXKXy3gjwT
X-Received: by 2002:a05:622a:17ce:b0:536:26db:d4e2 with SMTP id
 d75a77b69052e-55ac817f17cmr101112741cf.15.1794694412478; Sat, 14 Nov 2026
 14:13:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-3-artem122novak@gmail.com> <8513f7d0-eab3-4288-a097-ecb4e6c69ee2@lunn.ch>
In-Reply-To: <8513f7d0-eab3-4288-a097-ecb4e6c69ee2@lunn.ch>
From: Artem Novak <artem122novak@gmail.com>
Date: Sat, 14 Nov 2026 16:13:21 -0600
X-Gm-Features: AclHuK84N6a_455rEAqWmcsGNqLfsD8ckKdWUt5DLF-ZQvwpuH54LGUJOk1veqM
Message-ID: <CAPufuhZdNXLvwE2zAz5Emi73DysuaEZkXvjVfZDA1sMJVVpf8Q@mail.gmail.com>
Subject: Re: [PATCH net 2/2] net: usb: smsc95xx: propagate MDIO write errors
To: Andrew Lunn <andrew@lunn.ch>
Cc: Steve Glendinning <steve.glendinning@shawell.net>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Andre Edich <andre.edich@microchip.com>, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks,
Artem

On Sat, Nov 14, 2026 at 4:10=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Return the error from the helper and propagate it through the
> > MDIO bus callback. Continue treating -ENODEV as success during
> > device disconnect, consistent with the MDIO read path.
>
> This is logically two different things, so should be two patches.
>
> > Fixes: 05b35e7eb9a1 ("smsc95xx: add phylib support")
>
> net-next.
>
>         Andrew
