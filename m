Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990972;
	b=CCCdsInPdiMaew9rz/EY82VGBBbKEbjoqQT2O7yC3RzSNYTO4+GiUGxRcIRKcE2Wgl0c
	 rdsgNOd5IvvRsd5EE0UJPCmJFmIMzkCxjgvTddXGLikF6aMRraoj/OKgPURlshb8JrMMf
	 Phy1OllqAEJOWPtQJIxr1p5qihutW//ILUmll0pBAz1b7woM5TZYERWPD4kwWChtVkAog
	 rk2xtNI2ItsXsn9Yf6i6OsX7vQ4kOs1fQiItrgrfPtpMCxtG0HhxTn3hbloQpVdeuScs9
	 mVTU4bDPYlH7UzFHfFxn5ELbiDKHhEnAezz/++pT80OCTOC9flK8UcClKEf1UrV6wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990972;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AngdKKEV49KCIJ12c6OSFDxnUGDymkPwOk1b71kiWuI=;
	b=3lFK5MlOcUVfzUAqNOVg/wKMEVCAHT19m5xB0L9Nullfvpuf0oNSsUMJi4qb+Ybkukzf
	 zA1sd/Bbhf7M+TUiCe4BhQaMKsfikm1ak3I4wauT7KjveIrvesoqHKDKVa3ePzh8L4o/z
	 Zyrk5t/PQvVuOd+Pp/pocUwamXl3g1ushnzlT4ae4PxQ6kjEH3OFKiaOB8Icmvizippxv
	 yVDLopx/bul/DcP6U4zWdXW7UTzPLMEvjk5NOZ9kSCupx6bFYd6xb7MZsO+LvXKHE3wZx
	 8UUR8KDasyJzizRD1D1xLfe6h93UObPlasd+yva719+kJzjf0FUTG0IHsegnRKz6Cwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZrkxrDt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01553606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZrkxrDt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CAC1F000C4
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990971;
	bh=AngdKKEV49KCIJ12c6OSFDxnUGDymkPwOk1b71kiWuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TZrkxrDtIKW+1c2LA5/O9nqBosrTD23p5cbN3rKpl2vebusRklTpb/VAO0TFTqzTH
	 5nqxRPhf2gwIfsnsu9izlpfQpAimR2URQNgiuF6MNXMccHNjP3FQoqPgPesLHkRNTx
	 xa2F6JyOQkx9kxnGq7EsNzPUPSumk2eN86+AWd5jwIzra8BoPK8q6BKTHEFbkjsnCn
	 ntm0RkNnCwifZdz5GAw1iv6nqCBrma+yrBn0hyJPO33hJZZ/skOEFNQXQlZU95zT8y
	 qx1WFN1RK8qQPBgGRcrsx6fGFWtVgg9+EAvKobVCu0nHp7spFam/dF4uBbMyvaVT9l
	 6x443H6OD83pg==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71ad047710aso475129eaf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG4aCaHV11nFGIf0/uzcc9pdmM/ePq8GJSIpTnPhzwEW2LBlCzY02ZD1w9G3KvF6MJLJSWHuYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9elx+bM7llYBUQwto9flXhlmHYFnkTIvescGgPGHmti9/XORJx
	+pOZeKXe7ad8e4rGxJ2UNa0oPaJXM2UJhugkiaAI+l8iIc4oqn0iY5wLWk3retMEJxVoH73bI3w
	37Q5w6Ae9GGAPNtr4ba6TGOtL9y9AbNk=
X-Received: by 2002:a05:6820:560b:b0:716:cfac:bc29 with SMTP id
 006d021491bc7-71b18843f7bmr920885eaf.85.1794990970636; Wed, 18 Nov 2026
 00:36:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
In-Reply-To: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 09:35:58 +0100
X-Gmail-Original-Message-ID: <CAL4WiipE6YzVOHwecF9wS3n7gq=dOSKNETXMq2gzKchg5LV_zQ@mail.gmail.com>
X-Gm-Features: Aa3M54pjTJQyL7psQSFQ4l7rjaL312tLjeRbst_IkgsN3QC4lzHm8w8YnO_pqgs
Message-ID: <CAL4WiipE6YzVOHwecF9wS3n7gq=dOSKNETXMq2gzKchg5LV_zQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: avoid hashing the namespace pointer for
 device names
To: Zhengchuan Liang <zcliangcn@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 07:27, Zhengchuan Liang <zcliangcn@gmail.com> a=
 =C3=A9crit :
>
> dev_name_hash() salts device-name hashes with the network namespace
> pointer. An unprivileged user can time SIOCGIFINDEX lookups for chosen
> missing names and identify collisions with a resident name such as "lo".
> Ranking this collision pattern across possible KASLR slides recovers the
> init_net pointer and thus the kernel text base.
>
> Use an unsalted name hash. Each network namespace has a separate hash
> table, so this does not change lookup or namespace-isolation semantics.
>
> Found by AI-assisted code review and reproduced unprivileged on an
> unmodified kernel without fault injection. The reproducer and networking
> selftests pass with this change.
>
> Fixes: 8387ff2577eb ("vfs: make the string hashes salt the hash")
> Cc: stable@vger.kernel.org

As discussed in v1, local KASLR attacks are not a serious concern,
this is why I asked for net-next.

A "Cc: stable" tag does not belong in a net-next patch.

Maintainers can probably remove it when applying, no need for a V3.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
