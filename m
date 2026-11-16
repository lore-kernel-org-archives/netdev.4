Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794795824;
	b=H0Bz9IPVSQhPGyFN2Dyolyb6UoRhAKiatM68upbc5rhde0c6PrvzkR1dfvB07cNrwoFf
	 eTQyCmyRS33WyZekXTSBtGOpP1RJjCw9y+n5zVUWFyAgALOeb8aLxtzhCGWMjcKp/YF1U
	 Jz9ZLNnF/GdaYKZ4v2AdsADrPyolJsqzq+BMMQ4XYDl5FYLvDEK03qntAXbLHCGaa1cg5
	 ZQEkbMgQ2ONT9BuzslYMggY+R9/8An2CZTaeWV3zKYG6CwQll9vm6bKm5iiVavYup0D91
	 MUcftHIo+OQGBKYG9P0c4ifx1Dx8WkGhFw1Iek81+9zU4zOQVzLAGB4NS3u6sMuJWfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
	b=zx0qKpAjUOWwkbzJDiqss2sZ94GlMNvKxhqAWRr1Hx5mRUNOiUwPBNipZCzFQt8kDs/z
	 HjTLKdQr/kViBotg6HuxEW3zxFRcExUKouiEU5fLOqPAroBGxVeM+96iN68S5oQ6K5u3a
	 9GFr6wdoTAazOhjeyH71b8WL2zW2FsZVkK7wBkfl5wHhBQK2/Qne8Up5DLK/Nx8d34X8R
	 QMeVizf8e87aJIaSGrxP1vp32uezJX3wqCeO6lqstSYxJYsM+PZygLxpbZIFNDGiX02oz
	 lJpTyUXFYZJvJimACqa9fyePwrDXxVuhAa96hish6togXg4VO8L+/59aQAW7KIApoHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7HQuqWs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8768606A31F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8768606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7HQuqWs
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-74ab99038afso2753494137.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794795823; cv=none;
        d=google.com; s=arc-20260327;
        b=LJjqVcMcU+VL+v/pg07oPSrj+I6FkImj2Sm6DHp6YGu5BhaiaUfIPSsVoldCSZ0DlU
         aRadMeFpfBgyBL8dr0erDUBz8DXbhnGJxTdjiP+NWBybPS1ROYPM3HfDEztBOVAcm/Ac
         5otelsEOWMfp58qlb7OxldRsE4RIiUvbcPcz0Bf6tHD3qLF2qmDmf2Bj9PVE7mI+Jqy0
         2yoCNR6wErGFAFNezmPLcGoF04aQasoaBa8m8rYu8aHVe/yMXx4uddIZ5qbb/EiC5DIa
         vAWyJeCCMg0GXa3OeaOYbdzZNffeqmJwnMHLf33itDjstwQULkrayxGW4W8NWij9BmZU
         8/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        fh=y5OFCL8SvyJfji3XvsJcTHi7lA6sNGXt7erWwpA3t9Y=;
        b=OhtIXNWawVPA3tn+/AMPfXbFkwAQbiFVvypJLrtSqRjZkXL72NlmWXJDTq3YlhgI5a
         ONXaG+ZcWsAje2iV1kNzJp3Yiu7Q8fhQjopkapZnSv+EKSWO+kZpruy5W4GEcZywCYB4
         N7TUKFB19IfxIm7JjKMH4eC50/acbEu6NNjrcwfqDn+RL3Kd++xGl2ZSav4k+QzF5Ty2
         FRF8xNy9HnUv+ENoL538rt9JepJxetvQnt3dOf1WWIg+oUxtSfgKP6sy2itNBE9dl5RW
         5oXicKFrXtPWnBh6d4I1JH7x1fIPYiS+/zR6RZzv8jQcsrwSoxxpArkybSg4TMe5IBb7
         hA+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795823; x=1795400623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        b=H7HQuqWsVzZsiIHC9hq/wCIUHRDK56xXHwtTvbfCDjE/9I6cDZIzEqYk41iMFBmPin
         5hGYDCj3e9yKBZUnR6qUTAthcdwQzxvAJZqnCWfW9ioyRI/ONrA2XFv45HNdWX5wkRlb
         yM16bgQZNKv3SBnNArIxXJLKJ70E1UbrBscAZxlAnR1hqZ6m5IRadCDvyUp/WsRjOiAZ
         HgZVRByRzUagfCnCoL4TeYHqxoAVffyQHfWvlqKisQkQgNu0ipeJhsw+S/XjMXEos1c4
         8m4bWMAFmJ7qpaxUZ4iZFMivoGIgoZMl1izfaPplxGRTtVszodJ4oPoss/nr39RVF4sL
         2eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795823; x=1795400623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        b=zhq+infeZWaeiZJSW4nhabCQwUX4Q0zGZ10yqXcJqjBu7VpOL64EoBrbu3tW7qnzDW
         0IK9m2dhM7Ri0kEQB/mx74vXUHqT7u6c2tPUVi0zpphoQi/PFAqE0MrytGBhckz3FjXX
         cwZZAKi0tcYGM4VKc4tP7OyM7PA3cS+DAoL+Jl3+50y0Fa9oadI3S12RGblh0sgdsr7D
         8qYKNX5P7yA/j/9wzrY43pAz72IAxycypsXp+YCeaphOGAgdjSmq3VoCjtpXQ6RCxCHv
         qylggMy7IPwAxAs7wmFcOVakd84+ccQyZ/SG5yvuN+hh18GbtlaeAgQwwz/DmB/2vhfY
         I5cA==
X-Gm-Message-State: APuU4Z8Po+1nVgdG/tsbgffdaXgp8xB0BqIDEoUmDCYXz2Ag1BpC5qyZ
	hsWOCVnkA7AKFrTFu2iBEiyvw844eWsNUrSBhcrymm0am2jdqVtTJUXKKHxbuwPsPfmGA6QR+cr
	NaTo00jzFsR0LGloigbd2ACjHzUbXx2E=
X-Gm-Gg: AYBFou0ISKA3LFW2gnvpTO/y2jtc0u7/u7CREh/gdwvqLMuvn66xx9ZWfvfTneFddFA
	7vpnMNHfixyKKn1Hnt02e+m9OeXWHSFL9xT2EkKSRnznzeLWg60OfdhDaYMJXub8IqLl014Xj9Z
	u98vE8349V4Np/M5c/LjyaTIxIvjGadcLVBxWEBlbMXURVWkOE/iwWTCD31oQTLoZ3LFyNEgPIJ
	MfjTE67mTHT9P//UySFetUhfe/6Nx+eplX1o55312Jg9p+rMF4q3IhRF0muyLDGDm2RgrGJoZ2l
	r5WDTGJStJal7wWcqnB33i9lZUYg4VzqOzdllRrEBf98bpgJqcJI4+vvOcOyDj+J8SSzI8yCGIc
	rYFKg/TqVCI8SCdcZLnp+3cWqrVlYSK/9RqUOzX4dHDaqqwyXr70znlfPkDndll3Dsm0Pt1AgOj
	BR+mPyL+xtW8AKj+MURHNf95IcB1QGi4sovwq3a9xNWIVIMHMMNzz9g8fR4ANVuG3YiwNj6nhY0
	h5ndeUqUzXRvxs5P0LA42CssmUVxQ==
X-Received: by 2002:a05:6102:510f:b0:7ad:3ad3:997a with SMTP id
 ada2fe7eead31-7d64d45ce68mr3458686137.5.1794795822798; Sun, 15 Nov 2026
 18:23:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
 <179479040161.3291.5723238689308327095@kernel.org>
In-Reply-To: <179479040161.3291.5723238689308327095@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:23:31 -0700
X-Gm-Features: Aa3M54r7-r68gNu4ymZsCQOh8t93vqxjaKLCKDTADrWnDebXaQvgc4p-YSz5rsA
Message-ID: <CADvTj4orHRWsBCitdUt5rMXisGK-yzjysvGZcgQj=cJ1y1vb=g@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe CAVALLARO <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:53=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
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

This was found while investigating RX checksum offload behavior on
H616 and reviewing the shared setup and feature-filtering paths.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

The capability loss was reproduced in a source-extracted test using the
actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
relevant setup and feature-filtering logic.

With the original code, disabling offload and following the reopen path
clears plat->rx_coe. The feature filter then prevents offload from being
enabled again. With the patch, the saved capability survives that
sequence. A requested enable that fails hardware readback still clears
the capability.

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Tested on an Allwinner H616 board with an AC200 PHY.

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
