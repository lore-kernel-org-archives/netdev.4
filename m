Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794687991;
	b=1KQW0y96+jQ4YlHptO4ewlYJ/wsLza37Y2gQuqT3uV5prpAJBGFbcDaDDVRhUxscDeJe
	 HDVnz0Qb5eC7oJoJjSiC7EMCph0OvORozoclmOXlFGuvx+kSpUji1Pbcb9+xZuSjoNZCT
	 0FuGoxtDJPXfZIVUlZtKGAn3ySXA8lQRBggLy75HAdfttzk5iovKgYPdwgV9k9cZs6cuU
	 /A1F/G2X8w7qyAOHj3gmp31F86fKSCeqBhbelk1KJHMnLZrtUgt0c1NBOezlyW/tlb/vf
	 Gw+rjwxmpLkycQkwcVz99Y7norTBntADFfhOJTMe4i+nBPEncJ8fr8NqT2SCjiGXVWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
	b=Dz+rHbl+hhDuMlIfCAW9QdLJOjaJ2GjJ9XEh2pvI9qajxbqO6LeZyfwU/wAbPcBwl1nF
	 uGyvev2OIGmpJkGVuDXgAQFdSu3Jpa0mI0i482kmwXDM9nJIFDN1KCYNJ0za3M2tEZXrK
	 iY3EatE7LRVHH+qWshLtNB5R4QA7+R8wL/P86/nrZ9CdgUAfMEtqerAKakuvrD/1pb7uO
	 2FBTxWN8JtAf6/GD6vFZ7tPmM6nHtZOcZDfbdouIqwLzp5TuXwb9zLR7jv0Gd7ZNhPLGa
	 OL3VwdN75aJXRbo/GEe6uWtTcPmX/p4vfwtWQ1iXMndcV39AkCrO5W4rND/WCoWyTzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ysVS/Pc2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E0606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872E0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysVS/Pc2
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso421325066b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:26:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794687990; cv=none;
        d=google.com; s=arc-20260327;
        b=UoY+cn99aknwovN/Ke01qrniPrGGuTQt1yS0cV/PSFJ5ebLCXVziUYc09WKG4N8wf/
         TO2O5u8t/xIc5otuJBLCxjPSH/JcJL4LHaOIvSX0Pfu7flhFVZow8rtmp6gyKaZGI8Wo
         QNgkqm0nqetdW5znRNJWFx27gR5Z++yA5EVAmurWz18yeeWAh+Z0+0DBBE42NhhfkZPl
         pLCOIEITHrf/1vwlihoRHOrOMIPHHSe00OuumjMY1kjxJ+A/nHlWsoBFc7YnAg2X92l8
         4corRml1iEc2j0tiajatref2TYtmRvZWh0MNO5R67Tl9xlWZblgefe0MnL94AB/Dpvup
         /WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
        fh=WjnMM0LAWUBDKhn1vNYlY9M6Avvpfglbxkv7HxscZ3Q=;
        b=hlH2BxVnxyryxGnhUBlEoX++/IR1fHFX4ICK7bwah+Q3oCnkiOfnVXVIcNT19jksp6
         r4idFn+LbB1JrW3xYSDbbyrpo0ILoZcuq7wj8b7naHFAz7NO0dZm8dkBiUdIhuVd8v/Q
         3DO7oPTik7b3Xq2zcPoJoL1TEoZHMHAVRlpzJJax7pN2vxDkagFD25wUElt6W4RisR8b
         DR6U0bjaQeeZQJJsj+bdZu9sclnJRllRs09HsLsLFoGts+R9wP4PRBMaIUF6y4tFF/LR
         ErI5IB7Fq8J5lSEkhAuZUPtSPaBWKUieQQ6q7slMNmHz/3f8thjUw9weG4OeBRxbmLMn
         q+Dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687990; x=1795292790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
        b=ysVS/Pc2B/Ws02ekmGuPCfumWT667tLchxxPbDG1p/VWu7+gUOB/XgYvUL/BXFAhVi
         y4A5t/WN6JzoxwZCu5WECaKnxP+zBXEkv8wljUxrXydvUsPBmx8z5rB97J3bAkzJC4s8
         Cj3VL857RDu8ZqAMlJabs7KQq3kEPBE22D9/r80pfCflHl3mBXHmmeAv8UPNCTg3ty6R
         yIlRpZ9fP3Huqen5QBnUstB5ET7QtVGA2UsRtjUMmo0uJ+DGUtpusLpGy3klUt0Np9mP
         VlcgMxPfN7yJTzsJcpBpUNH+8oNAupuvvISa6HqTS7f4oeSLAdfXkG3tEjOGJfYwo2vg
         TeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687990; x=1795292790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
        b=o523ZY9ORmaZj32lv8dOBnY4mmj/mHlFiyu9Eiv0XqYm7VB/+6pFaSvKkd0q0hnRGA
         zvGJFgVvjoEw9eG5jja3iz6/gIcViZH7UCQzbZid2S0lPEP5wcBcWv9dBbP1Y/l7j/ME
         lxkwVqMyNjhnynTQLpgJwCQdQwEL/HqPk+wK511k/VZ9BRsRWWcHIP+6DsuTl4fDpgW0
         yy2/vxzR/il/C8MOu3TeQVOhSN9xuKTSW6K7JrfV/C3tEUT40nNt/+l6eZQAYD5jYmFi
         VTwC4PNDTguMmUk9iW2pXLHIlNsyZPO+ujXp2eWqBSaXmp9JuI6jFAKrrFWFgmgzKPtq
         iPVQ==
X-Forwarded-Encrypted: i=1; AL+hErE7EsKfztbpCx44+OXIw52zw20eF3ImHZXp0pH7fnzC48j/DqA11btbs137zhgxMyRuBSn0JK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lx0pKp7wbALrQe9of72KKznaF0j0FuZ/gZU4U+xVJRVxfg9Zt
	WBu4lIdDsDi9UxiT0/NKwB5HRVmW6NhsVjXo322v8wr0ht4pIbJ9mmopA2LOXb8kleYno6eMGgw
	zipuvf+6hBIbfXGl2/3kwOrbcfTq93xQ=
X-Gm-Gg: AYBFou0M4AwKzS1Bhe6Wa/PkBMtbx2ckwSNgXK8DJcFhfX9/Wy77po1c9VqShazEH7T
	UWJR+/piefomjBf7dJbP76q+kqGkAlGVLGyZXGT5NpIfa8mD1UzLpzeWBiq17r0tzxVBW3/3Q9Y
	5y5h4JNhDQee09xcVHM5icHoYIphtnXyNP7Nix/9i+TSoiMzWvOUZhd8qZxyv2SpG0o3RCo+lD9
	NKywMKZY+HXEzGqj1QHgbnouSFuZhlQX1Exe+66SRBkgxS7xtj8K4a1okUEB+ZSjQgpObY6ads3
	ZkyxbNQZlzCqmW3zAEf9nYLuSryhCjHa4c4RTn6SQGPgdQDic6Ti1i6wyHDfb2T1aBuI3SrVrYB
	wZbGI761oElsecpSWNx8L3YfEzCjZ4y05vOw6
X-Received: by 2002:a17:907:60d3:b0:c40:4f39:22e8 with SMTP id
 a640c23a62f3a-c50963d3237mr547794966b.44.1794687989782; Sat, 14 Nov 2026
 12:26:29 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de>
 <20261112-rtl8365mb-dcb-ingress-v2-9-f8e6fbdf8c99@pengutronix.de> <CAD++jL=EGaGXJCMGoTX-R5YU+OSU26NpbO3MBbr+yWBO0q6-yA@mail.gmail.com>
In-Reply-To: <CAD++jL=EGaGXJCMGoTX-R5YU+OSU26NpbO3MBbr+yWBO0q6-yA@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:26:16 -0300
X-Gm-Features: AclHuK-opAqBbnVl3SMbicdNR5dV_cuAzme9VQuR9-JlWqPoWq-RhUXkE5AY_ck
Message-ID: <CAJq09z4rKOPb9DdMmOq8LeRjZr2HysLz4waFOcNntR+xUYSX5w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 09/10] net: dsa: realtek: rtl8365mb: offload
 DCB apptrust
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> > Wire up port_get_apptrust and port_set_apptrust. The admin can then
> > choose through dcbnl apptrust which ingress classification a port trusts
> > for its priority: 802.1p (PCP), DSCP or both. A port that trusts nothing
> > keeps the port default priority.
> >
> > In the driver's model of the hardware, the trusted priority-decision
> > table is switch-wide, so all ports that trust something must trust the
> > same selectors. While another port trusts a set of selectors, a request
> > to trust a different set is refused with -EBUSY.
> >
> > When both are trusted, DSCP must come first. When PCP is trusted, the
> > switch classifies an untagged frame by the PCP given to untagged
> > frames. A PCP source ranked above DSCP would then hide DSCP from
> > untagged IP frames. Refuse the order pcp dscp and any unknown selector
> > with -EOPNOTSUPP.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> > Changes in v2:
> > - move selector and precedence validation into rtl83xx-qos.c behind new
> >   qos_get/set_apptrust callbacks; weights and -EBUSY stay here (Linus)
> > - use one-hot decision weights; in the driver's model, the v1 linear
> >   weights could tie PCP with DSCP (Linus)
> > - define the apptrust slot order once (enum rtl83xx_apptrust_slot) for
> >   the shared selector table and the backend source table
> > - write the PCP and DSCP weights with one register update, so a failed
> >   write cannot leave the trusted table half programmed (sashiko)
> > - check that all apptrust sources share the one register that is updated
> > - rank DSCP above PCP and refuse pcp dscp with -EOPNOTSUPP, because
> >   with PCP first, untagged IP frames never reach DSCP

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
