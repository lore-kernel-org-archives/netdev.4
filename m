Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199316;
	b=QtnHWimGF3vPjnjMUD/Pgq/LVcdEx7gmyAchN89O/sY8lOiX5AqvgeK6nyjO0oHYlU/K
	 +4l1+SZCI1BbV/1o7YTxS/44e3Xg36QPQUlMNI9hiT4S0tQk+yNyRPtH6kIU0aUKJ7L1L
	 j1gHJxvlvyAWu2MHIa2vFhA+hhE2Qxf0//YBDhf6TqBY8jjGW5wK3+feMwvrb0jTRVljh
	 9yDdidggfc8l+EfCIFENh77lOErgvaFirTeVic4GNvnl+BHlnv2kKY+rA2RE+sqlD5xye
	 CAgVW8ZpIhP25QwyR4BqvLLOsJ7RuyjQh+m3pbWoUf1RvD5SJNmtANnVOakrHWliJKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
	b=1Ri8hJ8GCB/JEF0caeyml9ygYxaeKIxL0f1ps4apyQq44A06wYfzli4uueWcUqJcWCGl
	 ud3qANu3ESqxOlgb3mMbSI5J/PiyEwmfxhaWsju07lb6TDBVp9j0YWzxOCJLxwOfHtAJz
	 WtRVkWLPTCVt7N9Sknt+w+bHmKqmzy24NyDnnaPp4r5K+i6XLydQAXvSFJ+0QeeFX88dl
	 PcxIU33A+gzigBHcZflDPTxZgm1ZjW1Lcscdo8inIUt+KdeJ3nNV+2L4veGwRmWrXLBwY
	 OzXh31PRwt6WtcH0P0dPY8n2jF/gkBFqjjh8RyXWp3mKB58bFTfOe6BAXy7Bpyt0S0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKP+VL7U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0EF606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0EF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKP+VL7U
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa5103so751009f8f.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199314; cv=none;
        d=google.com; s=arc-20260327;
        b=KSjYxmXBz7hl+XExnTLcwSVnXtStjsA6x03M5mRj2zgap/dKwXAkcvRYMvgoybhAsn
         lmw0JVWUFdKE35uSMADwlrhAp8AG9XTDY7TC0uL5DmO7SN7hJw8oKufUbwR1+M9cBwnk
         NBZp+gKbiwbRLOkVYuD/Wdf0i4wrz7ZjMm7gdJ7264EnbsGR7ho302OdTTBtPEfKfPHk
         nHJwlAuD1mjTFsfdxLyjLgAZC3hvZYmPPM+5S0gV7+mHEQ+gZgR6Fz6rATIbK7xyPwnH
         AahPPJyCNFFpKBzxY7Z7yqv6KdcFMoZi3aB+A1XxvcR9Ma0pWAP0bVv1x4syYqeFSI6L
         5S2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        fh=WN+w5mfepYM+sHUSjNvQjdyRKUli0Ceyr/p2DlC8Duk=;
        b=ofFy38TNtX4TR47qt43I7FYQ8wqobt2BVIJuXiFwQN1x37UZ6anANovecR9AQj5k64
         21OOb64aDSmfhCCJKPRK1IF3fUOx0LJwPsGcpkjlvYT+RZHB/f6Kx3hjTN4DNwWKUp8H
         2GJlECS2PqJ3aEN41adFY9qPhIx8syq09egAuL2w+3LKCTYWm6udPna8OSg+wjAZ3zeS
         5vtd74Zjl4Phm+g9JiuLbEEzXnI14wER70qWYgK/WU1IVG+k+VoPuT64Yl8qO9/3McjQ
         XFOG+Gztndye7XoozKmZEAaX76kDlnlmVbmzBZYjmu8Q7iGR1R1CqbYy+TkAM2Mi6++3
         aynA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199314; x=1795804114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        b=SKP+VL7USEbVWLzyNKe8vqlVzzCV9Yk8mcaoFQiMau8f8rXDzwpCak4Vsmv6BR/+pr
         RgylvG9oK1tyn9HVNxsfbZVUNKkIchTWZ9X8kJuoyh1kq64J4Ht2rzEa0T1VyHr22jgY
         8LCDGRU15JxcXqPu3SUUV5SgqRuHz+Z1iEokPyTEcAcId1PaGovoxia4Ty6h+zvaD7I3
         4y2tVCh/h1q718vD/ixJINcglatHqod8P/u+jn7b0Kg91rBesPqOPLmb7sdtO2eGD3hu
         BDKWUbOZHypesxxEv5PhgymmUWQHQko31GpAGU6sziXf/1R5N8yEfF6gUFxCmLJXMEQq
         BKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199314; x=1795804114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNDQo+a14v9s0HW9OP+czAcmraAhXwLLM732JTo+ZL8=;
        b=Gdyavp8WH3uoR6JzhzqqsFEX3URpsPrimwaceHDZwn9Cg7Tc5Clf3tRDgxL3mIZpX3
         xCLKkLmkDvqlEcVdxZ0GiU3RKjdWjEAfTxTRCisxtHWj/8W65mV4wLqEHu42hmN0nnTs
         CYWI83DJziYhqpkzrSwnzZMbEF8CMLk3VtaZDTyrwsqG91W+3krZ64+GqJxGKQhkoEvQ
         YzqPBE3KyqKTXc90hv22ZHMgpJaPfkdgvxn7mUcozmLUD6SZijOB3dIObsJ1Na+jm9SP
         s69t5L3/v2TIi2+RJoZe5xHiaBKjes5I+XEk4vmEudxRkKe7QgfZUlKZv4QtawWEBpdj
         VY6A==
X-Forwarded-Encrypted: i=1; AL+hErHkNl6rcWz0zxO4tOYq/P5BK44UL91wUmCOlaIiOTq5whXZX3aME5LLEQpQxRjdVS8KIuyK6cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KzAiY0ixIvLNeyFaeCgCOMR9MDi8T8FnHnRvefi2VFlH6gFDO
	5FlzGGoI0EyPJIyCa35Xm6OdpLRjx8bkoTpLMb0ERObHQkVXVPJXLnv4uCEt8iG7sU+5iG1qQzQ
	uzPZ8/rL9mNjwWeQQ5Ao9XBazsZh8SZs=
X-Gm-Gg: AZFdTZdBPhtwTy2dumHVaCPuFJun9Pc9EpD/WDRJILFCjmxzPCf+kguDO7mW/G0YKUN
	KcKlC0kaYvynQCMuxLA2RrUbxdvOQ9fBgENj1s+OTcm6srb9rBO0Hz7rje69ms8+w8Dg8vCGVpP
	+dXuARFr4P/akmy+u9Yl0xtYC07FBpglXbJyIpW+ZjDJ+3yiB/Wv3xKvVZqfCKox1v6613Fb9zL
	eMmG0+SiyiGpnI5RIPT0oZtAe3MpDooQja1FO9Eik74j1G8LLfLl/97eCtAcglt7ra3lw1fEghL
	UxGpfC3AFCLG7eP5hIoyj+QCQj9BZ9WMV5KPgs+XjfWGAvNf+wm6yIDZQg6RliRQEoPNmPHpTuq
	FPM15kE0+fwboXDEShPQJPwfC6YK/GCfpRHAObKQ4Aj5QTvd5MSRDBFkt3TF9mFFBhkTzIVJnrf
	L4KGASyK+tR5dSHRpOzx74iCtuEI4RrQr6aH25Yk2pYQ4CF8VJlj7CFcWsBA==
X-Received: by 2002:a05:6000:2f81:b0:4aa:ba0f:c1a with SMTP id
 ffacd0b85a97d-4abb683bca6mr8274343f8f.40.1795199314113; Fri, 20 Nov 2026
 10:28:34 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <d4405a68-5df9-4e76-84ff-fa034f162429@lunn.ch>
In-Reply-To: <d4405a68-5df9-4e76-84ff-fa034f162429@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:28:07 +0000
X-Gm-Features: Aa3M54otSF2In6FsOUyV1sYkafqWIOL4jrRT5kqPhS7eswmhjTdncZ_k_zb5leE
Message-ID: <CA+V-a8vj4nCZ+u_HnzNxKXu8xuOR115gHDF7YACFfiDpskQsjQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 09/24] net: dsa: rzn1-a5psw: Fix
 VLANTransmitted counter offset
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.

On Fri, Nov 20, 2026 at 3:29=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 20, 2026 at 12:25:19AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/N1 hardware manual places the VLANTransmittedOK counter at
> > offset 0x8f4, not 0x8ec. Correct the register offset so the driver
> > reads the counter from the right location.
> >
> > Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This again seems like a real fix, so should be for net.
>
Ok, I will re-submit it for net (and for all other fixes patches in the ser=
ies).

Cheers,
Prabhakar

> Submitting these to net will also help with your patch count.
>
>            Andrew
