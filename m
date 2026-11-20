Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196471;
	b=F9TA4mZKljzSt+ynGtcq3b5OKXbVqDkdqRoHLSS7jgC+EdJdWZBoWgOeNy6x8BXG8l0+
	 7uu6BjOnZLEl5OIdRZW14H9SEfeBOgqtp6UHY9qK3jy89rVqNrpVa7I6yfBPcpAQmYwlY
	 K9jFw8CNeBUkVtNov221ixHEPNz+rY6c3D3blorh86YERmVpuzRYiQZ2Uqat5nz38rTLf
	 ANzWtjvR/j9Qd85K/JMMSXFMdtHo1yIWiaLdi7dyo1Gv8Es/M2mCvSPR4ptlrMxTJAKIT
	 BXBRDdmc6NgsRGqqtEDBXeWb2q/pT1U+vOrUeRPajhMmQud8qUq6hlqhx3qKru7H+Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
	b=RptxPAnF1JO4V1hfosLkQ6c05xllS7/bBlvD/EPweCT5qwmAEAY4LHGSTteEP0r2GNPZ
	 RL9lzV5h032M806lBxp65lm+i88Mt+M+tpyFDFlQti1Xw5Y0wjjhBseUJ1LqtS9EUya7S
	 aIjUzx26j2nfuz2NUtMfQDAPORtgBn4Ep4Yvgyoeh6NIWk9+pMWgG+O0eKVIKt8c1q3VO
	 qqSm4LiZswmQRlteMDLna9+lCRaZLDpAEg1ocnfmBJt00jbL5gD2bnV8bEKPOFmFygXyT
	 sCz7jI8gBmQ5NrMe5a6I2FR3Qim1WudzCgIlvOP6BoDfJeFiVK3kRDRM2gKeJymza6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H0YVwCbF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C607D606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C607D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H0YVwCbF
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533202fe429so171cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196470; cv=none;
        d=google.com; s=arc-20260327;
        b=MAgIrCeyIYUQdJoH1k/zkjpbUZ+2+eVLQVMPgZu0L7bhL22sPE6BUObzeUq/Q5ZEPA
         py7UO2ONWGQCKO46UxqFE0f8hEai4BDOEDDTEaORSckMV6LctBwwVnDTl3XjDzfqs9sv
         pMtdIrTxdrzFAKm0vagziQnQBiSIlKozu1eQ1cEm76LIygPz/0XEILYbSRxNkNffzJ6z
         jjGKC6SLAqNzieuxz+URcGH5BsuSxvuSH6DeqKR75EXH+XEofnA88Q5LrF9Rtbk5cSru
         XXNUGGsQiZ2S4hbf41+hJ8ZhtTY5BYEjRxIpUNw/1lbEEj/Qo5YZ4tcQ0EYGZqlFa6KB
         E4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        fh=X46ybOzdhMx7/TD00KhtvjLw8igNrz6uL5Qy+Yqgvww=;
        b=czkF/3mdMTZYuKrREW9r3RqmodbBUIyqIH68sgg7L/sKv3rWPxqCiASI+AHiGDkE50
         2VUvgwit0JxNx9kEegMgclErOhHII/nIX2hGNW9sHvgLwgNjuEjAtA39EyOeadLpC/v6
         IRW7HIzpAMj3VbXq2z5Y/ksxwOg0zEzvlLHl/6bLrV9VWv1SQcK760xWnNZyDu5XF71b
         lNbCD1Wsv+xBHdVBgU1aRFW2Zd923f+I8W9NpG5dyqAmU66FEZk98Pk4VevIvtckz0pf
         Fzjdqp4BV5+hUIn085H+FqTHGbHkJxTD1tTqPiYr4gvZoWlKr6HrNppnqytCUNtt7Keg
         O9Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196470; x=1795801270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        b=H0YVwCbFtGsLhM2WgfyZ9CEZuscowg14WiA+lGcenJ4NsS++ZK28EXcnwg7wRJs1+8
         +z5Yyobbdw8XfgEZXrC8PmpRdfpofq5yIe+YvuleuMfjNdXoKc50YW3DxeRi4OthuRqz
         0tuKhB8OrCns8cXlXrDiBhdk9AcVh86nnuG7ZSmr8R2FYvQi1M0nS/u6ajkzKfVJ6nmL
         NMqoouL4ZyyqnOsTslkUO4QzXWMDqWVdE4LaNW/uy9MML4lLgwtkOiMZKng/4b3yRM7Z
         xhBSTJieuagig0YgfuCsKkLw/XhFOmV2jReuv3khWSxABqSkp6b77CoVKCc+9NPZMEUK
         Qzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196470; x=1795801270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBhJnzU/KValBhhwaOLZ41OrcrxNBBfePnpP/eKtfYY=;
        b=Hx3fc1MKtaedfoE+GLiZp8RPZtOD0eHxkt2nxP8UiK7XHx8+ynULw711jzdoCehFQ2
         yeFyyOQuS+8XaQd1PyvU1A5WEORGFNBgou1o5y+vLuK1QqQ07K0SwMcLciigoafenHr+
         lzR6JipBruIxA3MLIat8FmtbikHcxZsCvbQrmVFygC+Li8NbdXFalWyNnNSwRBWI3CXT
         5bgNBxHs/0TdKQUPufAy2L5J+WcsUcI5sKAd1r2vVl9UzPMoQszhpD2hERzfJOKSwOdz
         /QAz8kZy3GBXhtsQeOD6gI0zVJHeaHOSN8xkfHQibw9dvjb+wFXY5CkxKWXgOGpZDbNC
         3laQ==
X-Forwarded-Encrypted: i=1; AL+hErEkw8lsdCQNTR2joSz5bTsTjBlijpEpGtqI5SIBlEcs7kgbadTKljChOySvdBe9/WvvzG9sQJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oaKrrRxmVm2xj8U5fl6+UfCw4LrlQ5CdsPXHfRqdu0b/B83N/
	ixsvoOgzcMNE31x1LnUjWzMpA/QE00CpjwqsEstegO1UjI+A23tVQMF4q92q8FTVJ0iGcwV4SSg
	qVgqzvoSvDXLHv2PolC1tGF2gRNV9G3cw50GyUxMI
X-Gm-Gg: AYBFou3xY1lEPb4SW0381gsLXrHd0eQHJd1aVTnykdiN7J2Cb0dYUMEx5XlgZheSRz0
	JtamuxWrU9+51LyVUkTaVLUdp/uXk6BeXYV4hfDrUGXKNLA8B+z8TacjCe3hEPCctJo4AeagJQz
	ra4+ZAvO5AnlCP36uIumyZ5l0swnbQWu6fsqdJZ6CSPOuSuDbqAndQQP1MCw1zTYQEzpEJ3sjTp
	2wW925ZW2a85IeDogq+XQLdOnVljbrN/YqF8s7LhXTpgCl1emOBH7IXkw9Ndwst/Zn3Ao8E5k4P
	feVmfj1Jw+t8X8+HisYjdDXMBcnwPElgkUqA5UzQSrB32j4C4Oe86r+o2mB77zMVANf3MTLcBOQ
	ADjMK1lT1u7HWg6IET5P5YLRHEOpa/gWaSzao
X-Received: by 2002:a05:622a:58c8:b0:55b:d494:187f with SMTP id
 d75a77b69052e-55d7911a3d1mr23325621cf.5.1795196469202; Fri, 20 Nov 2026
 09:41:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170729.1524516-1-irogers@google.com> <20261120095750.njqvupqpfuh443rh@DEN-DL-M70577.microsemi.net>
In-Reply-To: <20261120095750.njqvupqpfuh443rh@DEN-DL-M70577.microsemi.net>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:40:57 -0800
X-Gm-Features: Aa3M54oOzjegUxdpX7VNYBH8UxXyKYAg5jEgHWesrq6ha6qjCQCMQopqRhJhoB8
Message-ID: <CAP-5=fWXrX+VTWP4r4daZPf8QHEEWEyfWaQ9L+oa80Y3YAZcBA@mail.gmail.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:57=E2=80=AFAM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> > When all LAN966X_MAX_PTP_ID timestamp slots are in flight,
> > lan966x_ptp_txtstamp_request() returns -EBUSY without queuing or freein=
g
> > skb, and lan966x_port_xmit() returns that negative errno directly from
> > .ndo_start_xmit. Because dev_xmit_complete() treats negative return cod=
es
> > (< NET_XMIT_MASK) as packets already consumed by the driver, skb is nev=
er
> > freed or requeued, permanently leaking the sk_buff and its socket
> > sk_wmem_alloc accounting.
> >
> > Free skb with dev_kfree_skb_any(), increment tx_dropped, and return
> > NETDEV_TX_OK when lan966x_ptp_txtstamp_request() fails.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wimplicit-int-enum-cast; not tested on Microchip LAN966x hardware.
> >
> > Fixes: 77eecf25bd9d ("net: lan966x: Update extraction/injection for tim=
estamping")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../net/ethernet/microchip/lan966x/lan966x_main.c  | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/dr=
ivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > index b8696fc7e9b9..9c722d23e0bb 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > @@ -392,6 +392,7 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff=
 *skb,
> >       struct lan966x_port *port =3D netdev_priv(dev);
> >       struct lan966x *lan966x =3D port->lan966x;
> >       __be32 ifh[IFH_LEN];
> > +     netdev_tx_t ret;
> >       int err;
> >
> >       memset(ifh, 0x0, sizeof(__be32) * IFH_LEN);
> > @@ -404,8 +405,11 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buf=
f *skb,
> >
> >       if (port->lan966x->ptp && skb_shinfo(skb)->tx_flags & SKBTX_HW_TS=
TAMP) {
> >               err =3D lan966x_ptp_txtstamp_request(port, skb);
> > -             if (err)
> > -                     return err;
> > +             if (err) {
> > +                     dev_kfree_skb_any(skb);
> > +                     dev->stats.tx_dropped++;
> > +                     return NETDEV_TX_OK;
> > +             }
> >
> >               lan966x_ifh_set_rew_op(ifh, LAN966X_SKB_CB(skb)->rew_op);
> >               lan966x_ifh_set_oam_type(ifh, LAN966X_SKB_CB(skb)->pdu_ty=
pe);
> > @@ -414,12 +418,12 @@ static netdev_tx_t lan966x_port_xmit(struct sk_bu=
ff *skb,
> >
> >       spin_lock(&lan966x->tx_lock);
> >       if (port->lan966x->fdma)
> > -             err =3D lan966x->ops->fdma_xmit(skb, ifh, dev);
> > +             ret =3D lan966x->ops->fdma_xmit(skb, ifh, dev);
> >       else
> > -             err =3D lan966x_port_ifh_xmit(skb, ifh, dev);
> > +             ret =3D lan966x_port_ifh_xmit(skb, ifh, dev);
> >       spin_unlock(&lan966x->tx_lock);
> >
> > -     return err;
> > +     return ret;
> >  }
> >
> >  static int lan966x_port_change_mtu(struct net_device *dev, int new_mtu=
)
> > --
> > 2.56.1.708.g77570a6a1d-goog
> >
>
> Hi Ian,
>
> Thanks for the fix. The issue is real, and also on my backlog of work to
> upstream.
>
> Just a heads up, I expect the AI review to flag issues in this area. The =
lan966x
> PTP TX path has a number of known problems that I am are going to address=
 in a
> PTP series soon. I'll go through the findings once the review is in and f=
ollow
> up on this one.

Thanks for the heads-up, Daniel! Feel free to fold or supersede this
in your upcoming PTP series if that's easier than taking it
standalone.

Thanks,
Ian

> /Daniel
