Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794805000;
	b=QEf9JSX/LTz3PCJ8M6ypsbNIa/YNtSUQbbvr8umZoAVuXY/gO1uk3FipMmBKUafZ04M/
	 dQiPfND34huUmjhyzNF7jmoTZ/Wz4T93La8u9W7/y5Y4UF+3xRN0GmqbXdzeXzrod6zCl
	 UaOoglSdPUu/NFX57/ztuHLgl+4TNyCsCmuxh9ilxyS6WU//vTbEC0cJpjDbj/7swu5Gz
	 sbxG8VgmJL+UTluwbUrxWkr3y/ETGeMfdQrD5Euw4uJVMiY6iJuaQcK4glw/GpA1Oho6p
	 fXlkokP8qrZLu4yts54y5f8u4IBG8pDmsIKpw4ovU6YoCtTsnX6qT+NamNOBPZZYNiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
	b=EZ7xGRbO2eNHB+vmIBttS/flqxwGbhX9GdnswUBm//tpQplzCg1qbnWIChI0/SK3wj2h
	 mt/EyYPK0fMYTcqnQko8+2HQASl1G7BgguAwa63zwlELrM9+FSkH/Glc0X4IOTJB7ZgO8
	 qozDWlEdx03HnQjSDtxO0VJ1y2jh4e5wFr+6yk7CnEvqs6LiVQUGeQAMEfPHNfjGjsgWL
	 C4kKuTaK7xYtG2EDY507CYt1AJoaGeFlY3F3xZlQDzzrs8iXgV0Ld4RTWfoGn/DHJArK6
	 dPFVK0KU8To5HAgOu8u2WeDfEeP3MMM7PweaVjSZX1abjEFmeLj/lYtlk6C30KaoPIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1zJ5RDQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989E2606A321
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 989E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1zJ5RDQ
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso655566241.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794804998; cv=none;
        d=google.com; s=arc-20260327;
        b=fQ+KRY23YMgOqf/SnIAZS7FCyS5QscET49SzPT7fkwIW502YTN6OQpzAIwKfMO5HWp
         vWM6XrF6fMHandAHTe5NIpZwrESqydjdoplxQUKzDbWciQB6WgjEx5rDq+5qh11io4kd
         jQeJx9wNOWluo04hRun9Itdx+eZzthcDvKIwIRD5ViiTEUzBDFiRB5VmFj+jvugIdS/3
         kiUUg2AhD0ZJANn79v4a3Kr3EbeOLcd9rk9RiQMNlRCm1XEdeFHJeLyoimVFPlh31BLi
         dte8SiViBzPSnFpMpUyOXCQoF7abvVSInr5bi334gjWj37XOYh6nsCMcorJZ6UsRzR/l
         EyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        fh=XU95pSRJVQWESenq0xI9BpRLbW4h+JO/BiyVsIsaDzU=;
        b=c/c8+UQ/38xljiY/maIhy02dhA1dY1ckvM/MSDnE4ns00sG7wjICiKOYF6sQi/Q6Xo
         yx83JJ4ENiisBGuyDKBccufBqkYzgSR4Y9l9U+R9VekvxnTdJCDsCgDTyrL51LbEFKpG
         AyFH1+E4mOV/IC7XhGsUJzRE5SZCqqgme1OJu94m3iUnDiYXx8flRHdvZgGVkIK8UVea
         1luvyX6e2jlwiOcK/UhlGbKaZeCWl0/a5t0B8IVj/8DADVZHe1m3wrJrMQWJ0P/dH59X
         KmDuNBxEwyBaeJF3pgtBZwXTsppu2PcGBL61dYJ6IpPoLWWgYRDMquFgyV+tQPkv5eam
         Ookw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804998; x=1795409798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        b=X1zJ5RDQeUFDdGphkWM10fgrRC2oV9rjQRtmNdqgmqHFizwwAWCJepUCRD3U+gWzZ5
         D2t/kh4W5ZyJQhMXltCOoJCkiLC3xwuN9rRcX0YSjuK5K+5XEq313NsYPeKJdIswB46Y
         oENFL6IkfhC6ya4ZdfzbMzCjfPw3/gEzl80e2+gdRcKuF1fJLNDJ9Tc60WvjaV2nZzJR
         Mlq1viJaqDPNbbHcCDd7Ty37h+it+P9ki8kaGstWVYuMIhzUR2m2lw+c/K9SijlmRsiu
         Ib0ACPMAn7DUyW4fNs31OcmXhAY6/4YSnGnFh7rsH3W6N+v91bW2AWT9KunhuO16PM6X
         SYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804998; x=1795409798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        b=jg5HCsQ2vSVP0qAo53/xdSitfhHXEeO9dyVNZyX+yek/b3R6SAtlbLAe96JcvoNVkK
         VAMcvaf5dDD2jgTRgu0MIv8an1wRQe2CD7uhKGgtaRy+IblIGG/SsmQi/mcu/DnfgLa0
         niWcrOD2WpZu0jVqOomntn6IVHXphRog9P/bTUcQWeKBgp4GGZIAUQH8eSstJfiSNJM2
         wExovkqfUHIr+mky0nBpzaWTsJz8q00rwfFkdrR2b60KlqGeISQ7IRtLv3DnZrHfdbGv
         2dlghknbKc6HpwS6OYgCxMaJjMuy71020z/ILS4yRXA+Vz86UATp53JMCiRORtAi5D36
         sYNw==
X-Forwarded-Encrypted: i=1; AL+hErF809qADlwz9tB2/nwoswk+T9kF8oCpuAG0U/rdgtpvkhbVnBtNu54JFowTHXeNSCK9ALN1tFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mepHh+nJD980aDm+vELf0ugD2YJm9GOt8PFFMN3FNqyrJ4vzF
	3pkU3Oj3OZoAAmM1/E/Dc7f03/CXKBjuJpoRBcAjb80ZqaLKseuJTPDNf5UVrwY9jKE/J2+D++l
	+v4/coY4t9nfdBuW9KEKALjijWt4wdq0=
X-Gm-Gg: AYBFou18KX2txQBBgLkK6gy7DSvrP1j1NBojF9iHdxIkwMOlM41QSXORIpcqc0mIEC8
	SywMe3Q44LRNDaFnJ5ZFmZADNoQ5NBovt2hdrSko1CtsuOv7yGGLB3YKQnoaHOELq4TjBdb5QSr
	Wt3cSn2qGRnLvFF3ws3P9s2YvtILSBZFJoysSol0dLhAWsswFK3mqr5TGosUT+41enqADIdISQb
	ex0h/g0ZyCxq7a/vo5JexOcxBEWUZw2X4+876o6HcA91HnUQIS684q+sgVYc6rYnON6CUXyoEWe
	aHebO6Jb4p891F1gt/ZwrvVZJ2yYAW7MLQsmqxKrh0YEIAdRsvJNBVkZwq1igEL1nySBuI10+g1
	c00mtzqpSxV/WdpcH1ZKQEIyIl5mZttJ2hf5fW+UVhzuGbNDfXtNRSSfrVghy8olIO7D0sP9VQf
	sO6cjPzi7dlfJ87rnf1UnbBMXLJhZn+c8Ng14EzCIS3nhGwDgax+CC3/dtTb3d7GYvQ8+IOPleb
	7YXBxcJhUQDsAYXICp/BXHi+m5LmA==
X-Received: by 2002:a05:6102:3eca:b0:7c3:6466:3155 with SMTP id
 ada2fe7eead31-7d64d8da06cmr2426406137.33.1794804998470; Sun, 15 Nov 2026
 20:56:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch> <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
In-Reply-To: <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:56:26 -0700
X-Gm-Features: Aa3M54pfgPpl22QOYcS9U-YpyBuFQlb4VrEZUDEBvkJV5vCHfNjijzrmfafBS4A
Message-ID: <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:39=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Nov 15, 2026 at 09:12:35PM -0700, James Hilliard wrote:
> > On Sun, Nov 15, 2026 at 8:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:
> > >
> > > > The generic PHY receive-byte counter describes successfully receive=
d
> > > > traffic. Some PHYs instead count bytes in all received frames,
> > > > including frames with errors.
> >
> > That restriction comes from the current kernel-doc definition of
> > ethtool_phy_stats.rx_bytes: "Total successfully received bytes".
>
> Yes, i found this.
>
> > Should we instead clarify the existing rx_bytes definition to include
> > errored traffic and use it for ACx00, dropping rx_bytes_total? That
> > would leave the existing packet counters unchanged.
>
> What do you mean by errored traffic?

Specifically, frames with an invalid Ethernet FCS. ACx00 has a
PHY-resident CRC-error counter, and its received-byte counter includes
bytes from those frames.

We checked this using PHY loopback with MAC FCS insertion disabled.
Frames with a software-generated valid FCS did not increment the PHY
CRC-error counter; flipping one FCS bit did. These observations came
from the PHY registers read over MDIO, not from MAC statistics.

>
> Think about it.
>
> If you don't have a MAC, you don't have FCS.

There are existing mainline PHY drivers exposing this functionality.
The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
a phy_crc_errors counter separately from phy_symbol_errors [1].

This demonstrates frame-aware diagnostic functionality within these
PHYs, rather than something every PHY necessarily implements.

The generic byte counter need not require that functionality. My
question was whether rx_bytes should count received bytes without
conditioning the count on FCS validity. ACx00 could then report its
hardware byte total through that field, including bytes from frames
which its separate CRC checker identifies as bad.

[0] https://github.com/torvalds/linux/blob/v7.4-rc3/drivers/net/phy/qcom/qc=
om-phy-lib.c
[1] https://github.com/torvalds/linux/blob/v7.4-rc3/drivers/net/phy/icplus.=
c

>
>         Andrew
