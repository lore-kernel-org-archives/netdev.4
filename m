Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794688756;
	b=4hejeCBg5kZvVLvN23GREF+uQTmtqJdLUoZMV2ccPv0KLfaQU/D8tvYtj8pRPnEekhCN
	 0IQOUBegK49Fpc3cuzqSGsJOudiharYIKtamMuP/reNs3PET9fNK//W58RQMHnqfDUSC2
	 QFCDRaTmULXAFwYRiutVdTe9DF5eRk9zjo0zMg0AehO54vHgYNmsXycVH6+VfWiEsjTmk
	 oA3DO9WjMY4ogmXiUpUDCDYFzyyUN+IYNxnllYTH371ZqykxuxuNFs6tjHnF0Q/Sik80v
	 AOwS10FOZUVXmzF9cFTmdLHGHmVphnE1yc/dBw8AZquyMG/Q8i8Ksjxn6323YBfkpJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794688756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
	b=M4TP9jEfA+n0xTziqILD1PbNaLuBPzNg7LLskDj6XOhnihumK8kdR+8eJBuLkM7l8jiz
	 cs+I8R8fbfut3LS1JvK7Jf+hF5ndXIw/5+fCyYCQsZwR2iTJWeKTVVmNvVqbMi0iF5xLK
	 5h7RCMdCuA4rzupAEvE3EqPZmvBGxjawznIXxxp4HGLoaSoCbiOn4cM5smK0QmQSTfy8E
	 apBMugLIWJ5b1bxBRoSrS0QcHEnXxiq8fyYLF8+biAGsNEX2cYXuWu8ml/wtnveC21uR1
	 va0hOobDC0U/QFnaWO6OBuzqr4Mtp8ht9sCaM+cUcbCEmyNa4RDV4IGZyju5CNtldcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8ukABJa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E3E606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E3E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8ukABJa
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4682977f9aso363831766b.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794688754; cv=none;
        d=google.com; s=arc-20260327;
        b=IGog1/COKod2Brg+3XFzvTxxTYli4S0Lbkj3Iz06zpCZ7KsAr8s5sebxXWKjcRElxo
         OKcfABxKXgwwPK3gOmEp9rpqinX/5wHLBGAmI5vhiZVknMAjLY1Mhvn4rylsDEZGyvv0
         Z4HOgH1emPzPEjyvAvbPCt0lBgTufY2rWauZPMTycwqChyOn555E0M6uHkSd5i9gbPQQ
         BDpf+Iip+t+FYIIFiJO0ikv8MUUMewuqOQ5yzHJtQuriEKgnDx4vYhhNevPJTehiiwWE
         jPp0AgV/7bNZblmqaln1kCq0yXddZvwZmv3anYwmuGXNCp9UdmnA0a8Smrh10etoF0DC
         IgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
        fh=hSeLRuiEUIb1KfXxRMiHCeNWNJflCZFeTagk5XPSXjI=;
        b=Lh6acoUy5UnNuuHFJBVmJFDpQe07ec8J91AoKn2mpui2vLRaf+alxZ/DJ3jD8al7Hd
         PeN0t5Ts/Vpe7fDvHsTp7wftu9FMhaOcX8Ilbn9ZMtrn+JZsTOMKpejLSXVt1A0GaAuR
         BwBy6P6H+DLse87NWFMdRn6x9cOhAGfc06BsqiVk1qqupABn4bcHk7hYJ5Mtjw1FCPPg
         XtPzUJivhmn6oQQ0zGT4VRvCfFq+u3+t4ZsDPDEiqp+L24irqbncgnFUOx1jIGM+DxaX
         pCIAHxCbNrjUML0OZlmqhZTxn+4xu/bFTS2ZA7QHlLj10F7RP6U9dMy5X0alTv19NPnn
         i2NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794688754; x=1795293554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
        b=F8ukABJaAnd8b+MXpOMreIzMQptBsKsYhAk9Y4lf8cTBtHtLyeZeiKclCWIICnOJbb
         bo37qHCDZJUkIWp13k4pc9zzqltHAsPv8x/02P5QUmP6/kgtZ4LC3EhsjWofjWGnNcfX
         zMSlCnY8qPxU8cVQ1fRI7mLiwsn8W0HJS916VvgscSpmcERNl6jBER0i0a0TA1fa21P6
         /aG8CfNL01raiT+8RxCrzhp3+eCXP/jnE6C8fiSDrV+l+nQd8kPM+QQeQ1AU8tDxOA/k
         +fdoYz1m64Mf8faPDyccVDv/ywENForLLzswzpDCO7I1P1DxfoU8HD1C24CjxfLqCeUB
         SvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794688754; x=1795293554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey6jNvwKFcPzLuBXW6K73R9zGUg4iUAAWG1z7F/+/rc=;
        b=Kz84SLa5bd2xiDqmIynRI7lKxpSv+lj+Tt0TMI+qcYWBoiqP3X5GWWV/wtMWzFLERX
         g4yQqXEsoVSt5S4IUpPI9LCzTIkkrifJdCsJqsVomvUmK6YeUiFBLOT+Zx3Nyd4DX6Zu
         gRuUwEq6LWI8Hvgcu5TD6Cklew8Fsexrl0QodfmhleaChmACSJAFLnUyvqJF/0ulJdxI
         pWkwFgvDhwMKfiwIBN/hsZvOUsdxNUfAYfLtjto/aNaatXatTEKecr00pUy7khmvzrAS
         jkfBas4LYu4ZXOkthDxeJg6DSnaE7Q7f52yxTzg7uuJ6Sq8GIPLBp80iltDe9c5RvFTK
         tvEg==
X-Forwarded-Encrypted: i=1; AL+hErHGin8B9/Zp3mUe+7Et50r7rxsLNvAFpYad53JmvPqnzf+QBV2f1R5AtQcr/Ca3m5vHUdiO8XI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m9+8l4Brc3Gu7mBfrzWs653DleeMUdIk0CYSgwmTXeaMjCfO0
	ziq76Ip54CMfxiNjpMxx/mcwvP5UMyZfNaCvny/nRa92JsooC2QI9o5WafPeG0bhljYjYuSi1au
	WoesgTvKEkn7EI3WyLTxc9KzMkmjY980=
X-Gm-Gg: AYBFou2MarDsf0IjGzZz9+JLP8wRiNOqCtX1/XjpoLVx9pT+NqjMDzNmFPz/5Un3qUZ
	UUSfWs/QEmTBv4Y9GbFZ7mattT9RJrpMji+p8y7wsx3lEAOL5RpMMOKfXNnRmEsbooPva8zGy4m
	XLBBJteVWmQelwh+GQcqOvKM5AvvHB/7+WqBNNwYHoHGQWDqlUCyxAT/4RhLySWxTXKGfrJQhkX
	5BVyRRAZql6AsisWR1LTVmEJsTQmOhRVic61Xx0xcx71H1Sp/TIBOFK0RHnMu4UYlaUlTINS261
	WNIFTe7CA8Ano/w+z2HiTjDIPYAkvxW08xadtaWp6OqzaMQmg6t76ETNR8mktmtMwR/yfVCJHUB
	7svNB/I8ltvl519UcQA8OoU7Ap82Y/9TusIxo
X-Received: by 2002:a17:907:8e08:b0:c50:4d71:a85d with SMTP id
 a640c23a62f3a-c509641ab20mr445443566b.32.1794688754274; Sat, 14 Nov 2026
 12:39:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <avbP8aF77eg1iCPR@analog.com>
In-Reply-To: <avbP8aF77eg1iCPR@analog.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:39:01 -0300
X-Gm-Features: AclHuK9BY69kDDjUdmT7GeWf1Q2o8MI9AUV-rzgv2jbiwBRGrXdhb9u9CoLm1Ew
Message-ID: <CAJq09z6Juk0Disr-AKCV2pwP0UFghWMKdcMry2g47hfKahbYVw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/10] net: dsa: realtek: rtl8365mb: DCB
 ingress QoS offload
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Thu, Nov 12, 2026 at 09:37:43AM +0100, Oleksij Rempel wrote:
> > Add ingress QoS offload for the RTL8365MB switch through the dcbnl app
> > interface: a per-port default priority, PCP trust and DSCP trust. The
> > mapping helpers go to net/core/ieee8021q_helpers.c so other drivers
> > can share them.
> >
> > Two changes are visible to users. The driver now rejects a devicetree
> > port that the chip does not have. With a default priority set, an
> > untagged frame that leaves a VLAN-tagged port carries that priority as
> > its PCP.
> >
> > Tested on an RTL8365MB-VC with eight queues.
> >
> > ETS scheduling and CPU-tag pre-classification will follow in separate
> > series.
> >
> > v1:
> > https://lore.kernel.org/r/20261002115850.962676-1-o.rempel@pengutronix.=
de
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>
> Notwithstanding my other comment, the whole thing looks good! So for the
> series:
>
> Reviewed-by: Alvin =C5=A0ipraga <alvin.sipraga@analog.com>

Great series!

Best regards,

Luiz
