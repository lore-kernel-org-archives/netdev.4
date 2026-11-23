Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795439801;
	b=XCFysCvE06+N9ti6twSWCLWmui8/pWsMO6cgaHr5naSIPwDDG2pwkFgLJ6hkOFKaXVoX
	 y+1lYcSWkvWCLkyIAeNFxHgudLdWXL79VkeUjLXzKa9HUN0UqwUhqeTcIZp3lo4+eeR9n
	 Zsv8TjP8z3kjuZGBroZ0QOSvwE4EnWHPHOr3VPgTPSiLyTYpIl/0C1gEE/ANKzHGf73Ek
	 iZGaC+WcwjtrWvBmMDosMDpSLXOa++Y/Hj3WVb8L+SsLTooiU0P6yMfm76J5EWhy9NM0i
	 MdPX5kIpX691Bbgop1fxgneI2g7KyCZtgEzAvlmgIB+TeXmFF3S8YvA1k1adPCOxO6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
	b=gL1hiP7NA1c3eFC5NjhcTYNVAEykRRHeDpVBlAO44kvQKLaoTf6t9uAFOCfySVLoR+L2
	 cnC1wYSrU3TbQlHRz4Om5cFT0sNrZNidSla8Lezed8fNpm+bvF5k5oWmRZ15Ya1D+y8WZ
	 Mr8IDnGU60jL5l/tSb7SkSeIPhvY5txx8aoKVOS9orzTVk6MZ/M4negEeJM4/D5dTR93X
	 f2woHmvgb9aQZWEijv5Qy29vbVvsq/lazpZ7vF93pr1QlTZlB44s1z/5qkLTJFDU/Fd2E
	 MA6wrw8X9USixphnIHPY7HbNvPeILHdjaeEA4AmFEvuAnBM6LBmT419xHpnn+D2+xLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3OK0JpF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A4A606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A4A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3OK0JpF
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1934519f8f.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795439799; cv=none;
        d=google.com; s=arc-20260327;
        b=Mbcy9vM8fYNAh485GGUDfLZTij5DjLPxs5WwQqEDhXL74LgvwhJ3Wc+B60IzkaG/Iz
         iwM4hygXxU2cULo1uk8bNBO3guBP6DfgBuqryM4KV+hTk+P5Ejgdy8XvgyxqqEWtNtAz
         uZ9j0+B8OCvUoIEOGz8AhnfWH4f+9pZfPjS3pv2HFlSO0A1C+JI7aqoSAUkCnyNPWpXe
         4cLYGEM+0HDuIpq+st8359eCYewciRHyDXb9Wobk5nx3YsiGTR7PlFrJfPNPlrChuiOl
         iyjqm6GZKy/Wd6+FnAspbQIxL4PXyQWk2zR3TCi7yPMYym5SP0YOisxAQV5IRpVk5VSX
         I+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
        fh=XASpbTukVhynzWx56i1C/sFPnO72uqjrdspcRJbzFpU=;
        b=ckFcCk4omwsMt01Gw484ON3n545rM8MW36tpYReNMF4thszRd0Gvkpe+aOgtIH4GR9
         zUglg0dBN1zUuTrite48KNEMWZ2qCGXnlfjXaMiBaB0uHWwG4kDTNFhxYHqRqBg2Rcd5
         EMqfhpm+k/5ZKZM+Flc+d+F6aGKhAQJBnIn/EGOBYRol2dzsylDil7W0oOfGvx7oI2Rp
         5WHjvqVYZwMmonuzBjWNvJi5fBzw6T0XXreEOT9qCKPKE0uwGYWuy9ILQDG1yUTtHzTR
         GI5/1p6UqPQSvmUWXom1HNkSlXgfWIXMpF5Aio8LDO4oIFsv7RLF+VHTYDQuulX6Zz83
         MuXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439799; x=1796044599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
        b=f3OK0JpFmCFgD32tMRqFiQBBxu9w/4uQiav7PKHwj4d57cJASbOto2Zd0VYy/O6xh/
         vkMts6TC5LSuwaZ6ps3OWNc3TRFtlaUg6uWYTqLUoiz8Gl8dM0uhkXQGPc7GxYBFtOcS
         bRsaRyZgTMA72k74IHIB5AZLWtyRN5NfC45pNI0kBrOvNhsE1orG35OROSAoecYDWr/C
         8o0dwB0FZAa3f5Vn2/v7XwbqE5XArGLljlVAr2SF81dUA3KxQyeltFYugwHC0eA4UxiM
         xFQao6As575MonCt6VWEZ2X1SxO+uI0ktspzxoAt03SWzUJg61lycEfUdHNnxqmqstyo
         YtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439799; x=1796044599;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMUZrzoWcw+UiyFceMO3Bhc9RRCN/ckPjei7y/ASaQU=;
        b=Z+/prQnFlVLM7JtC/IB3HCiQGTnDboN5sHMEt9LwMfi/RVZ6Y4FL+4BvYdPg52K1i5
         I0NfzDPWFQmiSLsxK8udbUVppyWuNQP1O173yK/TF3RxOm10auh7H/TUILlPRbbxkzjn
         0jGJvbyLFE5rHzO4fWl26pduO/LvJ7C3BPg6dfG8zPhrMEQ94pq8PsTmCykH3jhRM0ml
         B0vhHP1X6lOAIjjP+GhEJx8CIXxHpTG3yqlf8o1YI9kbeHaJuz4HUJw5KEyXLiyJR+5L
         Ps2SEjNcy4723Fzr1FFwNDvk7HoMZ7jAGzK/stzyOvUSo0OOw8wqcDozxpiGjE52jpRC
         YfdQ==
X-Forwarded-Encrypted: i=1; AL+hErGjoMfNfddYPXodYQHpFhrgnenOB1Zo70NT7UTb9mLCLmesT/JQMOOrB2gi387W6VtvJWkPAao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UhMldu8d74k2gnTQg7VYMOE4CwOTqu6PyTkSdHbxGjbu1iK5v
	OfAfOoveIazodnT+ypn3PGdPW4/hdUoZjM53ajX40MI7r/hggFw8SfrPZ2x2z7ko+FQH1RjOYQ2
	mucrFZjD54mRmmtDdLkTV6JAWpSvkZ7E=
X-Gm-Gg: AZFdTZfokFSUv2EWeOVj8wOPnC++P76GbmRJpHGq+q/cXmSxdzIknxP/74aJjXrCHjB
	OrYGFpWa1By32A75a5z1p7FZa+TmPVbzqsc7vSv9gf0gDYlu7jKOzF+tRKk0ErtDrxjsJjNTM+9
	6GLPHJiOHaKj41HVasoZ8VUBtYWdqZQnVLwhYTICbraB5gO1+uMF0uqaJ8U4ickRXsDuPti6Nqb
	ziBU5cmJCV4yGdTef5sYu6ejTBjsajVf+Acw510Lx1ZhfNHUiNDPDPVRvfTihj3SGu5PVOSumNt
	4G7BBwGHEhGRqMRJg/fZ+2CBjzU3KdDfFeROHO3PUX4XAI9fC0U6TSZWEa2jlKwD19JaPFC+Vrj
	AE9Fof5nhmaUhQ298ow/w8KInkiqqXJqB2Bg6bFKlx9e6IUpdWhF6qb6COyZTpkNFqR9a0DvMFo
	Ikvq7AnfctOhW3/WIzLMaszcnnaW0ydcQwT81wlyCa1UQgPGyYu+qRuzOS/kA=
X-Received: by 2002:a05:6000:491b:b0:490:9fe2:6a2d with SMTP id
 ffacd0b85a97d-4abb0a710c2mr21603138f8f.26.1795439799381; Mon, 23 Nov 2026
 05:16:39 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123130852.3420491-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179543956483.3294.440601604363377666@kernel.org>
In-Reply-To: <179543956483.3294.440601604363377666@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 23 Nov 2026 13:16:13 +0000
X-Gm-Features: Aa3M54p5cXU3HarfB_L72M8wVmAoaF4EoHmiSiEqy9m_atJHStDac1KvUFiv0V0
Message-ID: <CA+V-a8v9Rg1RiM9e3gM69EpS0uw1i2j+J67+f1T+J51WoKQWCg@mail.gmail.com>
Subject: Re: [PATCH net v6 0/4] net: dsa: Fix various issues in rzn1-a5psw driver
To: netdev-bot+sinfo@kernel.org
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Florian Fainelli <f.fainelli@gmail.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:12=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
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
The issues were found while manually comparing the hardware manuals
for RZ/N1 and RZ/T2H SoCs.

Cheers,
Prabhakar
