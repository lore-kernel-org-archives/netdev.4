Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045337;
	b=4WAvXg4qUNWquISNFiQ+7J3ZWsrCJMuPDhOASjQ7U3wXj9XCM0IKnXJs2GcMjfQoEQ4A
	 Hza39D62t7ZWJY0Bs+y79ogJxEzpRJs9bw+H9eqkyFsAKAtZS6BM0HRmhyXaRrJCVQEyM
	 i7ki9CWcENTusD9JKsoDR04x56EqOl0jkB+sDRt+pdH4/DB1KGCm8EK4YdIS04TZ2XbX3
	 fpCcLsoOIGIGZ8A2XXX6w5bPeYRcly3wqvxqMmgiyH93D5HXiw0I09QSdqS4N62ZWrXo+
	 07s2nItSlZ64RPVdGa1JU310QjpFLjcencnYazic+uSZmddtF6DkowqM5PkrKxCHB9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
	b=IZQlzvUgHc1HCdoqWhNsJFX4qDDMhCF1yOJ+5YpziakgqwVeWwytSKNeX7Nz94Jeh/xF
	 E7OgyzK7TJwLBZkmRSf8cTbY5GTCl2zBkwqwWvO8ERH2R3f2GQWPuWOI9ULyp6du0Xbvy
	 lk0yeq02D2Jin9u6cBK096L159mRnFFfx6utwZrsQT+YhWrmklcDBOE70zTgzJuKj2tbh
	 urNlHeEENecSmq1GATE1p+yxjt9GAczOrVT/S/7clS4tpiAEhAmesT5YVexxxn562k8Jy
	 SBtJlhZ4DeADeFXA27tBl0Ao43SbPMT6auEzyZWR5wC4hnwTAGDgb0QbLUCgG+Pvbnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BYPFQo2m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A68606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A68606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BYPFQo2m
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efc4a84e75so13925ad.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045336; cv=none;
        d=google.com; s=arc-20260327;
        b=mZEEWUGuniF4eDW+LmyE1uzkSRmWvL+6YAcHR6tetBWEr2zlFT3fu1YsuGdSiZYGlw
         wbTfT0QnHYe+nfiDT4rFYWK1rTelkFY2l4Dvn4NXBBSljWPRXK6SnpwOZQFBiG3LtGji
         GGz9AaTILocidI7sf41YXniQlGsyacKBGT4P6ReHkw9B6Jd19tIvlwUtZyLRx6m7XMeq
         fn0MkF40Swzs4pWVGsLuTlyiGlBwwUYxIr009DchQKLPkX7aVhcBSWxbucDiJRnVY6I2
         xW55A6r2O3q9qni+i0QiAJvrHb1H4s/KY2cXu1EMu2/N+DjXXrb51niE9iPHwU2f60vO
         nNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
        fh=eP30+S3yNFKKFX4JVGNruUw/VOdg3vNFtGEuF786bWU=;
        b=IOaW/1dzJ2hdrem38/GAhNGZXlMgQQhGbIBDCcEUg0XU1W2WVmF8A6niTc8Eue56Ue
         oDRl7J9P3iwgSzaviMbpCpNW1MRZCn53epIKLRq5do8+2+dgntBAHegTHcptiliMvvZE
         u8vwLsxsd79EqEdTolCZPltDovwUWJZ9C5nstuJ8PLYzPw5gLcm6K26kcSMMU3YTOeA6
         VVwz8UxsdphaAilTHs0rVSkWC+166XYPD1DeO/5h88eR490lKIYemnBn5FGYeaKvji+Y
         CuJSLWEPhDlwZmQiPRD+LivULDHRw8Vv4qaeMNtoi0MlQ8g3xBmEVczcxt3pQRhBD7xN
         mLHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795045336; x=1795650136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
        b=BYPFQo2me3FI9+6BoNiaXzaOQPNXr2VbBy/Ph9cbu3UzPsUPyMiYJz1MQR9otfUvHi
         drXujMbOXyXnWPFfyJ4Uv7gGipquzv3ETUttYf0fQi3TJ/0oukTN3KL0YarpRCGWS8Kl
         Q4x3RfaA4ZI9RTkfj4RIW+SGedXjg0q1MGLtDIB05XmUmAQWlvEcWbYdYOWp3uGjTnNQ
         /Jcmr/TogJ1yRXMRBMsfOf349U8LHeqBJipOLHtnS7JCNYiSmpvk23Wpf41qJ4yEJOU2
         BzwYS+AR2LnYRTRl8L/2PLP1574w30ryIRWBBX6eoMxDvM0k7TCbLdZ2kkrpTFMDAgcO
         ladg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045336; x=1795650136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
        b=v3/lTHznpNqEA/OvsZozU8xv9ybtOVaROWgAjDfU2ZbjZhkxZxWEDIcd5WxjHCVtDV
         nqm80yEUWD0KPRjtAtn/uNkuPHObmascCB7c0q/sFy2+gGTmOF9xOppWc3Jhum/75ffy
         AIXgkRzAZK/W4c/QZNc4RdhfDlC1YYMrIjNUxSzJPJp66ebjiDRXNBhjdNrzMBTpYpAp
         qy0xMsljzPtqmPi0q0piGJoYNU6nLs1sNXIixv8cQQwS6b4II2cHXvLuzOgKdbZC4AC1
         w7zzF55U3bWUBO48SPwqL7hUVuZOxjeASeFI2xLwZbpYv3L4GMvNGW2LmpahH7thz2Pz
         VuNA==
X-Forwarded-Encrypted: i=1; AL+hErHFij0YKNTJEjPMi4c/5dEN1wFaw8YbdYn1iRIiin3lrLDAzAyMXLfoEmAgrIougplzxwJMLiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/26HBZhfFTDgi0Uv8GN4QkqN2lqrVxDWNCsPx8jl45BQWiMzh0
	tgE9OzoeBlS5eXB/YTEEa25ALmNmHNKQKeEnE6Qccy7f716B2iaCTmDhQa441eSkU61NGInpQxs
	9yAv8JDjLulSaugLRVmJ4YbdXzL0POnQYomMjRal3
X-Gm-Gg: AZFdTZfWngZNEvccx3eNqTf4i8v+mpGNXCZ575edXfCM1yRNqvu5arXi/T3zjMs39hA
	NmZosp1sxtEk2F6gOMfsGzijh1M+ze21fEjnDvfEsiquEuQ6866MAm18JiCGekV59bIRHoLp4TU
	OZ1v7DlSVkYGGqyDFBIcTtJktFadS9L8/cQQ/YKUFdCMdB2LrjdlTcS4bspBdL8zTzkWYcTfzd5
	GQwNl6jeFCBeXlpGgOr9K402el78jUyFNSVWGfwaCmYB9IxDG9Lfjsf0Pd2cNgvPsZ2M1MSOu7G
	mbUIk/RZKKU1K2dc2CcxpTJ6hHW0iam698q91m4NSCaFXGPr8CQ1f4H8m62IYbBN/C5Rjy5sKpI
	+KZe2EPCTqMOYR+BAL22QqEeEnw9PJBIBzHyf+eVLMZY8zNSOkWo+Y2S/hq/5dYLyBhjWFbyIq4
	b8q7YSIia0tcj+4DVta9j6jhHzRh8NQ67pFTGp
X-Received: by 2002:a17:902:ccc7:b0:2e6:d25:d874 with SMTP id
 d9443c01a7336-2f028c3e17fmr143915ad.10.1795045335693; Wed, 18 Nov 2026
 15:42:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118023429.29330-1-enderaoelyther@gmail.com>
In-Reply-To: <20261118023429.29330-1-enderaoelyther@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Wed, 18 Nov 2026 15:42:03 -0800
X-Gm-Features: AclHuK9zkg5a7aJIuOxzPa__9fJ6mx2Z38mZmb44f7PTJuVcXf4iZLJXA2rnRU0
Message-ID: <CAEAWyHc+0zrhwgAC9m9uj-R1Ddj7_tKqVnTwQt1LoAfNAAhM_w@mail.gmail.com>
Subject: Re: [PATCH net] gve: clear flow rule cache state when freeing its buffers
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

On Tue, Nov 17, 2026 at 6:35=E2=80=AFPM Zhao Li <enderaoelyther@gmail.com> =
wrote:
>
> Freeing the flow-rule cache clears its pointers but retains the cached
> counts and synchronization flag. A successful rule-reset command
> invalidates the cache, but a failed reset does not. Recovery can then
> allocate zeroed buffers while retaining a nonzero count and synced flag,

Yes, this is possible when gve_adminq_reset_flow_rules() fails in the
gve_reset() path however....

> causing a later flow-rule query to return zeroed rules as if they were a
> synchronized cache.

The user visible case is narrower and will only show up on an ethtool
-n <dev> rule 0 with a stale value. Because gve_get_flow_rule_entry()
will end up re-querying for every other location.

Also, the more holistic fix is up in gve_adminq_configure_flow_rule():

diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c
b/drivers/net/ethernet/google/gve/gve_adminq.c
index 8b215fca9c1b..ee9d5bc20e7e 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -1399,8 +1399,7 @@ gve_adminq_configure_flow_rule(struct gve_priv *priv,
                        sizeof(struct gve_adminq_configure_flow_rule),
                        flow_rule_cmd);

-       if (!err)
-               priv->flow_rules_cache.rules_cache_synced =3D false;
+       priv->flow_rules_cache.rules_cache_synced =3D false;

        return err;
 }

When a new flow rule configuration is _attempted_ as opposed to just
successful, we can treat the cache as out of sync because the command
could have failed for any reason and the device state is unknown. This
covers both the reset path and a failed add/del command.

I'd suggest a v2 with this diff instead of the memset describing the
problem a bit more in detail in the commit message. Feel free to use:
Suggested-by: Harshitha Ramamurthy <hramamurthy@google.com>

pw-bot: cr

>
> Clear the complete cache state after freeing its buffers so reallocation
> always starts unsynchronized with zero cached entries.
>
> Found by code review. Compile-tested with W=3D1.
>
> AI assistance was used.
>
> Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
> ---
> No new W=3D1, sparse or smatch warnings.
>
>  drivers/net/ethernet/google/gve/gve_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/eth=
ernet/google/gve/gve_main.c
> index 35cf0f06a0f2..747f5229d7ef 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -189,9 +189,8 @@ static void gve_free_flow_rule_caches(struct gve_priv=
 *priv)
>         struct gve_flow_rules_cache *flow_rules_cache =3D &priv->flow_rul=
es_cache;
>
>         kvfree(flow_rules_cache->rule_ids_cache);
> -       flow_rules_cache->rule_ids_cache =3D NULL;
>         kvfree(flow_rules_cache->rules_cache);
> -       flow_rules_cache->rules_cache =3D NULL;
> +       memset(flow_rules_cache, 0, sizeof(*flow_rules_cache));
>  }
>
>  static int gve_alloc_rss_config_cache(struct gve_priv *priv)
>
> base-commit: a2239d5dbbda3a61b6323df8836f605921a29f7f
> --
> 2.56.1
>
