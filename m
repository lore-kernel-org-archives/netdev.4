Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196253;
	b=bcjEO0JLlB4bz+pfm6gbV4TDnIB2WbZbrfLbPd/stinlNkV2x7N2YOePOoSQqfXARtUJ
	 /b9Y3GtCAHb4ZoUXUBKYAdPROMz1C3Ex83JvWMTgRFfTjTsmzdwyCfkdy5062IwZ67qOj
	 yyF0E4Ce2/O07vL5WZOK7a1XTQ92aOIhUfwKlAOEXTJ/jSUymN7MfsiaphwQLhNPPtYX2
	 wJ3H3Jzl3sqz0dER1nCU9rcD/JPlDrg2Ob04ubqXkX1Y28gRQ1vyDEU+ZmWNmwmY3xDXY
	 kbflQuQtdMhnTgzMGFNdRvLOX4KIhdohAK5AtTTnQb9/eSsX7tYeG4VuN/lsisGgxOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
	b=mPnNX6yMpMQ/mMBTUUHkuh6EdolS6UEiDcZ5y1iiwyJBH1Kk1QZLh4iVHpqdW2kw1pj6
	 aBJOb7QLCIpNxtIw9Bv3fWk94ZxhiTWmFEVKeSMPUkv8kzaFFqVCr8U5IKTVCAGNvtcZ6
	 Kn5z0MwgOtIC0RjFJMWtposnIMYPrV9LaMrgc8NIJ/M5IGLHlKY9RRA/fRpIRIb5h7k9J
	 /dDWOak3qe2ctgsxFjDswaCxmvk6fkYUHcpvBUmZeObNFgxrQyRGzttDRuY3HgHAZlO3N
	 ledVXvpyZYsla2cHFE/BHPkulgO3CJ0+H/Z0TJH4BCQonhfPvNeqM6DgGhabMTHvtXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HyEFdSiv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E2606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HyEFdSiv
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533202fe429so375171cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196251; cv=none;
        d=google.com; s=arc-20260327;
        b=g/n7BmRQBNLGP/q42EfcghkFGTz1DmURdQ5w3QecoLscJ7m1UceekiSmYz87+7gfJB
         KlkBYoNJBDb1LfpIIlVxFeRaRsPC8qmFAolBDZ68f4PKlDkfcQXzMBIvOZbnL84u2Oj8
         Qunq4Cxmu2uXNLxVx5qMfd5HjFP3eCDaWlqMxnGVZQ09/96RxtRycQeJbgNxnFOF2vdj
         NOJPIef+m9qpGrnl876Zg9nm8E+F4LeTnsNVrPu1Or6CPwN/nxya5wN7hvD5EsL9F4re
         rBERfubn3eixanVtp6tvAsbzF1j/vaJ9JlUbD1tivpyoHMCcNHX6faGjF2gbNPIR3+/6
         0Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        fh=ZLeaZQVHkt7INUtVgyBBj/qV2kuXSOj0RJihAL0gwjY=;
        b=AXhWdN0KufxLRlT9gixwXavNZhbUp/z7fSFQPuf33Toe6kk80P5zQ8cULvWi7su0lI
         gtC7h5H2aQn+tV6pv3kKjt+/81SaAejshJTW1JeXIxf1Uk6Y6p7t/fqYP7XSCr74FMni
         3GcZVqUTeoWhG84zyqDE7SO/0iMZdFiUJ4y+pcm3+fAA/rx7xXm7aXD89UMzyHX6LNLR
         Mpjuj9f9Y8nMeFLG1jCyNq9G3G9rxYVqtFrgyPtiTbGW0Y6W7aiAJFZNkOMrgm8zdMt3
         p1gicYF8P0N4tnFGI9y+kuyEwf6Shtnsp2hG2o4sjCwSY924DyfzNv5h6SMHPi86reeW
         DG4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196251; x=1795801051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        b=HyEFdSiviiH5O/7TZuD1vGZ+kM18wepe6pgn2HElMQnBbttGCrDUA+C67r84fRUXe0
         bLnMusdd0pjNDYDtKZDpXupbhCn9zuKytmUv8E0LGfClDQuCtH+TpMkxOFRJgK7Rhww2
         a7P2rxNb2mnrU21GBAJ4+mWeTT3WK7yOtke7efzrV+Mhc+6TT53lGQik1nKVPlc1lfGP
         OTy4cJdsSf7Kt85FbR015QEXuyjagBSTnBc3lktgJtgnvRyqB0JeRaFviUSjvG4Kt5Dp
         S+u84LWIVt+1BqKckZCqP+lfhH7Nv+HaLIRTXAY9XEuX11Oa55b8JxEL1Tp3/ZvMPOyk
         l5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196251; x=1795801051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRKvnlsdzu3jXDaX4UB8D7CCbipvvMVl8tWANK/PyeU=;
        b=jXvzCJPSruvG8r9DKqfAbCsUbBTX/eEM8lCrEuxpiqFeP2VGZAatgd5iAE/abU9hSo
         wQDAli+bUQC53Dem8aY4GJR74tTmWpxxMKQo/r/SWIMlc0uQHKvORrshi0diH/wT99OC
         CbUUfUuFuHk06pJhfqeyRYk6mIE0ZDipqL57K/niZAraJayfbZZIJ6iuph4u2APRHopK
         3s6IvqHyckD5qpzddt0Q3tRFDRLFPiLSIcj8zxff8ZYFjFihviEb+0TF5I3mXVio21+G
         i2zgCEqCqma2bJ59lQpJ5bCvJNT5cOgO3kGBOhuK9mBbbJR1IAkrZXwY9WZibJSxFHMB
         lsYg==
X-Forwarded-Encrypted: i=1; AL+hErEp43NExA9++BahriAvDhlwTdsCkTsP6USU7exB6PQPeaGJx/lrF0Tne/jqii0WU9lHdC7zbBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7EmmdJ8dnE4Tz6VkEBLvbYm1Sl8b4Gmv75sc2qJoMuylrALzl
	hPV0PJhcIYBZDulc7ncYa0n30Fv4pV/FFRzn3e/CKBbQAVWfRSmMBcCmYyPD9sP94GTuK3d7UxP
	Oka27mbpZC5uel7UwolqIzKc/ZZhBlJADMCdKlpLc
X-Gm-Gg: AZFdTZcP30bmOEezFyLNnuSyGem9kLrtS/glIG29L5VJ8VcD0kFsRD56CnwlhqLK/7t
	9aZMVHgif6Occp9USaHblhqcTPIyWLjHo73na8+L3aqIQ1dKT5zlQE8GYG78mv9LJzla0/YuLM/
	aQgxEQA5Pb+PM0uH6DIxcEB7mmuZAMqTLnKHYTpM6AZhOiqt5EnfjGayr/UWvGNkIANg3PFUEGf
	gHm5gafthgQonA8MceYyV/EAbn/oz65TTZjcsc2uGdYrl8BlE2mW6wpJ8lT++oWjjgiWA7f20oN
	oHoGpH4tdQCnlE8gQAj90zWFsmhglpEffg8J63DVazSD+/N2ToM32DExdwZb98pWlEgye/SiamR
	j5ENDYkLqU6Hxr8pz43kOyR4lokrDNLtmStDh
X-Received: by 2002:a05:622a:420a:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d78e6fe63mr22944711cf.2.1795196250681; Fri, 20 Nov 2026
 09:37:30 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170354.1509589-1-irogers@google.com> <BL1PPFB0715B38BE20BB0B4087ABC66BD9EDB792@BL1PPFB0715B38B.namprd18.prod.outlook.com>
In-Reply-To: <BL1PPFB0715B38BE20BB0B4087ABC66BD9EDB792@BL1PPFB0715B38B.namprd18.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:37:18 -0800
X-Gm-Features: Aa3M54r5Jmnt4Ssp-wBby_ZlWdHK7iMTTCVJuGgQMqW36wSMvbgVZ0tFQ-QRjgE
Message-ID: <CAP-5=fVj+nAvGW9m9L2AxPqzw63PDqCawS=9a6jVh1fc7ob-dw@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH net] net: marvell: prestera: Fix skb leak on
 error in prestera_rxtx_xmit()
To: Elad Nachman <enachman@marvell.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:39=E2=80=AFAM Elad Nachman <enachman@marvell.com>=
 wrote:
>
> > prestera_rxtx_xmit() is invoked directly from prestera_port_xmit(), the
> > driver's .ndo_start_xmit() callback, whose return type is netdev_tx_t.
> > When skb_cow_head() or prestera_dsa_build() fails, prestera_rxtx_xmit()
> > returns NET_XMIT_DROP (0x01, a qdisc congestion code rather than a
> > netdev_tx_t value) without freeing skb.
> >
> > In dev_hard_start_xmit(), any return code other than NETDEV_TX_OK (0x00=
)
> > is treated as a busy/requeue condition unless dev_xmit_complete() holds=
;
> > for an unrecognized positive value like 0x01, the core neither frees no=
r
> > requeues the skb (or hits the unrecognized-return WARN path), leaking
> > the packet buffer.
>
> Did you check it yourself or was this sentence AI generated?
>
> Please check here:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/netdevice.=
h#L122
>
> and here:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/netdevice.=
h#L144
>
> You indeed need to free the SKB, but as long as rc < 0xf (which is true f=
or both the
> NET_XMIT_DROP and the NETDEV_TX_OK cases), the behavior of dev_hard_start=
_xmit() is the same:
> https://elixir.bootlin.com/linux/v7.4-rc1/source/net/core/dev.c#L4074

My mistake on that paragraph - you are completely right. Because
NET_XMIT_DROP (0x01) is < NET_XMIT_MASK (0x0f), dev_xmit_complete()
returns true and dev_hard_start_xmit() assumes the driver already
consumed the skb, which is why returning without freeing skb leaks it.

> >
> > Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
> > counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 report=
s
> > the software drop), and return NETDEV_TX_OK.
> >
> > Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build=
,
> > with AI coding assistant help to audit the warning and prepare the fix.
> > Build-tested with Clang; not runtime-tested on Prestera switch hardware=
.
> >
> > Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera f=
amily ASIC devices")
> > Signed-off-by: Ian Rogers <mailto:irogers@google.com>
> > ---
> >  drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/dr=
ivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > index c4ea247d2470..7ac9220d33c5 100644
> > --- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > +++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
> > @@ -817,13 +817,18 @@ netdev_tx_t prestera_rxtx_xmit(struct prestera_po=
rt *port, struct sk_buff *skb)
> >       dsa.port_num =3D port->hw_id;
> >
> >       if (skb_cow_head(skb, PRESTERA_DSA_HLEN) < 0)
> > -             return NET_XMIT_DROP;
> > +             goto drop_skb;
> >
> >       skb_push(skb, PRESTERA_DSA_HLEN);
> >       memmove(skb->data, skb->data + PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
> >
> >       if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) !=3D 0)
> > -             return NET_XMIT_DROP;
> > +             goto drop_skb;
> >
> >       return prestera_sdma_xmit(&port->sw->rxtx->sdma, skb);
> > +
> > +drop_skb:
> > +     dev_kfree_skb_any(skb);
> > +     dev_core_stats_tx_dropped_inc(port->dev);
> > +     return NETDEV_TX_OK;
>
> For the sake of clarity I would return here NET_XMIT_DROP . The behavior =
in dev_hard_start_xmit() would be the same.
> There are 53 drivers which currently return this value, this is not an is=
olated case of just the prestera switchdev one:
> https://elixir.bootlin.com/linux/v7.4-rc1/C/ident/NET_XMIT_DROP
>
> The rest of the patch is fine.

Sounds good (I had used NETDEV_TX_OK to match prestera_sdma_xmit()
just above and avoid Clang's -Wassign-enum on netdev_tx_t, which is
how I spotted the missing free). I'll send a [PATCH net v2] keeping
'return NET_XMIT_DROP;' and fixing the commit message.

Thanks,
Ian

> >  }
> > --
> > 2.56.1.708.g77570a6a1d-goog
> >
>
> Elad.
