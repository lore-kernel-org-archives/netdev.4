Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795141898;
	b=qkYoaVFy974/uF3E+vY6NeyOj8B/q71Ywvei5mKQewiF0rNkClZVhFS+y2DV0udgeaUC
	 fIn50InJMWodh2G2ADxx0DYKnNOdE2NSvD4OVMk0Pw323DE5kUNvtz7NeeNWwgvJE1WuE
	 liaieuaUb/uHS70C6yTawWkQV1IdGfKD2vftn0rS+60DyGtFL1wqqOexq2cpckztn8Nd3
	 HWOJgZG0YLp6U7doKy6CJvw7kLwFh4rsm2Ig3rjeq81AB6OMvftKMdmWHBg/36QbatVrZ
	 ofdl+aTghVqaijgwiVQgnuR98DlAt9DVob3dQsPv33xhlsFj5eJlX9Gfk6MRsmdV9Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
	b=PTs8gCSa93Ovj4TIXBs1wpgTpJVSSnOPdR42dtWwhclibHekFXW/5CvscvYOhHg/fLPL
	 AswdOUwPX6ZU3O55KPZPCpD2pZWrc/OepoYkkOWGcusXC47sT8OL7N/KqS449gogxE+8I
	 jfoaYpTJw6QlL4bGzngxMN14dpKvmNXGFognWQY9WNPCl/zx7mCdjp1ZSLa61/61e21b5
	 s/qHxTvjn4+VRbm6oxh12BM+TxYOcYWrINuOQltlFvjDDVrEjXGZn0t8enyo7avfTWqKP
	 7Q1OC+ZAZhzaOVBFOw3PVMS2BemFt+oYTIDoAjgoZNJJwWZNPYw7FddNHsrPy6am4gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qrdy0TPS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6BB606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA6BB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qrdy0TPS
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2efc4a84e75so16815ad.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795141897; cv=none;
        d=google.com; s=arc-20260327;
        b=MqheY6mWL/3hGrr8wWLDOdP7GivIUY+AP8WvQYbDz+QiA65D1z9uOdTNcCi4LV06IP
         UgGnzXorXHAG2JNi1MVJz2o29128jauCKgjDC3Fs8zFKS4hQSxFFB8W4eurC5FoYyi8N
         0QiUZq9htXUEDWIsfeCTaGVqYrwfeSr8YV/JOlsn/gJeaKQ3W8lIiJ94GrOzUVGl2U6p
         BJT46/zQsPJgOh4n9lmfm7g3KbZP/YeG00EEmTGaxW3t7KcTfFJf0RTRpPMHH+n+Utev
         m7mCLigktD1LAzd+QHjMytqbJf3Qxx9u2lCpfc3MtoKFpHhV8zwKKbuDWvfpjYqpxdMl
         CqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
        fh=QGRQ8AHZejzIrMpojVjfrDlaelqqfjZYVVCiGzwJuWY=;
        b=q/jrqMlwmhxppZiKs6WN20yo3kt+oSuZHjt8Wk4gYhWwwhH8UzTlJqUqbNxttFgYb1
         EWdbRVestxAbSxtr8RYyR+ntnAdOoD3whcWT2shYcycp9qhSe8hCn40drvlOxsWMnfHu
         N02z7ECmbT71uh6yQjVECRs+Ss/xVyjzT3yLW5t2mfUmqGQXRtcRVeLLY4y1LKs+DZqV
         mSXRggEHNA9rSNnGnkg+B9Fj+ErgnnSohPq/maHWjpc6IQd40eRJDPmQ1EeWjatDJP/Y
         PM5bx69wNS1/eup9jY4DlrHb/tRGhxajXK2UC+urszQhaeKEHQhBOOUhRUMHLeDYCHJK
         7vLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795141897; x=1795746697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
        b=Qrdy0TPSy4mDHfih5I/YhyhoJTImoMV3NzQ2MPXAQP6JVC4N4CyBXTEBgzd3GwmVue
         GA95k7Q9i94qr15wNt0nFgTodZEgH12Yevm0ASBd1KA4GAf35lBJbOyhDv0/JpzFhOPF
         4zgLN5sMIYaCS0ou5mc5LFLX+LEr3iFBYtRH0Ohu3nLt0g6xLKImS13Mqsa+hh3cBche
         J13yRgeDzl3nJJWwWFUVuRyA5stg2/AZ7RwZJWPh7qA0xtfNnVYb68j50vnZY9j2BN1M
         KHOf36+hdjcfy2Ba5VA8MKiXOhhiYraVvfX3wQm9Q6vFK0wfuuVaCizKIMWnkoQpzKTE
         iK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795141897; x=1795746697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw528oppsicl5iu2Aad1GPwt5g3ei5dQBu/8tKhvTDA=;
        b=DB+1lgLZvaJuoExM/CV+W3xsYH8kATzYyWWHkiUnJ9DRd0JZp20Pzw8nhTqjgrTnVR
         DM04aeq25ArqSGMzyKSrWN+kJEsJ2l7vnt7hJy/FbLdyV6gcMDHVY6Opu1xR3HNp7UF3
         z90ICpt+UA3O9f08Fs56TPPgFJLbE2Zf1vkq+6kP8Pj2p9cYsFAuAwJJ+h+GCM7STXXM
         I1bmWXICIDQeHL0IGnpz3cKYH94Q8VlMNET4TIeW7g8MWIFu4yX+z/Z3ZT8kIc+PyQ2b
         s173+/KsFQNjtq3wmsAA/Gx4gqnflkv7YjUWVHQhOOB7Hk9VPHIxhIg5F4s/SmQwYJCs
         f36w==
X-Forwarded-Encrypted: i=1; AL+hErG13ytc9t7jvraxxvzpRwOt/K5PCAsc6KbQL9/+n8Nyk9Ncn+MI1mt+GqYSbjvIJUlDESEz7zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DMA9+QwSbEiOWByBQLyx1ROydfVPMYxjzNgXrYXBv+THYXdVK
	gP0A0tBal33d26s/d1dLiF1vhG/QbzgAOfBOcn/VQ2ONI1rkfqxnYHoGlAKWFlpyHpEI0+dglBV
	+3TOW2nFkPdict6mwieL8s/m2mclXTN0mDV8ABkXx
X-Gm-Gg: AZFdTZdfMtBpw+mhcyUDn5ohO86j2HpZYsr0KW84LlQ9m4f4QsIyTBkak0b7i/kbkKK
	1eHy8zv7GBso/nwSPq9Il0zSHZaw1w62EOunuMneDQ22bE8qQ5px9NYFa/PuAc5TDrX9mGskmdF
	z9eRVapJQ1dZPmUcwd2V114CtzKcG8Ls302UvIVLuKOXiBaowJ0tWm614jriWeWOWAndeF61VIV
	hDjL/iT0sXPOxsswib7JBQNaBaehYTCe3jY3rHuG2g1O9aSU/kWRLdMsq76+pGR1kotEZASh0oI
	Ap0+Z1dSmxVEnicJTwiYz7wOP/MTKrZYXmpXMz1Cmc5376f0KindbN2UG7kkYOaHj324BwcYSZg
	H0Rw3RP6EYqnTvROcdYWOcJtDtFCq7//aK4D2MuHJywajO1eMMUpXxPAf38YNV0STFnPRJHEpZd
	Awhyj/P9vWQv7m11StVuT8neoRVUbDyQ+X2x8d
X-Received: by 2002:a17:903:1670:b0:2e6:f400:5655 with SMTP id
 d9443c01a7336-2f04203a6b0mr2818995ad.3.1795141896502; Thu, 19 Nov 2026
 18:31:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119044537.57936-1-enderaoelyther@gmail.com>
In-Reply-To: <20261119044537.57936-1-enderaoelyther@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 19 Nov 2026 18:31:25 -0800
X-Gm-Features: AclHuK-CSDmpAuC4dx4YDI9BMHjGGIhpLpaYIttNJzbasYk4gLp2I3z1LhRSds0
Message-ID: <CAEAWyHf4D2P3=AbewjxJkB19K-r1MMWj2p6p30Qnay_RMTYwtA@mail.gmail.com>
Subject: Re: [PATCH net v2] gve: mark the flow rule cache out of sync when a
 rule update fails
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Joshua Washington <joshwash@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Ziwei Xiao <ziweixiao@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Tim Hostetler <thostet@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Matt Olson <maolson@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Zhao Li <enderaoelyther@gmail.com> =
wrote:
>
> gve_adminq_configure_flow_rule() marks the flow rule cache out of sync
> only when the device accepts the command, although a failed add,
> delete or reset can leave the device state unknown.
>
> gve_reset() sends the flow rule reset command from
> gve_teardown_control_plane_resources() and then frees and reallocates
> the cache buffers. If that command fails, the cache keeps its nonzero
> rule count and stays marked in sync, but its entries are now zeroed.
> gve_get_flow_rule_entry() then finds location 0 inside the cached range,
> since every zeroed entry has location 0, and reports an all-zero
> TCP/IPv4 rule that steers to queue 0, whatever the device holds at that
> location. Queries for other locations fall outside the cached range and
> read the rules from the device again.
>
> Mark the cache out of sync whenever a flow rule command is attempted,
> so that the next query reads the rules from the device.
>
> Found by an AI code review agent; not triggered. Compile-tested with W=3D=
1.
>
> Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
> Suggested-by: Harshitha Ramamurthy <hramamurthy@google.com>
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>

Thanks for the respin,
Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

> ---
> v2:
>   - mark the cache out of sync on every flow rule command instead of
>     clearing it when its buffers are freed (Harshitha Ramamurthy)
>   - describe the problem in more detail; drop Cc: stable
> v1: https://lore.kernel.org/netdev/20261118023429.29330-1-enderaoelyther@=
gmail.com/
>
> No new W=3D1, sparse or smatch warnings.
>
>  drivers/net/ethernet/google/gve/gve_adminq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/e=
thernet/google/gve/gve_adminq.c
> index 2c848f0c23dc..d0e0d9ace3bc 100644
> --- a/drivers/net/ethernet/google/gve/gve_adminq.c
> +++ b/drivers/net/ethernet/google/gve/gve_adminq.c
> @@ -1401,8 +1401,7 @@ gve_adminq_configure_flow_rule(struct gve_priv *pri=
v,
>                         sizeof(struct gve_adminq_configure_flow_rule),
>                         flow_rule_cmd);
>
> -       if (!err)
> -               priv->flow_rules_cache.rules_cache_synced =3D false;
> +       priv->flow_rules_cache.rules_cache_synced =3D false;
>
>         return err;
>  }
>
> base-commit: e203d8a4751d48aa00eda31e3b320ba8e0d47dbf
> --
> 2.56.1
>
