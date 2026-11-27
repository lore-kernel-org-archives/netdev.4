Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795789587;
	b=KBrxzg0E3EpgfDUuVDeCV/1m3B9U359Kr99FglXuwSSCf+TL5dpYo1oxMBCoXzRrK0DA
	 bT4Y4xH0vwO0OlxLRmaVUYKScuIP94H7/x14l6PVF7B33jgXosmYu+90hPKnnYAsQABwY
	 gluIu9EVA5GslQNQ+5Ab5pBT4FVy58TdqPjusbd4LTrp+Lo8FvBWBPyoKGbhyLJxzYPQ3
	 lbMBwfoLKKhv2EzM/Ia6ccHtEUh6N+MKiIsV0UAKTwz5AR7z60q643Ie5LnfBVCFDfGwr
	 K4ix9b/dJ80xcCzM0PdGtXbHJcqPm0hGDfRUc+JzBmW9EwKEVHHybw+VMgGydBhTKdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
	b=4VrCEy1cP8TQOBfS9ecRealYIYkvPiI/MJ2PtAATcLETcA5pj0qeotsZ2hP/bSSvXf31
	 G+mDO9tiHw67FcCFMYivaYadrgw3FUMaY4QYOru5sJB5Apw17YVV7Gg7eOPONTyvIg7UG
	 XyuzyTqAibIIswmpB3H1hR19EydjMTa+sKRIuHad3pla3ocDMxX42D/LbPvNOzkQTmwoA
	 jCukch3E19ONBdNCP5daK0JaKUcRQL3Ed2Tuy6SD4lYhNa2zDOfSzLN9JfO/qP7mqlcJQ
	 x3eadXN3J1M9pSy0/wOWRfq7o/BOKLeu0IzrzfXJwI9Xepdq4YEsCVC27L7E++02DVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+qyaGB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EACF606A68B
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EACF606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+qyaGB
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db8985419so10046588d50.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795789586; cv=none;
        d=google.com; s=arc-20260327;
        b=M/hKNDjH568CCkFYASfgZJXpdtfhIT08yjcstBgv1dKzHbYugCZeKOZGR1/+KUNEVm
         iMqYet8KIgruvW7rSB24DbK8d8Y1ICyXZfURp/2GRMGD4aupeI3dV/IWNhDUtWIbkm36
         97EnlOU39nIRoiyKSAR4pGVTYTBBgyTW7d+zAOiqFMsuhx+XyObLP5ucPSa22zu+a0vW
         9aiQIq6ngjzKQqlb3kMyB76dUbT3q3R7Ubk3sGe7nxqoXpMqkQKOmzlePUlCIMrCx3Ls
         8lwbWmuxbCdHZ01VYjEh8bJz+twSVGqTUFPZxazHOA+HsYrO6iKmaMkrsRByaKKeUnJL
         jWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        fh=Kfu0sJA09SIm0r8Jp94wyoZzNyf3yoZLB7wcS6/cC7o=;
        b=CwiF+sqzuPCjZNRGb9akZRnRIuc2iQ8OrCpvBxaMLp7pJaQFKq1xTaS++9wv2xI5wy
         /mwBCVzzM0UmTWrWugDUuaoFnjH0B45+STzVszMOM+6wxrg6heG70TIytqmBkBL6ihko
         +XzBj+bQw3FB47M8FPBxyWHroKCzJTo19/Vvb2wFhsbMM2CLEqOy/DzrlDtQ3Aa5S6D9
         IlIyu/2clXF8a9CfRYZDLntofSrE8Y5kWhq2qrl3CqfvvH4VqgcFbSjWCvT7vhPqqXYj
         Qb5C9Wn11NIgHfUsMrbtN+sA+QwLFO4jkZWBrYrDSAChL5XuSCnip0rRFm8TnizwyXP1
         mI0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795789586; x=1796394386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        b=cC+qyaGB7xL9/hIvPM4ljhUM9AVaeCKlMK0ostHAZv1kgp3lsJC8zl2UpLsbY7otIa
         QCDU6cUBKgiLBSOY57PzbUabzc8p+p2iAhbHDJrNScBluGlgc0Q+/7lPscZQ1NgYX+Mg
         OiZgV5RY8nh6r6xs478/Ymbq/NlSuyXmxF3gNVJb/WMt2D+JOcxR3B5I16d8UzC4GREF
         8b2kbs1gHoy1BP/XSOM+TplqEspcJjKGaFdKuTwX0z2lLH77QyrThzSem3Xmf9nG5O8/
         tapWNSHQpmghvv/R0hhEZHG+3z0HyAzNPU4RhLafw+Sop5lML9Y6MnGWkUm/ySctlfLU
         F5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789586; x=1796394386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        b=CXAcXJcTvr/F+tp/mloxblCaPlMFSjXGmcMO1AD79+sqdAH7X0FLY9UU/d0ozCl0NN
         6te99RSTUFl3ie9QfTDWx+AcVbsTjei5JHKW4hM29wWAb7Q8wOTd1yEdasRdhUji7eUX
         JnaBhRsAqPVUTtwiHFh6QeJmX7qM74qLKBjG4aU4e03WNUgyGtk+5MUDuCUrtEDfrgqA
         U6Jp40vvV8642gbo6FlgbzRPvY4TKxP1jR090KTUM+LUFZNxajSZB/BKVLw1po/6zV1M
         TW5q5qyUWBNbI9ZibHC9X1TuMmLQXid9uFWRM6/+BjckfrNF4kpAcLd5AJQHS7kIARuc
         qHew==
X-Gm-Message-State: APuU4Z/7ua9nTQ5y4hrj6KI/+ib+sWctfhIevlEA/jqXilcQOmduYRfX
	kAgGVwM47M9V6+Cf17YkUChyMBhJP9aRo3GZyEFlZHt9aKhT0Njx9kyBM+S9lSGmzOlVvvvKXtI
	84UIxVuN0oKsKPv+GGycl8Ak7/U1tYgc=
X-Gm-Gg: AZFdTZfp7AGwIFE1lwH8bZClplpuORRDm3eOZssWOfHgivriUSp10hGh4Wcv9+NOygP
	2YPC+jiGToJw3wyd6aPvj6t85gPZMKePqwPgNvS/LopRvx9nBoYaBUqifAojlKC6P1pQmZkldgB
	s6npjRyJy63iJUB81fNUf4WtApTsMTWRxFfRT0KlbiA0cH/OsDTMMKHjJbqW+NqzjSmr8qJusCs
	Up60Twyrmn/Ogbh1LaTAa+/ADu3UXIdrKnEMfat4qXXZ2JkWpMkXmm/eNCNs3B2TcdwP/0M3KOH
	In9ZPvyjWADoflwRFPmG9kTHwHKPh0xM3jL6pq7rQMyBcYi6lYh2IvnQJkX/AZt+u1sJrhutHMt
	9aRpY7hYJ4yhMSrKr26TixMJVlDHDHjqUcM1vJTVDVm/CUVoNl1RgyZ/sx3lDOrrq8jobK62R0V
	0LeliqVN2d8BArT4Ihu2NlH0BLzPNft2IqP5XwOJTYmb65OVpt8PgLVaiuL8j+bjrZUvvFtMmD4
	FomeG88daOKvhst50E6LCHiORs/jKBLUYovVqR+WCypp1e/ZW+62vHGkORW/w==
X-Received: by 2002:a05:690e:1489:b0:679:5bea:d3fb with SMTP id
 956f58d0204a3-67df44ff2a3mr11332814d50.98.1795789586210; Fri, 27 Nov 2026
 06:26:26 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de> <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
In-Reply-To: <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 27 Nov 2026 15:26:14 +0100
X-Gm-Features: Aa3M54rU861K6hVH_v4BM8VXqJq13L8vPQqUixPloEFQahDxyt31sYLJ9SxYLgk
Message-ID: <CAOiHx=mX7HYFXt05G_cH+u3uu3pVZEF5W5j2M0tRs6PG5swd_g@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] bcm63xx_enet: Prevent unbalanced
 clk_disable_unprepare() call in bcm_enet_remove()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Florian Fainelli <f.fainelli@gmail.com>, 
	Frank Li <Frank.Li@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 3:04=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 27 Nov 2026 11:52:23 +0100
>
> A clk_prepare_enable(priv->phy_clk) call was specified within an if branc=
h
> in the implementation of the function =E2=80=9Cbcm_enet_probe=E2=80=9D wh=
ile
> a clk_disable_unprepare(priv->phy_clk) call was unconditionally performed
> in the implementation of the function =E2=80=9Cbcm_enet_remove=E2=80=9D.
> Move this clk_disable_unprepare() call into a corresponding if branch.
>
> Fixes: 7e697ce99ceb09538cdc1dfa9ebb3db60236b0a7 ("bcm63xx_enet: use manag=
ed functions for clock/ioremap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/e=
thernet/broadcom/bcm63xx_enet.c
> index f6595fdc888d..cc9a5cd2a2a3 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1915,6 +1915,9 @@ static void bcm_enet_remove(struct platform_device =
*pdev)
>         enet_writel(priv, 0, ENET_MIISC_REG);
>
>         if (priv->has_phy) {
> +               if (!priv->use_external_mii)
> +                       clk_disable_unprepare(priv->phy_clk);
> +
>                 mdiobus_unregister(priv->mii_bus);
>                 mdiobus_free(priv->mii_bus);
>         } else {
> @@ -1927,7 +1930,6 @@ static void bcm_enet_remove(struct platform_device =
*pdev)
>         }
>
>         /* disable hw block clocks */
> -       clk_disable_unprepare(priv->phy_clk);

clk_disable_unprepare() is NULL-safe, so it's fine to call it
unconditionally. This change fixes nothing, just adds potential
breakage (disabling the phy clock before unregistering the mdio bus
feels risky).

>         clk_disable_unprepare(priv->mac_clk);

Best regards,
Jonas
