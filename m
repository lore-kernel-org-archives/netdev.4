Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437723;
	b=K3XcyApDVXjCeJM3cu13dfYXTFgxusqEvtGw/+qbTf+Plbvz8yp2oJEXY56dNrt4qmj8
	 W92nkMKCLDh3ybqWZJpCy8qpsD7Orm5FKmL5DsOf47OFAYoWwZTaKVe912hhVyCMts72L
	 YYjR3zOfT29xdUnTrbpfkP8c+mS+K7rnnEOOGclZps51Zvjvx61BBYzlEI/GSYuBsTLwS
	 2A5+c7gCmY7zTVZKkHDPBj7nSEiOrM0htlZPO885thkw76ak2tkB9McC7J/xJScZ/qV5h
	 AN0dkX2+EN9s6P8foLnmjPaSGZ7NtU29NTnH0m4CzhyTWcT+EXz1A1aN2ituRaH7qMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zk/zRd/DSWOo4ZU+uiseKdBg5SqPyN64+INmafD407Q=;
	b=G5F+F96s2nPE86peJgl4KjYNArUkG0wuEsL36Z6qQ1REqZCkBYvz4ZVMPgqlphDY6eFH
	 qMWqCOF00kaBB2X8oWSyrJ1O/fnM7lCcJ4u40k6ozktTI0XqzTlMm2On4YVh2YXAbh+TW
	 HIsGbVHK9urF4mutFWeJjQL89efKYeL0PnixEm0RdD4n5ise/OPUugP0lerPdBMZG9mba
	 a/H8GH0qPHjqhrwQvc6ksndRd6NNm1/jT7VPmoabPawzZeOvicxJJ3tC3Mb9w9eH9uduA
	 harYZRINl0DRqiYU4k2e0xxqQFWe28YaUw2qzHubeSNlCgVnBeptrgdMn/YLTCreJXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNSWdwkN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.75
Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E68606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E68606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNSWdwkN
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3ae3d6e579bso16418071fa.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795437721; cv=none;
        d=google.com; s=arc-20260327;
        b=MhHM/ff5RhZbQUhLL+0NL23mlV6QzL8S1VR8RDg0JZgZKAqdEqS0oNSyCS6K9O2iI0
         UIz6swXoxjc90SRrd9ZvD6qxWW9ke6JgSrjKMZ/mxXGfolLy/xqDJO+6BWeRS/CwCCHQ
         5pzegjRVfl4+XOS3zEbPhzLxU6wIVByx8SLpZxbBYlcPpXOAVTwrVbwVfIv7fmU5MRwU
         +RdVrFWYmzZW7R5v8yPXppjnOTE6Gvwa90311txB4uwi2tVH4hLX9a5TEqiV732vv528
         s4sXn3IcnrsoIHtQxpkVCEptIaKyvluFfuf12dOR6UgPO8WFAw1NE57Tmq+wX08SPklx
         s2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zk/zRd/DSWOo4ZU+uiseKdBg5SqPyN64+INmafD407Q=;
        fh=iq1pz88XocrsBQp8mraB89z+oNiMHPGj0u4xsIuZIIk=;
        b=GmxLeIZxaHIJ5anY999ug42s9nwd/Nm1o4vlx4VSBfM2tmDi1ZSSTE9VIYgsYbNZGe
         4IUC0to7bRMBU+FF+fvq6Ui1h2SwShzvyx2SkenG9eaZSNshvAJ7jPkb4P7W0ir9pV0Y
         ypokaEF55UFQCFT5xUdL1SLylOMG216Ofy/RozD0kyRnHF2Hk/ZUY5+Ssr3fTdWir+2o
         cg+P1mVWaMyTqBq9p6T7V4n0HqiQbffd8Vfwd0y5uXSx5xpTm4qAyT7cxKwr0E2j9TiW
         RKrBZOJfYPNkBOl4qXCgzvh7NIdXtgqRmgJ0y8FtKY4aCik12MrOUjOrjkvI8/UBTy6P
         UEZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437721; x=1796042521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zk/zRd/DSWOo4ZU+uiseKdBg5SqPyN64+INmafD407Q=;
        b=TNSWdwkN2sZFJfb2o1DNIIW5NUjk6MAMdfjUvXTiance+EI03fRfY5EEj2JPt40F+F
         ADqhWMqHMeV68+Nr286UlbvyyrRPWgWPUwDZBmkEFKau1T6geBFlkz8mX/dtCU7LdgOV
         RwAVgiTgNurVXyid6nEQn7JNPlyfKlcq4oD6BhalW9KNudPTx4uJax1VIW2aMpZ8lMrW
         Ll6+3QI1GEWLAtgoXfZ/oOOKrN4puL01o5/iBjpju9B6ziM3oiRHfRem3FkGBZIKSQlD
         6r3DeDKkNVyT95X34RBf6VEmDzcQTGbWRHDmPbrvpvlEMkg73x+Zy4Y65H3tdeR6AM4D
         i9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437721; x=1796042521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zk/zRd/DSWOo4ZU+uiseKdBg5SqPyN64+INmafD407Q=;
        b=LV5pgSvXS4j4MNZpn865z85lPd4oETzqzRvYHoiJ76EZm5YZCHtyH9Ow75LHiKcYht
         uSDGczIK2JTfCXtD1yM9N+3Y4weD0exZ0De/DMY2XDdIEWE+5LSvltCagEyLXabPpNTh
         bmTbaPliETbhg3tX2lV8Yj+rZEy6+DORI37l1OVgVXXpTfik+zRQd5oys51FU2/R7cfz
         1ne2SxufF0FMnCpGn3qlLOlbRGAyzcDwaDRquVu8qCtbA/K0E1p2yxheUT0ZISvbYTkc
         wnpoV3U82jznwpRpZOZD6QKvNFfz4xHEKhaJxPodug2nvnmMsyHPL+KtWjN6AbUrLF5P
         nXUw==
X-Forwarded-Encrypted: i=1; AL+hErEFtxvCjXi7D+ivm0n4dZ63yfg3unNK02J/vtaxRjO66+zHp89u51RXKNT3IvV78mwkqkn/do0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fO71NErOrWnG70OBDDZTyBnh0EA7L96eLRpsxx5+JgFNZyWj4
	n0ccICyYkFydm062R+swXR954fQrgp+o4qDXMAdCcrKQL2jJ+EkGlaRIImm14yiSV/ZFxvSCs17
	rYNyvZtp5rwDsFvgFP0VpAiH1G9bp3lM=
X-Gm-Gg: AZFdTZckfiNJSxZQBnRytPMgJe+bMo2316zvXsRIKYTPeQWN9D7Mwx2FviI/JlgWn6s
	0blzgO+AcEp3+IdjWc0drDtBUsFr9O8h4cO1B82Lf68q9zlpecu1TaF8cTWmx6hc6ZnZOm731Fp
	Os1Ouan+rM/GlNDL9mOKEMyIkCRaLpNXPtNrqQms46fHPRkRi9eh7Gx2Aif/QedOCtUkCtweYb2
	20dHHQX5ULcp6l9mjMTuiP5/SD/Rgk319JbWH5YuujfrT1WdkoR7a4Sa7PLutCw98K7V0FOJs3H
	kBusSU6j/EbnH4rIMUkDxFgX3ce18/CEdBgtEzzO1cidqkWRecp88HFW8mdigj8nuxvHvvobEQx
	Il7sZNoVh0/pzriNudM8oETlJuECYGXJVAFXXtA==
X-Received: by 2002:a05:6512:3d24:b0:5c1:4c4b:6b68 with SMTP id
 2adb3069b0e04-5c1bc802f62mr3414265e87.31.1795437721087; Mon, 23 Nov 2026
 04:42:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120060254.3766851-1-bsdhenrymartin@gmail.com> <20261123062752.27920-1-yanhaishuang@cmss.chinamobile.com>
In-Reply-To: <20261123062752.27920-1-yanhaishuang@cmss.chinamobile.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Mon, 23 Nov 2026 20:41:49 +0800
X-Gm-Features: Aa3M54rsv5iRHUZ4GpMcRr3DikcwBbormgnkk3CHb8Xdr0aMtIvQVeT5aCPkttg
Message-ID: <CAEnQdOqAQ12A9NdwTWrgfyUVHMvSua1DLTbWbsmGWGUMMhv_FQ@mail.gmail.com>
Subject: Re: [PATCH net] ip_gre: fix stale header length after erspan version change
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- v2 is posted with hlen sampled before
ipgre_newlink_encap_setup(), so the delta is now correct:

https://lore.kernel.org/netdev/20261123123529.3183627-1-bsdhenrymartin@gmai=
l.com/

Henry

Haishuang Yan <yanhaishuang@cmss.chinamobile.com> =E4=BA=8E2026=E5=B9=B411=
=E6=9C=8823=E6=97=A5=E5=91=A8=E4=B8=80 14:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Nov 20, 2026 at 02:02:54PM +0800, Henry Martin wrote:
> > +     if (data && data[IFLA_GRE_ERSPAN_VER]) {
> > +             int len =3D t->hlen;
>
> The bug is real (on 0 -> 1 the GRE sequence number even overwrites the
> GRE base header), and the patch fixes the packets. But t->hlen has
> already been reset to tun_hlen + encap_hlen by ipgre_newlink_encap_setup(=
),
> so the delta is wrong. iproute2 always sends IFLA_GRE_ERSPAN_VER, so
> each "ip link set erspan1 type erspan ttl N" on a ver 1 device lowers
> the MTU by 8 (1450, 1442, 1434, ...) and raises needed_headroom by 8.
>
> Saving t->hlen before ipgre_newlink_encap_setup() and always
> recomputing it fixes that in my tests:
>
>         erspan_calc_hlen(dev);
>         hlen =3D t->hlen - hlen;
>         if (hlen) {
>                 dev->needed_headroom +=3D hlen;
>                 if (!tb[IFLA_MTU])
>                         WRITE_ONCE(dev->mtu, max_t(int, dev->mtu - hlen, =
68));
>         }
>
>
