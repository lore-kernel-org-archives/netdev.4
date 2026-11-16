Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794863382;
	b=WubwColqofsUGusJxjKW8GqkZMHD9nmfx96Jv/0Rcv/wHkta4nz/7Iz1QcmiFhl2GD/G
	 m0GB2rSWtFTH1cg0OX9fUo/9/o9UjD5MtE9Vck47Vuc3xRA2VtS3hJ/kEKYFp1cakmG1Q
	 T+fk+/tNAI/1jlzxI8ssr9Y0fujhhynKk6jooZNRnp/cLTszxOdw/b1lnv19WOJ59pYoK
	 RVbwByNE3G/kc/gE1z19EFJN4i1FJvxOxIbbmE9Tjdwmy5ldGzRA+AVSGds9oDGCD41kL
	 jOE9s8TRaF2cDzQlr8UqdpXejgaKcRbBi1SKA47zhUYoTlLcGuuJ9FwlOwDk7FXxmyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
	b=Yab9r9skM4nZ6wBVuKBVznCIauzbhC3XUSOBwUTx4MaEM6I8aXOiRVv/lY1P8ZZJpX9x
	 Qf4/1dOdhVGCfIgDT7mRqNmWk9YRk4egD7Px/roZKxS191Ii8rZycNwoUR0Jp44bhifMZ
	 otZD87Y7L/ceWJ4lZr0zfNdJKMh/pDlv0Xv5a0yDgss0pHN+LI1hyxIDenwrftzs/mt6C
	 QafmUHEKm/2B/sh5CNbeb9iBU60j7ssSiDooyDOs8VY26mmO4ppVCrlltdeMaAzZR0VCD
	 W8PPXlr6blsdNpMp08daFzFw8yeoSw2Lvf6H68Otz0G1Uh9tnf9dAKwZZWgs941kRZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rL4/+C5/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CEE606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54CEE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rL4/+C5/
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ec20398b05so3983713e0c.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794863381; cv=none;
        d=google.com; s=arc-20260327;
        b=mTmEUKMEGG9jekGpLhyp7zPGEe3tD5GELmZ9jeXXaeykSzyn5485DVYmPeMbjdWmz2
         qMlf30Lrz4I/+2tLUs8ByvWX0a7x8zXpOO6gZbkMeLglRWksJrXk+4yIWq2KsnjBBHGG
         l98+WYsJeM2J26WT89G7IiOvPSSYQrRfmyopwZ2uVFECy9JrPzlj+2UDxDlZqUg7Sqyx
         Btr8uaQQP6vSD2Bavb9vx4b3/stdcBoClG2w7qtdhA8/ZTJ6NLUMmdBP1iXxpQOveC8G
         Ef4wUz8Ig/3uFkxv4Xzcu7rj6Xe6laJ/4CU1ie9Yd47s/7Kz5HxtVcyKZ5fN32v2KLGH
         RhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        fh=9YxqiE1SPezn8co/zNzWVGysModBfKa29UCsoeWOoyk=;
        b=bOkc6rFV6+fKOSl3gdKa+KxmXpmXShy4HsTzw4pi4kjp3Q+fBeGOEh4Jfgwe3ZHSNU
         mlfXYoFzComosp9bkWEp599W3ZJdAhjxj21QXH1/iHv2daWPKLoPMDERJkiW7EIIlOAd
         CvVnDI0PEUNcVSQ9L1dcP5zTGw4BDpKhJ+jqT03Uj9DlhSrZuuALmVeKpLYIPjJVDwsx
         rNbIlnwy6S6U2wxnVKHOgZ5li9L9o5/ceXzKTf6TD9ErNnR5d644qPXzN9QuaR0VSgHn
         rfYQPqvJaHrGfduI6CbJqYF9Dq5TI+l5F8r7jLJ5RWhc599AEV/wru//SjMFGYjIjVJd
         3YFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863381; x=1795468181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        b=rL4/+C5/mHNlyuAP/2smxQPn5aM4Is8Ha2rYS7F5QWHpJrhZo/a43OYQ2pd5l/Y0Jx
         pLLG/1X8tcjuUiHOhA4i9kWJ0IwR1gWVcMSxXNRVlNJGCzXuiIqi6YwhCYSzg1qTwK8B
         TI3QljCV/yU32/F8TjMIhOVXdg4NPKCoF7q9wj8+QVqqbNiWfcUDCd8eBxoVT+vIpQtI
         aCrA5gRi76p4VSPLTB5VndE3cdHc/8ef5zJeAYgsf9Kb3b4BKdG+e+EDS+VgKipaBrus
         qp2cQ6m2kJ7R1Mhsn0wfOrXVi11e68EZQpWQQO5iXZQLyhW78n2Oypu5ms++WsY4m0ei
         kPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863381; x=1795468181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbC0YXJeV6+UIPjOKzwg108UL1tvIUSPybpQIgpSgE0=;
        b=vsfwaA+qmBbCCErDBd/gVdE28Ff2z5sKr5zuc7zUmGp2d/CLhgX2R5AONtCawXFK36
         opDm8wC3pGZPkr0qakaewH5XTfrYGooPrx2Cz/MRgkGVpihw4Y2a1UmAWTqZlVrZI+It
         BMDIIsa1Caq4ztXBEP1fN5fsQ2ew/vD6ygLsKHOeRuxVuO1Qhwb+WktCKBrBxg7ew74P
         2y34YIZfq98L8b/yZEqWj5vTRBQRWwfQZCOlzptgyarRLhxG5+DlNE05dU3XcYlhZW3S
         HggXJYAo7dVPL4w38Rw8+CReV3GjEX4J/wp6X0R8NR+hV0Kwl3B5aQO+foIblTJBoxX+
         YsCw==
X-Forwarded-Encrypted: i=1; AL+hErELVR1MY3ZlHNMy/KU15FUHzPbS921dV8DmO6w3r1QExkEVVCTzlrY/Gqgajlb7M3LIeBdXJHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sc9X11Dhc++960GbAd/MbzBHd7INcfBzD9vKJ07N2F0RT5EW1
	VPyWQkl3jbmVb6JEXjE/FBq1xJDEsrDwQHQ4/wbvru+Y7FgfJnYpJM/shvv9IR1s5jk5bC8MWym
	N+CO/ABAU3V6YdWTyGD/7/r7Wra1aW4A=
X-Gm-Gg: AYBFou2l3yqKLxAV9i42v536WynPQAVukijpvADgiUCCWGaF9d6O3GJxc2AIWbl53Ng
	8a8cu8QNoAj9VcF8QyUg0poep1++EJ1VmGHhTAcHYb004GhHhnF7rzYUX5pKFuNmNd1hH8igYCP
	kNK/vOUQjnvViKwq+G2x0LoabqwmwDKflWSMIpyxDwZULNcM4GiHzVKv7hXgl3Ac/o2mtgS0Bjc
	XrWKqAKhbAzP0zQ3aWDfChGVERqM0+amE6xSloBHzrPAVagQhCqb3CfC1DLLjO3hYYg4wjS8sFI
	jP8rqe+6apgRIyAEAZM+WoTuSnkFt7+oPj+2qdMzF2G0ehVPVMvtlThfZPxYCjfqMYoQeM+MQQ+
	3tcLsa3D+3j+pKq6AlNR6zd3bwnv2+Lw/xWaJrPrWjE6SuSVt2STux+UDynBBVM4mSmX+VBuXeq
	mpAWU7r/IBDZqdJR4xRpMh3uaXLGmch9MKEfA0dBvtlaRVyz+uA+kiM8NOLCovd1QCMgoeUCgQY
	niU4eHfNklwr4gXxvhDLo0IiboyvQ==
X-Received: by 2002:a05:6122:793:b0:5ea:b972:1403 with SMTP id
 71dfb90a1353d-5ee346766a6mr4625862e0c.3.1794863381379; Mon, 16 Nov 2026
 13:09:41 -0800 (PST)
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
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch> <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
In-Reply-To: <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 14:09:30 -0700
X-Gm-Features: Aa3M54q_Tii21W65owc4nMI0TRPC095pgsqSNf31IEYTxCFkefhvfgxKPUvxAKA
Message-ID: <CADvTj4oGZ1hwBqrcXp9-M4zhoG=QbVWuyqNV=1xogqL-pJ4Kbg@mail.gmail.com>
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

On Mon, Nov 16, 2026 at 6:14=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Think about it.
> > >
> > > If you don't have a MAC, you don't have FCS.
> >
> > There are existing mainline PHY drivers exposing this functionality.
> > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
> > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
> > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
> > a phy_crc_errors counter separately from phy_symbol_errors [1].
> >
> > This demonstrates frame-aware diagnostic functionality within these
> > PHYs, rather than something every PHY necessarily implements.
> >
> > The generic byte counter need not require that functionality. My
> > question was whether rx_bytes should count received bytes without
> > conditioning the count on FCS validity. ACx00 could then report its
> > hardware byte total through that field, including bytes from frames
> > which its separate CRC checker identifies as bad.
>
> Read 802.3. What does an 802.3 defined PHY actually allow. That is
> ideally what the kernel should support with these counters. Lowest
> common denominator.

FCS validation is part of the MAC functionality defined by 802.3.
Counting received bytes at the PHY need not depend on that validation.
The PHY CRC counters I mentioned are additional hardware diagnostics,
not functionality that every PHY must implement.

The original statistics interface also distinguishes the IEEE-defined
eth-phy statistics from the additional phydev counters [0]. For
rx_bytes, the common meaning can be received-byte activity without
requiring the PHY to determine whether the MAC will accept the frame.

> So i would say RX bytes does not differentiate between the frames the
> MAC will later throw away because the FCS is wrong. I would say it is
> also O.K. to include the preamble, and the FCS, any padding up to 64
> byte frames, etc.

That matches the ACx00 byte counter: it includes the Ethernet header,
padding and FCS, including bytes from frames with an invalid FCS. It
excludes the preamble and SFD.

The separate counter was prompted by the existing kernel-doc wording,
"Total successfully received bytes", rather than an IEEE requirement
or a need for successful-only byte accounting.

> Since this counter is not actually defined by 802.3, i would also
> allow some flexibility in its meaning. Different PHYs might have
> slightly different meanings.

For this use case, documenting those differences is sufficient. I
don't need identical byte boundaries across vendors, and whether a
counter includes the preamble does not change its diagnostic value.

> Look at it from the other direction. What is your use case? Does the
> exact definition actually matter? Does it matter if a different
> vendors PHY counts it differently? Does your use case require cross
> device compatibility?

The use case is the board bring-up and networking diagnosis you
describe: exposing the counters already available in the PHY to help
locate where traffic is being lost. It is the same PHY/MAC comparison
described in the diagnostics work accompanying this interface [1].

For example, in our tests the PHY byte and CRC-error counters advanced
for traffic that the MAC discarded before DMA. That distinguishes
traffic reaching the PHY but being rejected downstream from traffic
not reaching the PHY at all.

A common interface is useful for inspecting that activity across
devices, but exact cross-device byte totals are not required. The
important point here is that received traffic remains visible even
when the MAC subsequently rejects it.

[0] https://lore.kernel.org/r/20240829174342.3255168-3-kuba@kernel.org/
[1] https://lore.kernel.org/r/20241221081530.3003900-5-o.rempel@pengutronix=
.de/

> You have not actually said what your use case is. For new board
> bringup, debugging broken networking, the exact definition generally
> does not matter. The PHY RX counter is going up, the MAC is not,
> something between the MAC and the PHY. Neither the MAC nor the PHY
> counters are going up, something between the RJ45 and the PHY. The
> absolute values don't matter, its that they change which matters. But
> maybe your use case is different?
>
>                Andrew
>
>
>
