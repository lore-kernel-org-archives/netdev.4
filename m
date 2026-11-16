Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794797093;
	b=ocb8zKEDzibc8z8sMNQsp7S2icHIcWLmApegyHxFSjVqTanaVzF5ulSo8AoEVRA8VbeW
	 6X87QjLFH4quzhQ5C376xZM/4QEBAMMZOdYuWyThstUJCVSIqImzjTPx1fPM2s105UWQK
	 0hpFNiiu8+EDPf4OTA0HTxxKAXMoWbf+55tThZ9QijPB4o9NOHs4ao7EznKBXi1gf0Gdh
	 X8CAGIdn59S804QK1wTcgB+OBJcqzgMJDivyLYjL8fQPfXdNFa2AnonJWbKFQNPdTE6/z
	 2bw0z4oWuLpySw30RUDaT16PhQvNvXeRnaBvCJTZlA2yzqlIZnh2M2PqwP9LCiG6jJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
	b=Unm+dikzE4LMaYz7EN0keZZt3Gk0juy6wsnx30nf6Fxq9d3A4VwwU2IBM7W70LUstlId
	 fjViu6qHVCiZxPMVFjRHN+SaB2PRMieKDAenwuGGHbmNQQ4WiUi0jsQKzqengQ1wE1pYR
	 37hAf85eE+wpbrD1Ns5AJNe+aEQJOdHuZ8vZOEM6twtIylqw1Jr6pHYKF8Q7hllDOmlpA
	 ZCnzsT6qtU7uKa//h/JNbrTrtxhjUqMnJtUCKVninTXOzJNiDh876YRr182Q22P2w4Rh6
	 UBA7F8YEREy6h84QV/Q9wm10ZIvr3qNK51Vts7daEhA/FquNqdURv+ERzttYHrIX7Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nFGwJvQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0C6606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nFGwJvQR
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c7445cf85so236321cf.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794797092; cv=none;
        d=google.com; s=arc-20260327;
        b=L8Nv/u5T9OBhk1YfzjCj55/ZZnHhJolfjiAy08sG37wojzPg103PVPHGltylm24tvV
         IsbywUU/dFrS5iXCxQiK5W9LghNGWkH5PRmmLjFaVpQHsp7uwzuCLh+Wwh2Il6SU8k5t
         d7TvHiaL1biKIIzp+jd4n6tYDPJiJ5i3QnfQGOxQfY7cNw4d/6oBv0uh2cYoVoBlMkuH
         9gcz2lQk93j8j6a8Xo9J9AnZLv/RVraWS3fgMfpgW5wFoHaF+zUVtM2sN+kNyD7gXBO6
         qGg4IuX+5ib3OYhDb5qkrlrpVnOv/TwFz9JwC88tjzjSSiLsyHN9QCqhiiJIeGOOalmA
         FCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        fh=85RzfZiaky8Lw0reHGRCJLW1SqjTRe/zy6v3ioK4MnY=;
        b=WHH9RJSqAcKk/Y9gNzI0busUXacQTzye9JpFfv7/0A1cVjBeq/I2fuU00/12KfH0sV
         HO+OwtcLBMopKR9MoNzaS7CE+eKReZsxrDkrTyfYk6LO4+QUyFhC4hqTRDFpSVawPJOr
         lq4eSUaEstujobaUtHxIyK2i5UReIc9IgfFWaHq6qfXYZIYXTbPYNPQf5Uvv1IpC3+3y
         0KiIOv1J8MxuBdC/o0nEVh6Sn6Ju9epshzZfgfFDsNFUH8wiV30L7bCk4w6T5ThroLN/
         mUrp3XGjyYK8TLH7TI0A4e7mVg19SZels4emDq1b9qy8jyxeNo9MDeGkd0VgFosFkfXv
         EB3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794797092; x=1795401892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        b=nFGwJvQRRsHhvwfmdSvYfqBZw+cwMsVDENRdiit92dHTa+7O+OiIcMa1sFUe5aj+gV
         0arE70K4hM2KQEnQeyVZ3KwVQ7LSUSlFUphhAo8u/ggapG0bMwsQPeKcDnoGP0F55hDp
         4YgoLKjJcLaqOl3iwtNpCKzM3pTB9gqovF2Tfe85YMJiKuPCSgUFSqB1VvncglChRX4Z
         DnxE1h7MeVn/c1AgAC3Bt5zC7nov/mhM9bTKbn7r9TPAfAZ+qRZRQdTetJ3Xtj55ocS4
         3SmNPRvTlmMZS1B1sWIAVj5WbHuhzjvrKl+4LOf1YMHMVRouDTiyQfv14TVJzdW2x7Dy
         GRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797092; x=1795401892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        b=rGChmRmvKd5FJO4+X9lioVQcPc1XiId0W3FbFf0jmJ38YliF+nZ7OVYD7Rlo2SKH14
         nfxPM1vBw5kj1wsrXdfRMFTuhWx1bIOOXzMMHxyfbuPWlfsCyAcPvQbqdWdRfWfsPOiz
         YJrJj/xhMAZMxFDBB0yj4IERqNm7MFGYo5Z8zKIDeu9P6Sm6jJqsqMECbK81otR8Uevz
         AxuQtLNBx2tKf6htL/B0dCk0h+8/wAeCX+UGD6och9KHbJp+0Kv4k4W96ijOVnAW+2u1
         3HTL79EMSHjzKuVC6SjAWjR+0t9aOgPegY1b+jpOMyWWFn/h2IIxFF4DcCdts/zWv1t6
         rZjg==
X-Forwarded-Encrypted: i=1; AL+hErEvky+y53BsbNoXjce5RqCvV6fu0twP4B6xC1b2hXJokH2k+FlbhSx8AkTuP3bRgEkXNEPpVRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qb/Ra4Ke11AGPDQPsS3aFQASMV1QF4GxIUW0940pC7GMl77ZB
	Qkb5rxyqm4GkgDdEQ+ZFXVJorGyxeaMcnqLIWjqlkD4ROmu5U2ranlwjof5PxupN1ooVld4eR6j
	LE0Tjeg32/KEPsPo/kjDn9FAUumjcum+nlApC8q5j
X-Gm-Gg: AYBFou25oNPymBwub0yP754p2nTRCYY+hWNOefi5jB14+dct1KIoZ1tAN0zbLof9V6D
	NUO6ydsA+9g5GiICzdv6N5qQWaproYejlQPN1xfn/0AcY96aHVYHZOor7VeTm2X5ky8Jm8ooWNc
	pTCGUFVgES2yJ+vblGTfO4zrLvPBvhCFpqGXqHtNCrlVawESZ3LWpmyDJ/DfK0apO9Fj06vXqZ+
	HKzPoYiH+bJLujbUjCNzbOIve4BMrmnati0BFzne/KU2wEudsLRnwKF+CfveJwXBKpwkvZHcIcI
	VlVliVrZUnlApNz+Ttq3W94VG/ByU7xpBv/9He9gTgi0o6BgQgW+iz7t6uijDx8eAE/Rml4BnME
	H5VoxTn29ObJibDVL5+HqIrAhnGzo4Q3QxVw=
X-Received: by 2002:a05:622a:a06:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-55c682a8a6emr25827851cf.14.1794797091092; Sun, 15 Nov 2026
 18:44:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
In-Reply-To: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
From: Wei Wang <weiwan@google.com>
Date: Sun, 15 Nov 2026 18:44:40 -0800
X-Gm-Features: Aa3M54o-0Vkofupcnn38JmSI-OGkOkHMmrH1O9tJZwmSDKKBsdojHT-nKCZT5IQ
Message-ID: <CAEA6p_CXNCgmq0bz_mfuehPGaEx-GwcHxdNVBSBAAtqB0nfMrw@mail.gmail.com>
Subject: Re: [PATCH net] selftests: drv-net: psp: skip unsupported versions in
 netkit data test
To: alexeys@xsightlabs.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, guyt@xsightlabs.com, 
	Lior Yizchak <liory@xsightlabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:03=E2=80=AFAM Alexey Skidanov via B4 Relay
<devnull+alexeys.xsightlabs.com@kernel.org> wrote:
>
> From: Alexey Skidanov <alexeys@xsightlabs.com>
>
> data_basic_send_netkit_psp_assoc() runs for PSP versions 0-3. The
> non-netkit data path already skips versions the device does not
> advertise in psp-versions-cap. The netkit path does not, so those
> cases fail instead of skipping.
>
> Version 0 stays mandatory. Skip an unadvertised version before opening
> the PSP connection.
>
> Fixes: 43cf629700fa ("selftests/net: psp: add dev-assoc data path test")
> Signed-off-by: Alexey Skidanov <alexeys@xsightlabs.com>
> Signed-off-by: Lior Yizchak <liory@xsightlabs.com>
> ---

Reviewed-by: Wei Wang <weiwan@google.com>

>  tools/testing/selftests/drivers/net/psp.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index c114d2245135..7c8fb2200b39 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -728,6 +728,12 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, =
ipver):
>      """
>      _assoc_nk_guest(cfg)
>
> +    # Version 0 is required by spec, don't let it skip
> +    if version:
> +        name =3D cfg.pspnl.consts["version"].entries_by_val[version].nam=
e
> +        if name not in cfg.psp_info['psp-versions-cap']:
> +            raise KsftSkipEx("PSP version not supported", name)
> +
>      # Enter guest namespace (netns) to run PSP test
>      with NetNSEnter(cfg.netns.name):
>          cfg.pspnl =3D PSPFamily()
>
> ---
> base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
> change-id: 20261115-main-0b37fbe5e1d2
>
> Best regards,
> --
> Alexey Skidanov <alexeys@xsightlabs.com>
>
>
